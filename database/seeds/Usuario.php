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
                "ID_Portal" => 1,
                "ID_Rol" => 1,
                "nombre" => "Desarrollador",
                "email" => "ignacio_juego@hotmail.com",
                "password" => "12345",
                "archivo" => "logo.png",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 2,
                "ID_Portal" => 1,
                "ID_Rol" => 1,
                "nombre" => "Administrador",
                "email" => "admin@hotmail.com",
                "password" => "12345",
                "archivo" => "logo.png",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ]
        ]);
    }
}