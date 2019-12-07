<?php

use App\User;

function getUserId($id, $pid){
    $u = User::where('pid', $id)->pluck('id')->toArray();
    if($pid == 0){

        return array_merge($u, [$id]);
    }else{
        return array_merge($u, [$id, $pid]);
    }
}

/**
 * 生成纯数字的随机数
 * @param $len
 * @return bool|string
 */
function randStr($len) {
    $chars = str_repeat('0123456789', $len);
    $chars = str_shuffle($chars);
    $str = substr($chars, 0, $len);

    return $str;
}

function makeInvitationCode($length) {
    $chars = 'ABCDEFGHJKLMNPQRSTUVWXY0123456789';
//    $chars = '0123456789012345678901234567890123456789';
    $password = '';
    for ($i = 0; $i < $length; $i++) {
        $password .= $chars[mt_rand(0, strlen($chars) - 1)];
    }

    return $password;
}

function getInvitationCode(){
    $code = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $rand = $code[rand(0,25)]
        .strtoupper(dechex(date('m')))
        .date('d')
        .substr(time(),-5)
        .substr(microtime(),2,5)
        .sprintf('%02d',rand(0,99));
    for(
        $a = md5( $rand, true ),
        $s = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ',
        $d = '',
        $f = 0;
        $f < 6;
        $g = ord( $a[ $f ] ),
        $d .= $s[ ( $g ^ ord( $a[ $f + 8 ] ) ) - $g & 0x1F ],
        $f++
    );
    return $d;
}

function upload($file, $disk='public') {
    // 1.是否上传成功
    if (! $file->isValid()) {
        return [
            'status' => false,
            'message' => '未上传成功'
        ];
    }

    // 2.是否符合文件类型 getClientOriginalExtension 获得文件后缀名
    $fileExtension = strtolower($file->getClientOriginalExtension());
    if(! in_array($fileExtension, ['png', 'jpg', 'gif', 'jpeg'])) {
        return [
            'status' => false,
            'message' => '图片类型错误'
        ];
    }

    // 3.判断大小是否符合 2M
    $tmpFile = $file->getRealPath();
    if (filesize($tmpFile) >= 10240000) {
        return [
            'status' => false,
            'message' => '文件超过10M'
        ];
    }

    // 4.是否是通过http请求表单提交的文件
    if (! is_uploaded_file($tmpFile)) {
        return [
            'status' => false,
            'message' => '非表单提交'
        ];
    }

    // 5.每天一个文件夹,分开存储, 生成一个随机文件名
    $fileName = date('Y_m_d').'/'.md5(time()) .mt_rand(0,9999).'.'. $fileExtension;
    if (Storage::disk($disk)->put($fileName, file_get_contents($tmpFile)) ){
        return [
            'status' => true,
            'path' => Storage::url($fileName),
            'message' => '上传成功'
        ];
    }
}

/**
 * 默认的精度为小数点后两位
 * @param $number
 * @param int $scale
 * @return \Moontoast\Math\BigNumber
 */
function bigNumber($number, $scale = 2)
{
    return new \Moontoast\Math\BigNumber($number, $scale);
}
