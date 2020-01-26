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
     * php artisan make:model PermisosModel  --crear modelos
     * composer dump-autoload
     * 
     *  UsersT  --crear seeders
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        //php artisan make:seeder Catalogo
        //php artisan make:seeder Rol
        //php artisan make:seeder Accion
        $this->call(Catalogo::class);
        $this->call(Accion::class);
        $this->call(Rol::class);
        $this->call(Portal::class);
        $this->call(Usuario::class);
        $this->call(Estatus::class);
        $this->call(Marca::class);
        $this->call(Departamento::class);
        $this->call(Producto::class);
        $this->call(Unidad::class);
    }
}



