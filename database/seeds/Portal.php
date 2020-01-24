<?php

use Illuminate\Database\Seeder;

class Portal extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        return \DB::table('portal')->insert([
            [
                "id" => 1,
                "nombre" => "punto de vanta Port-Kal",
                "archivo" => "logo.png",
                "status" => "1",
                'created_at' => date('Y-m-d H:m:s'),
                'updated_at' => date('Y-m-d H:m:s')
            ]
        ]);
    }
}
