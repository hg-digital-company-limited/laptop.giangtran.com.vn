@include('admin/headerAdmin')

@if (session('success'))
    <script>
        swal("Good job!", "{{ session('success') }}", "success");
    </script>
@endif

@php
    $tracks = [
        [
            'icon' => '<i class="fa fa-check"></i>',
            'title' => 'Xác nhận',
        ],
        [
            'icon' => '<i class="fa fa-user"></i>',
            'title' => 'Đã lấy đơn',
        ],
        [
            'icon' => '<i class="fa fa-truck"></i>',
            'title' => 'Trên đường',
        ],
        [
            'icon' => '<i class="fa fa-box"></i>',
            'title' => 'Đã giao',
        ],
    ];
@endphp

<div style="background: white; padding-top: 5px;">
    <div class="container">
        <article class="card">
            <div class="card-body">
                <h6>Order ID: {{ $order['idDonHang'] }}</h6>
                <div class="track">
                    @foreach ($tracks as $index => $track)
                        <div data-index="{{ $index }}"
                            id="<?= $track['title'] == $order['trangThai'] ? 'selectTrack' : '' ?>" class="step">
                            <span class="icon">{!! $track['icon'] !!}</span>
                            <span class="text">{{ $track['title'] }}</span>
                        </div>
                    @endforeach
                </div>
                <hr>


                <ul class="row">
                    @php
                        $total = 0;
                        $tenSpArray = explode(', ', $order['tenSp']);
                        $tenLoaiSpArray = explode(', ', $order['tenLoaiSp']);
                        $imgArray = explode(', ', $order['img']);
                        $giaSpArray = explode(', ', $order['giaSp']);
                        $soLuongMuaArray = explode(', ', $order['soLuongMua']);
                    @endphp
                    @foreach ($tenSpArray as $index => $tenSp)
                        <li class="col-md-4">
                            <figure class="itemside mb-3">
                                <div class="aside">
                                    <img width="100" src="{{ asset('storage/upload/' . $imgArray[$index]) }}"
                                        class="img-sm border">
                                </div>
                                <figcaption class="info align-self-center">
                                    <p class="title">{{ $tenSp }} <br> {{ $tenLoaiSpArray[$index] }}</p>
                                    <span class="text-muted">{{ number_format($giaSpArray[$index], 0, ',', '.') }}
                                        VND</span>
                                    <br>
                                    <span class="text-muted">Quantity: {{ $soLuongMuaArray[$index] }}</span>
                                </figcaption>
                            </figure>
                        </li>
                        @php $total += ($giaSpArray[$index] * $soLuongMuaArray[$index]) @endphp
                    @endforeach
                </ul>
                <hr>
                <article class="card bg-info-subtle">
                    <div class="card-body row">
                        <div class="col"> <strong>Tên người đặt:</strong> <br> {{ $order['ten'] }} </div>
                        <div class="col"> <strong>Ngày đặt hàng:</strong> <br> {{ $order['ngayMuaHang'] }} </div>
                        <div class="col"> <strong>Số điện thoại:</strong> <br> {{ $order['Sdt'] }} </div>
                        <div class="col"> <strong>Địa chỉ:</strong> <br> {{ $order['DiaChi'] }} </div>
                        <div class="col"> <strong>Status:</strong> <br> {{ $order['trangThai'] }} </div>
                    </div>
                </article>

                <hr>
            </div>
            <h5 class="p-5 d-flex align-items-center justify-content-between bg-success-subtle">
                Tổng tiền: {{ number_format($total, 0, ',', '.') . ' VND' }}
                <form method="post" action="{{ route('admin.order.update.status') }}">
                    @csrf
                    <!-- Trạng thái hiện tại -->
                    <input type="hidden" name="trangThai" id="statusInput" value="{{ $order['trangThai'] }}">
                    <input type="hidden" name="idDonHang" value="{{ $order['idDonHang'] }}">

                    <button class="btn btn-primary m-3">Cập nhật</button>
                </form>
            </h5>

        </article>
    </div>
</div>

<script>
    const stepElms = document.querySelectorAll('.step');
    const statusInput = document.getElementById('statusInput');


    const handleChangeTrack = (currentTag, index) => {
        stepElms.forEach((element, indexCheck) => {
            if (indexCheck <= index) {
                element.classList.add('active');
            } else {
                element.classList.remove('active');
            }
        });
        // Cập nhật giá trị cho input hidden
        statusInput.value = currentTag.querySelector('.text').textContent.trim();


    }

    stepElms.forEach((element, index) => {
        element.addEventListener('click', (e) => handleChangeTrack(e.currentTarget, index));
    });

    // Cập nhật trạng thái từ db
    const selectedTrack = document.querySelector('#selectTrack');
    if (selectedTrack) {
        handleChangeTrack(selectedTrack, selectedTrack.dataset.index);
    }
</script>


@include('admin/footerAdmin')
