"use strict";

const countWords = (words) => {
    let wordsObject = {};
    words.split(" ").forEach((element) => {
        element = element.trim().toLowerCase();
        wordsObject[element] = wordsObject[element]
            ? ++wordsObject[element]
            : 1;
    });
    return Object.entries(wordsObject);
};

const fillForm = (formID, jsonObject) => {
    $(`#${formID} input, #${formID} select, #${formID} textarea`).each(
        (index, element) => {
            var input = $(element);
            let value = jsonObject[input.attr("name")];
            if (input.attr("name") === "_token") {
                $(`[name='${input.attr("name")}']`).val();
            } else {
                $(`[name='${input.attr("name")}']`).val(value);
            }
        }
    );
};

// module.exports = { countWords, fillForm };
