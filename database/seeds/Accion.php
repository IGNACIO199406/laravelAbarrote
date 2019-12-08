<?php

use Illuminate\Database\Seeder;

class Accion extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        return \DB::table('accion')->insert([
            [
                "id" => 1,
                "nombre" => "Vista",
                "archivo" => "logo.png",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 2,
                "nombre" => "Inserta",
                "archivo" => "logo.png",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 3,
                "nombre" => "Actualiza",
                "archivo" => "logo.png",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 4,
                "nombre" => "Elimina",
                "archivo" => "logo.png",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 5,
                "nombre" => "Detalle",
                "archivo" => "logo.png",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 6,
                "nombre" => "Activa",
                "archivo" => "logo.png",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 7,
                "nombre" => "Reporte",
                "archivo" => "logo.png",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ]
        ]);
    }
}
