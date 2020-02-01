<?php

use Illuminate\Database\Seeder;

class Catalogo extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        return \DB::table('catalogo')->insert([
            [
                "id" => 1,
                "nombre" => "Desarrollador",
                "url" => "",
                "parent" => "0",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 2,
                "nombre" => "Usuario",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 3,
                "nombre" => "Marca",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 4,
                "nombre" => "Proveedor",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 5,
                "nombre" => "Catalogo",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 6,
                "nombre" => "Rol",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 7,
                "nombre" => "Accion",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 8,
                "nombre" => "Permiso",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 9,
                "nombre" => "Cliente",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 10,
                "nombre" => "Departamento",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 11,
                "nombre" => "Producto",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 12,
                "nombre" => "Unidad",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 13,
                "nombre" => "Estatus",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 14,
                "nombre" => "Almacen",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ]
        ]);
    }
}
