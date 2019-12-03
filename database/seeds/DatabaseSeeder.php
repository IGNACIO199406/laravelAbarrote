<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     * php artisan migrate             --migracion
     * php artisan db:seed             --insertar registros
     * php artisan migrate:reset       --todas las migraciones
     * php artisan migrate:rollback    --ultima migracion
     * composer dump-autoload
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        //php artisan make:seeder Catalogo
        $this->call(Catalogo::class);
    }
}
