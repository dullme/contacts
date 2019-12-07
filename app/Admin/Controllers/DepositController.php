<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Deposit\ReviewDeposit;
use App\Complaint;
use App\Deposit;
use App\DepositWithdraw;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class DepositController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '保证金';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Deposit);
        $grid->model()->orderBy('created_at', 'DESC');
        //筛选框
        $grid->actions(function ($actions){
            //详情
            $actions->disableView();
            //编辑
            $actions->disableEdit();
            //审核
            if ($actions->row->status == 0){
                $actions->add(new ReviewDeposit());
            }
        });

        $grid->filter(function ($filter){
            $filter->equal('user.username', '会员账号');
            $filter->equal('status', '状态')->select([
                '0' => '待审核',
                '1' => '已审核',
                '2' => '已注销'
            ]);
        });

        $grid->column('id', __('Id'));
        $grid->column('会员账号')->display(function (){
            return optional($this->user)->username;
        });
        $grid->column('amount', __('缴纳金额(元)'))->display(function ($amount){
            return bigNumber($amount)->getValue();
        });
        $grid->column('name', __('收款人'));
        $grid->column('bankname', __('汇款归属行'));
        $grid->column('bankcard', __('汇款银行卡号'));
        $grid->column('remitter', __('汇款人'));
        $grid->column('images', __('汇款回执单'))->display(function ($picture){
            return json_decode($picture);
        })->gallery(['width' => 100, 'height' => 100]);;
        $grid->column('status', __('状态'))->display(function ($status){
            if ($status == 0){
                $label = "<a class='label label-danger'>待审核</a>";
            }elseif($status == 1){
                $label = "<a class='label label-success'>已审核</a>";
            }else{
                $label = "<a class='label label-default'>已注销</a>";
            }

            return $label;
        });
        $grid->column('created_at', __('汇款时间'));
        $grid->disableExport();
        $grid->disableCreateButton();
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
        $show = new Show(Deposit::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('amount', __('Amount'));
        $show->field('name', __('Name'));
        $show->field('bankname', __('Bankname'));
        $show->field('bankcard', __('Bankcard'));
        $show->field('images', __('Images'));
        $show->field('status', __('Status'));
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
        $form = new Form(new Deposit);

        $form->number('user_id', __('User id'));
        $form->number('amount', __('Amount'));
        $form->text('name', __('Name'));
        $form->text('bankname', __('Bankname'));
        $form->text('bankcard', __('Bankcard'));
        $form->textarea('images', __('Images'));
        $form->number('status', __('Status'));

        return $form;
    }

    public function asd()
    {
        $withdraw = DepositWithdraw::where('status', 0)->count();
        $deposit = Deposit::where('status', 0)->count();
        $complaint = Complaint::where('status', 0)->count();

        return response()->json([
            'deposit' => $deposit,
            'complaint' => $complaint,
            'withdraw' => $withdraw
        ]);
    }
}
