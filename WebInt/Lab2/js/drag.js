var dropzone = document.getElementById("dropzone");
var dropimg = document.getElementById("dropimg");
var textdropped = document.getElementById("textdropped");

dropimg.addEventListener("dragover", function(evt) {
    evt.preventDefault();
    evt.dataTransfer.dropEffect = 'copy';
});

dropimg.addEventListener("drop", function(evt) {
	dropzone.classList.toggle('drop-zone');
	dropzone.classList.toggle('drop-zone-dropped');
	textdropped.style.display = "block";
	alert("File dropped");
	evt.preventDefault();
});

var send = document.getElementById("send");

send.addEventListener("click", function(evt) {
	window.open("index.html","_self");
});