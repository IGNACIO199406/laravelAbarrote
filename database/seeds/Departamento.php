<?php

use Illuminate\Database\Seeder;

class Departamento extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        return \DB::table('departamento')->insert([

            [
                'id' => 1,
                'nombre' => 'perfumeria',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-01 11:12:08',
                'updated_at' => '2018-12-01 11:12:08'
            ],
            [
                'id' => 2,
                'nombre' => 'recargas',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-01 11:34:09',
                'updated_at' => '2018-12-01 11:34:09'
            ],
            [
                'id' => 3,
                'nombre' => 'MEDICAMENTOS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-01 14:13:31',
                'updated_at' => '2018-12-01 14:13:31'
            ],
            [
                'id' => 4,
                'nombre' => 'ELECTROLITOS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-01 14:16:28',
                'updated_at' => '2018-12-01 14:16:28'
            ],
            [
                'id' => 5,
                'nombre' => 'BRULUAGSA',
                'archivo' => 'no_imagen.jpg',
                'status' => '0',
                'created_at' => '2018-12-02 16:32:45',
                'updated_at' => '2018-12-02 16:34:02'
            ],
            [
                'id' => 6,
                'nombre' => 'MATERIAL DE CURACION',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 17:04:59',
                'updated_at' => '2018-12-02 17:04:59'
            ],
            [
                'id' => 7,
                'nombre' => 'COSMETICOS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-05 15:54:54',
                'updated_at' => '2018-12-05 15:54:54'
            ],
            [
                'id' => 8,
                'nombre' => 'ALIMENTOS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-05 16:47:24',
                'updated_at' => '2018-12-05 16:47:24'
            ],
            [
                'id' => 9,
                'nombre' => 'FORMULA LACTEA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-05 16:47:56',
                'updated_at' => '2018-12-05 16:47:56'
            ],
            [
                'id' => 10,
                'nombre' => 'BEBÈS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-06 12:18:18',
                'updated_at' => '2018-12-06 12:18:18'
            ],
            [
                'id' => 11,
                'nombre' => 'LIMPIEZA DENTAL',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-11 16:41:05',
                'updated_at' => '2018-12-11 16:41:05'
            ],
            [
                'id' => 12,
                'nombre' => 'HIGIENE PERSONAL',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-11 16:55:20',
                'updated_at' => '2018-12-11 16:55:20'
            ],
            [
                'id' => 13,
                'nombre' => 'SUPLEMENTO ALIMENTICIO',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-28 15:36:52',
                'updated_at' => '2018-12-28 15:36:52'
            ],
            [
                'id' => 14,
                'nombre' => 'MATERIAL PARA VENOCLISIS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-08 17:41:15',
                'updated_at' => '2019-01-08 17:41:15'
            ],
            [
                'id' => 15,
                'nombre' => 'SOLUCIONES PARENTERALES',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-08 17:51:00',
                'updated_at' => '2019-01-08 17:51:00'
            ],
            [
                'id' => 16,
                'nombre' => 'HOGAR',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-29 14:41:45',
                'updated_at' => '2019-01-29 14:41:45'
            ],
            [
                'id' => 17,
                'nombre' => 'ACCESORIOS MEDICOS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-02 16:43:08',
                'updated_at' => '2019-02-02 16:43:08'
            ],
            [
                'id' => 18,
                'nombre' => 'MATERIAL PARA LABORATORIO',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-03 17:14:10',
                'updated_at' => '2019-02-03 17:14:10'
            ],
            [
                'id' => 19,
                'nombre' => 'PASTILLAS PARA LA TOS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-04 16:41:34',
                'updated_at' => '2019-05-13 16:31:14'
            ],
            [
                'id' => 20,
                'nombre' => 'SOLUCION ANTISEPTICA',
                'archivo' => 'no_imagen.jpg',
                'status' => '0',
                'created_at' => '2019-04-16 16:26:39',
                'updated_at' => '2019-04-16 16:27:59'
            ],
            [
                'id' => 21,
                'nombre' => 'DROGUERIA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-02 15:28:00',
                'updated_at' => '2019-05-02 15:28:00'
            ],
            [
                'id' => 22,
                'nombre' => 'ANTICONCEPTIVOS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-14 16:29:42',
                'updated_at' => '2019-05-14 16:29:42'
            ],
            [
                'id' => 23,
                'nombre' => 'PROTECTOR SOLAR',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-06-20 15:47:56',
                'updated_at' => '2019-06-20 15:47:56'
            ]
        ]);
    }
}
