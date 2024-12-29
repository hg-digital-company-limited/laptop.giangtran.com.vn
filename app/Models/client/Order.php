<?php

namespace App\Models\client;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class Order extends Model
{
    use HasFactory;
    protected $table = "donhang";
    public function getOrdersUserId($idUser)
    {
        $results = DB::table($this->table)
            ->join('chitietdonhang', 'chitietdonhang.idDonHang', '=', 'donhang.idDonHang')
            ->join('loaisanpham', 'loaisanpham.idLoaiSp', '=', 'chitietdonhang.idLoaiSp')
            ->join('sanpham', 'sanpham.idSp', '=', 'loaisanpham.idSp')
            ->select(
                'donhang.idDonHang',
                'donhang.ten',
                'donhang.Sdt',
                'donhang.Email',
                'donhang.DiaChi',
                'donhang.trangThai',
                'donhang.ngayMuaHang',
                DB::raw('GROUP_CONCAT(sanpham.tenSp SEPARATOR ", ") as tenSp'),
                DB::raw('GROUP_CONCAT(loaisanpham.tenLoaiSp SEPARATOR ", ") as tenLoaiSp'),
                DB::raw('GROUP_CONCAT(loaisanpham.img SEPARATOR ", ") as img'),
                DB::raw('GROUP_CONCAT(loaisanpham.giaSp SEPARATOR ", ") as giaSp'),
                DB::raw('GROUP_CONCAT(chitietdonhang.soLuongMua SEPARATOR ", ") as soLuongMua')
            )
            ->groupBy(
                'donhang.idDonHang',
                'donhang.ten',
                'donhang.Sdt',
                'donhang.Email',
                'donhang.DiaChi',
                'donhang.trangThai',
                'donhang.ngayMuaHang'
            )
            ->where('donhang.idUser', $idUser)
            ->orderBy('donhang.ngayMuaHang', 'desc')
            ->get()
            ->toArray();

        return array_map(function ($item) {
            return (array) $item;
        }, $results);
    }

    public function getOrderById($id)
    {
        $results = DB::table('donhang')
            ->join('chitietdonhang', 'chitietdonhang.idDonHang', '=', 'donhang.idDonHang')
            ->join('loaisanpham', 'loaisanpham.idLoaiSp', '=', 'chitietdonhang.idLoaiSp')
            ->join('sanpham', 'sanpham.idSp', '=', 'loaisanpham.idSp')
            ->select(
                'donhang.idDonHang',
                'donhang.ten',
                'donhang.Sdt',
                'donhang.Email',
                'donhang.DiaChi',
                'donhang.trangThai',
                'donhang.ngayMuaHang',
                DB::raw('GROUP_CONCAT(sanpham.tenSp SEPARATOR ", ") as tenSp'),
                DB::raw('GROUP_CONCAT(loaisanpham.tenLoaiSp SEPARATOR ", ") as tenLoaiSp'),
                DB::raw('GROUP_CONCAT(loaisanpham.img SEPARATOR ", ") as img'),
                DB::raw('GROUP_CONCAT(loaisanpham.giaSp SEPARATOR ", ") as giaSp'),
                DB::raw('GROUP_CONCAT(chitietdonhang.soLuongMua SEPARATOR ", ") as soLuongMua')
            )
            ->where('donhang.idDonHang', $id)
            ->groupBy(
                'donhang.idDonHang',
                'donhang.ten',
                'donhang.Sdt',
                'donhang.Email',
                'donhang.DiaChi',
                'donhang.trangThai',
                'donhang.ngayMuaHang'
            )
            ->first();

        if ($results) {
            return (array) $results;
        } else {
            return null;
        }
    }
}
