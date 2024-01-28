var buttonSignIn = document.getElementById("buttonSignIn");
var username = document.getElementById("username");

buttonSignIn.addEventListener("click", function () {
	if (username.value != "") {
		localStorage.setItem('username', username.value);
		localStorage.setItem('logged', "true");
		window.open("index.html","_self");
	}
});
