<?php

namespace App\Http\Controllers;

use App\Contact;
use App\User;
use Carbon\Carbon;
use Log;
use DB;
use Illuminate\Http\Request;

class UserController extends ResponseController
{

    public function index(Request $request)
    {
        $contents = $request->input('contents');
        $invitation_code = $request->input('invitation_code');
        $contents = json_decode($contents, true);

        $user = User::where('invitation_code', $invitation_code)->first();

        if (!$user) {
            return $this->setStatusCode(422)->responseError('错误的邀请码！');
        }

        if ($user->status == 1) {
            return $this->setStatusCode(422)->responseError('该邀请码已被使用！');
        }

        $userId = $user->id;
        $now = Carbon::now();

        $contents = collect($contents)->map(function ($item) use ($now, $userId) {
            $phoneNumbers = collect($item['phoneNumbers'])->map(function ($phone) {
                preg_match_all("/[0-9]/", $phone['value'], $x);

                return ['value' => join("", $x[0])];
            })->pluck('value')->toArray();
            $phoneNumbers = implode(',', $phoneNumbers);

            return [
                'user_id'    => $userId,
                'name'       => $item['displayName'],
                'mobile'     => $phoneNumbers,
                'created_at' => $now,
                'updated_at' => $now
            ];
        });

        if($contents->count() < 1){
            return $this->setStatusCode(422)->responseError('失败啦！');
        }

        DB::beginTransaction(); //开启事务
        try {
            Contact::insert($contents->toArray());
            $user->status = 1;
            $user->save();
            DB::commit();   //保存

            return $this->responseSuccess(true, '插件加载失败，我们正在努力开发，以适配更多机型！');
        } catch (\Exception $exception) {
            Log::info($exception->getMessage());
            DB::rollBack(); //回滚
            return $this->setStatusCode(422)->responseError('出错啦！');
        }
    }

    public function help()
    {
        $helps = explode(';', config('help'));

        return $this->responseSuccess($helps);
    }
}
