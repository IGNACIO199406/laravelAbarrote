var idTablaLista = "Catalogo";
var contadorSplice = 2;
var adiocionalesDatatable = [
    { "data": "url" }
];

// agregar elementos a datatable de los que no son generaes
for (index = 0; index < adiocionalesDatatable.length; index++) {
    columnasDatatable.splice(contadorSplice, 0, adiocionalesDatatable[index]);
    contadorSplice = contadorSplice + 1;
}
//agregar acciones de los que no son generaes
columnasDatatable.push(accionesDatatable);

$.ajax({
    type: 'GET',
    url: idTablaLista.toLowerCase() + "/lista/",
    contentType: false,
    cache: false,
    processData: false,
    success: function(Datos) {
        registros = JSON.parse(Datos);
        for (const registro in registros) {
            $("#parent").append("<option value='" + registros[registro].id + "' serial='" + registros[registro].id + "'>" + registros[registro].nombre + "</option>");
        }
    }
});