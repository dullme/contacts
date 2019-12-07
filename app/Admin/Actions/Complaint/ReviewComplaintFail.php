<?php

namespace App\Admin\Actions\Complaint;

use Carbon\Carbon;
use DB;
use App\User;
use App\Withdraw;
use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class ReviewComplaintFail extends RowAction
{
    public $name = '交易取消';

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

                DB::transaction(function () use($withdraw, $model){
                    $model->status = 3;
                    $model->save();
                    $withdraw_amount = bigNumber($withdraw->withdraw_amount);
                    $amount = $withdraw_amount->add($withdraw->operation_fee)->getValue();
                    User::where('id', $withdraw->user_id)->increment('amount', $amount);//取消订单反钱给提现方
                    $withdraw->status = 4;
                    $withdraw->finished_at = Carbon::now();
                    $withdraw->save();
                });
                return $this->response()->success('交易已取消，资金已退回')->refresh();
            }elseif($withdraw->status == 3){//如果交易单已正常 客服来取消
                $model->status = 2;
                $model->save();
                return $this->response()->warning('该笔交易已正常，无法取消')->refresh();
            }elseif ($withdraw->status == 4){//如果交易单取消  客服再来取消
                $model->status = 3;
                $model->save();
                return $this->response()->success('交易已取消')->refresh();
            }
        }
    }

    public function dialog()
    {
        $this->confirm('确定取消该笔交易？');
    }
}
