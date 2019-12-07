<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Complaint\ReviewComplaintFail;
use App\Admin\Actions\Complaint\ReviewComplaintSuccess;
use App\Complaint;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ComplaintController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '投诉管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Complaint);

        //筛选框
        $grid->expandFilter();
        $grid->filter(function ($filter){
            $filter->equal('withdraw.order_no', '订单号');
            $filter->equal('user.name', '投诉方姓名');
            $filter->equal('user.username', '投诉方账号');
        });

        $grid->model()->orderBy('created_at', 'DESC');
        $grid->column('id', __('Id'));
        $grid->column('userInfo', __('投诉方(账号/姓名)'))->display(function (){
            return optional($this->user)->username.' / '.optional($this->user)->name;
        });

        $grid->column('other', __('被投诉方(账号/姓名)'))->display(function (){
            if($this->type == 1){
                return optional($this->withdraw->user)->username.' / '.optional($this->withdraw->user)->name;
            }
            return optional($this->withdraw->payer)->username.' / '.optional($this->withdraw->payer)->name;
        });
        $grid->column('withdraw.order_no', __('单号'));
        $grid->column('withdraw.withdraw_amount', __('提现金额'));
        $grid->column('withdraw.brokerage_fee', __('佣金'));
        $grid->column('withdraw.operation_fee', __('平台运营手续费'));
        $grid->column('content', __('投诉内容'))->display(function($text) {
            return str_limit($text, 20, '...');
        });
        $grid->column('replay', __('回复'))->display(function($text) {
            return str_limit($text, 20, '...');
        });
        $grid->column('type', __('类型'))->using(['1'=>'付款','2'=>'提现']);
        $grid->column('status', __('状态'))->display(function ($status){
            if ($status == 0){
                $label = "<a class='label label-danger'>等待受理</a>";
            }elseif($status == 1){
                $label = "<a class='label label-warning'>正在处理</a>";
            }elseif($status == 2){
                $label = "<a class='label label-success'>交易正常</a>";
            }elseif($status == 3){
                $label = "<a class='label label-info'>交易取消</a>";
            }
            return $label;
        });
        $grid->column('created_at', __('添加时间'));

        $grid->actions(function ($actions){
            $actions->disableDelete();
            if($actions->row->status == 0 || $actions->row->status == 1){
                $actions->add(new ReviewComplaintSuccess());
                $actions->add(new ReviewComplaintFail());
            }else{
                $actions->disableEdit();
            }
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
        $show = new Show(Complaint::findOrFail($id));

        $show->field('content', __('投诉内容'));
        $show->field('replay', __('回复'));

        $show->panel()->tools(function ($tools){
            $tools->disableEdit();
            $tools->disableDelete();
        });

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Complaint);

        $form->display('content', __('投诉内容'));
        $form->textarea('replay', __('回复'));

        $form->saving(function (Form $form){
            if($form->model()->status == 0){
                $form->model()->status = 1;
            }
        });

        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
        });

        return $form;
    }
}
