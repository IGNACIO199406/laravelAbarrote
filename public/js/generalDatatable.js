var dataTableId = $('#lista' + idTablaLista).DataTable({
    "language": lenguajeDatatable,
    "lengthMenu": [
        [10, 20, 30, 50, -1],
        [10, 20, 30, 50, "Todos"]
    ],
    "iDisplayLength": 30,
    "bJQueryUI": false,
    "ajax": {
        "url": idTablaLista.toLowerCase() + "/lista",
        "contentType": "application/json",
        "dataSrc": ""
    },
    "order": [0, 'asc'],
    columns: columnasDatatable
});