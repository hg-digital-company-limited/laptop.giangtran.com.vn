<?php

namespace App\Models\admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class UserModel extends Model
{
    use HasFactory;

    protected $table = 'user';

    public function checkAdmin($userName, $pass)
    {
        $result = DB::table($this->table)->select('vaiTro')
            ->where('userName', $userName)
            ->where('password', $pass)->first();
        return $result;
    }

    public function getUsers()
    {
        $results = DB::table('user')
            ->get()
            ->where('idUser', '!=', 1)
            ->toArray();

        return array_map(function ($item) {
            return (array) $item;
        }, $results);
    }
    public function updateRole($idUser, $newRole)
    {
        DB::table($this->table)
            ->where('idUser', $idUser)
            ->update(['vaiTro' => $newRole]);
    }
}
