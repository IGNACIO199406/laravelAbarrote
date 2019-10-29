@extends('layaud')
@section('titulo','Usuario')
@section('conten')
 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">


    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
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
            <a  class="small-box-footer " data-toggle="modal" data-target="#Modal-InUp_Tabla" >Registrar <i class="fa fa-arrow-circle-right "></i></a>
          </div>
        </div>

        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-purple">
            <div class="inner">
              <h3>150</h3>

              <p>Registro Masivo</p>
            </div>
            <div class="icon">
              <i class="fa fa-database w3-text-white"></i>
            </div>
            <a  class="small-box-footer " data-toggle="modal" data-target="#Modal-InUp_Tabla" >Registrar <i class="fa fa-arrow-circle-right "></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-2 col-xs-6">
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
        <div class="col-lg-2 col-xs-6">
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
        <div class="col-lg-2 col-xs-6">
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
      <!-- /.row -->
      <!-- Main row -->
      <div class="">
      <div class="col-lg-12 col-xs-12 w3-white">
      <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Extn.</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Extn.</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </tfoot>
    </table>
    </section>
    <!-- /.content -->
  </div>
@endsection



@section('formulario') 
 <!-- Registrar -->
 <form class="validar Modal" id="InUp_Tabla" name="InUp_Tabla" action="{{ route('usuarioCrea') }}" enctype="multipart/form-data">
  <div class="modal fade" id="Modal-InUp_Tabla" >
    <div class="modal-dialog" >
      <div class="modal-content" >
       <input class="w3-input w3-border-blue" id="ID" name="ID" type="hidden" >
          <div class="row">
            <!--Default Tabs-->
            <div class="col-sm-12 ">
              <div class="panel panel-border-color panel-border-color-primary ">
                <div class="tab-container ">
                  <div class="panel-heading " id="Title-InUp_Tabla">dwdwdwd</div>
                  <ul class="nav nav-tabs">
                    <li class="active"><a href="ui-tabs-accordions.html#Tabla_Insert" data-toggle="tab">Tabla</a></li>
                  </ul>
                  <div class="tab-content">
                  <input name="token" type="hidden" value="{{ csrf_token() }}"/>
                   {{ csrf_field() }}
                    <div id="Tabla_Insert" class="tab-pane active cont">
                         <div class="row">
                         <div class="w3-padding"> 
                        <div class="col-md-12 col-sm-12 ">
                            <div class="form-group ">
                                 <label>Nombre:</label>
                                 <input type="text" class="w3-input w3-border-blue requerido texto"  name="Nombre" id="Nombre"  placeholder="Nombre">
                            </div>
                            <div class="form-group ">
                                 <label>Correo:</label>
                                 <input type="text" class="w3-input w3-border-blue requerido correo"  name="Correo" id="Correo"  placeholder="ICorreocono">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="w3-col m12 w3-center w3-padding">
                        <button type="button" class="btn btn-danger" data-dismiss="modal" style="width: 150px;">Cerrar</button>
                        <button id="Registrar" class="btn btn-primary" type="submit" name="Registrar" style="width: 150px;">Registrar</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>
  </div>
</form>
@endsection 




@section('datatable') 
<script >
$(document).ready(function() {
    $('#example').DataTable( {
      "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
        },
      "ajax": {
        "url": "lista",
        "contentType": "application/json",
        "dataSrc": ""
      },
        "columns": [
            { "data": "id" },
            { "data": "email" },
            { "data": "password" },
            { "data": "status" },
            { "data": "created_at" },
            { "data": "updated_at" }
        ]
    } );
} );
</script>
  @endsection 