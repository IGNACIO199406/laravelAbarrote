<?php
/*
|--------------------------------------------------------------------------
| Web rutas de los controladores generales del array asociativo
|--------------------------------------------------------------------------
//Route::middleware('auth:api')->get("/".$Usuario."/app/create", "Usuario@appCreate")->name($Usuario."App"."Crear");
php artisan make:controller Marca
*/

$arrayList = ["usuario" => "usuario", "marca" => "marca", "proveedor" => "proveedor", "categoria" => "categoria", "producto" => "producto", "catalogo" => "catalogo"];
foreach ($arrayList as $rutaSelect) {
    Route::get("/" . $rutaSelect . "/", ucfirst($rutaSelect) . "Controller@index")->name($rutaSelect . "Vista");
    Route::get("/" . $rutaSelect . "/lista", ucfirst($rutaSelect) . "Controller@list")->name($rutaSelect . "Lista");
    Route::post("/" . $rutaSelect . "/crea", ucfirst($rutaSelect) . "Controller@create")->name($rutaSelect . "Crea");
    Route::post("/" . $rutaSelect . "/elimina", ucfirst($rutaSelect) . "Controller@delete")->name($rutaSelect . "Elimina");
    Route::post("/" . $rutaSelect . "/actualiza", ucfirst($rutaSelect) . "Controller@update")->name($rutaSelect . "Actualiza");
    Route::get("/" . $rutaSelect . "/detalle/{id}", ucfirst($rutaSelect) . "Controller@detalle")->name($rutaSelect . "Detalle");
}

Route::get('/marca/csv', function(){
    $filepath = resource_path().'/img/Marcas.csv';
    dd(Excel::load($filepath, function($reader){})->get());
  })->name("marcaCsv");
/*
|--------------------------------------------------------------------------
| Web rutas de los controladores unicas
|--------------------------------------------------------------------------
*/
$rutaSelect = "usuario";
Route::get("/", ucfirst($rutaSelect) . "Controller@home")->name($rutaSelect . "Home");
Route::post("/" . $rutaSelect . "/login", ucfirst($rutaSelect) . "Controller@login")->name($rutaSelect . "Login");
 