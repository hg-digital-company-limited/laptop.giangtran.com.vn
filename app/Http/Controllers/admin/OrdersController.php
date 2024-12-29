<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\admin\OrderModel;

class OrdersController extends Controller
{
    protected $redirect;
    protected $obJMdOrders;

    public function __construct(OrderModel $orderModel)
    {
        $this->obJMdOrders = $orderModel;
    }
    function showListOrders()
    {

        $data = [
            'allOrders' => $this->obJMdOrders->getAllDataOrders()
        ];
        return view('admin/orders/listOrders', $data);
    }
    function showOrderDetail($id_order)
    {
        $data = [
            'order' => $this->obJMdOrders->getOrderById($id_order)
        ];
        return view('admin/orders/orderDetail', $data);
    }

    function handleUpdateOrderStatus(Request $request)
    {
        $id = $request->input('idDonHang');
        $status = $request->input('trangThai');
        $this->obJMdOrders->updateOrderStatus($id, $status);

        $this->redirect = route('admin.order.detail', ["id_order" => $id]);
        session()->flash('success', 'Cập nhật đơn hàng thành công!');
        return redirect($this->redirect);
    }

}
