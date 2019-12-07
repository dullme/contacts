<?php

namespace App\Admin\Controllers;

use App\Bank;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class BankController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '银行管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Bank);
        $grid->model()->orderBy('created_at', 'DESC');
        $grid->column('bank_name', __('银行名称'));
        $grid->column('icon', __('图标'))->image('', 100, 100);
        $grid->column('status', __('是否启用'))->switch([
            'on' => ['value'=> 1, 'text' => '启用'],
            'off' => ['value'=> 0, 'text' => '禁用'],
        ]);
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
        $show = new Show(Bank::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('bank_name', __('银行名称'));
        $show->field('status', __('是否启用'))->as(function ($status){
            return $status?'启用':'禁用';
        });
        $show->field('icon', __('图标'))->image();

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Bank);

        $form->text('bank_name', __('银行名称'))->required('required');
//        $form->text('bank_code', __('Bank code'));
        $form->image('icon', __('图标'))->required('required');
        $form->switch('status', __('是否启用'))->default(1)->states([
            'on' => ['value'=> 1, 'text' => '启用'],
            'off' => ['value'=> 0, 'text' => '禁用'],
        ]);;
//        $form->text('background', __('Background'));

        return $form;
    }
}
