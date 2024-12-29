<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\admin\UserModel;

class UserController extends Controller
{

    protected $objUser;
    function __construct()
    {
        $this->objUser = new UserModel();
    }
    public function showListUser()
    {

        return view('admin.user.listuser', [
            'users' => $this->objUser->getUsers()
        ]);
    }

    public function handleUpdateRole(Request $request) {
        $idUser = $request->input('idUser');
        $vaiTro = $request->input('vaiTro');
        $this->objUser->updateRole($idUser, $vaiTro);

        session()->flash('success', 'Phân quyền thành công!');  
        return redirect(route('admin.user.list'));
    }

}
