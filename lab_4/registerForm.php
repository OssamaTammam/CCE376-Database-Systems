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
        <div id="email-error" class="error"></div>
      </div>
      <div class="form-element">
        <label for="password">Password</label>
        <input type="password" name="password" required id="password" />
      </div>
      <div class="form-element">
        <label for="confirmPassword">Confirm Password</label>
        <input type="password" name="confirmPassword" required id="confirmPassword" />
        <div id="password-error" class="error"></div>
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
      var confirmPassword = document.getElementById("confirmPassword").value;

      var emailError = document.getElementById("email-error");
      var passwordError = document.getElementById("password-error");

      // Reset error messages
      emailError.innerText = "";
      passwordError.innerText = "";

      if (name === "") {
        alert("Name cannot be empty.");
        return false;
      }

      if (email === "") {
        emailError.innerText = "Email cannot be empty.";
        return false;
      }

      if (password === "") {
        passwordError.innerText = "Password cannot be empty.";
        return false;
      }

      if (password !== confirmPassword) {
        passwordError.innerText = "Password and Confirm Password must match.";
        return false;
      }
      // Use an AJAX request to fetch email addresses from the server-side script
      function getEmails() {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "getEmails.php", true);

        xhr.onreadystatechange = function() {
          if (xhr.readyState === 4 && xhr.status === 200) {
            var emails = JSON.parse(xhr.responseText);
          }
        };

        xhr.send();
      }

      // Call the function to fetch email addresses

      // Simulate email uniqueness check
      function checkEmailUniqueness(email) {
        // Replace this with your actual check (e.g., AJAX call to a server)
        var existingEmails = getEmails();
        return !existingEmails.includes(email);
      }
      // Add email uniqueness check here
      // Replace the following line with your actual check
      var isEmailUnique = checkEmailUniqueness(email);

      if (!isEmailUnique) {
        emailError.innerText = "Email Already Exists.";
        return false;
      }

      return true;
    }
  </script>

</body>

</html>