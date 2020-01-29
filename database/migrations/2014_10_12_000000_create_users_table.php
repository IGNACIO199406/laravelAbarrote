<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usuario', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('idSucursal');
            $table->integer('idPortal');
            $table->integer('idRol');
            $table->string('codigoBarra',255);
            $table->string('nombre',45);
            $table->string('apellidoPaterno',45);
            $table->string('apellidoMaterno',45);
            $table->string('email',90);
            $table->string('telefono',12);
            $table->text('direccion');
            $table->text('password');
            $table->string('archivo',255);
            $table->double('puntos', 7, 2);
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('proveedor', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('idUsuario');
            $table->integer('idMarca');
            $table->string('codigoBarra',255);
            $table->string('nombre',45);
            $table->string('apellidoPaterno',45);
            $table->string('apellidoMaterno',45);
            $table->string('email',90);
            $table->string('telefono',12);
            $table->string('razonSocial',45);
            $table->text('domicilio');
            $table->text('password');
            $table->string('archivo',255);
            $table->double('puntos', 7, 2);
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('cliente', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('idUsuario');
            $table->string('codigoBarra',255);
            $table->string('nombre',45);
            $table->string('apellidoPaterno',45);
            $table->string('apellidoMaterno',45);
            $table->string('email',90);
            $table->string('telefono',12);
            $table->text('domicilio');
            $table->text('password');
            $table->string('archivo',255);
            $table->double('puntos', 7, 2);
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('estatus', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('valor');
            $table->string('nombre',45);
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('portal', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre',45);
            $table->string('archivo',255);
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('sucursal', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre',45);
            $table->string('archivo',255);
            $table->string('status',2);
            $table->timestamps();
        });
        Schema::create('catalogo', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre',45);
            $table->string('url',45);
            $table->string('parent',10);
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('marca', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre',45);
            $table->string('archivo',255);
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('rol', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre',45);
            $table->string('archivo',255);
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('accion', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre',45);
            $table->string('archivo',255);
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('permiso', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('idRol');
            $table->integer('idAccion');
            $table->integer('idCatalogo');
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('producto', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('idMarca');
            $table->integer('idDepartamento');
            $table->integer('idUnidad');
            $table->string('codigoBarra',255);
            $table->string('nombre',255);
            $table->integer('stock');
            $table->double('precioCompra', 7, 2);
            $table->double('precioVenta', 7, 2);
            $table->text('descripcion');
            $table->string('archivo',255);
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('agenda', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('idCatalogo');
            $table->integer('idCatalogoUsuario');
            $table->integer('idUsuario');
            $table->text('descripcion');
            $table->string('status',2);
            $table->timestamps();
        });
        
        Schema::create('departamento', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre',45);
            $table->string('archivo',255);
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('unidad', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre',45);
            $table->string('archivo',255);
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('dia', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre',45);
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('venta', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('idUsuario');
            $table->integer('idCatalogo');
            $table->integer('idUCP');
            $table->double('puntos', 7, 2);
            $table->double('efectivo', 7, 2);
            $table->double('tarjeta', 7, 2);
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('ventaDetalle', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('idVenta');
            $table->integer('idProducto');
            $table->integer('cantidad');
            $table->double('precioCompra', 7, 2);
            $table->double('precioVenta', 7, 2);
            $table->string('status',2);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('usuario');
        Schema::drop('cliente');
        Schema::drop('proveedor');
        Schema::drop('sucursal');
        Schema::drop('estatus');
        Schema::drop('portal');
        Schema::drop('catalogo');
        Schema::drop('marca');
        Schema::drop('rol');
        Schema::drop('accion');
        Schema::drop('permiso');
        Schema::drop('producto');
        Schema::drop('departamento');
        Schema::drop('agenda');
        Schema::drop('dia');
        Schema::drop('venta');
        Schema::drop('ventaDetalle');
        Schema::drop('unidad');
    }
}
