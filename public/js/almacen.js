var idTablaLista = "Almacen";
var contadorSplice = 2;
var adiocionalesDatatable = [
    { "data": "stock" },
    {
        "render": function(data, type, row) {
            action = '<i onclick="detallePermiso(' + row.id + ')" class="iconoDelete fa fa-plus fa-2x w3-text-green" style="cursor: pointer;" > </i> ';
            return action;
        }
    }
];

// agregar elementos a datatable de los que no son generaes
for (index = 0; index < adiocionalesDatatable.length; index++) {
    columnasDatatable.splice(contadorSplice, 0, adiocionalesDatatable[index]);
    contadorSplice = contadorSplice + 1;
}

columnasDatatable.splice(4, 3);

columnasDatatable.unshift({
    "render": function(data, type, row) {
        action = row.stock > 0 ? '<i onclick="detallePermiso(' + row.id + ')" class="iconoDelete fa fa-minus fa-2x w3-text-red" style="cursor: pointer;" > </i> ' : ' ';
        return action;
    }
});