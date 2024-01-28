
var buttonchloe = document.getElementById("buttonchloe");
var comments = document.getElementById("commOff" || "");

buttonchloe.addEventListener("click", function() {

    if (comments.id == "commOff") {
        comments.id = "";
    } else {
        comments.id = "commOff";
    }
});

