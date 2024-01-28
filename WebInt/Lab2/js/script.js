var logoutButton = document.getElementById("logout");

if (localStorage.getItem('logged') == "true") {
	logoutButton.innerHTML = "Log out";
	
	logoutButton.addEventListener("click", function() {
		localStorage.setItem('logged', "false");
		window.open("index.html","_self");
	});
} else {
	logoutButton.innerHTML = "Log in";
	
	logoutButton.addEventListener("click", function() {
		window.open("log-in.html","_self");
	});
}