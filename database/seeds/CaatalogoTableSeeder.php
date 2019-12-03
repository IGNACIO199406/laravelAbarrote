<?php

use Illuminate\Database\Seeder;

class CaatalogoTableSeeder extends Seeder
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
                "nombre" => "Desarrollador",
                "url" => "",
                "parent" => "0",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "nombre" => "Usuario",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "nombre" => "Marca",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "nombre" => "Proveedor",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "nombre" => "Catalogo",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "nombre" => "Rol",
                "url" => "",
                "parent" => "1",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ]
        ]);
    }
}
