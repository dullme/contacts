<?php

namespace App\Admin\Controllers;

use App\Message;
use App\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class MessageController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '消息管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Message);
        $grid->model()->orderBy('created_at', 'DESC');
        $grid->column('user.name', __('姓名'));
        $grid->column('title', __('标题'));
        $grid->column('content', __('内容'))->display(function($text) {
            return str_limit($text, 50, '...');
        });
//        $grid->column('type', __('Type'));
        $grid->column('is_read', __('是否已读'))->using(['0'=>'未读','1'=>'已读']);
        $grid->column('created_at', __('创建时间'));
//        $grid->column('updated_at', __('Updated at'));
        $grid->disableExport();
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
        $show = new Show(Message::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('title', __('标题'));
        $show->field('content', __('内容'));
//        $show->field('type', __('Type'));
        $show->field('is_read', __('是否已读'));
        $show->field('created_at', __('添加时间'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Message);

        $users = User::pluck('username', 'id');

        $form->select('user_id', __('会员帐号'))->options($users);
        $form->text('title', __('标题'));
        $form->textarea('content', __('内容'));
//        $form->number('type', __('Type'));
//        $form->datetime('created_a', __('新增时间'));
        $form->switch('is_read', __('是否已读'))->default(0)->states([
            'on' => ['value'=> 1, 'text' => '已读'],
            'off' => ['value'=> 0, 'text' => '未读'],
        ]);

        return $form;
    }
}
