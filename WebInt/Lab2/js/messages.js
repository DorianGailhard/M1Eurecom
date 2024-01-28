var username = document.getElementById("username");
username.innerHTML = localStorage.getItem('username');


var messageBox = document.getElementById("messages-sent");
var messages = localStorage.getItem('messages');
	
if (messages == null) {
	messageBox.innerHTML = '<div class="left"><p class="text-box r"> Hi ! Could you find a room to repeat ?</p></div>';
} else {
	messageBox.innerHTML = messages;
}

var buttonSend = document.getElementById("sendButton");
var textBar = document.getElementById("inp");

buttonSend.addEventListener("click", function () {
	var message = textBar.value;
	
	if (message != "") {
		messageBox.innerHTML += '<div class="right"><p class="text-box l"> ' + message + '</p></div>';
		localStorage.setItem('messages', messageBox.innerHTML);
		textBar.value = "";
	}
});


function buildGeo() {
	//Auxiliary function to build a map
	function buildGoogleMap(latitude,longitude,name) {
		// The location of the city
		const city = { lat: latitude, lng: longitude };
		// The map, centered at the city
		const map = new google.maps.Map(document.getElementById(name), {
			zoom: 4,
			center: city,
		});
		// The marker, positioned at the city
		const marker = new google.maps.Marker({
			position: city,
			map: map,
		});
	};
	
	buildGoogleMap(48.856614, 2.3522219, "map");
};