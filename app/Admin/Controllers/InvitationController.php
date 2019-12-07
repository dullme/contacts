<?php

namespace App\Admin\Controllers;

use App\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class InvitationController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '邀请码管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User);
        $grid->model()->where('pid', Auth('admin')->user()->id)->orderBy('id', 'DESC');

        $grid->tools(function ($tools) {
            $url = url('admin/add-users');
            $tools->append("<a class='btn btn-sm btn-warning' href='{$url}'>新增邀请码</a>");
        });

        //筛选框
        $grid->filter(function ($filter){
            $filter->equal('invitation_code', '推广码');
            $filter->equal('status', '状态')->select([
                '0' => '待激活',
                '1' => '已激活',
            ]);
        });

        $grid->column('id', __('ID'));
        $grid->column('invitation_code', __('邀请码'));
        $grid->column('status', __('状态'))->display(function ($status) {
            if ($status == 0) {
                $label = "<a class='label label-danger'>待激活</a>";
            } else if ($status == 1) {
                $label = "<a class='label label-success'>已激活</a>";
            } else {
                $label = "<a class='label label-default'>未知</a>";
            }

            return $label;
        });
        $grid->column('created_at', __('创建时间'));

        $grid->column('remark', __('备注'))->editable();

        $grid->disableActions();
        $grid->disableExport();
        $grid->disableRowSelector();
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
        $show = new Show(User::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('invitation_code', __('Invitation code'));
        $show->field('pid', __('Pid'));
        $show->field('status', __('Status'));
        $show->field('phone_model', __('Phone model'));
        $show->field('mobile', __('Mobile'));
        $show->field('remark', __('Remark'));
        $show->field('activation_at', __('Activation at'));
        $show->field('remember_token', __('Remember token'));
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
        $form = new Form(new User);

        $form->text('invitation_code', __('Invitation code'));
        $form->number('pid', __('Pid'));
        $form->switch('status', __('Status'));
        $form->text('phone_model', __('Phone model'));
        $form->mobile('mobile', __('Mobile'));
        $form->text('remark', __('Remark'));
        $form->datetime('activation_at', __('Activation at'))->default(date('Y-m-d H:i:s'));
        $form->text('remember_token', __('Remember token'));

        return $form;
    }
}
