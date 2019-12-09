<?php

namespace App\Admin\Controllers;

use App\Admin\Extensions\Tools\ChangeUserStatus;
use App\Admin\Extensions\Tools\UserTool;
use App\User;
use Carbon\Carbon;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;
use Illuminate\Http\Request;

class UserController extends AdminController
{

    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '会员管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User);
        if(Auth('admin')->user()->id != 1){
            $grid->model()->where([
                'status' => 1,
                'pid' => Auth('admin')->user()->id
            ])->orderBy('activation_at', 'DESC');
        }else{
            $grid->model()->where([
                'status' => 1,
            ])->orderBy('activation_at', 'DESC');
        }


        //筛选框
        $grid->filter(function ($filter){
            $filter->equal('invitation_code', '推广码');
        });

        $grid->column('id', __('ID'));
        $grid->column('invitation_code', __('邀请码'))->expand(function ($model) {

            $comments = $model->contacts->map(function ($comment) {
                return $comment->only(['id', 'name', 'mobile']);
            });

            return new Table(['ID', '姓名', '电话'], $comments->toArray());
        });

        $grid->column('phone_model', '手机型号');
        $grid->column('mobile', '手机号码');
        $grid->column('activation_at', __('注册时间'));

//        $grid->column('status', __('状态'))->display(function ($status) {
//            if ($status == 0) {
//                $label = "<a class='label label-danger'>待激活</a>";
//            } else if ($status == 1) {
//                $label = "<a class='label label-success'>已激活</a>";
//            } else {
//                $label = "<a class='label label-default'>未知</a>";
//            }
//
//            return $label;
//        });

        $grid->column('remark', __('备注'))->editable();

        //操作栏
        $grid->actions(function ($actions) {
            $actions->disableView();

            if ($this->row->status != 0) {
                $actions->disableDelete();
            }
        });
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
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        $show->panel()->tools(function ($tools) {
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
        $form = new Form(new User);

        $form->switch('status', __('状态'))->states([
            'on'  => ['value' => 1, 'text' => '正常', 'color' => 'success'],
            'off' => ['value' => 0, 'text' => '冻结', 'color' => 'danger'],
        ])->default(1);


        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
        });

        return $form;
    }

    public function showAddUsers(Content $content)
    {
        return $content
            ->header('增加/减少天数')
            ->description(' ')
            ->body(view('admin.addUsers'));
    }

    public function editAddUsers(Request $request)
    {
        $request->validate([
            'count' => 'required|integer|min:1|max:200',
        ]);

        $count = $request->input('count');
        $pid = Auth('admin')->user()->id;

        $lastUser = User::where('pid', $pid)->count();
        $code = 0;
        if ($lastUser) {
            $code = $lastUser->id;
        }
        $data = [];
        $now = Carbon::now()->toDateTimeString();
        for ($i = 0; $i < $count; $i++){
            $data[$i]['pid'] = $pid;
            $data[$i]['invitation_code'] = $pid.++$code.makeInvitationCode(1);
            $data[$i]['created_at'] = $now;
            $data[$i]['updated_at'] = $now;
        }

        User::insert($data);

        return response()->json([
            'status'  => true,
            'message' => '邀请码添加成功！'
        ]);
    }
}
