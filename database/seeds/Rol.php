<?php

use Illuminate\Database\Seeder;

class Rol extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        return \DB::table('rol')->insert([
            [
                "id" => 1,
                "nombre" => "Desarrollador",
                "archivo" => "logo.png",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ],
            [
                "id" => 2,
                "nombre" => "Administrador",
                "archivo" => "logo.png",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ]
        ]);
    }
}
