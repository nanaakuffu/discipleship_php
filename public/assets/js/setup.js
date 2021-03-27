"use strict";

$("#setupTable")
    .DataTable({
        responsive: true,
        lengthChange: false,
        paging: true,
        searching: true,
        ordering: true,
        info: true,
        autoWidth: false,
        responsive: true,
        buttons: ["copy", "csv", "excel", "pdf", "print"],
    })
    .buttons()
    .container()
    .appendTo("#setupTable_wrapper .col-md-6:eq(0)");

$("#addSetup").validate({
    rules: {
        name: {
            required: true,
            maxlength: 255,
        },
        type: {
            required: true,
            maxlength: 50,
        },
    },
    submitHandler: (form) => {
        const id = $("#setup_id").val();
        const url = id > 0 ? "/setups/" + id : "/setups";
        const formData = $("#addSetup").serialize();

        $.ajax({
            url: url,
            method: "post",
            data: formData,
            dataType: "json",
            success: (response) => {
                console.log(response);
                if (response.code == 200) {
                    location.href = "/setups";
                    toastr.success(response.message);
                    $("#setup-modal").modal("hide");
                } else {
                    location.href = "/setups";
                    toastr.error(response.message);
                }
            },
            error: (xhr, status, error) => {
                if (status == 422) {
                    const errObject = xhr.responseJSON.errors;
                    let messages = "";

                    for (const key in errObject) {
                        messages += errObject[key].toString();
                    }
                    toastr.error(messages);
                } else {
                    console.log(xhr);
                    const message = xhr.responseJSON.message;
                    toastr.error(message);
                }
            },
        });
    },

    errorClass: "is-invalid font-weight-light",
});

const showSetup = (id) => {
    $("#setup_id").val(id);
    $("#name").val($("#name_" + id).html());
    $("#type").val($("#type_" + id).html());

    $("#setup-modal").modal("show");
};

const deleteSetup = (id) => {
    const post_data = {
        _token: $("input[name=_token]").val(),
        id: id,
    };

    $.post(`/delete-setup`, post_data, (response) => {
        if (typeof response.code !== "undefined") {
            if (response.code == 200) {
                toastr.success(response.message);
                window.location.reload();
            } else {
                toastr.error(response.message);
            }
        }
    });
};
