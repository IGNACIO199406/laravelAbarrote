<div class="row">
  
  @foreach ($permisos as $permiso)
  @if ($permiso->idAccion==4 )
  <div class="w3-display-none" id="permisoDelete">{{$permiso->status}}</div>
  @endif
  @endforeach

  @foreach ($permisos as $permiso)
  @if ($permiso->idAccion==6 )
  <div class="w3-display-none" id="permisoActive">{{$permiso->status}}</div>
  @endif
  @endforeach

  @foreach ($permisos as $permiso)
  @if ($permiso->idAccion==3 )
  <div class="w3-display-none" id="permisoActualiza">{{$permiso->status}}</div>
  @endif
  @endforeach

  @foreach ($permisos as $permiso)
  @if ($permiso->idAccion==2 and $permiso->status=="1")
  <div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <div class="small-box bg-aqua w3-hover-shadow">
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

  @endif
  @endforeach
  <!-- ./col -->
  @foreach ($permisos as $permiso)
  @if ($permiso->idAccion==7 and $permiso->status=="1")
  <div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <div class="small-box bg-green w3-hover-shadow">
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
    <div class="small-box bg-yellow w3-hover-shadow">
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
    <div class="small-box bg-red w3-hover-shadow">
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
  @endif
  @endforeach
  <!-- ./col -->
</div>