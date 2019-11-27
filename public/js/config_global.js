 /*
                                                                                                                                                                                                                                                              ------------------------------------------------
                                                                                                                                                                                                                                                              Insert Update Delete
                                                                                                                                                                                                                                                              ------------------------------------------------
                                                                                                                                                                                                                                                              */

 //declaracion de variables
 var letras, numeros, correo, Contador, array_inputs, i, x, Search_required, Input_validar, Input_validar_texto, Input_validar_numeros, Input_validar_correo, ID_Form;
 //traer todos los formularios
 ID_Form = document.getElementsByTagName('form');
 letras = /^[A-Za-z\s\xF1\xD1]+$/; //solo letras
 numeros = /^\d*$/; //solo numeros
 correo = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i; //solo correos
 numeros_letras = /^[A-Za-z0-9\s\xF1\xD1]+$/; //solo letras y numeros
 imagenes = /(.jpg|.jpeg|.png|.gif)$/i; //solo imagenes
 pdf = /(.pdf)$/i; //solo PDF
 csv = /(.csv)$/i; //solo CSV
 colorBordeRed = "w3-border-red";
 colorBordeBlue = "w3-border-blue";
 // error=style.backgroundColor = "red";
 // success=style.backgroundColor = "green";
 //recorrer los formularios
 for (i = 0; i < ID_Form.length; i++) {
     Formulario = ID_Form[i].id; //guardar el ID del form en la variable
     $("#" + Formulario).submit(function(evento) {
         Contador = 0;
         array_inputs = [];
         Select_ID_Form = $(this).attr('id');
         Select_Action_Form = $(this).attr('action');

         //funcion de validacion
         function Validacion() {
             Search_required = document.forms[Select_ID_Form].className.search("validar");
             if (Search_required >= 0) {
                 x = document.forms[Select_ID_Form];
                 for (i = 0; i < x.length; i++) {
                     //validar que el input sea requerido
                     Input_validar = x[i].className.search("requerido");
                     if (Input_validar >= 0) {
                         if (x[i].value == "") {
                             Contador = Contador + 1;
                             array_inputs.push(x[i].id);
                             x[i].classList.add(colorBordeRed);
                         } else {
                             Input_validar_texto = x[i].className.search("texto");
                             Input_validar_numeros = x[i].className.search("numeros");
                             Input_validar_correo = x[i].className.search("correo");
                             Input_validar_numeros_letras = x[i].className.search("enteros-letras");
                             Input_validar_imagen = x[i].className.search("imagen");
                             Input_validar_pdf = x[i].className.search("pdf");
                             Input_validar_csv = x[i].className.search("csv");
                             //validar que solo sean letras
                             if (Input_validar_texto >= 0) {
                                 if (letras.test(x[i].value)) {
                                     x[i].classList.remove(colorBordeRed);
                                     x[i].classList.add(colorBordeBlue);
                                 } else {
                                     Contador = Contador + 1;
                                     array_inputs.push(x[i].id);
                                     x[i].classList.add(colorBordeRed);
                                 }
                             }
                             //validar que solo sean numeros
                             else if (Input_validar_numeros >= 0) {
                                 if (numeros.test(x[i].value)) {
                                     x[i].classList.remove(colorBordeRed);
                                     x[i].classList.add(colorBordeBlue);
                                 } else {
                                     Contador = Contador + 1;
                                     array_inputs.push(x[i].id);
                                     x[i].classList.add(colorBordeRed);
                                 }
                             }
                             //validar que solo sean numeros y letras
                             else if (Input_validar_numeros_letras >= 0) {
                                 if (numeros_letras.test(x[i].value)) {
                                     x[i].classList.remove(colorBordeRed);
                                     x[i].classList.add(colorBordeBlue);
                                 } else {
                                     Contador = Contador + 1;
                                     array_inputs.push(x[i].id);
                                     x[i].classList.add(colorBordeRed);
                                 }
                             }
                             //validar que solo sean correos
                             else if (Input_validar_correo >= 0) {
                                 if (correo.test(x[i].value)) {
                                     x[i].classList.remove(colorBordeRed);
                                     x[i].classList.add(colorBordeBlue);
                                 } else {
                                     Contador = Contador + 1;
                                     array_inputs.push(x[i].id);
                                     x[i].classList.add(colorBordeRed);
                                 }
                             }
                             //validar que solo sean imagenes
                             else if (Input_validar_imagen >= 0) {
                                 if (imagenes.test(x[i].value)) {
                                     x[i].classList.remove(colorBordeRed);
                                     x[i].classList.add(colorBordeBlue);
                                 } else {
                                     Contador = Contador + 1;
                                     array_inputs.push(x[i].id);
                                     x[i].classList.add(colorBordeRed);
                                 }
                             }
                             //validar que solo sean pdf
                             else if (Input_validar_pdf >= 0) {
                                 if (pdf.test(x[i].value)) {
                                     x[i].classList.remove(colorBordeRed);
                                     x[i].classList.add(colorBordeBlue);
                                 } else {
                                     Contador = Contador + 1;
                                     array_inputs.push(x[i].id);
                                     x[i].classList.add(colorBordeRed);
                                 }
                             }
                             //validar que solo sean csv
                             else if (Input_validar_csv >= 0) {
                                 if (csv.test(x[i].value)) {
                                     x[i].classList.remove(colorBordeRed);
                                     x[i].classList.add(colorBordeBlue);
                                 } else {
                                     Contador = Contador + 1;
                                     array_inputs.push(x[i].id);
                                     x[i].classList.add(colorBordeRed);
                                 }
                             }
                         }
                     }
                 }
                 if (Contador > 0) {
                     return false;
                 } else {
                     return true;
                 }
             } else {
                 return true;
             }
         }
         if (Validacion() == true) {
             evento.preventDefault();
             //$('#myCheckbox').is(':checked');

             var formssss = new FormData(this);
             $.ajax({
                 type: 'POST',
                 url: Select_Action_Form,
                 data: new FormData(this),
                 contentType: false,
                 cache: false,
                 processData: false,
                 success: function(Datos) {
                     registros = JSON.parse(Datos);
                     switch (registros.succes) {
                         case 'ok':
                             var buscarCadena = Select_Action_Form.search("usuario/login");
                             if (buscarCadena >= 0) {
                                 window.location.href = "/usuario/lista";
                             } else {
                                 $("#" + Select_ID_Form)[0].reset();
                                 dataTableId.clear().draw();
                                 dataTableId.ajax.reload(null, false);
                                 $("#Modal-" + Select_ID_Form).modal("hide");
                             }
                             console.log(registros);
                             break;
                         case 'error':
                             break;
                     }
                 }
             });
         } else {
             evento.preventDefault();
             VanillaToasts.create({
                 title: 'Message Title',
                 text: 'Notification text',
                 type: 'error',
                 icon: 'img/error.png'
             });
         }
     });
 }


 // valores predeterminados para datatable
 var idtDatatable = {
     "data": "id"
 };
 var nombreDatatable = {
     "data": "nombre"
 };
 var archivoDatatable = {
     "data": "archivo"
 };
 var statusDatatable = {
     "data": "status",
     "render": function(data, type, row) {
         if (data == "0") { status = "Inactivo" } else { status = "Activo" }
         return status;
     }
 };
 var createdAtDatatable = {
     "data": "created_at"
 };
 var updatedAtDatatable = {
     "data": "updated_at"
 };

 var accionesDatatable = {
     "render": function(data, type, row) {
         if (row.status == "1") {
             action = '<i onclick="funcionSelectId(' + row.id + ",'registroDelete'" + ')" class="iconoDelete fa fa-trash fa-2x w3-text-red" style="cursor: pointer;" > </i> ' +
                 '<i onclick="funcionSelectId(' + row.id + ",'registroUpdate'" + ')" class="fa fa-edit fa-2x w3-text-orange" style="cursor: pointer;" > </i>';
         } else {
             action = '<i onclick="funcionSelectId(' + row.id + ",'registroDelete'" + ')" class="iconoDelete fa fa-check-circle fa-2x w3-text-green" style="cursor: pointer;" > </i> ';
         }
         return action;
     }
 };
 var lenguajeDatatable = {
     "url": "../json/lenguajeDatatable.json"
 };

 var columnasDatatable = [
     idtDatatable,
     nombreDatatable,
     statusDatatable,
     createdAtDatatable,
     updatedAtDatatable,
     accionesDatatable
 ];

 // llamada del form para eliminar o activar registro
 function showModalDelete() {
     if (registros.status == '1') {
         var status = '0';
         $("#Modal-eliminaRegistro-Titulo").text('Eliminar registro');
         $("#Modal-eliminaRegistro-Color").removeClass("w3-blue").addClass("w3-red");
     } else {
         $("#Modal-eliminaRegistro-Color").removeClass("w3-red").addClass("w3-green");
         $("#Modal-eliminaRegistro-Titulo").text('Activar registro');
         var status = '1';
     }
     $("#eliminaID").val(registros.id);
     $("#eliminaStatus").val(status);
     $("#eliminaRegistro").attr('action', idTablaLista.toLowerCase() + '/elimina');
     $("#Modal-eliminaRegistro-Contenido").text('Clave = ' + registros.id + ' Nombre = ' + registros.nombre);
     $("#Modal-eliminaRegistro").modal("show");
 }

 // llamada del form para eliminar o activar registro
 function showModalUpdate(registroArray, tabla) {
     $("#InUp_" + tabla)[0].reset();
     $("#InUp_" + tabla).attr("action", tabla.toLowerCase() + "/actualiza");
     $("#Modal-Titulo").text("Actualiza Reistro");
     ID_Form = document.getElementsByTagName('form')["InUp_" + tabla];
     ID_Form["ID"].value = registroArray.id;
     ID_Form["Nombre"].value = registroArray.nombre;
        if(tabla.toLowerCase()=="catalogo"){
            $('#parent option[value='+ registroArray.parent +']').prop("selected", true);
            var serial_attr = $("#parent option:selected").attr("serial");
        }
     $("#Modal-InUp_" + tabla).modal("show");
 }


 // llamada del registro a la bd
 function funcionSelectId(id, accion) {
     $.ajax({
         type: 'GET',
         url: idTablaLista.toLowerCase() + "/detalle/" + id,
         contentType: false,
         cache: false,
         processData: false,
         success: function(Datos) {
             registros = JSON.parse(Datos);
             if (accion == "registroDelete") {
                 showModalDelete();
             } else if (accion == "registroUpdate") {
                 showModalUpdate(registros, idTablaLista);
             }

         }
     });
 }

 // llamada al Modal de registro
 $('#botonRegistro').click(function() {
     $("#InUp_" + idTablaLista)[0].reset();
     $("#InUp_" + idTablaLista).attr("action", idTablaLista.toLowerCase() + "/crea");
     $("#Modal-Titulo").text("Crear Reistro");
     $(this).attr("data-target", "#Modal-InUp_" + idTablaLista);
 });