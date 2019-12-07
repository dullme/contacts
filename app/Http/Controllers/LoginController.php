<?php

namespace App\Http\Controllers;

use App\Http\Proxy\TokenProxy;
use App\Traits\PassportToken;
use App\User;
use App\VerificationCode;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class LoginController extends ResponseController {
    use PassportToken;

    protected $proxy;

    /**
     * LoginController constructor.
     * @param TokenProxy $proxy
     */
    public function __construct(TokenProxy $proxy) {
        $this->proxy = $proxy;
    }

    /**
     * 用户登录
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {
        $data = $request->validate(
            [
                'username' => 'required',
                'password' => 'required',
                'key' => 'required',
                'code' => 'required|captcha_api:' . $request->input('key')
            ],
            [
                'username.required' => '请输入用户名',
                'password.required' => '请输入密码',
                'code.required' => '请输入验证码',
                'code.captcha_api' => '验证码错误',
            ]
        );

        $user = User::where('username', $data['username'])->first();

        if(!$user){
            return $this->setStatusCode(422)->responseError('未注册');
        }

        if(!Hash::check($data['password'], $user->password)){
            return $this->setStatusCode(422)->responseError('用户名或密码错误');
        }

        if($user->status == 2){
            return $this->setStatusCode(422)->responseError('该账户已注销');
        }

        $response = $this->getBearerTokenByUser($user, 2);
        $token = json_decode((string) $response->getBody(), true);

        return response()->json([
            'code' => 200,
            'data' => [
                'token'      => 'Bearer '.$token['access_token'],
                'auth_id'    => md5($token['refresh_token']),
                'expires_in' => $token['expires_in'],
            ],
            'message' => 'success'
        ], 200)->cookie('refreshToken', $token['refresh_token'], 14400, null, null, false, true);
    }

    public function register(Request $request)
    {
        $data = $request->validate(
            [
                'username' => 'required|min:6|unique:users',
                'password' => 'required|min:6',
                'invitation_code' => 'nullable',
                'key' => 'required',
                'code' => 'required|captcha_api:' . $request->input('key')
            ],
            [
                'username.required' => '请输入用户名',
                'username.min' => '用户名过短',
                'username.unique' => '用户已存在',
                'password.required' => '请输入密码',
                'password.min' => '密码过短',
                'code.required' => '请输入验证码',
                'code.captcha_api' => '验证码错误',
            ]
        );

        if($data['invitation_code'] != null){
            $user = User::where('invitation_code', $data['invitation_code'])->first();
            if(!$user){
                return $this->setStatusCode(422)->responseError('邀请码错误');
            }

            $data['pid'] = $user->id;
        }

        $data['invitation_code'] = getInvitationCode();
        $data['password'] = bcrypt($data['password']);

        User::create($data);

        return $this->responseSuccess(true, '注册成功');

    }

    public function captcha()
    {
        $captcha = app('captcha')->create('default', true);
        return $this->responseSuccess($captcha);
    }

    /**
     * 用户注销
     * @return \Illuminate\Http\JsonResponse
     */
    public function userLogout() {

        return $this->proxy->logout();
    }

    /**
     * 重置 Token
     * @return mixed
     */
    public function refresh() {

        return $this->proxy->refresh();
    }

}
