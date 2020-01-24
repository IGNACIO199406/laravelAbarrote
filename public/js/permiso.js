var idTablaLista = "Permiso";
var contadorSplice = 2;
var adiocionalesDatatable = [ //{  "data": "archivo" }
];

// agregar elementos a datatable de los que no son generaes
for (index = 0; index < adiocionalesDatatable.length; index++) {
    columnasDatatable.splice(contadorSplice, 0, adiocionalesDatatable[index]);
    contadorSplice = contadorSplice + 1;
}
//php artisan make: seeder CatalogoTableSeeder

var accionesDatatableModificadas = {
    "render": function(data, type, row) {
        action = '<i onclick="detallePermiso(' + row.id + ')" class="iconoDelete fa fa-edit fa-2x w3-text-orange" style="cursor: pointer;" > </i> ';
        return action;
    }
};
//agregar acciones de los que no son generaes
columnasDatatable.push(accionesDatatableModificadas);
//eliminar tres campos de la tabla despues de la posicion 1 del array
columnasDatatable.splice(2, 3);

function detallePermiso(id) {
    $.ajax({
        type: 'GET',
        url: 'permiso/detalle/' + id,
        success: function(Datos) {
            registros = JSON.parse(Datos);
            var cadena = "";
            $("#faltantePermiso").html();
            if (registros.length != 0) {
                if (registros.data.length != 0) {

                    for (const dato in registros.data) {
                        // console.log(registros.data[dato].catalogo)
                        cadena += '<tr> <th class="">' + registros.data[dato].catalogo + '</th>';
                        for (const key in registros.data[dato].accion) {
                            // console.log(registros.data[dato].accion[key].accion)
                            // console.log(registros.data[dato].accion[key].status)
                            if (registros.data[dato].accion[key].status == '1') {
                                cadena += '<th class="w3-center w3-cursos-pointer">' +
                                    '<i onclick="activePermiso(' + registros.data[dato].accion[key].id + ",'registroActive'" + ')" class="iconoDelete fa fa-check fa-2x w3-text-green" > </i>' +
                                    '</th>';
                            } else {
                                cadena += '<th class="w3-center w3-cursos-pointer">' +
                                    '<i onclick="activePermiso(' + registros.data[dato].accion[key].id + ",'registroDesActive'" + ')" class="iconoDelete fa fa-check fa-2x w3-text-red" > </i>' +
                                    '</th>';
                            }
                        }
                        cadena += '</tr>';
                    }
                    $("#detallePermisos").html('<div class="w3-col m8  w3-padding ">' +
                        '<div class="w3-white w3-card 4 ">' +
                        '<header class="w3-container w3-blue w3-center">' +
                        '<h2>' + registros.rol + '</h2>' +
                        '</header>' +
                        '<div class="w3-padding">' +
                        '<table id="" class="table table-striped " style="width:100%">' +
                        '<thead class="">' +
                        '<tr>' +
                        ' <th class="w3-center">Catalogo</th>' +
                        '<th class="w3-center">Vista</th>' +
                        '<th class="w3-center">Inserta</th>' +
                        '<th class="w3-center">Actualiza</th>' +
                        '<th class="w3-center">Elimina</th>' +
                        '<th class="w3-center">Detalle</th>' +
                        '<th class="w3-center">Activa</th>' +
                        '<th class="w3-center">Reporte</th>' +
                        '</tr>' +
                        '</thead>' +
                        ' <tbody>' +
                        cadena +
                        ' </tbody>' +
                        '</table>' +
                        '</div>' +
                        '</div>' +
                        '</div>');

                } else {
                    $("#detallePermisos").empty();
                }
            } else {
                $("#detallePermisos").empty();
            }
        }
    });



}


function faltantePermiso() {
    $.ajax({
        type: 'GET',
        url: 'permiso/faltante',
        success: function(Datos) {
            registros = JSON.parse(Datos);
            $("#faltantePermiso").empty();
            if (registros.length != 0) {
                $("#faltantePermiso").html('<select name="listRoles" id="listRoles">' +
                    '</select>');
                $("#listRoles").empty();
                $("#listRoles").append('<option value="0">Elije una opcion</option>');
                for (dato in registros) {
                    $("#listRoles").append('<option value="' + registros[dato].id + '"  >' + registros[dato].nombre + '</option>');
                }
                $("#listRoles").change(function() {
                    if ($('select[id=listRoles]').val() != 0) {
                        ajustePermiso($(this).val());
                    }
                });

            }
        }
    });
}


faltantePermiso();

function ajustePermiso(idRol) {
    $.ajax({
        type: 'GET',
        url: 'permiso/ajuste/' + idRol,
        contentType: false,
        cache: false,
        processData: false,
        success: function(Datos) {
            registros = JSON.parse(Datos);
            switch (registros.succes) {
                case 'ok':
                    faltantePermiso();
                    break;
                case 'error':
                    break;
            }
        }
    });
}


function activePermiso(idPermiso, accion) {
    console.log(idPermiso + " " + accion);
}