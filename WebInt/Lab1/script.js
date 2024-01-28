var video = document.getElementById("video1");
var canvas = document.getElementById('canvasPreview');
var canvasMirror = document.getElementById('canvasMirror');

//Don't know why, the following does not apply when put in css
canvas.style.display = "none";
video.style.transform = 'rotate(0deg)';
canvasMirror.style.display = "none";



//Changing video URL
var changeURL = document.getElementById("changeURL");

changeURL.addEventListener('submit', function (evt) {
	evt.preventDefault();
	
    var link = document.getElementById("changeURLinput").value;
	
	if (link != "") {
		video.src = link;
		video.load();
	};
	
	document.getElementById("jumpInput").max = video.duration;
}, false);


//Jumping in the video
var jump = document.getElementById("jump");

jump.addEventListener('submit', function (evt) {
	evt.preventDefault();
	
	var timecode = document.getElementById("jumpInput").value;
	
	if (timecode != "") {
		video.currentTime = timecode;
	}
}, false);

//Preview of the video	
var previewButton = document.getElementById('extractPreview');
var disableButton = document.getElementById('disablePreview');

disableButton.addEventListener('click', function () {
	canvas.style.display = 'none';
}, false);

previewButton.addEventListener('click', function () {
canvas.style.display = 'block';

var context = canvas.getContext('2d');
context.drawImage(video, 0, 0, canvas.width, canvas.height);
}, false);



//Rotate video
var rotateClockButton = document.getElementById('rotateClockwise');

rotateClockButton.addEventListener('click', function () {
	var angle = parseInt(video.style.transform.match(/[\d.]+/)); //extract the angle
	video.style.transform = 'rotate(' + ((angle - 90 + 360) % 360) + 'deg)';
}, false);

var rotateCounterClockButton = document.getElementById('rotateCounterClockwise');

rotateCounterClockButton.addEventListener('click', function () {
	var angle = parseInt(video.style.transform.match(/[\d.]+/)); //extract the angle
	video.style.transform = 'rotate(' + ((angle + 90 + 360) % 360) + 'deg)';
}, false);


//Display video controls or not
var displayControls = document.getElementById('displayControls');

displayControls.addEventListener('click', function () {
	video.controls = !video.controls;
}, false);



//Mirror in a canvas	
var mirrorButton = document.getElementById('mirror');
var disableButton = document.getElementById('disableMirror');

disableButton.addEventListener('click', function () {
	canvasMirror.style.display = 'none';
}, false);

mirrorButton.addEventListener('click', function () {
	canvasMirror.style.display = 'block';
},false);

video.addEventListener('play', function () {
	videoLoop();
}, false);

//Loop to mirror the video in a canvas
function videoLoop() {
    if (video && !video.paused && !video.ended) {
		var context = canvasMirror.getContext('2d');
		context.scale(-1,1);
		context.drawImage(video, -canvasMirror.width, 0, canvasMirror.width, canvasMirror.height);
		setTimeout(videoLoop, 1000 / 30);
    }
}



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
	commentDiv.innerHTML = `<p> You are not logged in, you cannot see the comments.</p>
	<form id="formComments">
		<div>
			<label>First name <input id="firstName" name="firstname" type="text" required/><label>
		</div>
		
		<div>
			<label>Last name <input id="lastName" name="last name" type="text" required/><label>
		</div>
		
		<div>
			<label>Mail <input id="mail" name="mail" type="email" required/><label>
		</div>

		<div>
			<label>Phone <input id="phone" name="phone" type="tel" min=0 required/><label>
		</div>

		<button type="submit">Submit</button>
	</form>`
	
	var logForm = document.getElementById('formComments');

	logForm.addEventListener('submit', function (evt) {
		evt.preventDefault();
		
		firstName = document.getElementById("firstName").value;
		lastName = document.getElementById("lastName").value;
		mail = document.getElementById("mail").value;
		phone = document.getElementById("phone").value;

		//Log
		localStorage.setItem('firstName', firstName);
		localStorage.setItem('lastName', lastName);
		localStorage.setItem('mail', mail);
		localStorage.setItem('phone', phone);
		localStorage.setItem('logged', "true");
		buildCommentsInterface();
	}, false);
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
	firstName = localStorage.getItem("firstName");
	lastName = localStorage.getItem("lastName");
	
	//Header of the comment zone
	commentDiv.innerHTML = `<div> You are now logged in as : ` + firstName + " " + lastName + `
						<button id="logOff" type="button">Log off</button>
					</div>
					
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
		
		firstName = localStorage.getItem("firstName");
		lastName = localStorage.getItem("lastName");
		
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
									
									addComment(firstName + " " + lastName + ", on " + date_str + " in " + adress + ` said :
			<details> <summary>See the location on a Google Map</summary> <div class='googleMap' id='map` + mapCount.toString(10) + `'> </div> </details>`,comment);
									
									buildGoogleMap(latitude, longitude, "map" + mapCount.toString(10));
									
									//Saving maps informations
									localStorage.setItem("map" + mapCount.toString(10) + "lat", latitude.toString(10));
									localStorage.setItem("map" + mapCount.toString(10) + "long", longitude.toString(10));
									
									mapCount += 1;
									localStorage.setItem('mapCount',  mapCount.toString(10));
								} else  {
									addComment(firstName + " " + lastName + ", on " + date_str + ` said :`,comment);
								}
							} else {
								addComment(firstName + " " + lastName + ", on " + date_str + ` said :`,comment);
							}
						}
					);
				});
			} else {
				addComment(firstName + " " + lastName + ", on " + date_str + ` said :`,comment);
			}
		}
	},false);
	
	//Logging off
	var logOffButton = document.getElementById('logOff');

	logOffButton.addEventListener('click', function (evt) {
		localStorage.setItem('logged', "false");
		buildLoggingInterface();
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



//Jukebox
var videoIndex = 0;
var jukebox = document.getElementById('jukebox');

jukebox.addEventListener('ended', function () {
	videoIndex += 1;
	
	if (videoIndex == 1) {
		jukebox.src = "https://archive.org/download/bugs-bunny-nips-the-nips-1944/Bugs%20Bunny%20Nips%20the%20Nips%20%281944%2C%29.mp4";
		document.getElementById('jukeboxTitle').innerHTML = 'Now playing "Bugs Bunny Nips the Nips"'
	}
	
	if (videoIndex == 2) {
		jukebox.src = "https://archive.org/download/winnie-the-pooh-happy-pooh-day-and-cowboy-pooh-d-221982-palvhs/WinnieThePoohHappyPoohDayAndCowboyPoohD221982PALVHS.mp4";
		document.getElementById('jukeboxTitle').innerHTML = 'Now playing "Winnie The Pooh - Happy Pooh Day And Cowboy Pooh (1998, UK VHS)"'
	}
	
	if (videoIndex == 3) {
		jukebox.src = "https://archive.org/download/turner_video_392787/392787.mp4";
		document.getElementById('jukeboxTitle').innerHTML = 'Now playing "The Little Prince"'
	}
	
	if (videoIndex == 4) {
		jukebox.src = "https://archive.org/download/BigBugBunny_AVCHD/bigBuckBunny_avchd_720p.mp4";
		document.getElementById('jukeboxTitle').innerHTML = 'Now playing "Big Buck Bunny"'
	}
	
	jukebox.load();
	
	if (videoIndex != 4) {
		jukebox.play();
	} else {
		videoIndex = 0;
	}
}, false);