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


var buttonchloe = document.getElementById("buttonchloe");
var comments = document.getElementById("comm");

buttonchloe.addEventListener("click", function() {
	comments.style.display = "block";
});



//Logging for registration
var commentDiv = document.getElementById("commentDiv");

function buildInterface() {
	if (localStorage.getItem("logged") != "true") {
		buildLoggingInterface();
	} else {
		buildCommentsInterface();
	}
}

//When not logged in
function buildLoggingInterface() {
	commentDiv.innerHTML = "You are not logged in, you cannot send a comment. <a href='log-in.html'>Click here to log in</a>";
};

function buildCommentsInterface() {
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
	
	function addComment(header, comment) {
		document.getElementById('commentsZoneDiv').innerHTML += `
			<br/>
			<hr>
			<div class='comment'>
				<p class='commentHeader'> ` + header + `</p>
				<p class='commentContent'>` + comment + "</p></div>";
		
		//Saving comments on local storage
		commentsCount += 1;
		localStorage.setItem('commentsCount', commentsCount.toString(10));
		localStorage.setItem('comments', document.getElementById('commentsZoneDiv').innerHTML);
		document.getElementById('textBox').value = "";
	};

	//Actually building the comments
	username = localStorage.getItem("username");
	
	//Header of the comment zone
	commentDiv.innerHTML = `
					<div id="commentsZoneDiv">
					</div>
					
					<hr>
					<div>
						<form id="commentForm">
							Your comment :<br>
							<textarea id="textBox" rows="5" cols="33"></textarea>
							<br>
							<button type="submit">Submit</button>
						</form>
					</div>
	`
	
	//Action performed when submitting a comment
	var commentForm = document.getElementById('commentForm');
	var commentsCount = localStorage.getItem('commentsCount');
	
	if (commentsCount == null) {
		commentsCount = 0;
	} else {
		commentsCount = parseInt(commentsCount);
	}
	
	var mapCount = localStorage.getItem('mapCount');
	
	if (mapCount == null) {
		mapCount = 0;
	} else {
		mapCount = parseInt(mapCount);
	}

	commentForm.addEventListener('submit', function (evt) {
		evt.preventDefault();
		
		username = localStorage.getItem("username");
		
		var date = new Date();
		date_str = new Intl.DateTimeFormat('en-GB', { dateStyle: 'full', timeStyle: 'long' }).format(date);
		
		comment = document.getElementById('textBox').value;
		
		if (comment != "") {
			if (commentsCount == 0) {
				document.getElementById('commentsZoneDiv').innerHTML = "";
			}
			
			//Checking geolocation is available
			if ("geolocation" in navigator) {
				navigator.geolocation.getCurrentPosition(function (position) {
					const latitude  = position.coords.latitude;
					const longitude = position.coords.longitude;
					
					//Getting city name and country
					var adress = "";
					
					var geocoder;
					geocoder = new google.maps.Geocoder();
					var latlng = new google.maps.LatLng(latitude, longitude);

					geocoder.geocode(
						{'latLng': latlng},
						function(results, status) {
							if (status == google.maps.GeocoderStatus.OK) {
								if (results[0]) {
									var add = results[0].formatted_address;
									var value=add.split(",");

									count=value.length;
									adress = value[count-3] + ", " + value[count-2] + ", " + value[count-1];
									
									addComment(username + ", on " + date_str + " in " + adress + ` said :
			<details> <summary>See the location on a Google Map</summary> <div class='googleMap' id='map` + mapCount.toString(10) + `'> </div> </details>`,comment);
									
									buildGoogleMap(latitude, longitude, "map" + mapCount.toString(10));
									
									//Saving maps informations
									localStorage.setItem("map" + mapCount.toString(10) + "lat", latitude.toString(10));
									localStorage.setItem("map" + mapCount.toString(10) + "long", longitude.toString(10));
									
									mapCount += 1;
									localStorage.setItem('mapCount',  mapCount.toString(10));
								} else  {
									addComment(username + ", on " + date_str + ` said :`,comment);
								}
							} else {
								addComment(username + ", on " + date_str + ` said :`,comment);
							}
						}
					);
				});
			} else {
				addComment(username + ", on " + date_str + ` said :`,comment);
			}
		}
	},false);
	
	
	//Load comments
	if (commentsCount == 0) {
		document.getElementById('commentsZoneDiv').innerHTML = "<br> There are currently no comments.";
	} else {
		document.getElementById('commentsZoneDiv').innerHTML = localStorage.getItem('comments');
		
		for (i=0;i < mapCount;i++) {
			buildGoogleMap(parseInt(localStorage.getItem("map" + mapCount.toString(10) + "lat")),parseInt(localStorage.getItem("map" + mapCount.toString(10) + "long")),"map" + i.toString(10));
		}
	};
};
