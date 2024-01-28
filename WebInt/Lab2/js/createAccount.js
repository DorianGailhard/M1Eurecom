var form = document.getElementById("createAccount");

form.addEventListener("submit", function (evt) {
	evt.preventDefault();
	window.open("log-in.html","_self");
});
