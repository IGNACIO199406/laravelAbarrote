<?php

use Illuminate\Database\Seeder;

class Estatus extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        return \DB::table('estatus')->insert([
            [
                "id" => 1,
                "valor" => 0,
                "nombre" => "Eliminado",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 2,
                "valor" => 1,
                "nombre" => "Activo",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 3,
                "valor" => 2,
                "nombre" => "Proceso",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 4,
                "valor" => 3,
                "nombre" => "Actualizado",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 5,
                "valor" => 4,
                "nombre" => "Venta",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 6,
                "valor" => 5,
                "nombre" => "Cancelada",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 7,
                "valor" => 6,
                "nombre" => "Prestamo",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ]
        ]);
    }
}
