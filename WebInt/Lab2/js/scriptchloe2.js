
// for sidebar

var checkbox = document.getElementById("buton");
var javaSidebar = document.getElementById("sidebar" || "sidebarOn");

checkbox.addEventListener("click", function() {

    if (javaSidebar.id == "sidebar") {
        javaSidebar.id = "sidebarOn";
    } else {
        javaSidebar.id = "sidebar";
    }
});

