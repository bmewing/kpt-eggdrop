<?php
session_start();

$options = [
    'cost' => 12,
];

$err = "&nbsp;";

if(isset($_POST['pwd'])) 
{ 
	include("dbc.php");
	$sql = "SELECT * FROM eggdrop.logins";
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
	    // output data of each row
	    while($row = $result->fetch_assoc()) {
	        if(password_verify($_POST["pwd"], $row["pwd"])){
	        	$_SESSION["li"] = "good2go";
						header("Location: http://162.243.214.108/new.php");
						die();
	        } else {
	        	$err = "Failed to login";
	        }
	    }
	}
}
?>
<html lang="en">
	<head>
		<title>Kingsport Egg Drop Data Portal</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<link rel="stylesheet" href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css">
	</head>
	<body>
<?php
if($_SESSION["li"] == "good2go"){
	header("Location: http://162.243.214.108/new.php");
	die();
} else {
?>
<div class="container">
  <div class="header clearfix">
    <nav>
      <ul class="nav nav-pills pull-right">
        <li role="presentation"><a href="#">Add Competitor</a></li>
        <li role="presentation"><a href="#">Round 1</a></li>
        <li role="presentation"><a href="#">Round 2</a></li>
        <li role="presentation"><a href="#">App Control</a></li>
        <li role="presentation" class="active"><a href="#">Login</a></li>
      </ul>
    </nav>
    <h3 class="text-muted">Data Entry</h3>
  </div>

  <div class="jumbotron">
    <h1>Please Login</h1>
    <?php echo "<p class='text-warning'>".$err."</p>";?><br/>
    <form action="index.php" method="post">
      <div class="form-group">
      <label for="username">User Name:</label>
        <input type="text" class="form-control" id="username" name="username">
      </div>
      <div class="form-group">
        <label for="pwd">Password:</label>
        <input type="password" class="form-control" id="pwd" name="pwd">
      </div>
      <button type="submit" name = "submit" class="btn btn-default">Submit</button>
    </form>
  </div>
</div>
<?php
}
?>		
	</body>
</html>