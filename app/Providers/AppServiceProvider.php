<?php

namespace App\Providers;

use Carbon\Carbon;
use Validator;
use Illuminate\Support\ServiceProvider;
use Encore\Admin\Config\Config;
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Carbon::setLocale('zh');

        $table = config('admin.extensions.config.table', 'admin_config');
        if (Schema::hasTable($table)) {
            Config::load();
        }

        /**
         * 手机号验证
         */
        Validator::extend('mobile', function($attribute, $value, $parameters) {
            return preg_match('/1(3[0-9]|4[579]|5[0-35-9]|7[0135-8]|8[0-9])[0-9]{8}$/', $value);
        });
    }
}
