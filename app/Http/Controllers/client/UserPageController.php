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


        // isert DH 
        $this->objPro->insertDonHang($idDonHang, $getAll['ten'], $getAll['sdt'], $getAll['email'], $getAll['diaChi'], $getAll['idUser']);

        for ($i = 0; $i <= $getAll['soLuongCart']; $i++) {
            $idLoaiSp = $getAll["idLoaiSp$i"];
            $soLuongMua = $getAll["soLuongMua$i"];
            $this->objPro->insertCtDonHang($soLuongMua, $idDonHang, $idLoaiSp);
        }
        Session::forget('cart');
        session()->flash('success', 'Đặt hàng thành công!');
        return redirect(route('home'));

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
