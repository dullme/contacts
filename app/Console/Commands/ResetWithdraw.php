<?php

namespace App\Console\Commands;

use App\Withdraw;
use Carbon\Carbon;
use Illuminate\Console\Command;

class ResetWithdraw extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'reset:withdraw';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '重置超时的订单';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        return Withdraw::where('status', 1)->where('time_out_at', '<', Carbon::now())->update([
            'payer_user_id' => NULL,
            'payer_parent_user_id' => NULL,
            'parent_brokerage_fee' => 0,
            'status' => 0,
            'grab_at' => NULL,
            'time_out_at' => NULL,
        ]);
    }
}
