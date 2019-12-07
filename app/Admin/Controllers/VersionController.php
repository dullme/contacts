<?php

namespace App\Admin\Controllers;

use App\Version;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class VersionController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '版本管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Version);
        $grid->model()->orderBy('created_at', 'DESC');

        $grid->column('id', __('Id'));
        $grid->column('name', __('项目名称'));
        $grid->column('number', __('版本号'));
        $grid->column('android_link', __('更新地址'));
        $grid->column('packge_size', __('更新包大小'));
        $grid->column('info', __('更新描述'));
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
        $show = new Show(Version::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('项目名称'));
        $show->field('number', __('版本号'));
        $show->field('android_link', __('更新地址'));
        $show->field('packge_size', __('更新包大小'));
        $show->field('info', __('更新描述'));
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
        $form = new Form(new Version);

        $form->number('id', __('版本ID'))->required('required');
        $form->text('name', __('项目名称'))->required('required');
        $form->text('number', __('版本号'))->required('required');
        $form->text('android_link', __('更新地址'))->required('required');
        $form->text('packge_size', __('更新包大小'))->required('required');
        $form->textarea('info', __('更新描述'))->required('required');

        return $form;
    }
}
