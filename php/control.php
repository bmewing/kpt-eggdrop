<?php
session_start();

include('dbc.php');

$err = "&nbsp;";
if($_SESSION["li"] == "good2go"){
	if(isset($_POST["stage"])){
		$stage = $_POST["stage"];

		$sql = "UPDATE `eggdrop`.`stage` SET `stage`=".$stage." WHERE `id`=1";

		if ($conn->query($sql) === TRUE) {
			$err = "<p class='text-success'>Stage Updated!</p>";
		} else {
			echo "Error: " . $sql . "<br>" . $conn->error;
			$err = "<p class='text-danger'>Failed to Update Stage</p>";
		}
	}

	$sql = "SELECT `stage` from `eggdrop`.`stage` where `id`=1";
	$result = $conn->query($sql);
	$currstage0 = 'Pre-Event';
	if ($result->num_rows > 0) {
	  $row = $result->fetch_assoc();
	  $cs = $row['stage'];
	  if($cs == 0){
	  	$currstage0 = 'Pre-Event';
	  } elseif ($cs == 1) {
	  	$currstage0 = 'Active Round 1';
	  } elseif ($cs == 2) {
	  	$currstage0 = 'Post Round 1';
	  } elseif ($cs == 3) {
	  	$currstage0 = 'Active Round 2';
	  } elseif ($cs == 4) {
	  	$currstage0 = 'Winners';
	  }
  }
  $currstage = "<p class='text-info'>Current Stage: ".$currstage0."</p>";
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
						<li role="presentation"><a href="new.php">Add Competitor</a></li>
						<li role="presentation"><a href="round1.php">Round 1</a></li>
						<li role="presentation"><a href="round2.php">Round 2</a></li>
						<li role="presentation" class="active"><a href="#">App Control</a></li>
						<li role="presentation"><a href="logout.php">Logout</a></li>
					</ul>
				</nav>
				<h3 class="text-muted">Data Entry</h3>
			</div>

			<div class="jumbotron">
				<h1>App Stage Control</h1>
				<?php echo $currstage; ?>
				<?php echo $err; ?>
				<form action="control.php" method="post">
					<input type="hidden" value=0 name="stage">
					<button type="submit" class="btn btn-default">Pre-Event</button>
				</form>
				<form action="control.php" method="post">
					<input type="hidden" value=1 name="stage">
					<button type="submit" class="btn btn-default">Active Round 1</button>
				</form>
				<form action="control.php" method="post">
					<input type="hidden" value=2 name="stage">
					<button type="submit" class="btn btn-default">Post Round 1</button>
				</form>
				<form action="control.php" method="post">
					<input type="hidden" value=3 name="stage">
					<button type="submit" class="btn btn-default">Active Round 2</button>
				</form>
				<form action="control.php" method="post">
					<input type="hidden" value=4 name="stage">
					<button type="submit" class="btn btn-default">Winners</button>
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