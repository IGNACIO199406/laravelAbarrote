@extends('layaud')
@section('titulo','Producto')
@section('conten')

@section('cards')
@include('cards')
@endsection

<div class="row">
  <div class="w3-padding">
    <div class="col-lg-12 col-xs-12 w3-white w3-padding">
      <table id="listaProducto" class="display" style="width:100%">
        <thead>
          <tr>
          <th>Quitar</th>
            <th>Clave</th>
            <th>Nombre</th>
            <th>Precio C</th>
            <th>Precio V</th>
            <th>Stock</th>
            <th>Archivo</th>
            <th>Status.</th>
            <th>Se-Registro</th>
            <th>Se-Actualizó</th>
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
<form class="validar Modal" id="InUp_Producto" name="InUp_Producto" enctype="multipart/form-data">
  <div class="modal fade bd-example-modal-lg" id="Modal-InUp_Producto">
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
                    <div class="col-md-4 col-sm-4 ">
                      <div class="form-group ">
                        <label>Departamento:</label>
                        <select class="w3-input w3-border-blue " name="idDepartamento" id="idDepartamento">
                          <option value="0">Departamento</option>
                          @foreach ($departamentos as $departamento)
                          @if ($departamento->status==1)
                          <option value="{{ $departamento->id}}">{{ $departamento->nombre}}</option>
                          @endif
                          @endforeach
                        </select>
                      </div>
                    </div>
                    <div class="col-md-4 col-sm-4 ">
                      <div class="form-group ">
                        <label>Marca:</label>
                        <select class="w3-input w3-border-blue " name="idMarca" id="idMarca">
                          <option value="0">Marcas</option>
                          @foreach ($marcas as $marca)
                          @if ($marca->status==1)
                          <option value="{{ $marca->id}}">{{ $marca->nombre}}</option>
                          @endif
                          @endforeach
                        </select>
                      </div>
                    </div>
                    <div class="col-md-4 col-sm-4 ">
                      <div class="form-group ">
                        <label>Unidad:</label>
                        <select class="w3-input w3-border-blue " name="idUnidad" id="idUnidad">
                          <option value="0">Unidad</option>
                          @foreach ($unidades as $unidad)
                          @if ($unidad->status==1)
                          <option value="{{ $unidad->id}}">{{ $unidad->nombre}}</option>
                          @endif
                          @endforeach
                        </select>
                      </div>
                    </div>
                    <div class="col-md-6 col-sm-6 ">
                      <div class="form-group ">
                        <label>Nombre:</label>
                        <input type="text" class="w3-input w3-border-blue requerido texto" name="nombre" id="nombre" placeholder="Nombre">
                      </div>
                    </div>
                    <div class="col-md-2 col-sm-2 ">
                      <div class="form-group ">
                        <label>Stock:</label>
                        <input type="text" class="w3-input w3-border-blue " name="stock" id="stock" placeholder="Stock">
                      </div>
                    </div>
                    <div class="col-md-2 col-sm-2 ">
                      <div class="form-group ">
                        <label>Precio/C:</label>
                        <input type="text" class="w3-input w3-border-blue " name="precioCompra" id="precioCompra" placeholder="Precio C">
                      </div>
                    </div>
                    <div class="col-md-2 col-sm-2 ">
                      <div class="form-group ">
                        <label>Precio/V:</label>
                        <input type="text" class="w3-input w3-border-blue " name="precioVenta" id="precioVenta" placeholder="Precio V">
                      </div>
                    </div>
                    <div class="col-md-12 col-sm-12 ">
                      <div class="col-md-6 col-sm-6 ">
                        <div class="form-group ">
                          <label>Descrpción:</label>
                          <textarea class="w3-input w3-border-blue " name="descripcion" id="descripcion" cols="30" rows="5" placeholder="Descrpción"></textarea>
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-6 ">
                        <div class="col-md-12 col-sm-12 ">
                          <div class="form-group ">
                            <label>Archivo:</label>
                            <input type="file" class="w3-input w3-border-blue " name="archivo" id="archivo">
                          </div>
                        </div>
                        <div class="col-md-12 col-sm-12 ">
                          <div class="form-group ">
                            <label>Codigo de Barras:</label>
                            <input type="text" class="w3-input w3-border-blue " name="codigoBarra" id="codigoBarra" placeholder="Codigo de Barra">
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
<script src="../js/producto.js"></script>
@endsection