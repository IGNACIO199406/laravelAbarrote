<?php

use Illuminate\Database\Seeder;

class Unidad extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        return \DB::table('unidad')->insert([

            [
                'id' => 1,
                'nombre' => 'gramos',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-01 11:15:14',
                'updated_at' => '2018-12-01 11:15:14'
            ],
            [
                'id' => 2,
                'nombre' => 'mililitros',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-01 11:21:47',
                'updated_at' => '2018-12-01 11:21:47'
            ],
            [
                'id' => 3,
                'nombre' => 'pieza',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-01 11:35:15',
                'updated_at' => '2018-12-01 11:35:15'
            ],
            [
                'id' => 4,
                'nombre' => 'TABLETAS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 16:11:11',
                'updated_at' => '2018-12-02 16:11:11'
            ],
            [
                'id' => 5,
                'nombre' => 'CAPSULAS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 16:11:22',
                'updated_at' => '2018-12-02 16:11:22'
            ],
            [
                'id' => 6,
                'nombre' => 'COMPRIMIDOS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 16:11:34',
                'updated_at' => '2018-12-02 16:11:34'
            ],
            [
                'id' => 7,
                'nombre' => 'GRAGEAS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 16:27:43',
                'updated_at' => '2018-12-02 16:27:43'
            ],
            [
                'id' => 8,
                'nombre' => 'CREMA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 16:49:30',
                'updated_at' => '2018-12-02 16:49:30'
            ],
            [
                'id' => 9,
                'nombre' => 'TABLETAS MASTICABLES',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 17:00:38',
                'updated_at' => '2018-12-02 17:00:38'
            ],
            [
                'id' => 10,
                'nombre' => 'TABLETAS EFERVECENTES',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-11 16:08:19',
                'updated_at' => '2018-12-11 16:08:19'
            ],
            [
                'id' => 11,
                'nombre' => 'MILIGRAMOS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-29 14:36:06',
                'updated_at' => '2018-12-29 14:36:06'
            ],
            [
                'id' => 12,
                'nombre' => 'ÒVULOS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-30 16:14:09',
                'updated_at' => '2018-12-30 16:14:09'
            ],
            [
                'id' => 13,
                'nombre' => 'AMPOLLETAS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-30 16:50:19',
                'updated_at' => '2018-12-30 16:50:19'
            ],
            [
                'id' => 14,
                'nombre' => 'COMPRIMIDOS EFERVECENTES',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-02 15:55:16',
                'updated_at' => '2019-01-02 15:55:16'
            ],
            [
                'id' => 15,
                'nombre' => 'LITRO',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-02 16:03:25',
                'updated_at' => '2019-01-02 16:03:25'
            ],
            [
                'id' => 16,
                'nombre' => 'SOBRES',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-08 17:13:01',
                'updated_at' => '2019-01-08 17:13:01'
            ],
            [
                'id' => 17,
                'nombre' => 'GEL',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-08 17:35:19',
                'updated_at' => '2019-01-08 17:35:19'
            ],
            [
                'id' => 18,
                'nombre' => 'TABLETAS LIBERACION PROLONGADA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-08 18:07:37',
                'updated_at' => '2019-01-08 18:07:37'
            ],
            [
                'id' => 19,
                'nombre' => 'AEROSOL',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-08 18:18:24',
                'updated_at' => '2019-01-08 18:18:24'
            ],
            [
                'id' => 20,
                'nombre' => 'PASTILLAS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-15 14:20:33',
                'updated_at' => '2019-01-15 14:20:33'
            ],
            [
                'id' => 21,
                'nombre' => 'SOLUCIÒN GOTAS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-20 15:44:56',
                'updated_at' => '2019-01-20 15:44:56'
            ],
            [
                'id' => 22,
                'nombre' => 'GOTAS PEDIÀTRICAS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-20 16:10:31',
                'updated_at' => '2019-01-20 16:10:31'
            ],
            [
                'id' => 23,
                'nombre' => 'OVULOS/CREMA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-22 16:18:18',
                'updated_at' => '2019-01-22 16:18:18'
            ],
            [
                'id' => 24,
                'nombre' => 'SUSPENSIÒN',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-22 17:00:03',
                'updated_at' => '2019-01-22 17:00:03'
            ],
            [
                'id' => 25,
                'nombre' => 'SOLUCIÒN ORAL',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-22 17:10:14',
                'updated_at' => '2019-01-22 17:10:14'
            ],
            [
                'id' => 26,
                'nombre' => 'UNGUENTO',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-29 13:51:13',
                'updated_at' => '2019-01-29 13:51:13'
            ],
            [
                'id' => 27,
                'nombre' => 'KILOGRAMOS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-29 14:17:02',
                'updated_at' => '2019-01-29 14:17:02'
            ],
            [
                'id' => 28,
                'nombre' => 'POMADA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-03 15:50:23',
                'updated_at' => '2019-02-03 15:50:23'
            ],
            [
                'id' => 29,
                'nombre' => 'SUPOSITORIOS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-03 16:32:44',
                'updated_at' => '2019-02-03 16:32:44'
            ],
            [
                'id' => 30,
                'nombre' => '',
                'archivo' => 'no_imagen.jpg',
                'status' => '0',
                'created_at' => '2019-02-03 17:10:27',
                'updated_at' => '2019-02-05 15:49:17'
            ],
            [
                'id' => 31,
                'nombre' => 'GOTAS OFTALMICAS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-04 16:54:41',
                'updated_at' => '2019-02-04 16:54:41'
            ],
            [
                'id' => 32,
                'nombre' => 'BÀLSAMO',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-05 15:49:44',
                'updated_at' => '2019-02-05 15:49:44'
            ],
            [
                'id' => 33,
                'nombre' => 'JABON',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-19 14:29:44',
                'updated_at' => '2019-02-19 14:29:44'
            ],
            [
                'id' => 34,
                'nombre' => 'JARABE',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-19 15:21:35',
                'updated_at' => '2019-02-19 15:21:35'
            ],
            [
                'id' => 35,
                'nombre' => 'PARCHES',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-03-16 16:24:53',
                'updated_at' => '2019-03-16 16:24:53'
            ],
            [
                'id' => 36,
                'nombre' => 'ovulos',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-03-16 17:15:08',
                'updated_at' => '2019-03-16 17:15:08'
            ],
            [
                'id' => 37,
                'nombre' => 'SOLUCION ANTISEPTICA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-04-16 16:28:39',
                'updated_at' => '2019-04-16 16:28:39'
            ],
            [
                'id' => 38,
                'nombre' => 'GLOBULOS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-02 15:34:58',
                'updated_at' => '2019-05-02 15:34:58'
            ],
            [
                'id' => 39,
                'nombre' => 'SOLUCION PARA NEBULIZAR',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-12 16:23:25',
                'updated_at' => '2019-05-12 16:23:25'
            ],
            [
                'id' => 40,
                'nombre' => 'cajas',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-14 15:25:57',
                'updated_at' => '2019-05-14 15:25:57'
            ],
            [
                'id' => 41,
                'nombre' => 'PASTA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-19 12:32:51',
                'updated_at' => '2019-05-19 12:32:51'
            ],
            [
                'id' => 42,
                'nombre' => 'SHAMPOO',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-19 13:11:21',
                'updated_at' => '2019-05-19 13:11:21'
            ],
            [
                'id' => 43,
                'nombre' => 'PROTECTOR SOLAR',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-06-20 15:49:08',
                'updated_at' => '2019-06-20 15:49:08'
            ]
        ]);
    }
}
