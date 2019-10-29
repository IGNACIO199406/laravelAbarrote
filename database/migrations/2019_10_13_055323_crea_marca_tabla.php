<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreaMarcaTabla extends Migration
{
    /**
     * Run the migrations.
     * crear migracion
     * php artisan make:migration crea_marca_tabla
     * 
     * correr migraciones
     * php artisan migrate
     * @return void
     */
    public function up()
    {
        //wewe
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
        //
        Schema::drop('marca');
    }
}
