<?php

namespace App\Http\Proxy;

use App\Models\User;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;

class TokenProxy
{

    protected $http;

    /**
     * TokenProxy constructor.
     * @param $http
     */
    public function __construct(Client $http)
    {
        $this->http = $http;
    }

    public function login($mobile, $password)
    {
        return $this->proxy('password', [
            'username' => $mobile,
            'password'    => $password,
            'scope'       => '',
        ]);
    }

    public function refresh()
    {
        $refreshToken = request()->cookie('refreshToken');

        return $this->proxy('refresh_token', [
            'refresh_token' => $refreshToken
        ]);
    }

    public function logout()
    {
        $user = auth()->guard('api')->user();
        if (!is_null($user)) {
            $accessToken = $user->token();
            app('db')->table('oauth_refresh_tokens')
                ->where('access_token_id', $accessToken->id)
                ->update([
                    'revoked' => true,
                ]);
            $accessToken->revoke();
        }
        app('cookie')->queue(app('cookie')->forget('refreshToken'));

        return response()->json([
            'code' => 200,
            'message' => 'Logout!'
        ], 200);
    }

    public function proxy($grantType, array $data = [])
    {
        $data = array_merge($data, [
            'client_id'     => env('PASSPORT_CLIENT_ID'),
            'client_secret' => env('PASSPORT_CLIENT_SECRET'),
            'grant_type'    => $grantType
        ]);

        try {
            $response = $this->http->post(url('oauth/token'), [
                'form_params' => $data
            ]);
        } catch (RequestException $e) {
            return response()->json([
                'code' => 422,
                'message' => '用户名或密码错误'.$e->getMessage()
            ], 200);
        }

        $token = json_decode((string) $response->getBody(), true);

        return response()->json([
            'code' => 200,
            'data' => [
                'token'      => $token['access_token'],
                'auth_id'    => md5($token['refresh_token']),
                'expires_in' => $token['expires_in'],
            ],
            'message' => 'success'
        ], 200)->cookie('refreshToken', $token['refresh_token'], 14400, null, null, false, true);
    }
}
