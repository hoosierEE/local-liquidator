<?php
  session_start();
  include "getDist.php";
  $UserName = $_SESSION['user'];
  $lat      = $_REQUEST['lat'];
  $lon      = $_REQUEST['lon'];
?>
<head>
  <link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
  <link rel="stylesheet" type="text/css" href="css/default.css" />
  <link rel="stylesheet" type="text/css" href="css/getUserAdStyles.css" />
  <script src="/vendor/elm-runtime.js">/* put this in the <head> */</script>
  <script src="build/Header.js">/* put this in the <head> */</script>



  <!-- Edit Below -->
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script type="text/javascript" src="css/animate.min.css"></script>
  <link href='css/animate.min.css' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" type="text/css" href="css/style2.css" />
  <script src="../file/js/modernizr.js"></script>
</head>

<script type="text/javascript">
  /* put this script block after the <body> */
  var headerDiv = document.getElementById('elm-Header');
  var header = Elm.embed(Elm.Header, headerDiv);
</script>

<script>
  function nearselected(c) {
    
    if(c.checked==false) {
    	document.getElementById("nearexpirationDate").value="";
    	document.getElementById("nearadusername").value="";
    }
    else{
    	var expdate= "";
    	var user="";
    	var radioBoxsList=document.getElementsByName("nearadrowselection");
    
    	for (e = 0; e < radioBoxsList.length; e++) {
        if (radioBoxsList[e].id == c.id && radioBoxsList[e].className  == c.className  ) {
          expdate= radioBoxsList[e].id;
          user= radioBoxsList[e].className;
        }
        else {
          radioBoxsList[e].checked=false;
        }
      }
  		
      document.getElementById("nearexpirationDate").value=expdate;
      document.getElementById("nearadusername").value=user;
      document.getElementById("yourUserName").value=<?php echo "'".$UserName."'"; ?>;
      
  	}
  }
  function validateForm2() {
  	if(document.getElementById("nearexpirationDate").value !="" && document.getElementById("nearadusername").value !="")
      return true;
  	else {
      alert("you must select at least one ad");
      return false;
  	}
  }
  
  function selected(c) {
    if(c.checked==false) {
      document.getElementById("expirationDate").value="";
    }
    else {
      var expdate= "";
      var radioBoxsList=document.getElementsByName("rowselection");
    
      for (e = 0; e < radioBoxsList.length; e++) {
        if (radioBoxsList[e].id == c.id) {
          expdate= radioBoxsList[e].id;
        } 
        else {
          radioBoxsList[e].checked=false;
        }
      }
      document.getElementById("expirationDate").value=expdate;
    }
  }

  function validateForm1() {
  	if(document.getElementById("expirationDate").value !="")
      return true;
  	else {
      alert("you must select at least one ad");
      return false;
  	}
  }
</script>

<div id="elm-Header"></div>
<div class="main">
  <ul class="tabs">
    <li>
      <input type="radio" checked name="tabs" id="tab1"/>
      <label for="tab1">My ads</label>
      <div id="tab-content1" class="tab-content">
        <div class="animated  bounceIn">
						
<?php
  $myServer       = 'CSCI450.db.11871087.hostedresource.com';
  $myUser         = 'CSCI450';
  $myPass         = 'CSCi450IUPUI!';
  $connectionInfo = $myServer;


  if ($_SESSION['access'] != "yes") {
    echo "you aren't authorised";
  } 
  else {
    $conn = mysql_connect($myServer, $myUser, $myPass) or die("Couldn't connect to SQL Server on $myServer");
    
    if ($conn) {
      if ($debug)
        echo "Connection established.<br />";
    }
    else {
      if ($debug)
        echo "Connection could not be established.<br />";
      die(print_r(mysql_error(), true));
    }
  
    $db = mysql_select_db("CSCI450", $conn) or die("Could not select database");
    
    $db = mysql_select_db("CSCI450", $conn) or die("Could not select database");
  
  
  $UserName = $_SESSION['user'];
  
  if (!empty($_REQUEST['expirationDate'])) {
    $querystr = "DELETE FROM  Ad
        WHERE  UserName = '$UserName' and  ExpTime='" . $_REQUEST['expirationDate'] . "'";
    mysql_query($querystr);
  }
    
  $mysqlstr = "SELECT * FROM Ad WHERE UserName = '$UserName'";
  $result  = mysql_query($mysqlstr);
  $columns = 5;
  if (mysql_num_rows($result) == 0) {
      echo "you haven't an brought books, you can create new ads";
  }
  else {
    echo "<table border=1 id='hor-minimalist-a'>";
    echo "<tr><td></td><td>Expiration date</td><td>UserName</td><td>Book ISBN</td><td>Sell/Buy</td><td>state</td></tr>";
    $rownum = 0;
    while ($newrow = mysql_fetch_row($result)) {
      echo "<tr> <td> <input type='checkbox' calss='actAsRadio' name='rowselection' id='" . $newrow[0] . "' onchange='selected(this)'  /> </td>";
      for ($y = 0; $y < $columns; $y++) {
          echo "<td>" . $newrow[$y] . "</td>";
      }
      echo "</tr>";
      $rownum++;
    }
      echo "</table> <br>";
    ?>
    <form action="getUserAds.php" onsubmit="return validateForm1()" method="get">
    <input type="hidden" name="expirationDate" id="expirationDate"><br>
    <input type="submit" value="delete">
    </form>
    <?php
  }
?>
    </div>
    </div>
  </li>
  <li>
    <input type="radio" name="tabs" id="tab2"/>
    <label for="tab2">Ads near me</label>
    <div id="tab-content2" class="tab-content">
    <div class="animated  bounceIn">
<?php
  $mysqlstr = "SELECT * FROM Ad where UserName <>'$UserName'";
  $result   = mysql_query($mysqlstr);
  $columns  = 5;
  
  if (mysql_num_rows($result) == 0) {
      echo "No available new ads";
      
  }
  else {
    $htmlTable = array(
        "<table border=1 id='hor-minimalist-a'>",
        "<tr><td></td><td>Expiration date</td><td>UserName</td><td>Book ISBN</td><td>Sell/Buy</td><td>state</td></tr>");
    $rownum = 0;
    while ($newrow = mysql_fetch_row($result)) {
      $entery   = "";
      $distance = getDistance($lat, $lon, $newrow[7], $newrow[8]);
      if ($distance < 1000) {
        $entery = $entery . "<tr><td> <input type='checkbox' class='" . $newrow[1] . "' name='nearadrowselection' id='" . $newrow[0] . "' onchange='nearselected(this)'  /> </td>";
        for ($y = 0; $y < $columns; $y++) {
            $entery = $entery . "<td>" . $newrow[$y] . "</td>";
        }
        $entery = $entery . "</tr>";
        $rownum++;
        array_push($htmlTable, $entery);
      }
    }
    array_push($htmlTable, "</table> <br>");
    
    if (count($htmlTable) <= 3) {
      echo "There is no ads near you";
    }
    else {
      reset($htmlTable);
      while (list($key, $val) = each($htmlTable))
        echo "$val";
      ?>
      <form action="loadMap.html"onsubmit="return validateForm2()"  method="get"> 
      <input type="hidden" name="nearexpirationDate" id="nearexpirationDate">
      <input type="hidden" name="nearadusername" id="nearadusername">
      <input type="hidden" name="yourUserName" id="yourUserName">
      <input type="submit" value="view map">
      </form>
      <?php
    }
  }
}
?>
			  </div>
		  </div>
		</li>
	</ul>
</div>


