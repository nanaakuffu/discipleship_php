"use strict";

$(function () {
    //Date range picker
    $("#meeting_date").datetimepicker({
        format: "LL",
    });

    $("#search_meeting_date").datetimepicker({
        format: "LL",
    });

    $("#comments").summernote({
        placeholder: "General comments",
        height: 300,
    });

    // $("#attendanceTable").DataTable({
    //     language: {
    //         paginate: {
    //             previous: "<i class='fas fa-chevron-left'></i>",
    //             next: "<i class='fas fa-chevron-right'></i>",
    //         },
    //     },
    //     responsive: true,
    //     lengthChange: false,
    //     paging: true,
    //     searching: true,
    //     ordering: true,
    //     info: true,
    //     autoWidth: false,
    //     responsive: true,
    // });
});

$("#class_id").on("change", (e) => {
    const id = $("#class_id").val();
    const meeting_date = $(".meeting_date").val();

    $.get(`/bible-class/${id}`, (response) => {
        if (typeof response.code !== "undefined") {
            if (response.code == 200) {
                $("#leader_name").html(response.data.leaderName);
                $("#assistant_name").html(response.data.assistantName);
                // $("#attendanceTable tbody").empty();
                // let index = 0;
                const ajax_data = response.data.class_members;
                const dTable = $("#attendanceTable").DataTable({
                    destroy: true,
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
                    data: ajax_data,
                    columnDefs: [
                        {
                            searchable: false,
                            orderable: false,
                            targets: 0,
                            render: (data, type, row, meta) => {
                                return meta.row + 1;
                            },
                        },
                        {
                            data: "fullName",
                            targets: 1,
                        },
                        {
                            data: "id",
                            render: (data) => {
                                console.log(data);
                                return `<input class='icheckbox_flat-blue' name=members[] type='checkbox'
                                        value='${data}' id='member_${data}'
                                    />`;
                            },
                            targets: 2,
                        },
                    ],
                    order: [[1, "asc"]],
                });

                dTable
                    .on("order.dt search.dt", function () {
                        dTable
                            .column(0, { search: "applied", order: "applied" })
                            .nodes()
                            .each(function (cell, i) {
                                cell.innerHTML = i + 1;
                            });
                    })
                    .draw();
            } else {
                toastr.error(respone.message);
            }
        } else {
            toastr.error("Sorry! An error occures while fetching data.");
        }
    });

    // Make sure the data is not sent double.
    $.get(`/get-attendance/${id}/${meeting_date}`, (response) => {
        console.log(response);
        if (response == 1) {
            $("#sendAttendanceData").attr("disabled", true);
            toastr.error(
                "Attendance, for this class and date, has been recorded already."
            );
        } else {
            $("#sendAttendanceData").attr("disabled", false);
        }
    });
});

$("#addAttendance").validate({
    rules: {
        class_id: {
            number: true,
            min: 1,
        },
        material_id: {
            number: true,
            min: 1,
        },
        comments: {
            required: true,
            minlength: 10,
        },
    },

    messages: {
        class_id: {
            min: "Please make a selection.",
        },
        material_id: {
            min: "Please make a selection.",
        },
        comments: {
            required: "Please comment on the meeting.",
        },
    },

    submitHandler: (form) => {
        const id = $("#meeting_id").val();
        const url = id > 0 ? "/attendance/" + id : "/attendance";
        $.ajax({
            url: url,
            type: "post",
            data: $("#addAttendance").serialize(),
            dataType: "json",
            success: (response) => {
                console.log(response);

                if (response.code == 200) {
                    toastr.success(response.message);
                    resetControls();
                } else {
                    toastr.error(response.message);
                }
            },
        });
    },

    errorClass: "is-invalid font-weight-light",
    errorElement: "span",
});

const resetControls = () => {
    $("#class_id").val(0);
    $("#material_id").val(0);
    // $("#comments").val("");
    $("#comments").summernote("code", "");
    $(".meeting_date").val("");
    $("#leader_name").html("");
    $("#assistant_name").html("");
    $("#attendanceTable tbody").html(
        "<tr><td valign='top' colspan='3' class='dataTables_empty'>No data available in table</td></tr>"
    );
};

$(".meeting_date").on("blur", (e) => {
    const class_id = $("#class_id").val();
    const meeting_date = $(".meeting_date").val();
    $.get(`/get-attendance/${class_id}/${meeting_date}`, (response) => {
        console.log(response);
        if (response == 1) {
            $("#sendAttendanceData").attr("disabled", true);
            toastr.error(
                "Attendance, for this class and date, has been recorded already."
            );
        } else {
            $("#sendAttendanceData").attr("disabled", false);
        }
    });
});

$("#searchAttendance").on("click", (e) => {
    const class_id = $("#search_class_id").val();
    const meeting_date = $(".search_meeting_date").val();

    if (class_id == 0 || meeting_date == "") {
        toastr.error("Please select a date and a class to search.");
    } else {
        $.get(`/attendance/${class_id}/${meeting_date}`, (response) => {
            if (typeof response.code !== "undefined") {
                if (response.code == 200) {
                    const response_data = response.data;
                    $("#meeting_id").val(response_data.id);
                    $("#leader_name").html(
                        response_data.class_details.leaderName
                    );
                    $("#assistant_name").html(
                        response_data.class_details.assistantName
                    );
                    $("#material_id").val(response_data.material_id);
                    $("#class_id").val(response_data.class_id);
                    $(".meeting_date").val(meeting_date);
                    // $("#comments").val(response_data.comments);
                    $("#comments").summernote("code", response_data.comments);

                    const ajax_data = response_data.class_members;
                    const dTable = $("#attendanceTable").DataTable({
                        destroy: true,
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
                        data: ajax_data,
                        columnDefs: [
                            {
                                searchable: false,
                                orderable: false,
                                targets: 0,
                                render: (data, type, row, meta) => {
                                    return meta.row + 1;
                                },
                            },
                            {
                                data: "fullName",
                                targets: 1,
                            },
                            {
                                data: { id: "id", present: "present" },
                                render: (data) => {
                                    const checked =
                                        data.present == 1 ? "checked" : "";
                                    return `<input class='icheckbox_flat-blue' name=members[] type='checkbox'
                                        value='${data.id}' id='member_${data.id}' ${checked}
                                    />`;
                                },
                                targets: 2,
                            },
                        ],
                        order: [[1, "asc"]],
                    });

                    dTable
                        .on("order.dt search.dt", function () {
                            dTable
                                .column(0, {
                                    search: "applied",
                                    order: "applied",
                                })
                                .nodes()
                                .each(function (cell, i) {
                                    cell.innerHTML = i + 1;
                                });
                        })
                        .draw();
                } else if (response.code == 404) {
                    resetControls();
                    toastr.error(response.message);
                } else {
                    resetControls();
                    toastr.error("Sorry! An error occured.");
                }
            } else {
                toastr.error("Sorry! An error occured while fetching data.");
            }
        });
    }
});
