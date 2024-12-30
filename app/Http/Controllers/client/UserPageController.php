<?php

namespace App\Http\Controllers\client;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;

use App\Models\client\ProductModel;
use App\Models\client\CategoryModel;
use App\Models\client\UserClientModel;
use App\Models\client\CommentModel;
use App\Models\client\Order;

use Illuminate\Support\Facades\Session;

class UserPageController extends Controller
{

    protected $objCt;
    protected $objPro;
    protected $objCm;
    protected $objOrder;



    function __construct()
    {
        $this->objCt = new CategoryModel();
        $this->objPro = new ProductModel();
        $this->objCm = new CommentModel();
        $this->objOrder = new Order();
    }

    public function index()
    {

        $data = [
            'allHomePr' => $this->objPro->getHomeProduct(),
            'allCate' => $this->objCt->getAllCategories(),
            'CateFt' => $this->objCt->getAllCategoriesFt(),
            'getLevelCate' => $this->objCt->handleCategorylevel(),
            'allHotPr' => $this->objPro->getHotProduct()
        ];
        return view('client/index', $data);
    }
    public function getProductDetail($plug = null, $idSp = null, $idLoaiSp = null)
    {

        // update view hiện tại + thêm 1
        $this->objPro->updateViewTypePr($idLoaiSp, $this->objPro->getViewTypePr($idLoaiSp));
        $data = [
            'plug' => $plug,
            'idSp' => $idSp,
            'idLoaiSp' => $idLoaiSp,
            'CateFt' => $this->objCt->getAllCategoriesFt(),
            'getIdSp' => $this->objPro->getProducFltId($idSp, $idLoaiSp),
            'typeProduct' => $this->objPro->getTypeProduct($idSp),
            'view' => $this->objPro->getViewTypePr($idLoaiSp),
            'infoComment' => $this->objCm->getInfoCommentIdLoaiSp($idLoaiSp),

        ];
        return view('client/productDetail', $data);
    }

    public function showCartProduct()
    {

        $cartSession = Session::get('cart', []);

        $listCart = [];
        foreach ($cartSession as $key => $sl) {
            $getCart = $this->objPro->getCartProduct($key);
            $cart = (array) $getCart;
            $cart['soLuong'] = $sl;
            $listCart[] = $cart;
        }

        $infoLogValue = Cookie::get('infoLog');
        if ($infoLogValue) {


            $idUser = json_decode($infoLogValue)->idUser;

            $data = [
                'CateFt' => $this->objCt->getAllCategoriesFt(),
                'CartItems' => $listCart,
                'idUser' => $idUser

            ];
            return view('client/cartProduct', $data);
        } else {
            echo "vui lòng đăng nhập trước khi đặt hàng";
        }
    }
    public function showProductCategories(Request $request, $idDm = null)
    {

        $data = [
            'CateFt' => $this->objCt->getAllCategoriesFt(),
            'listProCtgries' => $this->objPro->getProductCategories($idDm),
            'tenDm' => $this->objCt->getNameCategory($idDm)
        ];
        return view('client/productCategories', $data);
    }
    public function handleAddCart(Request $request)
    {
        $idLoaiSp = $request->input('idLoaiSp');
        $soLuong = $request->input('soLuong');
        $plug = $request->input('plug');
        $idSp = $request->input('idSp');
        $idLoaiSp = $request->input('idLoaiSp');

        if (Session::has('cart')) {
            $cart = Session::get('cart');
        } else {
            $cart = [];
        }

        // Kiểm tra xem sản phẩm đã có trong giỏ hàng hay chưa
        if (array_key_exists($idLoaiSp, $cart)) {
            // Nếu đã có, cập nhật số lượng
            $cart[$idLoaiSp] += $soLuong;
            session()->flash('success', 'Đã cập nhật số lượng cho sản phẩm!');
        } else {
            // Nếu chưa có, thêm sản phẩm vào giỏ hàng với số lượng mới
            $cart[$idLoaiSp] = $soLuong;
            session()->flash('success', 'Thêm vào giỏ hàng thành công!');
        }

        Session::put('cart', $cart);

        return redirect(route('sanpham.productdetail', [
            'plug' => $plug,
            'idSp' => $idSp,
            'idLoaiSp' => $idLoaiSp,
        ]));

    }
    public function handleDeleteCart(Request $request)
    {
        $idLoaiSp = $request->input('idLoaiSp');

        $cart = session()->get('cart');

        if (array_key_exists($idLoaiSp, $cart)) {

            unset($cart[$idLoaiSp]);
            session()->put('cart', $cart);
        }
        return redirect(route('sanpham.cart'));
    }
    public function handleInsertOrders(Request $request)
    {
        $getAll = $request->all();
        $idDonHang = $this->objPro->getIdnewDonHang() + 1;
    
        // Tạo đơn hàng
        $this->objPro->insertDonHang($idDonHang, $getAll['ten'], $getAll['sdt'], $getAll['email'], $getAll['diaChi'], $getAll['idUser']);
    
        // Tạo chi tiết đơn hàng
        for ($i = 0; $i < $getAll['soLuongCart']; $i++) {
            $idLoaiSp = $getAll["idLoaiSp$i"];
            $soLuongMua = $getAll["soLuongMua$i"];
            $this->objPro->insertCtDonHang($soLuongMua, $idDonHang, $idLoaiSp);
        }
        Session::forget('cart');
        session()->flash('success', 'Đặt hàng thành công!');



        $tongTien = 0; // Khởi tạo tổng tiền

        // Tạo chi tiết đơn hàng và tính tổng tiền
        for ($i = 0; $i <= $getAll['soLuongCart'] ; $i++) {
            $idLoaiSp = $getAll["idLoaiSp$i"];
            $soLuongMua = $getAll["soLuongMua$i"];
    
            // Lấy giá sản phẩm từ bảng loaisanpham
            $giaSp = $this->objPro->getGiaSanPham($idLoaiSp);
            // Cộng vào tổng tiền
            $tongTien += $giaSp * $soLuongMua;
    
            // Thêm chi tiết đơn hàng
            $this->objPro->insertCtDonHang($soLuongMua, $idDonHang, $idLoaiSp);
        }

        // Làm tròn tổng tiền và lưu vào biến
        $tongTien = round($tongTien);
        // Kiểm tra phương thức thanh toán
        if (true) {
            date_default_timezone_set('Asia/Ho_Chi_Minh');
    
            // Cấu hình VNPAY
            $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
            $vnp_Returnurl = 'http://localhost:8000/checkpayment'; // Đường dẫn kiểm tra thanh toán
            $vnp_TmnCode = "R3E63P5P"; // Mã website tại VNPAY
            $vnp_HashSecret = "GXDEHIEBSREFTEALNKYBXMKDKVVBEJPC"; // Chuỗi bí mật
    
            // Tạo dữ liệu thanh toán
            $vnp_TxnRef = $idDonHang;
            $vnp_OrderInfo = "Thanh toán đơn hàng #" . $idDonHang;
            $vnp_OrderType = 'billpayment';
            $vnp_Amount = $tongTien * 100 ; // Làm tròn tổng tiền (VND)
            $vnp_Locale = 'vn';
            $vnp_BankCode =  'NCB'; // Ngân hàng mặc định hoặc chọn từ form
            $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];
    
            // Tạo mảng dữ liệu đầu vào
            $inputData = [
                "vnp_Version" => "2.1.0",
                "vnp_TmnCode" => $vnp_TmnCode,
                "vnp_Amount" => $vnp_Amount,
                "vnp_Command" => "pay",
                "vnp_CreateDate" => now()->format('YmdHis'),
                "vnp_CurrCode" => "VND",
                "vnp_IpAddr" => $vnp_IpAddr,
                "vnp_Locale" => $vnp_Locale,
                "vnp_OrderInfo" => $vnp_OrderInfo,
                "vnp_OrderType" => $vnp_OrderType,
                "vnp_ReturnUrl" => $vnp_Returnurl,
                "vnp_TxnRef" => $vnp_TxnRef
            ];
    
            // Thêm thông tin ngân hàng nếu có
            if (isset($vnp_BankCode) && $vnp_BankCode != "") {
                $inputData['vnp_BankCode'] = $vnp_BankCode;
            }
            if (isset($vnp_Bill_State) && $vnp_Bill_State != "") {
                $inputData['vnp_Bill_State'] = $vnp_Bill_State;
            }
    
            // Sắp xếp dữ liệu theo key
            ksort($inputData);
            $query = "";
            $i = 0;
            $hashdata = "";
            foreach ($inputData as $key => $value) {
                if ($i == 1) {
                    $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
                } else {
                    $hashdata .= urlencode($key) . "=" . urlencode($value);
                    $i = 1;
                }
                $query .= urlencode($key) . "=" . urlencode($value) . '&';
            }
            
            $vnp_Url = $vnp_Url . "?" . $query;
            if (isset($vnp_HashSecret)) {
                $vnpSecureHash =   hash_hmac('sha512', $hashdata, $vnp_HashSecret);//  
                $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
            }
            $returnData = array('code' => '00'
                , 'message' => 'success'
                , 'data' => $vnp_Url);
                if (true) {
                    return redirect()->away($vnp_Url);

                    die();
                } else {
                    echo json_encode($returnData);
                }
        }
    
        // // Xử lý khi không dùng VNPAY
      
        // return redirect(route('home'));
    }
    
    public function handleInsertComment(Request $request)
    {
        $getAll = $request->all();
        $objCm = new CommentModel();
        if (Cookie::has('infoLog')) {
            $idUser = json_decode(Cookie::get('infoLog'), true)['idUser'];
            $objCm->insertComment($getAll['ndComment'], $idUser, $getAll['idLoaiSp']);
            return redirect(route('sanpham.productdetail', [
                'plug' => $getAll['plug'],
                'idSp' => $getAll['idSp'],
                'idLoaiSp' => $getAll['idLoaiSp'],
            ]));
        } else {
            return redirect()->route('home');
        }
    }
    public function handleLogin(Request $request)
    {
        $allData = $request->all();
        $objUser = new UserClientModel();

        $dataGeted = $objUser->getDataUser($allData['email'], $allData['password']);

        if ($dataGeted) {

            $infoLogValue = json_encode([
                'idUser' => $dataGeted->idUser,
                'email' => $dataGeted->Email,
                'nickName' => $dataGeted->nickName,
                'vaiTro' => $dataGeted->vaiTro
            ]);
            session()->flash('success', 'Đăng nhập thành công!');
            Cookie::queue('infoLog', $infoLogValue, 60);
            return redirect(route('home'));
        }
        session()->flash('error', 'Tài khoản hoặc mật khẩu không chính xác!');
        return redirect(route('home'));
    }

    public function handleLogout()
    {
        Cookie::queue('infoLog', null, -1);
        return redirect(route('home'));
    }
    public function handleRegister(Request $request)
    {
        $objUser = new UserClientModel();
        $getAll = $request->all();
        if ($objUser->checkExistUser($getAll['Email'])) {
            session()->flash('error', 'Email đã có người đăng ký');
        } else {
            $objUser->registerUser($getAll['Email'], $getAll['nickName'], $getAll['password']);
            session()->flash('success', 'đăng ký tài khoản thành công!');
        }
        return redirect()->route('home');
    }

    public function orderList()
    {

        $infoLogValue = Cookie::get('infoLog');

        if ($infoLogValue) {
            $idUser = json_decode($infoLogValue)->idUser;

            return view('client/listOrders', [
                "CateFt" => $this->objCt->getAllCategoriesFt(),
                "orders" => $this->objOrder->getOrdersUserId($idUser)
            ]);
        } else {
            echo "Vui lòng đăng nhập để xem danh sách đơn hàng";
        }
    }

    public function orderDetail($idDonHang)
    {
        return view('client/detailOrder', [
            "CateFt" => $this->objCt->getAllCategoriesFt(),
            "order" => $this->objOrder->getOrderById($idDonHang)
        ]);
    }

}
