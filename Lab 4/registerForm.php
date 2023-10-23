<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="css/style.css" />
  <title>Register</title>
</head>

<body>
  <form method="post" action="register.php" name="signup-form">
    <div class="form-element">
      <label for="name">Name</label>
      <input type="name" name="name" required />
    </div>
    <div class="form-element">
      <label for="email">Email</label>
      <input type="email" name="email" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}" required />
    </div>
    <div class="form-element">
      <label for="password">Password</label>
      <input type="password" name="password" required />
    </div>
    <button type="submit" name="register" value="register">Register</button>
  </form>
</body>

</html>