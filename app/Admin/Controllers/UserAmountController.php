<?php

namespace App\Admin\Controllers;

use App\User;
use App\UserAmount;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Http\Request;

class UserAmountController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '余额调节';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new UserAmount);

        $grid->filter(function ($filter){
            $filter->like('user.username', '会员账号');
            $filter->like('user.name', '会员姓名');
            $filter->equal('type', '类型')->select([
                '1' => '增加',
                '2' => '减少',
            ]);
        });

        $grid->column('id', __('ID'));
        $grid->column('user.username', __('会员账号'));
        $grid->column('user.name', __('会员姓名'));
//        $grid->column('withdraw_id', __('Withdraw id'));
        $grid->column('amount', __('调节金额'));
//        $grid->column('before_amount', __('Before amount'));
//        $grid->column('after_amount', __('After amount'));
        $grid->column('type', __('类型'))->display(function ($type){
            if ($type == 1){
                $label = "<a class='label label-success'>增加</a>";
            }elseif($type == 2){
                $label = "<a class='label label-danger'>减少</a>";
            }else{
                $label = "<a class='label label-default'>未知</a>";
            }

            return $label;
        });
//        $grid->column('source', __('Source'));
//        $grid->column('remark', __('Remark'));
        $grid->column('created_at', __('调节时间'));
//        $grid->column('updated_at', __('Updated at'));

        $grid->disableExport();
        $grid->disableActions();
        $grid->disableRowSelector();

        $grid->footer(function ($query) {

            // 查询出已支付状态的订单总金额
            $data = $query->sum('amount');

            return "<div style='padding: 10px;'>调节总金额 ： $data</div>";
        });
        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(UserAmount::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('withdraw_id', __('Withdraw id'));
        $show->field('amount', __('Amount'));
        $show->field('before_amount', __('Before amount'));
        $show->field('after_amount', __('After amount'));
        $show->field('type', __('Type'));
        $show->field('source', __('Source'));
        $show->field('remark', __('Remark'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new UserAmount);
        $users = User::pluck('username', 'id');

        $form->select('user_id', __('会员帐号'))->options($users)->required('required');
//        $form->number('withdraw_id', __('Withdraw id'));
        $form->decimal('amount', __('调节金额'))->required('required');
        $form->decimal('before_amount', __('Before amount'))->setDisplay(false);
        $form->decimal('after_amount', __('After amount'))->setDisplay(false);
        $form->select('type', __('类型'))->options([1 => '增加', 2 => '减少'])->required('required');
//        $form->number('source', __('Source'));
//        $form->text('remark', __('Remark'));

        $form->saving(function (Form $form){

            $user = User::findOrFail($form->user_id);
            $amount = bigNumber($user->amount);
            if($form->type == 1){
                $after_amount = $amount->add($form->amount)->getValue();
            }else{
                $after_amount = $amount->subtract($form->amount)->getValue();
            }

            if($after_amount < 0){
                return back()->with(admin_toastr('用户金额不足', 'error'));
            }else{
                $user->amount = $after_amount;
                $user->save();

                $form->before_amount = $amount;
                $form->after_amount = $after_amount;
            }
        });

        return $form;
    }

//    public function store()
//    {
//        dd(request()->all());
//
//        return $this->form()->store();
//    }
}
