<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Rubik&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="style.css" />
  <title>Login</title>
</head>

<body>
  <div class="container">
    <form method="post" action="login.php" onsubmit="return validateForm()" name="signin-form">
      <div class="form-element">
        <label for="email">Email</label>
        <input type="email" name="email" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}" required id="email" />
      </div>
      <div class="form-element">
        <label for="password">Password</label>
        <input type="password" name="password" required id="password" />
      </div>
      <button type="submit" name="login" value="login">Log In</button>

    </form>
    <a href="registerForm.php">
      <button>Registration Form</button>
    </a>
  </div>
  <script>
    function validateForm() {
      var email = document.getElementById("email").value;
      var password = document.getElementById("password").value;

      if (email === "" || password === "") {
        alert("Email and Password cannot be empty!");
        return false;
      }

      return true;
    }
  </script>
</body>

</html>