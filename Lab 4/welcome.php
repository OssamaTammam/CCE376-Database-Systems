<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Rubik&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="style.css" />
  <title>Welcome</title>
</head>

<body>
  <div class="container">
    <?php
    // Check if the "name" query parameter is set
    if (isset($_GET['name'])) {
      $name = htmlspecialchars($_GET['name']);
      echo "<h1>Welcome $name!</h1>";
    } else {
      echo "<h1>Welcome!</h1>";
    }
    ?>
    <p>You are now logged in.</p>
  </div>
</body>

</html>