<?php

namespace App\Models\client;

use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class UserClientModel extends Model
{
    use HasFactory;
    public function getDataUser($email, $pass)
    {
        // Lấy người dùng theo email
        $user = DB::table('user')
            ->where('email', $email)
            ->first();

        // Kiểm tra người dùng tồn tại và mật khẩu đúng
        if ($user && Hash::check($pass, $user->password)) {
            return $user;
        } else {
            return null; 
        }
    }
    public function checkExistUser($email)
    {
        $result = DB::table('user')->where('Email', $email)->first();

        return ($result ? 1 : 0);
    }
    public function registerUser($Email, $nickName, $password)
    {
        $data = [
            'Email' => $Email,
            'nickName' => $nickName,
            'password' => bcrypt($password)
        ];
        DB::table('user')->insert($data);
    }


}
