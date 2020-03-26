//the following code was taken from https://stackoverflow.com/questions/31710127/javascript-image-upload-and-display
var fileTag = document.getElementById("upload-image"),
    preview = document.getElementById("preview");

fileTag.addEventListener("change", function () {
    changeImage(this);
});

function changeImage(input) {
    var reader;

    if (input.files && input.files[0]) {
        reader = new FileReader();

        reader.onload = function (e) {
            preview.setAttribute('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}