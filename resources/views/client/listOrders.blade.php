<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
@include('client/headerClient')

<div class="container mt-4">
    <div class="table-responsive">
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th>
                        <input class="form-check-input select-all" type="checkbox" data-select-all-target="#products"
                            id="defaultCheck1">
                    </th>
                    <th>Id</th>
                    <th>Img</th>
                    <th>Name</th>
                    <th>Buyer</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Buy at</th>
                    <th class="text-end">Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($orders as $order)
                    <tr>
                        <td>
                            <input class="form-check-input" type="checkbox">
                        </td>
                        <td>{{ $order['idDonHang'] }}</td>
                        <td>
                            @foreach (explode(',', $order['img']) as $img)
                                <img width="40px" src="{{ asset('storage/upload/' . trim($img)) }}"
                                    class="img-thumbnail">
                            @endforeach
                        </td>
                        <td>
                            @foreach (explode(',', $order['tenSp']) as $tenSp)
                                <p class="m-0">{{ trim($tenSp) }}</p>
                            @endforeach
                        </td>
                        <td>{{ $order['ten'] }}</td>
                        <td>{{ $order['Sdt'] }}</td>
                        <td>{{ $order['DiaChi'] }}</td>
                        <td>
                            <div class="text-truncate">{{ $order['ngayMuaHang'] }}</div>
                        </td>
                        <td class="text-end">
                            <a href="{{ route('client.order.detail', ['idDonHang' => $order['idDonHang']]) }}"
                                class="btn btn-primary btn-sm">
                                Xem chi tiết
                            </a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

@include('client/footerClient')
