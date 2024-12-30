@include('client/headerClient')

@if(session('success'))
        <script>
            swal("Good job!", "{{ session('success') }}", "success");
        </script>
@endif

<section class="main-productdetails">
    <h1>Lỗi thanh toán!</h1>
    <p>Đã xảy ra lỗi trong quá trình xử lý thanh toán. Vui lòng liên hệ bộ phận hỗ trợ.</p>
   
</section>
 

@include('client/footerClient')
