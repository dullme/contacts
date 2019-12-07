<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('invitation_code')->unique()->comment('邀请码');
            $table->integer('pid')->unsigned()->default(0)->comment('邀请人ID');
            $table->tinyInteger('status')->default(0)->comment('会员状态：1-已激活/0-待激活');
            $table->string('phone_model')->nullable()->comment('手机型号');
            $table->string('mobile')->nullable()->comment('手机号码');
            $table->string('remark')->nullable()->comment('备注');
            $table->timestamp('activation_at')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
