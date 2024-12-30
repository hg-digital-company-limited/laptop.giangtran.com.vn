<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\client\Order; // Import model Order

class PaymentController extends Controller
{
    public function checkPayment(Request $request)
    {
        $params = $request->all();

        // Kiểm tra các tham số cần thiết
        if (!isset($params['vnp_TransactionStatus']) || !isset($params['vnp_TxnRef'])) {
            abort(400, 'Thiếu tham số cần thiết');
        }

        $transactionStatus = $params['vnp_TransactionStatus'];
        $txnRef = $params['vnp_TxnRef'];

        // Kiểm tra trạng thái giao dịch
        if ($transactionStatus == '00') {
            // Tìm order theo mã
            $order = Order::where('idDonHang', $txnRef)->first();

            if ($order) {
                // Cập nhật trạng thái order
                $order->update(['trangThai' => 'paid']); // Đảm bảo 'trangThai' đã được thêm vào thuộc tính fillable trong model

                // Hiển thị thông báo thành công
                session()->flash('message', 'Thanh toán thành công! Đơn hàng của bạn đã được cập nhật.');
                return redirect()->to('/success-page');
            } else {
                session()->flash('error', 'Không tìm thấy đơn hàng.');
                return redirect()->to('/error-page');
            }
        } else {
            // Giao dịch thất bại hoặc bị hủy
            $order = Order::where('idDonHang', $txnRef)->first();
            if ($order) {
                $order->update(['trangThai' => 'cancelled']); // Cập nhật trạng thái là 'cancelled'
            }
            session()->flash('error', 'Thanh toán thất bại hoặc bị hủy.');
            return redirect()->to('/cancel-page');
        }
    }
}
