//This file should contain a javascript function which returns the browser's geolocation coordinates.
//If it encounters an error it should return an error string or error code of some sort.

/*
* @author Alex: 
* commented out HTML markup to leave only JavaScript
*
*/

/*
get latitude and longitude using JS

<!DOCTYPE html>

<html>
<body>


<script>
*/
  if (navigator.geolocation)
    {
    navigator.geolocation.getCurrentPosition(showPosition);
    }
  else{document.write("Geolocation is not supported by this browser.");
}
  

function showPosition(position)
  {
  document.write("Latitude: " + position.coords.latitude + 
  "<br>Longitude: " + position.coords.longitude);	
  }


/*
</script>


</body>
</html>
*/
