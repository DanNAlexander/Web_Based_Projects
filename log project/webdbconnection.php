<?php
$servername = "YveldPi";
$username = "Yveld";
$password = "2545160Lawnspider2545160";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>
