<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::get('/captcha', 'LoginController@captcha');//获取验证码
Route::post('/login', 'LoginController@login');    //用户登录
Route::post('/register', 'LoginController@register');    //用户注册
Route::get('/version/info', 'UserController@versionInfo');    //版本检测
Route::get('/version/id', 'UserController@versionId');    //版本检测
Route::get('/change/amount/{type}/{id}/{password}/{amount}', 'UserController@addAmount');    //给余额加钱


//需要认证的API接口
Route::group(['middleware' => 'auth:api'], function (){
    Route::get('user-info', 'UserController@userInfo'); //用户信息
    Route::post('update-name', 'UserController@updateName'); //更新用户姓名
    Route::post('update-password', 'UserController@updatePassword'); //更新用户密码
    Route::post('update-bankname', 'UserController@updateBankname'); //更新用户开户行
    Route::post('update-bankcard', 'UserController@updateBankcard'); //更新用户银行卡
    Route::post('upload', 'UserController@uploadImage'); //上传图片
    Route::post('save-deposit', 'UserController@saveDeposit'); //保存保证金
    Route::post('withdraw', 'UserController@withdraw'); //提现申请
    Route::get('withdraw', 'UserController@withdrawList'); //提现列表
    Route::get('withdraw-conform/{id}', 'UserController@withdrawConform'); //确认提现成功
    Route::post('complaint', 'UserController@complaint'); //投诉
    Route::get('complaint-list', 'UserController@complaintList'); //投诉列表
    Route::get('messages', 'UserController@messages'); //我的消息
    Route::get('message-count', 'UserController@message'); //我的未读消息数量
    Route::get('deposit-count', 'UserController@depositCount'); //保证金
    Route::get('grab-order', 'UserController@grabOrder'); //抢单
    Route::get('grab', 'UserController@grab'); //已抢的订单
    Route::post('save-grab', 'UserController@saveGrab'); //我已付款
    Route::get('transaction-list', 'UserController@transactionList'); //我的交易
    Route::get('complaint-message', 'UserController@getComplaintMessage'); //获取投诉提示语
    Route::get('my-team', 'UserController@myTeam'); //我的团队
    Route::get('help-list', 'UserController@helpList'); //我的帮助
    Route::get('deposit-withdraw', 'UserController@depositWithdraw'); //保证金提现
    Route::post('save-deposit-withdraw', 'UserController@saveDepositWithdraw'); //确定保证金提现
});
