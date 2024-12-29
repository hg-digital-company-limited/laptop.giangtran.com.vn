@include('admin/headerAdmin')

<div class="breadcrumb-main">
    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb">
            @php
                $urlSegments = explode('/', request()->path());
                $url = '';
            @endphp

            @foreach ($urlSegments as $segment)
                @php
                    $url .= '/' . $segment;
                @endphp

                @if ($loop->last)
                    <li class="breadcrumb-item active" aria-current="page">{{ ucfirst($segment) }}</li>
                @else
                    <li class="breadcrumb-item">
                        <a href="{{ $url }}">{{ ucfirst($segment) }}</a>
                    </li>
                @endif
            @endforeach
        </ol>
    </nav>
</div>

<div class="table-responsive">
    <table class="table table-custom table-lg mb-0" id="products">
        <thead>
            <tr>
                <td>
                    <input class="form-check-input select-all" type="checkbox" data-select-all-target="#products"
                        id="defaultCheck1">
                </td>
                <td>Id</td>
                <td>Img</td>
                <td>Name</td>
                <td>Buyer</td>
                <td>Phone</td>
                <td>Address</td>
                <td>Buy at</td>
                <td>Price</td>
                <td>Quantity</td>
                <td>Total</td>
                <td>Status</td>
                <td class="text-end">Actions</td>
            </tr>
        </thead>
        <tbody>
            @foreach ($allOrders as $order)
                <tr>
                    <td>
                        <input class="form-check-input" type="checkbox">
                    </td>
                    <td>{{ $order['idDonHang'] }}</td>
                    <td>
                        @foreach (explode(',', $order['img']) as $img)
                            <img width="40px" src="{{ asset('storage/upload/' . trim($img)) }}" class="truncate">
                        @endforeach
                    </td>
                    <td>
                        @foreach (explode(',', $order['tenSp']) as $tenSp)
                            <p class="truncate">{{ trim($tenSp) }}</p>
                        @endforeach
                    </td>

                    <td>{{ $order['ten'] }}</td>
                    <td>{{ $order['Sdt'] }}</td>
                    <td>{{ $order['DiaChi'] }}</td>
                    <td>
                        <span class="truncate">{{ $order['ngayMuaHang'] }}</span>
                    </td>
                    <td>
                        @foreach (explode(',', $order['giaSp']) as $giaSp)
                            <span style="height: 40px" class="truncate">{{ trim($giaSp) }}</span>
                        @endforeach
                    </td>
                    <td>
                        @foreach (explode(',', $order['soLuongMua']) as $soLuongMua)
                            <div style="width: 40px; height: 40px" class="truncate">{{ trim($soLuongMua) }}</div>
                            <br>
                        @endforeach
                    </td>
                    <td>
                        @php
                            $giaSp = explode(',', $order['giaSp']);
                            $soLuongMua = explode(',', $order['soLuongMua']);
                        @endphp
                        @foreach ($giaSp as $index => $gia)
                            @if (isset($soLuongMua[$index]))
                                <span style="height: 40px"
                                    class="truncate">{{ trim($gia) * trim($soLuongMua[$index]) }}</span><br>
                            @endif
                        @endforeach
                    </td>
                    <td class="status {{ 'status-' . strtolower($order['trangThai']) }}">
                        @switch($order['trangThai'])
                            @case('Đợi xử lý')
                                <span class="text-danger">unconfirm</span>
                            @break

                            @case('Xác nhận')
                            <span class="text-warning">confirmed</span>
                        @break

                            @case('Đã lấy đơn')
                                <span class="text-warning">picked</span>
                            @break

                            @case('Trên đường')
                                <span class="text-success">Delivering</span>
                            @break

                            @case('Đã giao')
                                <span class="text-bg-primary">Delivered</span>
                            @break

                            @default
                                <span>Không xác định</span>
                        @endswitch
                    </td>

                    <td class="text-end">
                        <!-- Actions column -->
                        <div class="d-flex">
                            <div class="dropdown ms-auto">
                                <a href="#" data-bs-toggle="dropdown" class="btn btn-floating"
                                    aria-haspopup="true" aria-expanded="false">
                                    <i class="bi bi-three-dots"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end">
                                    <a href="{{ route('admin.order.detail', ['id_order' => $order['idDonHang'] ]) }}" class="dropdown-item">Xử lý đơn hàng</a>

                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>

@include('admin/footerAdmin');
