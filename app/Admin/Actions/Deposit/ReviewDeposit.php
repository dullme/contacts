<?php

namespace App\Admin\Actions\Deposit;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class ReviewDeposit extends RowAction
{
    public $name = '审核';

    public function handle(Model $model)
    {
        $model->status = 1;
        $model->save();

        return $this->response()->success('审核通过')->refresh();
    }

    public function dialog()
    {
        $this->confirm('确定审核通过？');
    }

}