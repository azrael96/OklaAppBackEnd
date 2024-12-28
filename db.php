<?php
//$servername = "92.112.188.239";
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bd_appokla";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>