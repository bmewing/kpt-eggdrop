<?php
session_start();

$err = "&nbsp;";
if($_SESSION["li"] == "good2go"){
	if(isset($_POST["fname"])){
		include('dbc.php');
		$fname = $conn->real_escape_string($_POST["fname"]);
		$lname = $conn->real_escape_string($_POST["lname"]);
		$tname = $conn->real_escape_string($_POST["tname"]);
		$year = date("Y");
		echo $fname;
		if($_POST["cat"] >= 0 and $_POST["cat"] <= 4){
			$cat = $_POST["cat"];
		} else {
			die("Evil category input");
		}

		$sql = "INSERT INTO eggdrop.people (fname, lname, tname, year, cat) VALUES ('".$fname."','".$lname."','".$tname."',".$year.",".$cat.")";

		if ($conn->query($sql) === TRUE) {
			$err = "<p class='text-success'>Record added!</p>";
		} else {
			echo "Error: " . $sql . "<br>" . $conn->error;
			$err = "<p class='text-danger'>Failed to add record</p>";
		}
	}
} else {
	header("Location: http://162.243.214.108/index.php");
	die();
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
		?>
		<div class="container">
			<div class="header clearfix">
				<nav>
					<ul class="nav nav-pills pull-right">
						<li role="presentation" class="active"><a href="new.php">Add Competitor</a></li>
						<li role="presentation"><a href="round1.php">Round 1</a></li>
						<li role="presentation"><a href="round2.php">Round 2</a></li>
						<li role="presentation"><a href="control.php">App Control</a></li>
						<li role="presentation"><a href="logout.php">Logout</a></li>
					</ul>
				</nav>
				<h3 class="text-muted">Data Entry</h3>
			</div>

			<div class="jumbotron">
				<h1>Add new record</h1>
				<?php echo $err; ?>
				<form action="new.php" method="post">
					<div class="form-group">
						<label for="fname">First Name:</label>
						<input type="text" class="form-control" id="fname" name = "fname">
					</div>
					<div class="form-group">
						<label for="lname">Last Name:</label>
						<input type="text" class="form-control" id="lname" name = "lname">
					</div>
					<div class="form-group">
						<label for="tname">Team Name:</label>
						<input type="text" class="form-control" id="tname" name = "tname">
					</div>
					<div class="form-group">
						<label for="cat">Category:</label>
						<select name="cat" id="cat">
							<option value=0>Team</option>
							<option value=1 selected>Elementary</option>
							<option value=2>Middle</option>
							<option value=3>High</option>
							<option value=4>Adult</option>
						</select>
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
		</div>
		<?php
	} else {
		header("Location: http://162.243.214.108/");
		die();
	}
	?>		
</body>
</html>