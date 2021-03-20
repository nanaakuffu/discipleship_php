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

$("#membersTable")
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
    .appendTo("#membersTable_wrapper .col-md-6:eq(0)");

$("#addMember").validate({
    rules: {
        first_name: "required",
        middle_name: {
            required: false,
        },
        last_name: "required",
        contact_number: {
            required: true,
            maxlength: 10,
            minlength: 10,
            digits: true,
        },
        email: {
            required: false,
            email: true,
        },
        class_id: {
            required: true,
        },
        member_type: {
            required: true,
        },
    },
    submitHandler: (form) => {
        const id = $("#member_id").val();
        const url = id > 0 ? "/members/" + id : "/members";
        const formData = $("#addMember").serialize();

        $.ajax({
            url: url,
            method: "post",
            data: formData,
            dataType: "json",
            success: (response) => {
                console.log(response);
                if (response.code == 200) {
                    location.href = "/members";
                    toastr.success(response.message);
                    $("#member-modal").modal("hide");
                } else {
                    location.href = "/members";
                    toastr.error(response.message);
                }
            },
        });
    },

    errorClass: "is-invalid font-weight-light",
});

const showMember = (id) => {
    $.get("/members/" + id, (response) => {
        console.log(response);
        if (typeof response.code !== "undefined") {
            if (response.code == 200) {
                $("#member_id").val(response.data.id);
                $("#first_name").val(response.data.first_name);
                $("#middle_name").val(response.data.middle_name);
                $("#last_name").val(response.data.last_name);
                $("#contact_number").val(response.data.contact_number);
                $("#email").val(response.data.email);
                $("#class_id").val(response.data.class_id);
                $("#member_type").val(response.data.member_type);

                $("#member-modal").modal("show");
            } else {
                toastr.error(response.message);
            }
        } else {
            toastr.error("Sorry! An error occured while fetching data.");
        }
    });
};

const deleteMember = (id) => {};
