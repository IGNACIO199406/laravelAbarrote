<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="es">
  <title>@yield('titulo')</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="../bower_components/morris.js/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="../bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
  <link rel="stylesheet" href="../css/w3.css">
  <link rel="stylesheet" href="../css/dataTable.css">

  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <link rel="stylesheet" href="../css/VanillaToasts-master/vanillatoasts.css">

</head>

<body class="hold-transition fixed skin-blue sidebar-mini">
  <div class="wrapper w3-white">

    <header class="main-header w3-white">
      <!-- Logo -->
      <a href="index2.html" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>Port</b>K</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Port</b>-Kal</span>
      </a>
      <!-- Header Navbar: style can be found in header.less -->
      <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
          <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">
            <!-- User Account: style can be found in dropdown.less -->
            <li class="dropdown user user-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <img src="../dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                <span class="hidden-xs">Alexander Pierce</span>
              </a>
              <ul class="dropdown-menu">
                <!-- User image -->
                <li class="user-header">
                  <img src="../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                  <p>
                    Alexander Pierce - Web Developer
                    <small>Member since Nov. 2012</small>
                  </p>
                </li>
                <!-- Menu Body -->
                <li class="user-body">
                  <div class="row">
                    <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Friends</a>
                    </div>
                  </div>
                  <!-- /.row -->
                </li>
                <!-- Menu Footer-->
                <li class="user-footer">
                  <div class="pull-left">
                    <a href="#" class="btn btn-default btn-flat">Profile</a>
                  </div>
                  <div class="pull-right">
                    <a href="{{ route('usuarioHome') }}" class="btn btn-default btn-flat">Sign out</a>
                  </div>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
      <!-- sidebar: style can be found in sidebar.less -->
      <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
          <div class="pull-left image">
            <img src="../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
          </div>
          <div class="pull-left info">
            <p>Alexander Pierce</p>
          </div>
        </div>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
          <li class="header">DESARROLLADOR</li>
          <!-- class="active treeview"-->

          @foreach ($datos as $dato)
          @if ($dato->status==1)
        <li class="treeview">
        @if ($dato->parent==0)
            <a >
              <i class="fa fa-dashboard"></i> <span>{{ $dato->nombre}}</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            @endif
            
            <ul class="treeview-menu">
            @foreach ($datos as $sub_dato)
            @if ($sub_dato->parent==$dato->id) 
            <li><a href="{{ route(strtolower($sub_dato->nombre).'Vista') }}"><i class="fa fa-circle-o"></i> {{$sub_dato->nombre}}</a></li>
            @endif
            @endforeach
          </ul>
        
          </li>
          @endif
        @endforeach
        </ul>
      </section>
      <!-- /.sidebar -->
    </aside>

    <!--
|--------------------------------------------------------------------------
| Todo el contenido de la vista
|--------------------------------------------------------------------------
-->
    <div class="content-wrapper">
      <section class="content">
        @yield('cards')
        @yield('conten')
      </section>
    </div>

    <footer class="main-footer">
      <div class="pull-right hidden-xs">
        <b>Version</b> 2.4.18
      </div>
      <strong>Copyright &copy; 2017-2019 Port-Kal</strong> Todos los derechos reservados.
    </footer>
  </div>


  <!--
|--------------------------------------------------------------------------
| Todos los formularios
|--------------------------------------------------------------------------
-->
  @yield('formulario')

 <!--
|--------------------------------------------------------------------------
| Modal delete general
|--------------------------------------------------------------------------
-->
<form class="validar Modal" id="eliminaRegistro" name="eliminaRegistro" enctype="multipart/form-data">
    <div class="modal fade" id="Modal-eliminaRegistro">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div id="Modal-eliminaRegistro-Color" class="modal-header ">
            <h3 class="modal-title w3-center" id="Modal-eliminaRegistro-Titulo"></h3>
          </div>
          <div class="modal-body">
            <input class="w3-input w3-border-blue" id="eliminaID" name="eliminaID" type="hidden">
            <input class="w3-input w3-border-blue" id="eliminaStatus" name="eliminaStatus" type="hidden">
            <input name="token" type="hidden" value="{{ csrf_token() }}" />
            {{ csrf_field() }}
            <h4 class="w3-center" id="">
              <div id="Modal-eliminaRegistro-Contenido"></div>
              Estas seguro de realizar esta acción?
            </h4>
          </div>
          <div class="modal-footer">
            <div class="w3-center">
              <button type="button" class="btn btn-danger" data-dismiss="modal" style="width: 150px;">Cerrar</button>
              <button id="Registrar" class="btn btn-primary" type="submit" name="Registrar" style="width: 150px;">Registrar</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>

  <!-- jQuery 3 -->
  <script src="../bower_components/jquery/dist/jquery.min.js"></script>
  <!-- jQuery UI 1.11.4 -->
  <script src="../bower_components/jquery-ui/jquery-ui.min.js"></script>
  <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->

  <!-- Bootstrap 3.3.7 -->
  <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
  <!-- Morris.js charts -->
  <script src="../bower_components/raphael/raphael.min.js"></script>
  <script src="../bower_components/morris.js/morris.min.js"></script>
  <!-- Sparkline -->
  <script src="../bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
  <!-- jvectormap -->
  <script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
  <script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
  <!-- jQuery Knob Chart -->
  <script src="../bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
  <!-- daterangepicker -->
  <script src="../bower_components/moment/min/moment.min.js"></script>
  <script src="../bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
  <!-- datepicker -->
  <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
  <!-- Bootstrap WYSIHTML5 -->
  <script src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
  <!-- Slimscroll -->
  <script src="../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
  <!-- FastClick -->
  <script src="../bower_components/fastclick/lib/fastclick.js"></script>
  <!-- AdminLTE App -->
  <script src="../dist/js/adminlte.min.js"></script>
  <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
  <script src="../dist/js/pages/dashboard.js"></script>
  <script src="../css/VanillaToasts-master/vanillatoasts.js"></script>
  <script src="../js/config_global.js"></script>
  <script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>

  <!--
|--------------------------------------------------------------------------
| url de los archivos unicos
|--------------------------------------------------------------------------
-->
  @yield('archivosDedicados')

 
</body>
<script src="../js/generalDatatable.js"></script>
</html>

5551931983

