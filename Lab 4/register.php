<?php
$dbServer = "localhost";
$dbUsername = "root";
$dbPassword = "";
$dbName = "registiration";

$userName = $_POST['name'];
$userEmail = $_POST['email'];
$userPassword = md5($_POST['password']);

$db = new mysqli($dbServer, $dbUsername, $dbPassword, $dbName);

if ($db->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sqlQuery = "INSERT INTO user (email, name, password) VALUES (?, ?, ?)";

$stmt = $db->prepare($sqlQuery);

if ($stmt) {
    $stmt->bind_param("sss", $userEmail, $userName, $userPassword);
    $result = $stmt->execute();

    $stmt->close();
} else {
    echo "Error preparing the statement: " . $conn->error;
}

if ($result) {
    $db->close();
    header("Location: welcome.php?name=" . urlencode($userName));
    exit();
} else {
    //TODO: error
    echo "Error inserting record: " . $stmt->error;
}
