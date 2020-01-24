var idTablaLista = "Rol";
var contadorSplice = 2;
var adiocionalesDatatable = [
    { "data": "archivo" }
];

// agregar elementos a datatable de los que no son generaes
for (index = 0; index < adiocionalesDatatable.length; index++) {
    columnasDatatable.splice(contadorSplice, 0, adiocionalesDatatable[index]);
    contadorSplice = contadorSplice + 1;
}
//php artisan make: seeder CatalogoTableSeeder

columnasDatatable.push(accionesDatatable);