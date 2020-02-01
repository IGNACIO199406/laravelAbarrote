@extends('layaud')
@section('titulo','Almacen')
@section('conten')


<div class="row">
      <div class="col-lg-12 col-xs-12 ">
        <header class="w3-container w3-blue w3-center">
          <h2>Almacén</h2>
        </header>
      </div>
    <div class="w3-padding">
      <div class="col-lg-12 col-xs-12 w3-white w3-padding">
        <table id="listaAlmacen" class="display" style="width:100%">
          <thead>
            <tr>
              <th>Quitar</th>
              <th>Clave</th>
              <th>Nombre</th>
              <th>Stock</th>
              <th>Agregar</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
</div>
@endsection



@section('archivosDedicados')
<script src="../js/almacen.js"></script>
@endsection