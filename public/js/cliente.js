var idTablaLista = "Cliente";
var contadorSplice = 2;
var adiocionalesDatatable = [
    { "data": "codigoBarra" },
    {
        "data": null,
        "render": function(data, type, row) {
            // Combinar campos
            return data.nombre + ' ' + data.apellidoPaterno + ' ' + data.apellidoMaterno;
        }
    },
    { "data": "email" },
    { "data": "puntos" },
    { "data": "archivo" }
];

// agregar elementos a datatable de los que no son generaes
for (index = 0; index < adiocionalesDatatable.length; index++) {
    columnasDatatable.splice(contadorSplice, 0, adiocionalesDatatable[index]);
    contadorSplice = contadorSplice + 1;
}

columnasDatatable.push(accionesDatatable);
//eliminar tres campos de la tabla despues de la posicion 1 del array
columnasDatatable.splice(1, 1);