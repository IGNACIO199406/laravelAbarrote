<?php

use Illuminate\Database\Seeder;

class Marca extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        return \DB::table('marca')->insert([

            [
                'id' => 1,
                'nombre' => 'GRISSI',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-01 11:13:07',
                'updated_at' => '2018-12-01 11:13:07'
            ],
            [
                'id' => 2,
                'nombre' => 'ego',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-01 11:20:36',
                'updated_at' => '2018-12-01 11:20:36'
            ],
            [
                'id' => 3,
                'nombre' => 'STEFANO',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-01 11:24:36',
                'updated_at' => '2018-12-01 11:24:36'
            ],
            [
                'id' => 4,
                'nombre' => 'telcel',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-01 11:34:40',
                'updated_at' => '2018-12-01 11:34:40'
            ],
            [
                'id' => 5,
                'nombre' => 'PISA',
                'archivo' => 'no_imagen.jpg',
                'status' => '0',
                'created_at' => '2018-12-01 14:31:44',
                'updated_at' => '2018-12-01 14:32:24'
            ],
            [
                'id' => 6,
                'nombre' => 'laboratorio PISA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-01 14:35:02',
                'updated_at' => '2018-12-01 14:35:02'
            ],
            [
                'id' => 7,
                'nombre' => 'GENOMMA LAB',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-01 14:40:59',
                'updated_at' => '2018-12-01 14:40:59'
            ],
            [
                'id' => 8,
                'nombre' => 'APOTEX',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 15:26:17',
                'updated_at' => '2018-12-02 15:26:17'
            ],
            [
                'id' => 9,
                'nombre' => 'NOVAG',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 15:35:29',
                'updated_at' => '2018-12-02 15:35:29'
            ],
            [
                'id' => 10,
                'nombre' => 'BIOFARMA CMD',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 15:42:25',
                'updated_at' => '2018-12-02 15:42:25'
            ],
            [
                'id' => 11,
                'nombre' => 'LAKESIDE',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 15:50:56',
                'updated_at' => '2018-12-02 15:50:56'
            ],
            [
                'id' => 12,
                'nombre' => 'AVIVIA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 16:08:33',
                'updated_at' => '2018-12-02 16:08:33'
            ],
            [
                'id' => 13,
                'nombre' => 'BIOMEP',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 16:27:08',
                'updated_at' => '2018-12-02 16:27:08'
            ],
            [
                'id' => 14,
                'nombre' => 'BRULUAGSA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 16:34:30',
                'updated_at' => '2018-12-02 16:34:30'
            ],
            [
                'id' => 15,
                'nombre' => 'BRULUART',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 16:42:09',
                'updated_at' => '2018-12-02 16:42:09'
            ],
            [
                'id' => 16,
                'nombre' => 'SON`S',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 16:48:13',
                'updated_at' => '2018-12-02 16:48:13'
            ],
            [
                'id' => 17,
                'nombre' => 'COLLINS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 16:53:14',
                'updated_at' => '2018-12-02 16:53:14'
            ],
            [
                'id' => 18,
                'nombre' => 'SENSI MEDICAL',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 17:08:09',
                'updated_at' => '2018-12-02 17:08:09'
            ],
            [
                'id' => 19,
                'nombre' => 'DENTILAB',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 17:18:23',
                'updated_at' => '2018-12-02 17:18:23'
            ],
            [
                'id' => 20,
                'nombre' => 'PROTEC',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 17:23:27',
                'updated_at' => '2018-12-02 17:23:27'
            ],
            [
                'id' => 21,
                'nombre' => 'DERMOCLEEN',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-02 17:37:13',
                'updated_at' => '2018-12-02 17:37:13'
            ],
            [
                'id' => 22,
                'nombre' => 'SERRAL',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-04 14:08:06',
                'updated_at' => '2018-12-04 14:08:06'
            ],
            [
                'id' => 23,
                'nombre' => 'MAVER',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-04 14:28:22',
                'updated_at' => '2018-12-04 14:28:22'
            ],
            [
                'id' => 24,
                'nombre' => 'STREGER',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-04 16:05:41',
                'updated_at' => '2018-12-04 16:05:41'
            ],
            [
                'id' => 25,
                'nombre' => 'ULTRA LABORATORIOS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-04 16:09:50',
                'updated_at' => '2018-12-04 16:09:50'
            ],
            [
                'id' => 26,
                'nombre' => 'GROSSMAN',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-04 16:12:22',
                'updated_at' => '2018-12-04 16:12:22'
            ],
            [
                'id' => 27,
                'nombre' => 'JANSSEN-CILAG',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-04 16:17:23',
                'updated_at' => '2018-12-04 16:17:23'
            ],
            [
                'id' => 28,
                'nombre' => 'VICTORY',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-04 16:20:12',
                'updated_at' => '2018-12-04 16:20:12'
            ],
            [
                'id' => 29,
                'nombre' => 'HORMONA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-04 16:32:08',
                'updated_at' => '2018-12-04 16:32:08'
            ],
            [
                'id' => 30,
                'nombre' => 'SKINPROT',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-04 16:50:23',
                'updated_at' => '2018-12-04 16:50:23'
            ],
            [
                'id' => 31,
                'nombre' => 'COSMETICOS',
                'archivo' => 'no_imagen.jpg',
                'status' => '0',
                'created_at' => '2018-12-05 15:49:08',
                'updated_at' => '2018-12-05 15:54:29'
            ],
            [
                'id' => 32,
                'nombre' => 'INDUSTRIAS LADIN',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-05 15:53:09',
                'updated_at' => '2018-12-05 15:53:09'
            ],
            [
                'id' => 33,
                'nombre' => 'REXONA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-05 16:00:08',
                'updated_at' => '2018-12-05 16:00:08'
            ],
            [
                'id' => 34,
                'nombre' => 'COLGATE PALMOLIVE',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-05 16:04:10',
                'updated_at' => '2018-12-05 16:04:10'
            ],
            [
                'id' => 35,
                'nombre' => 'BAYER',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-05 16:29:10',
                'updated_at' => '2018-12-05 16:29:10'
            ],
            [
                'id' => 36,
                'nombre' => 'NESTLÈ',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-05 16:46:06',
                'updated_at' => '2018-12-05 16:46:06'
            ],
            [
                'id' => 37,
                'nombre' => 'EVENFLO',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-06 12:19:59',
                'updated_at' => '2018-12-06 12:19:59'
            ],
            [
                'id' => 38,
                'nombre' => 'QUALAMEX',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-06 12:24:24',
                'updated_at' => '2018-12-06 12:24:24'
            ],
            [
                'id' => 39,
                'nombre' => 'MAVI',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-06 12:34:05',
                'updated_at' => '2018-12-06 12:34:05'
            ],
            [
                'id' => 40,
                'nombre' => 'KLEEN BEBÈ',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-11 15:15:19',
                'updated_at' => '2018-12-11 15:15:19'
            ],
            [
                'id' => 41,
                'nombre' => 'RB SALUTE MEXICO S.A. DE C.V.',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-11 15:49:44',
                'updated_at' => '2018-12-11 15:49:44'
            ],
            [
                'id' => 42,
                'nombre' => 'JOHNSON & JOHNSON',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-11 16:42:29',
                'updated_at' => '2018-12-11 16:42:29'
            ],
            [
                'id' => 43,
                'nombre' => 'PROCTER & GAMBLE',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-11 16:52:23',
                'updated_at' => '2018-12-11 16:52:23'
            ],
            [
                'id' => 44,
                'nombre' => 'SCA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-11 17:05:05',
                'updated_at' => '2018-12-11 17:05:05'
            ],
            [
                'id' => 45,
                'nombre' => 'LAB JALOMA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-15 16:47:21',
                'updated_at' => '2018-12-15 16:47:21'
            ],
            [
                'id' => 46,
                'nombre' => 'HENKEL CAPITAL',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-15 17:24:08',
                'updated_at' => '2018-12-15 17:24:08'
            ],
            [
                'id' => 47,
                'nombre' => 'SYNTHON',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-19 16:36:20',
                'updated_at' => '2018-12-19 16:36:20'
            ],
            [
                'id' => 48,
                'nombre' => 'BRONCOLIN',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-19 16:54:37',
                'updated_at' => '2018-12-19 16:54:37'
            ],
            [
                'id' => 49,
                'nombre' => 'RAYERE',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-28 15:11:19',
                'updated_at' => '2018-12-28 15:11:19'
            ],
            [
                'id' => 50,
                'nombre' => 'CODIFARMA S.A. DE C.V.',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-28 15:32:21',
                'updated_at' => '2018-12-28 15:32:21'
            ],
            [
                'id' => 51,
                'nombre' => 'LOEFFLER',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-28 15:40:47',
                'updated_at' => '2018-12-28 15:40:47'
            ],
            [
                'id' => 52,
                'nombre' => 'DEGORT`S/CHEMICAL',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-28 15:47:22',
                'updated_at' => '2018-12-28 15:47:22'
            ],
            [
                'id' => 53,
                'nombre' => 'LIFERPAL MD',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-28 16:31:02',
                'updated_at' => '2018-12-28 16:31:02'
            ],
            [
                'id' => 54,
                'nombre' => 'PROGELA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-28 16:38:19',
                'updated_at' => '2018-12-28 16:38:19'
            ],
            [
                'id' => 55,
                'nombre' => 'AMSA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-29 13:23:55',
                'updated_at' => '2018-12-29 13:23:55'
            ],
            [
                'id' => 56,
                'nombre' => 'LIOMONT',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-29 14:02:37',
                'updated_at' => '2018-12-29 14:02:37'
            ],
            [
                'id' => 57,
                'nombre' => 'PHARMACAPS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-29 16:46:21',
                'updated_at' => '2018-12-29 16:46:21'
            ],
            [
                'id' => 58,
                'nombre' => 'ALPHARMA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-29 17:07:05',
                'updated_at' => '2018-12-29 17:07:05'
            ],
            [
                'id' => 59,
                'nombre' => 'RAAM',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-30 15:47:16',
                'updated_at' => '2018-12-30 15:47:16'
            ],
            [
                'id' => 60,
                'nombre' => 'VALEANT',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2018-12-30 16:45:26',
                'updated_at' => '2018-12-30 16:45:26'
            ],
            [
                'id' => 61,
                'nombre' => 'AZ',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-02 16:04:18',
                'updated_at' => '2019-01-02 16:04:18'
            ],
            [
                'id' => 62,
                'nombre' => 'KIMBERLY-CLARK',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-08 17:00:15',
                'updated_at' => '2019-01-08 17:00:15'
            ],
            [
                'id' => 63,
                'nombre' => 'ARLEX',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-08 17:25:54',
                'updated_at' => '2019-01-08 17:25:54'
            ],
            [
                'id' => 64,
                'nombre' => 'MEDIFARMA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-08 17:29:53',
                'updated_at' => '2019-01-08 17:29:53'
            ],
            [
                'id' => 65,
                'nombre' => 'BIOGALENIC',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-08 17:50:23',
                'updated_at' => '2019-01-08 17:50:23'
            ],
            [
                'id' => 66,
                'nombre' => 'RANDALL',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-15 14:02:31',
                'updated_at' => '2019-01-15 14:02:31'
            ],
            [
                'id' => 67,
                'nombre' => 'AVANT',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-15 14:30:41',
                'updated_at' => '2019-01-15 14:30:41'
            ],
            [
                'id' => 68,
                'nombre' => 'WOLFF',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-16 15:52:17',
                'updated_at' => '2019-01-16 15:52:17'
            ],
            [
                'id' => 69,
                'nombre' => 'NATUREX',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-16 16:08:05',
                'updated_at' => '2019-01-16 16:08:05'
            ],
            [
                'id' => 70,
                'nombre' => 'BOEHRINGER INGELHEIM',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-20 14:40:49',
                'updated_at' => '2019-01-20 14:40:49'
            ],
            [
                'id' => 71,
                'nombre' => 'SCHOEN',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-20 15:02:28',
                'updated_at' => '2019-01-20 15:02:28'
            ],
            [
                'id' => 72,
                'nombre' => 'SUANCA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-20 15:05:35',
                'updated_at' => '2019-01-20 15:05:35'
            ],
            [
                'id' => 73,
                'nombre' => 'CHINOIN',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-20 15:55:34',
                'updated_at' => '2019-01-20 15:55:34'
            ],
            [
                'id' => 74,
                'nombre' => 'GRIN',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-22 15:15:55',
                'updated_at' => '2019-01-22 15:15:55'
            ],
            [
                'id' => 75,
                'nombre' => 'JAYOR',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-22 18:18:27',
                'updated_at' => '2019-01-22 18:18:27'
            ],
            [
                'id' => 76,
                'nombre' => 'QUIMPHARMA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-26 16:10:39',
                'updated_at' => '2019-01-26 16:10:39'
            ],
            [
                'id' => 77,
                'nombre' => 'DEGASA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-26 16:52:32',
                'updated_at' => '2019-01-26 16:52:32'
            ],
            [
                'id' => 78,
                'nombre' => 'EMQ',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-26 17:06:32',
                'updated_at' => '2019-01-26 17:06:32'
            ],
            [
                'id' => 79,
                'nombre' => 'PHARMAGEN',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-26 17:33:29',
                'updated_at' => '2019-01-26 17:33:29'
            ],
            [
                'id' => 80,
                'nombre' => 'NORDIN',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-29 12:09:26',
                'updated_at' => '2019-01-29 12:09:26'
            ],
            [
                'id' => 81,
                'nombre' => 'LEBEN',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-29 12:15:16',
                'updated_at' => '2019-01-29 12:15:16'
            ],
            [
                'id' => 82,
                'nombre' => 'NAILEX',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-29 12:45:53',
                'updated_at' => '2019-01-29 12:45:53'
            ],
            [
                'id' => 83,
                'nombre' => 'RECKITT BENCKISER MEXICO',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-29 12:49:31',
                'updated_at' => '2019-01-29 12:49:31'
            ],
            [
                'id' => 84,
                'nombre' => 'SANOFI',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-01-29 13:45:53',
                'updated_at' => '2019-01-29 13:45:53'
            ],
            [
                'id' => 85,
                'nombre' => 'OMRON',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-02 16:42:02',
                'updated_at' => '2019-02-02 16:42:02'
            ],
            [
                'id' => 86,
                'nombre' => 'KSK',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-02 17:15:01',
                'updated_at' => '2019-02-02 17:15:01'
            ],
            [
                'id' => 87,
                'nombre' => 'PFISER',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-02 17:26:45',
                'updated_at' => '2019-02-02 17:26:45'
            ],
            [
                'id' => 88,
                'nombre' => 'NIPRO',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-03 17:09:04',
                'updated_at' => '2019-02-03 17:09:04'
            ],
            [
                'id' => 89,
                'nombre' => 'PERRIGO',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-04 14:43:30',
                'updated_at' => '2019-02-04 14:43:30'
            ],
            [
                'id' => 90,
                'nombre' => 'OFFENBACH',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-04 16:23:48',
                'updated_at' => '2019-02-04 16:23:48'
            ],
            [
                'id' => 91,
                'nombre' => 'BEIERSDORF',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-05 14:20:43',
                'updated_at' => '2019-02-05 14:20:43'
            ],
            [
                'id' => 92,
                'nombre' => 'GEDEON RICHTER',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-05 15:55:25',
                'updated_at' => '2019-02-05 15:55:25'
            ],
            [
                'id' => 93,
                'nombre' => 'BODYCARE',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-05 16:17:33',
                'updated_at' => '2019-02-05 16:17:33'
            ],
            [
                'id' => 94,
                'nombre' => 'LANDSTEINER SCIENTIFIC',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-17 19:40:50',
                'updated_at' => '2019-02-17 19:40:50'
            ],
            [
                'id' => 95,
                'nombre' => 'SANFER',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-17 19:51:32',
                'updated_at' => '2019-02-17 19:51:32'
            ],
            [
                'id' => 96,
                'nombre' => 'ALLEN',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-02-19 14:45:39',
                'updated_at' => '2019-02-19 14:45:39'
            ],
            [
                'id' => 97,
                'nombre' => 'DIBAR',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-03-08 14:56:30',
                'updated_at' => '2019-03-08 14:56:30'
            ],
            [
                'id' => 99,
                'nombre' => 'KAREY',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-03-16 16:27:32',
                'updated_at' => '2019-03-16 16:27:32'
            ],
            [
                'id' => 100,
                'nombre' => 'GENETICA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-03-16 16:44:32',
                'updated_at' => '2019-03-16 16:44:32'
            ],
            [
                'id' => 101,
                'nombre' => 'TOCOGINO',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-03-17 13:33:58',
                'updated_at' => '2019-03-17 13:33:58'
            ],
            [
                'id' => 102,
                'nombre' => 'SEDA PURE',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-03-17 13:45:01',
                'updated_at' => '2019-03-17 13:45:01'
            ],
            [
                'id' => 103,
                'nombre' => 'MEDIX',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-03-17 17:34:56',
                'updated_at' => '2019-03-17 17:34:56'
            ],
            [
                'id' => 104,
                'nombre' => 'WERMAR',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-03-17 17:41:39',
                'updated_at' => '2019-03-17 17:41:39'
            ],
            [
                'id' => 105,
                'nombre' => 'GADER',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-03-18 16:54:25',
                'updated_at' => '2019-03-18 16:54:25'
            ],
            [
                'id' => 106,
                'nombre' => 'FARMACEUTICA HISPANOAMERICANA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-03-18 17:00:13',
                'updated_at' => '2019-03-18 17:00:13'
            ],
            [
                'id' => 107,
                'nombre' => 'BIORESEARCH',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-04-16 16:03:57',
                'updated_at' => '2019-04-16 16:03:57'
            ],
            [
                'id' => 108,
                'nombre' => 'ATLANTIS PHARMA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-04-16 16:16:25',
                'updated_at' => '2019-04-16 16:16:25'
            ],
            [
                'id' => 109,
                'nombre' => 'QUIROMED',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-04-16 16:25:20',
                'updated_at' => '2019-04-16 16:25:20'
            ],
            [
                'id' => 110,
                'nombre' => 'PHARMA&PHARMA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-04-16 17:10:43',
                'updated_at' => '2019-04-16 17:10:43'
            ],
            [
                'id' => 111,
                'nombre' => 'MERCURIO',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-02 15:28:35',
                'updated_at' => '2019-05-02 15:28:35'
            ],
            [
                'id' => 112,
                'nombre' => 'NARTEX',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-02 15:34:01',
                'updated_at' => '2019-05-02 15:34:01'
            ],
            [
                'id' => 113,
                'nombre' => 'MERCK',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-04 18:08:23',
                'updated_at' => '2019-05-04 18:08:23'
            ],
            [
                'id' => 114,
                'nombre' => 'SUMITEX',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-12 17:21:51',
                'updated_at' => '2019-05-12 17:21:51'
            ],
            [
                'id' => 115,
                'nombre' => 'QUIRMEX',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-14 14:54:15',
                'updated_at' => '2019-05-14 14:54:15'
            ],
            [
                'id' => 116,
                'nombre' => 'PE PLASTER',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-19 13:03:41',
                'updated_at' => '2019-05-19 13:03:41'
            ],
            [
                'id' => 117,
                'nombre' => 'PRUDENCE',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-19 13:24:28',
                'updated_at' => '2019-05-19 13:24:28'
            ],
            [
                'id' => 118,
                'nombre' => 'BE-ADVANCE',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-19 13:33:04',
                'updated_at' => '2019-05-19 13:33:04'
            ],
            [
                'id' => 119,
                'nombre' => 'SENOSIAIN',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-19 14:13:23',
                'updated_at' => '2019-05-19 14:13:23'
            ],
            [
                'id' => 120,
                'nombre' => 'RAPIL',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-19 14:21:14',
                'updated_at' => '2019-05-19 14:21:14'
            ],
            [
                'id' => 121,
                'nombre' => 'TECNOFARMA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-19 15:54:03',
                'updated_at' => '2019-05-19 15:54:03'
            ],
            [
                'id' => 122,
                'nombre' => 'VICHAM',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-21 18:23:40',
                'updated_at' => '2019-05-21 18:23:40'
            ],
            [
                'id' => 123,
                'nombre' => 'BIOMIRAL',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-05-21 18:29:07',
                'updated_at' => '2019-05-21 18:29:07'
            ],
            [
                'id' => 124,
                'nombre' => 'CURITAS',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-06-02 16:47:00',
                'updated_at' => '2019-06-02 16:47:00'
            ],
            [
                'id' => 125,
                'nombre' => 'TOTAL CARE',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-06-20 15:46:38',
                'updated_at' => '2019-06-20 15:46:38'
            ],
            [
                'id' => 126,
                'nombre' => 'ADN PHARMA',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-06-24 13:40:53',
                'updated_at' => '2019-06-24 13:40:53'
            ],
            [
                'id' => 127,
                'nombre' => 'P&G',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-06-28 16:15:24',
                'updated_at' => '2019-06-28 16:15:24'
            ],
            [
                'id' => 128,
                'nombre' => 'KLEENEX',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-06-28 16:32:02',
                'updated_at' => '2019-06-28 16:32:02'
            ],
            [
                'id' => 129,
                'nombre' => 'SANTO DOMINGO',
                'archivo' => 'no_imagen.jpg',
                'status' => '1',
                'created_at' => '2019-06-28 17:09:10',
                'updated_at' => '2019-06-28 17:09:10'
            ]
        ]);
    }
}
