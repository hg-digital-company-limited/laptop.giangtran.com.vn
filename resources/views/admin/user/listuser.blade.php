@include('admin/headerAdmin')


@if(session('success'))
        <script>
            swal("Good job!", "{{ session('success') }}", "success");
        </script>
@endif

<div class="content ">
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

</div>

<div style="margin-top: 20px" class="row">
    <div style="width: 100%" class="col-md-8">


        <div class="table-responsive">
            {{-- bảng --}}
            <table class="table table-custom table-lg mb-0" id="products">
                <thead>
                    <tr>
                        <td>
                            <input class="form-check-input select-all" type="checkbox"
                                data-select-all-target="#products" id="defaultCheck1">
                        </td>
                        <td>Id</td>
                        <td>Vai trò</td>
                        <td>Email</td>
                        <td>Nick Name</td>
                        <td>Ảnh</td>
                        <td class="text-end">Actions</td>
                    </tr>
                </thead>
                <tbody>

                    @foreach ($users as $user)
                        <tr>
                            <td>
                                <input class="form-check-input" type="checkbox">
                            </td>
                            <td class="truncate">
                                <p>{{ $user['idUser'] }}</p>
                            </td>
                            <td>
                                <p>{{ $user['vaiTro'] }}</p>

                            </td>
                            <td>
                                <p>{{ $user['Email'] }}</p>
                            </td>

                            <td>
                                <p>{{ $user['nickName'] }}</p>
                            </td>

                            <td>
                                <p><img width="30px" src="{{ asset('storage/upload/' . $user['Avatar']) }}"
                                        alt="">
                            </td>
                            <td class="text-end">
                                <div class="d-flex">
                                    <div class="dropdown ms-auto">
                                        <a href="#" data-bs-toggle="dropdown" class="btn btn-floating"
                                            aria-haspopup="true" aria-expanded="false">
                                            <i class="bi bi-three-dots"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end">

                                            <form action="{{ route('admin.user.update.role') }}" method="POST">
                                                @csrf
                                                <input type="hidden" name="idUser" value="{{ $user['idUser'] }}">

                                                @if ($user['vaiTro'] == 'User')
                                                    <input type="hidden" name="vaiTro" value="Subadmin">
                                                    <button type="submit" href="" class="dropdown-item">Phân làm
                                                        Subadmin</button>
                                                @else
                                                    <input type="hidden" name="vaiTro" value="User">
                                                    <button type="submit" href="" class="dropdown-item">Phân
                                                        thành User</button>
                                                @endif
                                            </form>

                                            <a href="" class="dropdown-item">Vô hiệu hóa</a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>

</div>

@include('admin/footerAdmin')
