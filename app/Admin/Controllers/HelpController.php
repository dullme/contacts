<?php

namespace App\Admin\Controllers;

use App\Help;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class HelpController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '帮助中心';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Help);
        $grid->model()->orderBy('created_at', 'DESC');
        $grid->column('id', __('Id'));
        $grid->column('title', __('标题'));
        $grid->column('content', __('详情'))->display(function($text) {
            return str_limit($text, 50, '...');
        });
        $grid->column('created_at', __('添加时间'));

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
        $show = new Show(Help::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('title', __('标题'));
        $show->field('content', __('详情'));
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
        $form = new Form(new Help);

        $form->text('title', __('标题'));
        $form->textarea('content', __('详情'));

        return $form;
    }
}
