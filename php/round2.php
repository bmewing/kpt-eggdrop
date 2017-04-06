<?php
session_start();

include('dbc.php');

$err = "&nbsp;";
if($_SESSION["li"] == "good2go"){
	if(isset($_POST["uid"])){
		$uid = $_POST["uid"];
		$round = 2;
		$dweight = $_POST["dweight"];
		$eweight = $_POST["eweight"];
		$zone = $_POST["zones"];
		$cracked = $_POST["broken"];
		$npart = $_POST["npart"];

		$sql = "INSERT INTO eggdrop.drops (uid, round, dweight, eweight, zone, cracked, nparts) VALUES (".$uid.",".$round.",".$dweight.",".$eweight.",".$zone.",".$cracked.",".$npart.")";

		if ($conn->query($sql) === TRUE) {
			$err = "<p class='text-success'>Drop added!</p>";
		} else {
			echo "Error: " . $sql . "<br>" . $conn->error;
			$err = "<p class='text-danger'>Failed to add drop</p>";
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
						<li role="presentation"><a href="new.php">Add Competitor</a></li>
						<li role="presentation"><a href="round1.php">Round 1</a></li>
						<li role="presentation" class="active"><a href="#">Round 2</a></li>
						<li role="presentation"><a href="control.php">App Control</a></li>
						<li role="presentation"><a href="logout.php">Logout</a></li>
					</ul>
				</nav>
				<h3 class="text-muted">Data Entry</h3>
			</div>

			<div class="jumbotron">
				<h1>Add Round 2 Score</h1>
				<?php echo $err; ?>
				<form action="round2.php" method="post">
					<div class="form-group">
						<label for="uid">Contestant:</label>
						<select type="text" class="form-control" id="uid" name = "uid">
							<?php
								$sql = "SELECT z.* FROM (select a.*, b.`round` from `eggdrop`.`people` as a left join `eggdrop`.`drops` as b on a.`uid` = b.`uid`) as z WHERE year = ".date('Y')." and `round` = 1 order by case `tname` when '' then `fname` else `tname` end";
								$result = $conn->query($sql);
								if ($result->num_rows > 0) {
								    // output data of each row
								    while($row = $result->fetch_assoc()) {
								    	if($row['tname'] == ""){
								    		$name = $row['fname'].' '.$row['lname'];
								    	} else {
								    		$name = $row['tname'];
								    	}
								    	echo "<option value=".$row['uid'].">".$name."</option>";
								    }
								}
							?>
						</select>
					</div>
					<div class="form-group">
						<label for="broken">Broken Egg:</label>
						<select type="number" class="form-control" id="broken" name = "broken">	
							<option value=0>Broken</option>
							<option value=1 selected>Not Broken</option>
						</select>
					</div>
					<div class="form-group">
						<label for="dweight">Device Weight:</label>
						<input type="number" class="form-control" id="dweight" name = "dweight">
					</div>
					<div class="form-group">
						<label for="eweight">Egg Weight:</label>
						<input type="number" class="form-control" id="eweight" name = "eweight">
					</div>
					<div class="form-group">
						<label for="npart"># of Parts:</label>
						<input type="number" class="form-control" id="npart" name = "npart">
					</div>
					<div class="form-group">
						<label for="zones">Zone:</label>
						<input type="number" class="form-control" id="zones" name = "zones">
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