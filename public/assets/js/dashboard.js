"use strict";
// import { countWords } from "./functions";

$(function () {
    $.get("/attendance-data", (response) => {
        if (typeof response.code !== "undefined") {
            if (response.code == 200) {
                var donutChartCanvas = $("#donutChart").get(0).getContext("2d");

                const data = response.data.attendance;
                const comments_data = response.data.comments;

                if (data.length > 0) {
                    let label = [],
                        value = [];

                    data.forEach((element) => {
                        label.push(element.meeting_date);
                        value.push(element.attendance);
                    });

                    const line_data = {
                        labels: label,
                        datasets: [
                            {
                                data: value,
                                backgroundColor: "transparent",
                                borderColor: "#007bff",
                                pointBorderColor: "#007bff",
                                pointBackgroundColor: "#007bff",
                                fill: false,
                            },
                        ],
                    };

                    const line_options = {
                        maintainAspectRatio: false,
                        responsive: true,
                    };

                    new Chart(donutChartCanvas, {
                        type: "line",
                        data: line_data,
                        options: line_options,
                    });
                }

                if (comments_data.length > 0) {
                    // Data for coments by respondents
                    const words =
                        comments_data != null ? countWords(comments_data) : "";

                    console.log(words);

                    // Canvas for comments
                    const comment_div = document.getElementById("comment-div");
                    const comments = document.getElementById("classComments");

                    comments.height = comment_div.offsetHeight;
                    comments.width = comment_div.offsetWidth;

                    // loadingDialog.Remove();

                    WordCloud(comments, {
                        list: words,
                        clearCanvas: true,
                        drawOutOfBound: false,
                        shrinkToFit: true,
                        gridSize: Math.round((2 * comments.offsetWidth) / 1024),
                        // weightFactor: (size) => {
                        //     return (
                        //         (Math.pow(size, 2) * comments.offsetWidth) /
                        //         1024
                        //     );
                        // },
                        weightFactor: 4,
                    });
                }
            }
        }
    });
});
