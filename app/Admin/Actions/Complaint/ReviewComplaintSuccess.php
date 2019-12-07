<?php

namespace App\Admin\Actions\Complaint;

use Carbon\Carbon;
use DB;
use App\Message;
use App\User;
use App\Withdraw;
use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class ReviewComplaintSuccess extends RowAction
{
    public $name = '交易正常';

    public function handle(Model $model)
    {
//投诉单必须为 0:待受理；1:客服处理中 交易单必须为 1:已接单；2:已出款
        if(in_array($model->status, [2, 3])){
            return $this->response()->error('无法操作')->refresh();
        }else{
            $withdraw = Withdraw::findOrFail($model->withdraw_id);
            if($withdraw->status == 0){
                return $this->response()->warning('该笔交易异常')->refresh();
            }elseif($withdraw->status == 1 || $withdraw->status == 2){//交易单必须为 1:已接单；2:已出款

                DB::beginTransaction(); //开启事务

                $model->status = 2;
                $complaint_saved = $model->save();

                //给打款人加钱
                $payer_user_add_withdraw_amount = bigNumber($withdraw->withdraw_amount);//打款金额
                $payer_user_add_amount = $payer_user_add_withdraw_amount->add($withdraw->brokerage_fee)->getValue();//打款金额+佣金
                $user_saved = User::where('id', $withdraw->payer_user_id)->increment('amount', $payer_user_add_amount);//给打款方加钱

                //给打款方上级加钱
                if($withdraw->payer_parent_user_id && $withdraw->parent_brokerage_fee != 0){
                    $payer_user_saved = User::where('id', $withdraw->payer_parent_user_id)->increment('amount', $withdraw->parent_brokerage_fee);//给打款方的上级加钱
                    if (!$payer_user_saved) {
                        DB::rollBack(); //回滚
                        return $this->response()->error('处理失败')->refresh();
                    }
                }

                $withdraw->status = 3;
                $withdraw->finished_at = Carbon::now();
                $withdraw_saved = $withdraw->save();

                $message_saved = Message::create([
                    'user_id' => $withdraw->payer_user_id,
                    'title' => '投诉成功交易确认',
                    'content' => config('payment_confirmed_message'),
                ]);

                if (!$complaint_saved || !$user_saved || !$withdraw_saved || !$message_saved) {
                    DB::rollBack(); //回滚
                    return $this->response()->error('处理失败')->refresh();
                }
                DB::commit();   //保存
                return $this->response()->success('交易已完成，资金处理完毕')->refresh();
            }elseif($withdraw->status == 3){//如果交易单已正常 客服来确认正常交易
                $model->status = 2;
                $model->save();
                return $this->response()->success('交易已完成')->refresh();
            }elseif ($withdraw->status == 4){//如果交易单取消  客服来确认正常交易
                $model->status = 3;
                $model->save();
                return $this->response()->warning('该笔交易已取消，无法修改为正常')->refresh();
            }
        }
    }

    public function dialog()
    {
        $this->confirm('确定该笔交易正常？');
    }
}
