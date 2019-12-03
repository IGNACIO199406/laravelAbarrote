@extends('layaud')
@section('titulo','Proveedor')
@section('conten')
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
    @endsection



    @section('formulario')
    <!-- Registrar -->
    <form class="validar Modal" id="InUp_Proveedor" name="InUp_Proveedor" action="{{ route('proveedorCrea') }}" enctype="multipart/form-data">
      <div class="modal fade" id="Modal-InUp_Proveedor">
        <div class="modal-dialog">
          <div class="modal-content">
            <input class="w3-input w3-border-blue" id="ID" name="ID" type="hidden">
            <div class="row">
              <!--Default Tabs-->
              <div class="col-sm-12 ">
                <div class="panel panel-border-color panel-border-color-primary ">
                  <div class="tab-container ">
                    <ul class="nav nav-tabs">
                      <li class="active"><a href="ui-tabs-accordions.html#Proveedor_Insert" data-toggle="tab">Alta de Provvedor</a></li>
                    </ul>
                    <div class="tab-content">
                      <input name="token" type="hidden" value="{{ csrf_token() }}" />
                      {{ csrf_field() }}
                      <div id="Proveedor_Insert" class="tab-pane active cont">
                        <div class="row">
                          <div class="col-md-12 col-sm-12 ">
                            <div class="col-md-6 col-sm-6 ">
                              <div class="form-group ">
                                <label>Nombre:</label>
                                <input type="text" class="w3-input w3-border-blue requerido texto" name="Nombre" id="Nombre" placeholder="Nombre">
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-6 ">
                              <div class="form-group ">
                                <label>Apellidos:</label>
                                <input type="text" class="w3-input w3-border-blue requerido texto" name="Apellidos" id="Apellidos" placeholder="Apellidos">
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-6 ">
                              <div class="form-group ">
                                <label>Correo:</label>
                                <input type="text" class="w3-input w3-border-blue requerido correo" name="Correo" id="Correo" placeholder="ICorreocono">
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

    @section('archivosDedicados')
    <script src="../js/proveedor.js"></script>
    @endsection