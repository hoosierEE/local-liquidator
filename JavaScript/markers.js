//Javascript code centers the map on the user's location, 
// and inserts 4 markers (hard coded array) into the map.
var x = 39.169153;  //-34.397;
var y = -86.51470; //150.644;
var locations= new Array();
var titles = new Array();
locations[0] = new google.maps.LatLng(39.169153,-86.51492);
titles[0] = "uni";
locations[1] = new google.maps.LatLng (39.169007,-86.5151);
titles[1]="street 1";
locations[2] = new google.maps.LatLng (39.169107,-86.514591);
titles[2]="street 2";
locations[3] = new google.maps.LatLng (39.168891,-86.514548);
titles[3]="building";

if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(showPosition);
}
else {
  // document.write("Geolocation is not supported by this browser.");
  // Maybe something a little more subtle than document.write()
  document.getElementById('map-canvas').innerHTML = "This app is much cooler with geolocation enabled.";
}
  
function showPosition(position) {	
  // calls our map making function with the user's coords
  initialize();
}

function initialize() {
  // set up our default map options
  var mapOptions = {
    center: new google.maps.LatLng(x,y),
    zoom: 18,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  
  // make an instance of the map with our options
  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

  // put our coordinates and descriptions into google map marker format
  for (i=0;i<locations.length;i++) {
    var marker = new google.maps.Marker({
      position:locations[i],
      map: map,
      title: titles[i]
    });
  }

  // "you are here" guy
  var image = "https://www.firstpct.org/images/user.png";
  
  // all the icons for our map
  var marker = new google.maps.Marker({
    position: map.getCenter(),
    map: map,
    title: "you",
    icon: image
  });

} 
