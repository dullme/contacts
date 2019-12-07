<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'pid',
        'status',
        'amount',
        'username',
        'name',
        'invitation_code',
        'bank_name',
        'bank_card',
        'password',
        'remark',
        'vip',
    ];

    public function findForPassport($username) {

        return User::where('username', $username)->first();
    }

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    /**
     * 上级邀请人
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function upLevel()
    {
        return $this->belongsTo(self::class, 'pid', 'id');
    }


    /**
     * 下级用户
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function downLevel()
    {
        return $this->hasMany(self::class, 'pid', 'id');
    }


    /**
     * 保证金记录
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function deposit()
    {
        return $this->hasMany(Deposit::class)
            ->where('status', 1);
    }


    public function totalAmount()
    {
        return $this->hasMany(Withdraw::class, 'user_id', 'id')->where('status', 3);
    }

    public function withdraw()
    {
        return $this->hasMany(Withdraw::class, 'payer_user_id', 'id');
    }
}
