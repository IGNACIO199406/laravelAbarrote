var dataTableId = $('#example').DataTable({
    "language": {
        "url": "../json/lenguajeDatatable.json"
    },
    "ajax": {
        "url": "../usuario/lista",
        "contentType": "application/json",
        "dataSrc": ""
    },
    "columns": [{
            "data": "id"
        },
        {
            "data": "email"
        },
        {
            "data": "password"
        },
        {
            "data": "status"
        },
        {
            "data": "created_at"
        },
        {
            "data": "updated_at"
        }
    ]
});


$('#botonRegistro').click(function() {
    $(this).attr("data-target", "#Modal-InUp_Proveedor");
});