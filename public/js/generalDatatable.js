var dataTableId = $('#lista' + idTablaLista).DataTable({
    "language": lenguajeDatatable,
    "ajax": {
        "url": idTablaLista.toLowerCase() + "/lista",
        "contentType": "application/json",
        "dataSrc": ""
    },
    "order": [0, 'asc'],
    columns: columnasDatatable
});