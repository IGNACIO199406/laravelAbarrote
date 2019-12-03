
@yield('insertar')
@yield('reporteExcel')
@yield('reporteJson')
@yield('reportePdf')
@section('cards')
        <div class="row">
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-aqua">
              <div class="inner">
                <h3>150</h3>

                <p>Nuevo registro</p>
              </div>
              <div class="icon">
                <i class="fa fa-database w3-text-white"></i>
              </div>
              <a class="small-box-footer w3-cursor-pointer" data-toggle="modal" data-target="" id="botonRegistro">Registrar <i class="fa fa-arrow-circle-right "></i></a>
            </div>
          </div>
<!-- 
          <div class="col-lg-3 col-xs-6">
            small box 
            <div class="small-box bg-purple">
              <div class="inner">
                <h3>150</h3>
                <p>Registro Masivo</p>
              </div>
              <div class="icon">
                <i class="fa fa-database w3-text-white"></i>
              </div>
              <a class="small-box-footer " data-toggle="modal" data-target="">Registrar <i class="fa fa-arrow-circle-right "></i></a>
            </div>
          </div>-->
          <!-- ./col -->
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
              <div class="inner">
                <h3>53</h3>

                <p>Reporte excel</p>
              </div>
              <div class="icon">
                <i class="fa fa-file-excel-o w3-text-white"></i>
              </div>
              <a href="#" class="small-box-footer">Descargar <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-yellow">
              <div class="inner">
                <h3>44</h3>
                <p>Reporte Json</p>
              </div>
              <div class="icon">
                <i class="fa fa-file-code-o w3-text-white"></i>
              </div>
              <a href="#" class="small-box-footer">Descargar <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-red">
              <div class="inner">
                <h3>65</h3>

                <p>Reporte pdf</p>
              </div>
              <div class="icon">
                <i class="fa fa-file-pdf-o w3-text-white"></i>
              </div>
              <a href="#" class="small-box-footer">Descargar <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
        </div>
        @endsection