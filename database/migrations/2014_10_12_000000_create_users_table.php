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
            $table->string('nombre',45);
            $table->string('email',90);
            $table->string('password');
            $table->string('archivo',255);
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('estatus', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre',45);
            $table->string('status',2);
            $table->timestamps();
        });

        Schema::create('tipo_usuario', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre',45);
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
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('usuario');
        Schema::drop('estatus');
        Schema::drop('tipo_usuario');
        Schema::drop('catalogo');
        Schema::drop('marca');
    }
}
