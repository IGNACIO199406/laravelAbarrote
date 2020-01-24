@extends('layaud')
@section('titulo','Permiso')
@section('conten')

<div class="w3-row-padding w3-padding-16" id="">
  <div class="w3-col m4   ">

    <div class="w3-padding ">
      <header class="w3-container w3-green w3-center">
        <h2>Lista de Roles</h2>
      </header>
      <div class="w3-white w3-card 4 w3-padding">
        <div id="faltantePermiso"></div>
        <table id="listaPermiso" class="display" style="width:100%">
          <thead>
            <tr>
              <th>Clave</th>
              <th>Nombre</th>
              <th>Acciones</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>


  <div id="detallePermisos"> </div>
</div>

@endsection

@section('formulario')
<!-- Registrar -->
<form class="validar Modal" id="InUp_Permiso" name="InUp_Permiso" enctype="multipart/form-data">
  <div class="modal fade" id="Modal-InUp_Permiso">
    <div class="modal-dialog">
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
                    <div class="col-md-6 col-sm-6 ">
                      <div class="form-group ">
                        <label>Nombre:</label>
                        <input type="text" class="w3-input w3-border-blue requerido texto" name="Nombre" id="Nombre" placeholder="Nombre">
                      </div>
                    </div>
                    <div class="col-md-6 col-sm-6 ">
                      <div class="form-group ">
                        <label>Archivo:</label>
                        <input type="file" class="w3-input w3-border-blue " name="archivo" id="archivo">
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
<script src="../js/permiso.js"></script>
@endsection