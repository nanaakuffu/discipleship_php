"use strict";

const fillForm = (formID, jsonObject) => {
    $("#" + formID + " input, #" + formID + " select").each((index) => {
        var input = $(this);
        for (let key in jsonObject) {
            if (key == input.attr("name")) {
                $("[name='" + key + "']").val(jsonObject[key]);
            }
        }
    });
};

$("#bibleClassTable")
    .DataTable({
        language: {
            paginate: {
                previous: "<i class='fas fa-chevron-left'></i>",
                next: "<i class='fas fa-chevron-right'></i>",
            },
        },
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
    .appendTo("#bibleClassTable_wrapper .col-md-6:eq(0)");

$("#addClass").validate({
    rules: {
        name: "required",
    },
    submitHandler: (form) => {
        const id = $("#class_id").val();
        const url = id > 0 ? "/bible-class/" + id : "/bible-class";
        const formData = $("#addClass").serialize();

        $.ajax({
            url: url,
            method: "post",
            data: formData,
            dataType: "json",
            success: (response) => {
                console.log(response);
                if (response.code == 200) {
                    location.href = "/bible-class";
                    toastr.success(response.message);
                    $("#class-modal").modal("hide");
                } else {
                    location.href = "/bible-class";
                    toastr.error(response.message);
                }
            },
            error: (xhr, status, error) => {
                if (status == 422) {
                    const errObject = error.responseJSON.errors;
                    let messages = "";

                    for (const key in errObject) {
                        messages += errObject[key].toString();
                    }
                    toastr.error(message);
                } else {
                    const message = error.responseJSON.message;
                    toastr.error(message);
                }
            },
        });
    },

    errorClass: "is-invalid font-weight-light",
});

const showClass = (id) => {
    $.get("/bible-class/" + id, (response) => {
        console.log(response);
        if (typeof response.code !== "undefined") {
            if (response.code == 200) {
                $("#class_id").val(id);
                $("#name").val(response.data.name);
                $("#leader").val(response.data.leader);
                $("#assistant").val(response.data.assistant);

                $("#class-modal").modal("show");
            } else {
                toastr.error(response.message);
            }
        } else {
            toastr.error("Sorry! An error occured while fetching data.");
        }
    });
};

const deleteClass = (id) => {};
