<?php

use Illuminate\Database\Seeder;

class Usuario extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        return \DB::table('usuario')->insert([
            [
                "id" => 1,
                "idSucursal" => 1,
                "idPortal" => 1,
                "idRol" => 1,
                "codigoBarra" => "OPE011220181",
                "nombre" => "Desarrollador",
                "apellidoPaterno" => "Desarrollador",
                "apellidoMaterno" => "Desarrollador",
                "email" => "ignacio_juego@hotmail.com",
                "telefono" => "",
                "domicilio" => "",
                "password" => "12345",
                "archivo" => "logo.png",
                "puntos" => 0.0,
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 2,
                "idSucursal" => 1,
                "idPortal" => 1,
                "idRol" => 1,
                "codigoBarra" => "OPE011220182",
                "nombre" => "Administrador",
                "apellidoPaterno" => "Administrador",
                "apellidoMaterno" => "Administrador",
                "email" => "admin@hotmail.com",
                "telefono" => "",
                "domicilio" => "",
                "password" => "12345",
                "archivo" => "logo.png",
                "puntos" => 0.0,
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ]
        ]);
    }
}
