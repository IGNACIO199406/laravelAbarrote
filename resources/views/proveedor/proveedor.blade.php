@extends('layaud')
@section('titulo','Proveedor')
@section('conten')

@section('cards')
@include('cards')
@endsection
<div class="row">
  <div class="w3-padding">
    <div class="col-lg-12 col-xs-12 w3-white w3-padding">

      <table id="listaProveedor" class="display" style="width:100%">
        <thead>
          <tr>
            <th>Clave</th>
            <th>Codigo de Barras</th>
            <th>Nombre</th>
            <th>Correo</th>
            <th>Puntos</th>
            <th>Archivo</th>
            <th>Status.</th>
            <th>Fecha registro</th>
            <th>Fecha actualizacion</th>
            <th>Acciones</th>
          </tr>
        </thead>
      </table>
    </div>
  </div>
</div>
@endsection

@section('formulario')
<!-- Registrar -->
<form class="validar Modal" id="InUp_Proveedor" name="InUp_Proveedor" enctype="multipart/form-data">
  <div class="modal fade bd-example-modal-lg" id="Modal-InUp_Proveedor">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header w3-blue">
          <h3 class="modal-title w3-center" id="Modal-Titulo"></h3>
        </div>
        <div class="row">
          <!--Default Tabs-->
          <div class="col-sm-12 ">
            <div class="panel panel-border-color panel-border-color-primary ">
              <div class="tab-content">
                <input class="w3-input w3-border-blue" id="ID" name="ID" type="hidden">
                <input name="token" type="hidden" value="{{ csrf_token() }}" />
                {{ csrf_field() }}
                <div class="row">
                  <div class="col-md-12 col-sm-12 ">
                    <div class="col-md-12 col-sm-12 ">
                      <div class="form-group ">
                        <label>Roles:</label>
                        <select class="w3-input w3-border-blue " name="idMarca" name="idMarca">
                        <option value="0">lista Marcas</option>
                          @foreach ($marcas as $marca)
                          @if ($marca->status==1)
                          <option value="{{$marca->id}}">{{$marca->nombre}}</option>
                          @endif
                          @endforeach
                        </select>
                      </div>
                    </div>
                    <div class="col-md-4 col-sm-4 ">
                      <div class="form-group ">
                        <label>Nombre:</label>
                        <input type="text" class="w3-input w3-border-blue requerido texto" name="nombre" id="nombre" placeholder="Nombre">
                      </div>
                    </div>
                    <div class="col-md-4 col-sm-4 ">
                      <div class="form-group ">
                        <label>Apellido Paterno:</label>
                        <input type="text" class="w3-input w3-border-blue " name="apellidoPaterno" id="apellidoPaterno" placeholder="Apellido Paterno">
                      </div>
                    </div>
                    <div class="col-md-4 col-sm-4 ">
                      <div class="form-group ">
                        <label>Apellido Materno:</label>
                        <input type="text" class="w3-input w3-border-blue " name="apellidoMaterno" id="apellidoMaterno" placeholder="Apellido Materno">
                      </div>
                    </div>
                    <div class="col-md-4 col-sm-4 ">
                      <div class="form-group ">
                        <label>Teléfono:</label>
                        <input type="text" class="w3-input w3-border-blue " name="telefono" id="telefono" placeholder="Teléfono">
                      </div>
                    </div>
                    <div class="col-md-4 col-sm-4 ">
                      <div class="form-group ">
                        <label>Correo:</label>
                        <input type="text" class="w3-input w3-border-blue requerido correo" name="email" id="email" placeholder="Correo">
                      </div>
                    </div>
                    <div class="col-md-4 col-sm-4 ">
                      <div class="form-group ">
                        <label>Razon Social:</label>
                        <input type="text" class="w3-input w3-border-blue " name="razonSocial" id="razonSocial" placeholder="Razon Social">
                      </div>
                    </div>
                    <div class="col-md-12 col-sm-12 ">
                      <div class="col-md-6 col-sm-6 ">
                        <div class="form-group ">
                          <label>Dirección:</label>
                          <textarea class="w3-input w3-border-blue " name="direccion" id="direccion" cols="30" rows="5" placeholder="Dirección"></textarea>
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-6 ">
                        <div class="col-md-12 col-sm-12 ">
                          <div class="form-group ">
                            <label>Archivo:</label>
                            <input type="file" class="w3-input w3-border-blue " name="archivo" id="archivo">
                          </div>
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
</form>



@endsection

@section('archivosDedicados')
<script src="../js/proveedor.js"></script>
@endsection