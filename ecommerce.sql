-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 30, 2024 lúc 12:04 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ecommerce`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `anhsanpham`
--

CREATE TABLE `anhsanpham` (
  `idImgs` int(11) NOT NULL,
  `subImg` varchar(255) DEFAULT NULL,
  `idSp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `anhsanpham`
--

INSERT INTO `anhsanpham` (`idImgs`, `subImg`, `idSp`) VALUES
(133, 'hx-1_38f491c0604e44d790c9a2b31b8f09f6_e47dc2b4fa214cb1a1bbe498224df51b_5eb757e2c3a04a779691287146c3431e_grande.webp', 2),
(134, 'hx-2_0895d7eec6f04929b00c6c60fd6bcbfb_419592787ed241d6a823689ffb932b1d_651117a77a4647b3a4d16063e543720a_grande.webp', 2),
(135, 'hx-3_5aadb2449ebe4430b431a59505610305_6c1679fadd154e158c046c2dc9d0d68e_b3702d7e6ea449c1861d046f6eb278df_grande.webp', 2),
(136, 'sus-rog-zephyrus-g15-ga503rs-ln892w-3_3963c2ec4e884107a3cd22fa9c851861_702991b027584aebb7f7e8c3a9b71e8e_grande.webp', 3),
(137, 'sus-rog-zephyrus-g15-ga503rs-ln892w-4_17f8364a7b544a4888359c0ced05d581_0d0cba1791a348cd824c9095a6908414_grande.webp', 3),
(138, 'sus-rog-zephyrus-g15-ga503rs-ln892w-5_fc27ef3cab3d48d4ad7b386f8bcc730d_3cc87c57070e49c0b881da3b4378c2d6_grande.webp', 3),
(139, '14z90rs-02-1-gram-style-design-mobile_d3807c71442c4235b9da6ffdcf597d04_999d52f9503749069407961b41b8e2e7_grande.jpg', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `idCtDonHang` int(11) NOT NULL,
  `soLuongMua` int(11) DEFAULT NULL,
  `idDonHang` int(11) DEFAULT NULL,
  `idLoaiSp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`idCtDonHang`, `soLuongMua`, `idDonHang`, `idLoaiSp`) VALUES
(18, 1, 4, 70),
(19, 1, 4, 72),
(20, 1, 5, 70),
(21, 1, 5, 72),
(22, 1, 5, 68),
(23, 1, 5, 69),
(24, 2, 6, 72),
(25, 2, 6, 70),
(26, 2, 6, 71),
(27, 3, 7, 72),
(28, 3, 7, 70),
(29, 3, 7, 71),
(30, 1, 7, 69),
(31, 4, 8, 72),
(32, 1, 9, 72),
(33, 1, 10, 69),
(34, 1, 11, 69),
(35, 1, 25, 68),
(36, 1, 26, 68),
(37, 1, 27, 68),
(38, 1, 28, 68),
(39, 1, 28, 68),
(40, 1, 29, 68),
(41, 1, 29, 68),
(42, 1, 30, 68),
(43, 1, 30, 68),
(44, 1, 31, 68),
(45, 1, 31, 68),
(46, 1, 31, 71),
(47, 1, 32, 68),
(48, 1, 32, 71),
(49, 1, 32, 68),
(50, 1, 32, 71),
(51, 1, 32, 72),
(52, 1, 33, 68),
(53, 1, 33, 71),
(54, 1, 33, 68),
(55, 1, 33, 71),
(56, 1, 33, 72),
(57, 1, 34, 68),
(58, 1, 34, 71),
(59, 1, 34, 68),
(60, 1, 34, 71),
(61, 1, 34, 72),
(62, 4, 35, 69),
(63, 2, 36, 72),
(64, 4, 37, 72);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chudetintuc`
--

CREATE TABLE `chudetintuc` (
  `IdCdTinTuc` int(11) NOT NULL,
  `tenCdTinTuc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `idComment` int(11) NOT NULL,
  `ndComment` mediumtext DEFAULT NULL,
  `ngayComment` timestamp NOT NULL DEFAULT current_timestamp(),
  `idUser` int(11) DEFAULT NULL,
  `idLoaiSp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmucsanpham`
--

CREATE TABLE `danhmucsanpham` (
  `idDm` int(11) NOT NULL,
  `tenDm` varchar(255) DEFAULT NULL,
  `iconDm` varchar(255) DEFAULT NULL,
  `idDmcha` int(11) DEFAULT 0,
  `trangThai` varchar(255) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmucsanpham`
--

INSERT INTO `danhmucsanpham` (`idDm`, `tenDm`, `iconDm`, `idDmcha`, `trangThai`) VALUES
(27, 'Laptop', '&lt;i class=&#039;bx bx-laptop&#039; &gt;&lt;/i&gt;', 0, '1'),
(28, 'Máy tính cây', '&lt;i class=&#039;bx bx-desktop&#039;&gt;&lt;/i&gt;', 0, '1'),
(29, 'Bàn phím - lót', '&lt;i class=&#039;bx bxs-keyboard&#039; &gt;&lt;/i&gt;', 0, '1'),
(30, 'Tai nghe - loa', '&lt;i class=&#039;bx bx-headphone&#039; &gt;&lt;/i&gt;', 0, '1'),
(31, 'Bàn - ghế gaming', '&lt;i class=&#039;bx bx-chair&#039; &gt;&lt;/i&gt;', 0, '1'),
(32, 'Phụ kiện', '&lt;i class=&#039;bx bx-joystick&#039;&gt;&lt;/i&gt;', 0, '1'),
(33, 'Thương hiệuu', '', 27, '1'),
(34, 'Giá bán', '', 27, '1'),
(35, 'Dưới 12tr', '', 34, '1'),
(36, 'từ 12 - 15tr', '', 34, '1'),
(38, 'Trên 20tr', '', 34, '1'),
(39, 'ASUS', '', 33, '1'),
(42, 'ACER', '', 33, '1'),
(43, 'LENOVO', '', 33, '1'),
(44, 'MSI', '', 33, '1'),
(45, 'DELL', '', 33, '1'),
(46, 'HP', '', 33, '1'),
(47, 'Thương hiệu', '', 29, '1'),
(48, 'Giá bán', '', 29, '1'),
(49, 'Dưới 1tr', '', 48, '1'),
(50, 'Từ 1tr - 2tr', '', 48, '1'),
(51, 'Trên 2tr', '', 48, '1'),
(52, 'Akko', '', 47, '1'),
(53, 'ASUS', '', 47, '1'),
(54, 'Logitech', '', 47, '1'),
(105, 'Thương hiệu', '', 31, '1'),
(106, 'Giá bán', '', 31, '1'),
(368, 'Laptop gaming', '', 27, '1'),
(369, 'Laptop văn phòng', '', 27, '1'),
(374, 'Ram - SSD - HDD', '&lt;i class=&#039;bx bxs-save&#039;&gt;&lt;/i&gt;', 0, '1'),
(376, 'Màn hình máy tính', '&lt;i class=&#039;bx bx-slideshow&#039;&gt;&lt;/i&gt;', 0, '1'),
(377, 'Chuột - lót chuột', '&lt;i class=&#039;bx bxs-mouse-alt&#039; &gt;&lt;/i&gt;', 0, '1'),
(378, 'Balo laptop - túi', '&lt;i class=&#039;bx bxs-shopping-bag-alt&#039; &gt;&lt;/i&gt;', 0, '1'),
(401, 'Dán skill + làm đẹp laptop', '&lt;i class=&#039;bx bx-sticker&#039;&gt;&lt;/i&gt;', 0, '1'),
(402, 'Linh kiện PC', '&lt;i class=&#039;bx bx-barcode-reader&#039;&gt;&lt;/i&gt;', 0, '1'),
(404, 'LG', '', 33, '1'),
(406, 'Sản phẩm hot', '&lt;i class=&#039;bx bxs-hot&#039;&gt;&lt;/i&gt;', 0, '1'),
(407, 'test', '', 29, '1'),
(408, 'test', '', 33, '1'),
(409, 'Laptop giá rẻ', '', 27, '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `idDonHang` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `ngayMuaHang` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `trangThai` varchar(255) NOT NULL DEFAULT 'Đợi xử lý',
  `Sdt` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  `updated_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`idDonHang`, `ten`, `ngayMuaHang`, `trangThai`, `Sdt`, `Email`, `DiaChi`, `idUser`, `updated_at`) VALUES
(4, 'Dương Đức Phương', '2024-08-05 09:05:50', 'Đã giao', '0354179060', 'zhuythai@gmail.com', 'HA NOI', 8, '2024-12-30'),
(5, 'Dương Đức Phương', '2024-08-04 17:27:57', 'Đã giao', '0354179060', 'vukhanhphuong2k4@gmail.com', 'HA NOI', 8, '2024-12-30'),
(6, 'Dương Đức Phương', '2024-08-05 07:43:08', 'Đã giao', '0354179060', 'vukhanhphuong2k4@gmail.com', 'HA NOI', 8, '2024-12-30'),
(7, 'Trương Phương Nam', '2024-08-05 09:04:18', 'Đã giao', '0336784512', 'nam@gmail.com', 'Nhà Số 17, Hòe Thị, Phương Canh, Nam Từ Liêm Hà Nội', 10, '2024-12-30'),
(8, 'Dương Đức Phương', '2024-08-05 09:00:35', 'Đã giao', '0354179060', 'vukhanhphuong2k4@gmail.com', 'Nhà Số 17, Hòe Thị, Phương Canh, Nam Từ Liêm Hà Nội', 8, '2024-12-30'),
(9, 'thuy', '2024-10-07 07:31:35', 'Trên đường', '0876554395', 'linh', 'ha noi', 11, '2024-12-30'),
(10, 'thuy', '2024-10-11 14:59:26', 'Trên đường', '0876554395', 'linh123@gmail.com', 'ha noi', 11, '2024-12-30'),
(11, 'Giang Trần', '2024-12-30 10:21:06', 'Đợi xử lý', '09883488421', 'trangiangzxc@gmail.com', '123', 12, '2024-12-30'),
(12, 'Giang Trần', '2024-12-30 10:27:21', 'Đợi xử lý', '096787658', 'trangiangzxc@gmail.com', '4535345', 12, '2024-12-30'),
(13, 'Giang Trần', '2024-12-30 10:28:57', 'Đợi xử lý', '867967', '456', '456', 12, '2024-12-30'),
(14, 'Giang Trần', '2024-12-30 10:32:45', 'Đợi xử lý', '898979', 'trangiangzxc@gmail.com', '345345', 12, '2024-12-30'),
(15, 'trangiangzxc@gmail.com', '2024-12-30 10:37:39', 'Đợi xử lý', 'trangiangzxc@gmail.com', 'trangiangzxc@gmail.com', 'trangiangzxc@gmail.com', 12, '2024-12-30'),
(16, 'trangiangzxc@gmail.com', '2024-12-30 10:38:12', 'Đợi xử lý', 'trangiangzxc@gmail.com', 'trangiangzxc@gmail.com', 'trangiangzxc@gmail.com', 12, '2024-12-30'),
(17, 'round($request->total_price)', '2024-12-30 10:38:35', 'Đợi xử lý', 'round($request->total_price)', 'round($request->total_price)', 'round($request->total_price)', 12, '2024-12-30'),
(18, 'round($request->total_price)', '2024-12-30 10:39:18', 'Đợi xử lý', 'round($request->total_price)', 'round($request->total_price)', 'round($request->total_price)', 12, '2024-12-30'),
(19, '$getAll', '2024-12-30 10:39:32', 'Đợi xử lý', '$getAll', '$getAll', '$getAll', 12, '2024-12-30'),
(20, '$getAll', '2024-12-30 10:39:43', 'Đợi xử lý', '$getAll', '$getAll', '$getAll', 12, '2024-12-30'),
(21, '$getAll', '2024-12-30 10:43:36', 'Đợi xử lý', '$getAll', '$getAll', '$getAll', 12, '2024-12-30'),
(22, 'Giang Trần', '2024-12-30 10:43:59', 'Đợi xử lý', 'Giang Trần', 'Giang Trần', 'Giang Trần', 12, '2024-12-30'),
(23, 'Giang Trần', '2024-12-30 10:44:27', 'Đợi xử lý', 'Giang Trần', 'Giang Trần', 'Giang Trần', 12, '2024-12-30'),
(24, 'Giang Trần', '2024-12-30 10:45:12', 'Đợi xử lý', 'Giang Trần', 'Giang Trần', 'Giang Trần', 12, '2024-12-30'),
(25, 'Giang Trần', '2024-12-30 10:45:44', 'Đợi xử lý', 'Giang Trần', 'Giang Trần', 'Giang Trần', 12, '2024-12-30'),
(26, 'Giang Trần', '2024-12-30 10:48:06', 'Đợi xử lý', 'Giang Trần', 'Giang Trần', 'Giang Trần', 12, '2024-12-30'),
(27, 'Giang Trần', '2024-12-30 10:48:10', 'Đợi xử lý', 'Giang Trần', 'Giang Trần', 'Giang Trần', 12, '2024-12-30'),
(28, 'Giang Trần', '2024-12-30 10:48:21', 'Đợi xử lý', 'Giang Trần', 'Giang Trần', 'Giang Trần', 12, '2024-12-30'),
(29, 'Giang Trần', '2024-12-30 10:48:38', 'Đợi xử lý', 'Giang Trần', 'Giang Trần', 'Giang Trần', 12, '2024-12-30'),
(30, 'Giang Trần', '2024-12-30 10:49:03', 'Đợi xử lý', 'Giang Trần', 'Giang Trần', 'Giang Trần', 12, '2024-12-30'),
(31, 'Giang Trần', '2024-12-30 10:49:19', 'Đợi xử lý', 'Giang Trần', 'Giang Trần', 'Giang Trần', 12, '2024-12-30'),
(32, '$getAll[\'soLuongCart\']', '2024-12-30 10:50:00', 'Đợi xử lý', '$getAll[\'soLuongCart\']', '$getAll[\'soLuongCart\']', '$getAll[\'soLuongCart\']', 12, '2024-12-30'),
(33, '$getAll[\'soLuongCart\']', '2024-12-30 10:50:11', 'Đợi xử lý', '$getAll[\'soLuongCart\']', '$getAll[\'soLuongCart\']', '$getAll[\'soLuongCart\']', 12, '2024-12-30'),
(34, '$tongTien$tongTien', '2024-12-30 10:50:28', 'Đợi xử lý', '$tongTien', '$tongTien', '$tongTien', 12, '2024-12-30'),
(35, '$tongTien', '2024-12-30 10:50:59', 'Đợi xử lý', '$tongTien', '$tongTien', '$tongTien', 12, '2024-12-30'),
(36, '07/15', '2024-12-30 10:56:44', 'paid', '07/15', '07/15', '07/15', 12, '2024-12-30'),
(37, 'Giang Trần', '2024-12-30 11:02:49', 'paid', 'Giang Trần', 'Giang Trần', 'Giang Trần', 12, '2024-12-30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `idLoaiSp` int(11) NOT NULL,
  `tenLoaiSp` varchar(255) DEFAULT NULL,
  `moTa` mediumtext NOT NULL,
  `img` varchar(255) NOT NULL,
  `giaSp` varchar(255) DEFAULT NULL,
  `soLuong` int(11) NOT NULL,
  `luotXem` varchar(255) NOT NULL DEFAULT '1',
  `idSp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`idLoaiSp`, `tenLoaiSp`, `moTa`, `img`, `giaSp`, `soLuong`, `luotXem`, `idSp`) VALUES
(68, 'i5-13450H 4.6 GHz GeForce RTX-4050 6GB', 'Đánh giá chi tiết laptop gaming ASUS ROG Strix G16 G614JU-N3135W\r\nLaptop gaming ngày nay được rất nhiều khách hàng lựa chọn nhằm phục vụ nhu cầu giải trí cao với các tựa game cấu hình nặng mà những chiếc laptop văn phòng không thể đáp ứng được. ASUS ROG Strix G16 G614JU-N3135W được ra đời nhằm mang đến những phút giây thăng hoa cho người dùng được thỏa sức đắm chìm vào các tựa game yêu thích của họ.\r\n\r\nGEARVN - Laptop gaming ASUS ROG Strix G16 G614JU-N3135W\r\n\r\nThiết kế mạnh mẽ đầy cá tính\r\nLaptop Asus ROG Strix được thiết kế vô cùng đẹp mắt với nắp máy tính làm từ nhôm cao cấp. Logo đặt lệch sang một bên làm điểm nhấn cho sự mạnh mẽ về hiệu năng cũng như thiết kế.\r\n\r\nPhần đáy được cắt xén tỉ mỉ với những đường rãnh cắt ngang hỗ trợ giữ máy cố định trên mặt bàn để quá trình chơi game lâu dài của người dùng không bị xê dịch gây sai sót ngoài ý muốn. Phần nghỉ tay của máy tính còn được phủ một lớp nhung soft-touch duy trì cảm giác dễ chịu cho 2 cánh tay khi sử dụng liên tục.\r\n\r\nGEARVN - Laptop gaming ASUS ROG Strix G16 G614JU-N3135W\r\n\r\nCấu hình vượt trội cho trải nghiệm tối đa\r\nLaptop Asus ROG Strix G16 sử dụng bộ xử lý Intel® Core™ i5-13450HX kết hợp cùng VGA NVIDIA Geforce GTX 4050 mang tới khả năng xử lý đa nhiệm một cách mượt mà. \r\n\r\nMột trong những dòng bàn phím ASUS ROG Strix G16 sở hữu ổ cứng SSD 512GB M.2 NVMe™ PCIe® 3.0 và bộ nhớ RAM 8GB DDR4 3200MHz hỗ trợ tốc độ load nhanh đến chóng mặt. Các tựa game như: PUBG, GTA 5, War Tank, God of War,... đều không thể làm khó được chiếc laptop này. \r\n\r\nGEARVN - Laptop gaming ASUS ROG Strix G16 G614JU-N3135W\r\n\r\nTản nhiệt hiệu quả cao \r\nViệc chơi game hay tải nặng trên máy tính luôn gây tình trạng nóng máy giảm hiệu suất, vì vậy tản nhiệt là cách tối ưu để có được hiệu suất làm việc tốt trong mọi lúc. CPU được thiết kế keo tản nhiệt lỏng trực tiếp làm mát tốt hơn các loại kem tản nhiệt gốm truyền thống. Bên cạnh đó còn 7 ống đồng và hệ thống 3 quạt tản nhiệt tạo điều kiện dẫn nhiệt được tốt hơn cho các linh kiện bên trong máy. Độ ồn không quá 45dB cho một không gian yên tĩnh để Asus ROG Strix G16 vận hành mạnh mẽ và ổn định hơn. \r\n\r\nGEARVN - Laptop gaming ASUS ROG Strix G16 G614JU-N3135W\r\n\r\nHỗ trợ LED RGB rực rỡ trên laptop ASUS ROG Strix G16 G614JU-N3135W\r\nĐể làm nên không gian tuyệt vời cùng chiếc laptop Asus ROG Strix G16 thì hiệu ứng đèn LED RGB là không thể thiếu. Phần viền đáy được trang bị dải đèn nổi bật mang đến hiệu ứng ánh sáng đầy tinh tế. Người dùng có thể cài đặt Aura Sync để thiết lập các chế độ game lý tưởng cho môi trường sống động đa sắc màu với các thiết bị tương thích. \r\n\r\nGEARVN - Laptop gaming ASUS ROG Strix G16 G614JU-N3135W\r\n\r\nTrải nghiệm màn hình Full HD tràn viền\r\nDòng Asus ROG Strix G này được chính hãng thiết kế màn hình FHD+ 165Hz cực kỳ sắc nét. Phần viền mỏng 4,5mm ở 3 cạnh cho tầm nhìn rộng hơn, tránh bị phân tâm bởi các yếu tố bên ngoài. Hình ảnh được kết xuất ra vô cùng đẹp mắt với màu sắc tươi sáng cho những lần chiến game hoàn hảo.\r\n\r\nGEARVN - Laptop gaming ASUS ROG Strix G16 G614JU-N3135W\r\n\r\nĐó là một vài điểm đặc biệt mà chiếc laptop gaming cao cấp đáng sở hữu. Asus ROG Strix G16 đưa trải nghiệm người dùng lên cao hơn với những trang bị được ưu ái từ hãng. Cấu hình vượt trội, hiệu năng hấp dẫn, không gian tuyệt vời cùng LED RGB thu hút mọi sự quan tâm của các game thủ.\r\n\r\nXem nhiều sản phẩm laptop uy tín chất lượng hơn tại GEARVN!', '14z90rs-02-1-gram-style-design-mobile_d3807c71442c4235b9da6ffdcf597d04_999d52f9503749069407961b41b8e2e7_grande.webp', '32990000', 100, '123', 2),
(69, 'Ryzen9-6900HS 1TB 32GB RTX3080', 'Đánh giá chi tiết laptop gaming ASUS ROG Zephyrus G15 GA503RS LN892W\r\nZephyrus G15, dòng sản phẩm laptop gaming đến từ ASUS được lấy tên từ vị thần gió trong thần thoại Ai Cập. Đúng như tên gọi, ASUS ROG Zephyrus G15 sở hữu cho mình vẻ ngoài mỏng nhẹ, tiện lợi hơn so với những chiếc laptop gaming khác hướng đến khả năng sử dụng của những creator. Hôm nay, chúng ta hãy cùng tìm hiểu về chiếc laptop gaming ASUS ROG Zephyrus G15 GA503RS LN892W ngay tại bài viết dưới đây!\r\n\r\nGEARVN Laptop gaming ASUS ROG Zephyrus G15 GA503RS LN892W\r\n\r\nThiết kế mỏng nhẹ, thanh thoát\r\nGiữ vững tôn chỉ của dòng Zephyrus, ASUS đã mang đến một thiết kế mỏng hơn, nhẹ hơn và thanh thoát hơn cho người dùng với ASUS ROG Zephyrus G15 GA503RS LN892W. Khoác lên mình lớn màu xám cá tính, ASUS ROG Zephyrus G15 còn sở hữu cho mình mặt A tinh xảo với những đường nét được chế tác bằng CNC cùng hàng nghìn lỗ nhỏ tạo nên trọng lượng nhỏ hơn rất nhiều. Bản lề ErgoLift có thể gập màn hình đến 180 độ mang đến khả năng làm việc thuận tiện hơn, tăng khả năng tương tác và trình chiếu đến với người đối diện.\r\n\r\nGEARVN Laptop gaming ASUS ROG Zephyrus G15 GA503RS LN892W\r\n\r\nPhần bàn phím trên ASUS ROG Zephyrus G15 cứng cáp, giảm thiểu tình trạng flex khó chịu khi sử dụng cho bạn cảm giác gõ phím thoải mái nhất.\r\n\r\nCấu hình mạnh mẽ cho khả năng làm việc đa dụng\r\nTrang bị trên phiên bản ASUS ROG Zephyrus G15 này là con chip đến từ AMD, Ryzen 9 6900HS. Với cấu trúc 8 nhân 16 luồng, chiếc laptop sẽ tự tin thể hiện sức mạnh xử lý cùng tốc độ vượt trội trong những tác vụ làm việc liên quan đến edit video, photoshop hình ảnh và khả năng xử lý hình ảnh trong những tựa game AAA. Thêm vào đó là chiếc card đồ họa RTX 3080 nâng cấp khả năng xử lý đồ họa trong những tựa game lên một trải nghiệm mới.\r\n\r\nGEARVN Laptop gaming ASUS ROG Zephyrus G15 GA503RS LN892W\r\n\r\nĐi kèm với phiên bản ASUS ROG Zephyrus G15 này là 32GB RAM đảm bảo khả năng đa nhiệm trên nhiều tác vụ mượt mà cùng bộ nhớ 1TB SSD, vừa giúp lưu trữ dữ liệu vừa tăng tốc quá trình khởi động máy. \r\n\r\nHình ảnh sắc nét với khung hình 15.6 inch\r\nLaptop gaming ASUS ROG Zephyrus G15 mang đến cho người dùng chiếc màn hình kích thước 15.6 inch cùng độ phân giải WQHD (2560 x 1440), tần số quét đạt 240Hz cùng thời gian phản hồi 3ms, tất cả tạo nên những khung hình mượt mà, sắc nét tới từng chi tiết. Chất lượng hiển thị màu sắc được nâng cấp với độ chuẩn màu DCI-P3 đạt 100% và được cân màu từ chính ASUS. Công nghệ Adaptive-Sync trên ASUS ROG Zephyrus G15 sẽ giảm thiểu tình trạng xé màn hình, cho ra những khung hình mượt mà nhất.\r\n\r\nGEARVN Laptop gaming ASUS ROG Zephyrus G15 GA503RS LN892W\r\n\r\nNâng cao trải nghiệm giải trí\r\nLà phiên bản nâng cấp từ ASUS ROG Zephyrus G15 tiền nhiệm, phiên bản này vẫn giữ được những thứ gọi là điểm mạnh của dòng laptop gaming dành cho creator. Với những chiếc loa được bố trí xung quanh chiếc laptop, cho ra những âm thanh to và rõ từ những bản nhạc yêu thích.\r\n\r\nGEARVN Laptop gaming ASUS ROG Zephyrus G15 GA503RS LN892W\r\n\r\nKhả năng kết nối linh hoạt\r\nLaptop ASUS ROG Zephyrus G15 mang đến cho người dùng những cổng kết nối thông dụng nhất hiện nay, với USB 3.2 Type-A/Type-C, khe đọc thẻ nhớ microSD, cổng LAN RJ45, jack tai nghe 3.5mm và cổng HDMI 2.0b.\r\n\r\nGEARVN Laptop gaming ASUS ROG Zephyrus G15 GA503RS LN892W\r\n\r\nGEARVN Laptop gaming ASUS ROG Zephyrus G15 GA503RS LN892W', 'ln892w_b333f9dc591b46bcb96143038f8f2768_grande.webp', '59990000', 100, '163', 3),
(70, 'i5-1340P 512GB 16GB Iris-Xe', 'Đánh giá chi tiết laptop LG Gram Style 14Z90RS GAH54A5\r\nLG Gram Style 14Z90RS GAH54A5 khơi nguồn cảm hứng làm việc với thiết kế tinh xảo, kiểu dáng thời thượng chuẩn laptop hiện đại năm nay. Thu hút bởi ngoại hình sang trọng cùng hiệu năng hoạt động đỉnh cao cho mọi yêu cầu học tập và làm việc hằng ngày của người dùng. Cùng GEARVN tìm hiểu chi tiết về sản phẩm LG Gram Style này nhé!\r\n\r\nGEARVN Laptop LG Gram Style 14Z90RS GAH54A5\r\n\r\n \r\n\r\nThiết kế laptop mỏng nhẹ siêu bền \r\nĐặc điểm đầu tiên mà bất cứ ai cũng bị mê hoặc từ LG Gram Style là vẻ bề ngoài của nó. Lớp vỏ được trang hoàng với tông màu bắt mắt với sắc độ biến ảo đầy tinh tế. Tùy vào góc độ ánh sáng chiếu vào mà máy phản xạ ra một hình dáng khác nhau. Chiếc laptop với trọng lượng siêu nhẹ 999 gram, dày khoảng 1.59cm sẵn sàng cho một ngày làm việc dài. Hiện thực hóa mong muốn sở hữu laptop mỏng nhẹ trong tầm tay.\r\n\r\nGEARVN - Laptop LG Gram Style 14Z90RS GAH54A5\r\n\r\nMỏng nhẹ nhưng không thể đánh giá rằng chiếc laptop 14Z90RS GAH54A5 không đủ chắc chắn và bền lâu. Trải qua 7 bài kiểm tra khắt nghiệt về độ bên theo chuẩn quân đội MIL-STD-810H đã giúp LG khẳng định sản phẩm của chính họ có độ chắc chắn và bền bỉ theo thời gian khi đồng hành cùng người dùng. Nếu bạn cần một chiếc laptop di động cao cũng như sự cứng cáp khỏi những va chạm thì LG Gram sẽ là lựa chọn phù hợp mà bạn không thể bỏ qua. \r\n\r\nHình ảnh hiển thị rõ nét \r\nLG Gram Style 14Z90RS GAH54A5 sở hữu kích thước màn hình 14 inch với độ phân giải cao WQXGA+ 2K8 (2880 x 1800). Tần số quét 90Hz cho khả năng chuyển đổi hình ảnh mượt mà trên từng chi tiết. Độ sáng 500nits và DCI-P3 100% nâng cấp hiển thị với chất lượng hình ảnh tương sáng, chân thực. Giải trí bằng những tựa game nhẹ hay xem những bộ phim yêu thích đều trọn vẹn từng giây từng phút. \r\n\r\nGEARVN - Laptop LG Gram Style 14Z90RS GAH54A5\r\n\r\nTỷ lệ màn hình 16:10 hoàn hảo giúp bạn quan sát toàn bộ thông tin trên màn hình LG 14Z90RS GAH54A5 tốt hơn. Tiết kiệm thời gian cuộn trang khi nghiên cứu tài liệu. Tấm nền OLED trang bị khả năng chống chói Anti-Glare đảm bảo hiệu suất khi gặp phải ánh sáng mặt trời chói chang hay những nơi có cường độ ánh sáng cao. \r\n\r\nHiệu suất hoạt động cao \r\nLG Gram Style 14Z90RS GAH54A5 là chiếc laptop học tập và làm việc thế hệ mới. Sử dụng sức mạnh từ con chip Intel Core i5-1340P Gen 13 mới nhất. Sẵn sàng mọi thách thức từ công việc đến giải trí. Card đồ họa tích hợp Intel Iris Xe Graphics còn hỗ trợ chất lượng xử lý khung hình đẹp mắt trên từng trải nghiệm. \r\n\r\nGEARVN - Laptop LG Gram Style 14Z90RS GAH54A5\r\n\r\nTốc độ đa nhiệm trên LG Gram Style cũng mượt mà hơn khi đồng hành cùng là 16GB LPDDR5 6000MHz. Ổ cứng 512GB SSD NVME mang đến không gian lưu trữ khổng lồ cho các dữ liệu quan trọng. Đồng thời hỗ trợ việc khởi động máy nhanh hơn những ổ HDD truyền thống. \r\n\r\nThời lượng pin cao \r\nSử dụng viên pin dung lượng cao 72WHr để mang đến thời gian làm việc tốt lên đến 15 giờ đồng hồ. LG Gram Style đảm bảo trải nghiệm sử dụng không dây tốt nhất trên những sản phẩm laptop LG Gram của họ. \r\n\r\nGEARVN - Laptop LG Gram Style 14Z90RS GAH54A5\r\n\r\nKết nối linh hoạt  \r\n14Z90RS GAH54A5 dù mỏng nhẹ nhưng vẫn trang bị đầy đủ các cổng kết nối phổ biến. Ngoài những cổng USB 3.2, Micro SD, hay jack tai nghe 3.5mm thì laptop LG Gram còn trang bị thêm giao diện 2 cổng Thunderbolt 4. Kết nối nhiều hơn, tốc độ nhanh hơn cho quá trình sử dụng liền mạch. \r\n\r\nGEARVN - Laptop LG Gram Style 14Z90RS GAH54A5\r\n\r\nGiải trí đỉnh cao cùng Dolby Atmos\r\nKhông dừng lại ở khả năng làm việc và học tập, LG Gram Style 14Z90RS GAH54A5 mang lại những giây phút thư giãn thông qua những bộ phim, những bài hát với hệ thống loa âm thanh vòm Dolby Atmos. Chiếc laptop LG sẽ giúp bạn chìm đắm vào những bản nhạc hay hòa mình vào bộ phim yêu thích với âm thanh chân thực.\r\nGEARVN - Laptop LG Gram Style 14Z90RS GAH54A5', 'lg-gram-style-fix_4013ad0ecc9c449f9611fb4f31069a92_grande.png', '35990000', 100, '136', 4),
(71, 'i5-1340P 1TGB 32GB Iris-Xe', 'Đánh giá chi tiết laptop LG Gram Style 16Z90RS GAH54A5 LG Gram Style 16Z90RS GAH54A5 khơi nguồn cảm hứng làm việc với thiết kế tinh xảo, kiểu dáng thời thượng chuẩn laptop hiện đại năm nay. Thu hút bởi ngoại hình sang trọng cùng hiệu năng hoạt động đỉnh cao cho mọi yêu cầu học tập và làm việc hằng ngày của người dùng. Cùng GEARVN tìm hiểu chi tiết về sản phẩm LG Gram Style này nhé!  GEARVN Laptop LG Gram Style 16Z90RS GAH54A5     Thiết kế laptop mỏng nhẹ siêu bền  Đặc điểm đầu tiên mà bất cứ ai cũng bị mê hoặc từ LG Gram Style là vẻ bề ngoài của nó. Lớp vỏ được trang hoàng với tông màu bắt mắt với sắc độ biến ảo đầy tinh tế. Tùy vào góc độ ánh sáng chiếu vào mà máy phản xạ ra một hình dáng khác nhau. Chiếc laptop với trọng lượng siêu nhẹ 1250 gram, dày khoảng 1.59cm sẵn sàng cho một ngày làm việc dài. Hiện thực hóa mong muốn sở hữu laptop mỏng nhẹ trong tầm tay.  GEARVN Laptop LG Gram Style 16Z90RS GAH54A5  Mỏng nhẹ nhưng không thể đánh giá rằng chiếc laptop 16Z90RS GAH54A5 không đủ chắc chắn và bền lâu. Trải qua 7 bài kiểm tra khắt nghiệt về độ bên theo chuẩn quân đội MIL-STD-810H đã giúp LG khẳng định sản phẩm của chính họ có độ chắc chắn và bền bỉ theo thời gian khi đồng hành cùng người dùng. Nếu bạn cần một chiếc laptop di động cao cũng như sự cứng cáp khỏi những va chạm thì LG Gram sẽ là lựa chọn phù hợp mà bạn không thể bỏ qua.   GEARVN Laptop LG Gram Style 16Z90RS GAH54A5  Hình ảnh hiển thị rõ nét  LG Gram Style 16Z90RS GAH54A5 sở hữu kích thước màn hình 16 inch với độ phân giải cao WQHD+ (3200x2000). Tần số quét 120Hz cho khả năng chuyển đổi hình ảnh mượt mà trên từng chi tiết. Độ sáng 500nits và DCI-P3 100% nâng cấp hiển thị với chất lượng hình ảnh tương sáng, chân thực. Giải trí bằng những tựa game nhẹ hay xem những bộ phim yêu thích đều trọn vẹn từng giây từng phút.   GEARVN Laptop LG Gram Style 16Z90RS GAH54A5  Tỷ lệ màn hình 16:10 hoàn hảo giúp bạn quan sát toàn bộ thông tin trên màn hình LG 16Z90R EAH75A5 tốt hơn. Tiết kiệm thời gian cuộn trang khi nghiên cứu tài liệu. Tấm nền OLED trang bị khả năng chống chói Anti-Glare đảm bảo hiệu suất khi gặp phải ánh sáng mặt trời chói chang hay những nơi có cường độ ánh sáng cao.   Hiệu suất hoạt động cao  LG Gram Style 16Z90RS GAH54A5 là chiếc laptop học tập và làm việc thế hệ mới. Sử dụng sức mạnh từ con chip Intel Core i5-1340P Gen 13 mới nhất. Sẵn sàng mọi thách thức từ công việc đến giải trí. Card đồ họa tích hợp Intel Iris Xe Graphics còn hỗ trợ chất lượng xử lý khung hình đẹp mắt trên từng trải nghiệm.   GEARVN Laptop LG Gram Style 16Z90RS GAH54A5  Tốc độ đa nhiệm trên LG Gram Style cũng mượt mà hơn khi đồng hành cùng là 16GB LPDDR5 6000MHz. Ổ cứng 512GB SSD NVME mang đến không gian lưu trữ khổng lồ cho các dữ liệu quan trọng. Đồng thời hỗ trợ việc khởi động máy nhanh hơn những ổ HDD truyền thống.   Thời lượng pin cao  Sử dụng viên pin dung lượng cao 80WHr để mang đến thời gian làm việc tốt lên đến 12.5 giờ đồng hồ. LG Gram Style đảm bảo trải nghiệm sử dụng không dây tốt nhất trên những sản phẩm laptop LG Gram của họ.   GEARVN Laptop LG Gram Style 16Z90RS GAH54A5  Kết nối linh hoạt   16Z90RS GAH54A5 dù mỏng nhẹ nhưng vẫn trang bị đầy đủ các cổng kết nối phổ biến. Ngoài những cổng USB 3.2, Micro SD, hay jack tai nghe 3.5mm thì laptop LG Gram còn trang bị thêm giao diện 2 cổng Thunderbolt 4. Kết nối nhiều hơn, tốc độ nhanh hơn cho quá trình sử dụng liền mạch.', 'LG-gram-White-Laptop-14Z90RSKAAW7U1-Front-Left.jpg', '44499900', 10, '116', 4),
(72, 'Ryzen9-6900HS 1TB 64GB RTX3080', 'Đánh giá chi tiết laptop LG Gram Style 16Z90RS GAH54A5 LG Gram Style 16Z90RS GAH54A5 khơi nguồn cảm hứng làm việc với thiết kế tinh xảo, kiểu dáng thời thượng chuẩn laptop hiện đại năm nay. Thu hút bởi ngoại hình sang trọng cùng hiệu năng hoạt động đỉnh cao cho mọi yêu cầu học tập và làm việc hằng ngày của người dùng. Cùng GEARVN tìm hiểu chi tiết về sản phẩm LG Gram Style này nhé!  GEARVN Laptop LG Gram Style 16Z90RS GAH54A5     Thiết kế laptop mỏng nhẹ siêu bền  Đặc điểm đầu tiên mà bất cứ ai cũng bị mê hoặc từ LG Gram Style là vẻ bề ngoài của nó. Lớp vỏ được trang hoàng với tông màu bắt mắt với sắc độ biến ảo đầy tinh tế. Tùy vào góc độ ánh sáng chiếu vào mà máy phản xạ ra một hình dáng khác nhau. Chiếc laptop với trọng lượng siêu nhẹ 1250 gram, dày khoảng 1.59cm sẵn sàng cho một ngày làm việc dài. Hiện thực hóa mong muốn sở hữu laptop mỏng nhẹ trong tầm tay.  GEARVN Laptop LG Gram Style 16Z90RS GAH54A5  Mỏng nhẹ nhưng không thể đánh giá rằng chiếc laptop 16Z90RS GAH54A5 không đủ chắc chắn và bền lâu. Trải', '13897_asus_rog_zephyrus_m16__7.jpg', '5000000', 1, '218', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `noidungtintuc`
--

CREATE TABLE `noidungtintuc` (
  `IdNdTinTuc` int(11) NOT NULL,
  `tieuDeTinTuc` varchar(255) DEFAULT NULL,
  `ndTintuc` varchar(255) DEFAULT NULL,
  `Anh` varchar(255) DEFAULT NULL,
  `idTinTuc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `idSp` int(11) NOT NULL,
  `tenSp` mediumtext DEFAULT NULL,
  `ngayTao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `trangThai` varchar(255) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`idSp`, `tenSp`, `ngayTao`, `trangThai`) VALUES
(2, 'Laptop gaming ASUS ROG Strix G16 G614JU N3135W', '2023-12-05 16:23:38', '1'),
(3, 'Laptop gaming ASUS ROG Zephyrus G15 GA503RS LN892W', '2023-12-05 16:23:41', '1'),
(4, 'Laptop LG Gram Style 14Z90RS GAH54A5', '2023-12-05 16:23:45', '1'),
(5, 'Bàn phím MonsGeek M1 QMK', '2023-12-06 09:39:39', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanphamdanhmucsanpham`
--

CREATE TABLE `sanphamdanhmucsanpham` (
  `idSpDm` int(11) NOT NULL,
  `idSp` int(11) DEFAULT NULL,
  `idDm` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanphamdanhmucsanpham`
--

INSERT INTO `sanphamdanhmucsanpham` (`idSpDm`, `idSp`, `idDm`) VALUES
(436, 2, 27),
(437, 2, 39),
(440, 3, 27),
(441, 3, 50),
(442, 3, 53),
(444, 4, 27),
(445, 4, 38),
(446, 4, 369),
(447, 4, 404),
(448, 3, 368);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tintuc`
--

CREATE TABLE `tintuc` (
  `IdTinTuc` int(11) NOT NULL,
  `Ngaydang` datetime DEFAULT NULL,
  `Luotxem` varchar(255) DEFAULT NULL,
  `IdCdTinTuc` int(11) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `vaiTro` varchar(100) NOT NULL DEFAULT 'User',
  `Email` varchar(255) DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `Avatar` varchar(255) DEFAULT 'user.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`idUser`, `vaiTro`, `Email`, `nickName`, `password`, `Avatar`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin', '$2y$12$Cfx5TBA4sUdqkaIQjfLzEe.Ga8nG3lnxW6SO2dyxZBOJYDtZLJ8Gu', 'user.png'),
(7, 'User', 'phuongsv@gmail.com', 'phuongdz12', '$2y$12$8.RTiMkWJt7L6dJo8zr2Gul1pwE46hOm3cqelvVvKB06op7WaPQ6K', 'user.png'),
(8, 'User', 'phuong@gmail.com', 'phuongdz12', '$2y$12$CIJMSvhpB12L72nZgr8aT.LQ9JMl43G6JeUv2OQJsvyiej1Np8efK', 'user.png'),
(10, 'User', 'nam@gmail.com', 'nam123', '$2y$12$ExKCAbDu.qT1cOXLRZPI3urW1cHZf79oSS/QGZLpHcTGn5bdnbIPy', 'user.png'),
(11, 'User', 'linh123@gmail.com', 'linh', '$2y$12$SFOOFOQewEpmX6LgVcIsa.QAhb7a8BilN08.Io8ZjnIf2RVKFpAwW', 'user.png'),
(12, 'User', 'trangiangzxc@gmail.com', 'giang', '$2y$12$zYF3uMFV4bg06vJLF0Pp5O6XRJkXRfKHnf1q/xVN.VlzAXy17SIvG', 'user.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `anhsanpham`
--
ALTER TABLE `anhsanpham`
  ADD PRIMARY KEY (`idImgs`),
  ADD KEY `idSp` (`idSp`);

--
-- Chỉ mục cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`idCtDonHang`),
  ADD KEY `idDonHang` (`idDonHang`),
  ADD KEY `idLoaiSp` (`idLoaiSp`);

--
-- Chỉ mục cho bảng `chudetintuc`
--
ALTER TABLE `chudetintuc`
  ADD PRIMARY KEY (`IdCdTinTuc`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`idComment`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idSp` (`idLoaiSp`);

--
-- Chỉ mục cho bảng `danhmucsanpham`
--
ALTER TABLE `danhmucsanpham`
  ADD PRIMARY KEY (`idDm`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`idDonHang`),
  ADD KEY `idUser` (`idUser`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`idLoaiSp`),
  ADD KEY `idSp` (`idSp`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `noidungtintuc`
--
ALTER TABLE `noidungtintuc`
  ADD PRIMARY KEY (`IdNdTinTuc`),
  ADD KEY `idTinTuc` (`idTinTuc`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`idSp`);

--
-- Chỉ mục cho bảng `sanphamdanhmucsanpham`
--
ALTER TABLE `sanphamdanhmucsanpham`
  ADD PRIMARY KEY (`idSpDm`),
  ADD KEY `idSp` (`idSp`),
  ADD KEY `idDm` (`idDm`);

--
-- Chỉ mục cho bảng `tintuc`
--
ALTER TABLE `tintuc`
  ADD PRIMARY KEY (`IdTinTuc`),
  ADD KEY `IdCdTinTuc` (`IdCdTinTuc`),
  ADD KEY `idUser` (`idUser`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `anhsanpham`
--
ALTER TABLE `anhsanpham`
  MODIFY `idImgs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  MODIFY `idCtDonHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `chudetintuc`
--
ALTER TABLE `chudetintuc`
  MODIFY `IdCdTinTuc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `idComment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `danhmucsanpham`
--
ALTER TABLE `danhmucsanpham`
  MODIFY `idDm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=410;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `idDonHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `idLoaiSp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `noidungtintuc`
--
ALTER TABLE `noidungtintuc`
  MODIFY `IdNdTinTuc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `idSp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `sanphamdanhmucsanpham`
--
ALTER TABLE `sanphamdanhmucsanpham`
  MODIFY `idSpDm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=494;

--
-- AUTO_INCREMENT cho bảng `tintuc`
--
ALTER TABLE `tintuc`
  MODIFY `IdTinTuc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `anhsanpham`
--
ALTER TABLE `anhsanpham`
  ADD CONSTRAINT `anhsanpham_ibfk_1` FOREIGN KEY (`idSp`) REFERENCES `sanpham` (`idSp`);

--
-- Các ràng buộc cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `chitietdonhang_ibfk_1` FOREIGN KEY (`idDonHang`) REFERENCES `donhang` (`idDonHang`),
  ADD CONSTRAINT `chitietdonhang_ibfk_2` FOREIGN KEY (`idLoaiSp`) REFERENCES `loaisanpham` (`idLoaiSp`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`idLoaiSp`) REFERENCES `loaisanpham` (`idLoaiSp`);

--
-- Các ràng buộc cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`);

--
-- Các ràng buộc cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD CONSTRAINT `loaisanpham_ibfk_1` FOREIGN KEY (`idSp`) REFERENCES `sanpham` (`idSp`);

--
-- Các ràng buộc cho bảng `noidungtintuc`
--
ALTER TABLE `noidungtintuc`
  ADD CONSTRAINT `noidungtintuc_ibfk_1` FOREIGN KEY (`idTinTuc`) REFERENCES `tintuc` (`IdTinTuc`);

--
-- Các ràng buộc cho bảng `sanphamdanhmucsanpham`
--
ALTER TABLE `sanphamdanhmucsanpham`
  ADD CONSTRAINT `sanphamdanhmucsanpham_ibfk_1` FOREIGN KEY (`idSp`) REFERENCES `sanpham` (`idSp`),
  ADD CONSTRAINT `sanphamdanhmucsanpham_ibfk_2` FOREIGN KEY (`idDm`) REFERENCES `danhmucsanpham` (`idDm`);

--
-- Các ràng buộc cho bảng `tintuc`
--
ALTER TABLE `tintuc`
  ADD CONSTRAINT `tintuc_ibfk_1` FOREIGN KEY (`IdCdTinTuc`) REFERENCES `chudetintuc` (`IdCdTinTuc`),
  ADD CONSTRAINT `tintuc_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
