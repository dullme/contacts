<?php

namespace App\Admin\Controllers;

use App\DepositWithdraw;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class DepositWithdrawController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '保证金提现';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new DepositWithdraw);
        $grid->model()->orderBy('created_at', 'DESC');

        $grid->column('id', __('Id'));
        $grid->column('会员账号')->display(function (){
            return optional($this->user)->username;
        });
        $grid->column('withdraw_amount', __('提现金额'));
        $grid->column('operation_fee', __('手续费'));
        $grid->column('name', __('姓名'));
        $grid->column('bankname', __('银行名称'));
        $grid->column('bankcard', __('银行卡号'));
//        $grid->column('status', __('状态'))->display(function ($status){
//            if ($status == 0){
//                $label = "<a class='label label-danger'>待审核</a>";
//            }elseif($status == 1){
//                $label = "<a class='label label-success'>已完成</a>";
//            }
//            return $label;
//        });
        $grid->column('created_at', __('申请时间'));

        $grid->filter(function ($filter){
            $filter->equal('user.username', '会员账号');
            $filter->equal('user.name', '会员姓名');
        });

        $grid->disableCreateButton();
        $grid->disableExport();
        $grid->disableActions();
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
        $show = new Show(DepositWithdraw::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('withdraw_amount', __('Withdraw amount'));
        $show->field('operation_fee', __('Operation fee'));
        $show->field('name', __('Name'));
        $show->field('bankname', __('Bankname'));
        $show->field('bankcard', __('Bankcard'));
        $show->field('images', __('Images'));
        $show->field('remarks', __('Remarks'));
        $show->field('status', __('Status'));
        $show->field('payment_at', __('Payment at'));
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
        $form = new Form(new DepositWithdraw);

        $form->number('user_id', __('User id'));
        $form->decimal('withdraw_amount', __('Withdraw amount'));
        $form->decimal('operation_fee', __('Operation fee'));
        $form->text('name', __('Name'));
        $form->text('bankname', __('Bankname'));
        $form->text('bankcard', __('Bankcard'));
        $form->textarea('images', __('Images'));
        $form->text('remarks', __('Remarks'));
        $form->number('status', __('Status'));
        $form->datetime('payment_at', __('Payment at'))->default(date('Y-m-d H:i:s'));

        return $form;
    }
}
