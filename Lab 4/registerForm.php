<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Rubik&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="style.css" />
  <title>Register</title>
</head>

<body>
  <div class="container">
    <form method="post" action="register.php" onsubmit="return validateForm()" name="signup-form">
      <div class="form-element">
        <label for="name">Name</label>
        <input type="name" name="name" required id="name" />
      </div>
      <div class="form-element">
        <label for="email">Email</label>
        <input type="email" name="email" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}" required id="email" />
      </div>
      <div class="form-element">
        <label for="password">Password</label>
        <input type="password" name="password" required id="password" />
      </div>
      <button type="submit" name="register" value="register">Register</button>
    </form>
    <a href="loginForm.php">
      <button>Login Form</button>
    </a>
  </div>
  <script>
    function validateForm() {
      var name = document.getElementById("name").value;
      var email = document.getElementById("email").value;
      var password = document.getElementById("password").value;

      if (name === "" || email === "" || password === "") {
        alert("Please fill in all required fields.");
        return false; // Prevent the form from submitting
      }

      return true; // Allow the form to submit if all required fields are filled
    }
  </script>

</body>

</html>