<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="es">
  <title>{{$tituloPagina ?? "Login"}}</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="../../plugins/iCheck/square/blue.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  
  <script src="../../css/toastr.css"></script>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>Admin</b>LTE</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>
    <form action="{{ route('usuarioLogin') }}" class="validar Modal" id="login">
    <input name="token" type="hidden" value="{{ csrf_token() }}"/>
    {{ csrf_field() }}
      <div class="form-group has-feedback">
        <input id="email" name="email" type="email" class="form-control requerido correo" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback "></span>
      </div>
      <div class="form-group has-feedback">
        <input id="password" name="password" type="password" class="form-control requerido text" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback "></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
              <input type="checkbox" id="check" name="check" class="checkss" checked> Remember 
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
        <button id="Registrar" class="btn btn-primary" type="submit" name="Registrar" >Registrar</button>
      
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div>
    <!-- /.social-auth-links -->

    <a href="#">I forgot my password</a><br>
    <a href="register.html" class="text-center">Register a new membership</a>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="../../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../../plugins/iCheck/icheck.min.js"></script>
<script src="../../js/toastr.js"></script>
<script src="../../js/config_global.js"></script>


<script>
  // $(function () {
  //   $('input').iCheck({
  //     checkboxClass: 'icheckbox_square-blue',
  //     radioClass: 'iradio_square-blue',
  //     increaseArea: '20%' /* optional */
  //   });
  // });

//   $('.checkss' ).on( 'click', function() {
//     if($("#check").is(':checked')){
//     alert("Checked");
// }
// });

$("input[type=checkbox]").is(':checked') ? $(".checkss").attr('value','true') : $(".checkss").attr('value',false)
$("input[type=checkbox]").click(function(){ 
 	result = $(this).is(':checked') ? $(this).attr('value','true') : $(this).attr('value',false);
});


</script>
</body>
</html>
