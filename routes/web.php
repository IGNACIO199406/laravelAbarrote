<?php
/*
|--------------------------------------------------------------------------
| Web rutas de los controladores generales del array asociativo
|--------------------------------------------------------------------------
//Route::middleware('auth:api')->get("/".$Usuario."/app/create", "Usuario@appCreate")->name($Usuario."App"."Crear");
php artisan make:controller Marca
*/

$arrayList = [
    "usuario" => "usuario",
    "cliente" => "cliente",
    "proveedor" => "proveedor",
    "sucursal" => "sucursal",
    "estatus" => "estatus",
    "portal" => "portal",
    "catalogo" => "catalogo",
    "marca" => "marca",
    "rol" => "rol",
    "accion" => "accion",
    "permiso" => "permiso",
    "producto" => "producto",
    "departamento" => "departamento",
    "agenda" => "agenda",
    "dia" => "dia",
    "venta" => "venta",
    "categoria" => "categoria",     
    "unidad" => "unidad"
];

foreach ($arrayList as $rutaSelect) {
    Route::get("/" . $rutaSelect . "/", ucfirst($rutaSelect) . "Controller@index")->name($rutaSelect . "Vista");
    Route::get("/" . $rutaSelect . "/lista", ucfirst($rutaSelect) . "Controller@list")->name($rutaSelect . "Lista");
    Route::post("/" . $rutaSelect . "/crea", ucfirst($rutaSelect) . "Controller@create")->name($rutaSelect . "Crea");
    Route::post("/" . $rutaSelect . "/elimina", ucfirst($rutaSelect) . "Controller@delete")->name($rutaSelect . "Elimina");
    Route::post("/" . $rutaSelect . "/actualiza", ucfirst($rutaSelect) . "Controller@update")->name($rutaSelect . "Actualiza");
    Route::get("/" . $rutaSelect . "/detalle/{id}", ucfirst($rutaSelect) . "Controller@detalle")->name($rutaSelect . "Detalle");
}

/*
|--------------------------------------------------------------------------
| Web rutas de los controladores unicas
|--------------------------------------------------------------------------
*/
$rutaSelect = "permiso";
Route::get("/" . $rutaSelect . "/faltante", ucfirst($rutaSelect) . "Controller@faltantePermiso")->name($rutaSelect . "Faltante");
Route::get("/" . $rutaSelect . "/ajuste/{id}", ucfirst($rutaSelect) . "Controller@ajustePermiso")->name($rutaSelect . "Ajuste");
Route::get("/" . $rutaSelect . "/actualiza/{id}/{status}", ucfirst($rutaSelect) . "Controller@activePermiso")->name($rutaSelect . "activePermiso");
Route::get("/" . $rutaSelect . "/actualiza/catalogo/{id}/{idRol}/{status}", ucfirst($rutaSelect) . "Controller@activePermisoCatalogo")->name($rutaSelect . "activePermisoCatalogo");
$rutaSelect = "usuario";
Route::get("/", ucfirst($rutaSelect) . "Controller@home")->name($rutaSelect . "Home");
Route::post("/" . $rutaSelect . "/login", ucfirst($rutaSelect) . "Controller@login")->name($rutaSelect . "Login");
Route::get("/" . $rutaSelect . "/closeLogin", ucfirst($rutaSelect) . "Controller@closeLogin")->name($rutaSelect . "closeLogin");
