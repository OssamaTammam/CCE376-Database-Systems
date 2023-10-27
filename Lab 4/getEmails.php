<?php
$dbServer = "localhost";
$dbUsername = "root";
$dbPassword = "";
$dbName = "registiration";

$db = new mysqli($dbServer, $dbUsername, $dbPassword, $dbName);

if ($db->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sqlQuery = "SELECT email FROM user"; // SELECT query to retrieve all email addresses

$result = $db->query($sqlQuery);

if ($result) {
    $emails = array();

    while ($row = $result->fetch_assoc()) {
        $emails[] = $row['email'];
    }

    echo json_encode($emails); // Return the email addresses as a JSON array
} else {
    echo "Error executing the SELECT query: " . $db->error;
}

$db->close();
