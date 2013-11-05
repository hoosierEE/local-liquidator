var x=39.773845;//-34.397;
var y =-86.176210; //150.644;

var locations= new Array();
var titles = new Array();

locations[0] = new google.maps.LatLng(39.773845,-86.177074);
titles[0] = "uni";
locations[1] = new google.maps.LatLng (39.774018,-86.172332);
titles[1]="street 1";
locations[2] = new google.maps.LatLng (39.774001,-86.170691);
titles[2]="street 2";
locations[3] = new google.maps.LatLng (39.773226,-86.173941);
titles[3]="building";



if (navigator.geolocation)
    {
    navigator.geolocation.getCurrentPosition(showPosition);
    }
  else{document.write("Geolocation is not supported by this browser.");
}
  


      function initialize() {
        var mapOptions = {
          center: new google.maps.LatLng(x,y ),
          zoom: 16,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
       var map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);


 


for (i=0;i<locations.length;i++)
  {

var marker = new google.maps.Marker({
    position:locations[i],
    map: map,
    title: titles[i]
  });

 

  addInfoWindow(marker,i);
  

}


 var image = "https://www.firstpct.org/images/user.png";

var marker1 = new google.maps.Marker({
    position: map.getCenter(),
    map: map,
    title: "you",
    icon: image
  });

alert("here");
 } 


function addInfoWindow(marker,i) {


  var infowindow = new google.maps.InfoWindow({
      content: titles[i]
  });


  google.maps.event.addListener(marker, 'mouseover', function() {
    infowindow.open(marker.get('map'), marker);
  });

 google.maps.event.addListener(marker, 'mouseout', function() {
 infowindow.close();

  });
}


function showPosition(position)
  {	
//x= position.coords.latitude;
//        y=position.coords.longitude;


       initialize();
  }



   //   google.maps.event.addDomListener(window, 'load', initialize);
