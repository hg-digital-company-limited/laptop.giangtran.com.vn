@include('client/headerClient')

@if(session('success'))
        <script>
            swal("Good job!", "{{ session('success') }}", "success");
        </script>
@endif

<section class="main-productdetails">
    <h1>Thanh toán thành công!</h1>
    <p>Cảm ơn bạn đã đặt hàng. Đơn hàng của bạn đã được xử lý thành công.</p>
   
</section>
 

@include('client/footerClient')
