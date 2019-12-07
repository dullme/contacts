<?php

namespace App\Admin\Controllers;

use Carbon\Carbon;
use Encore\Admin\Controllers\AuthController as BaseAuthController;
use Illuminate\Http\Request;


class AuthController extends BaseAuthController
{
    public function postLogin(Request $request)
    {
        $this->loginValidator($request->all())->validate();

        $credentials = $request->only([$this->username(), 'password']);
        $remember = $request->get('remember', false);

        if ($this->guard()->attempt($credentials, $remember)) {
            if(Auth('admin')->user()->id != 1 && Carbon::parse(Auth('admin')->user()->expired_at)->lt(Carbon::now())){
                $this->guard()->logout();

                $request->session()->invalidate();

                admin_toastr('登录失败！');

                return abort(222);
            }
            return $this->sendLoginResponse($request);
        }

        return back()->withInput()->withErrors([
            $this->username() => $this->getFailedLoginMessage(),
        ]);
    }
}

