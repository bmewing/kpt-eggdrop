<?php
session_start();

// remove all session variables
session_unset(); 

// destroy the session 
session_destroy(); 

header("Location: http://162.243.214.108/index.php");
die();
?>