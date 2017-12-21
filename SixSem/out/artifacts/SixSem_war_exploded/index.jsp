<%--
  Created by IntelliJ IDEA.
  User: Nikita
  Date: 8/11/16
  Time: 1:52 PM
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html>
<head>
  <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
  <meta charset="UTF-8">

  <title>Login Page</title>
  <link rel="stylesheet" type="text/css" href="../css/firstPage.css">
</head>

<body>

<div><h2 style="color: white; " align="center">WELCOME</h2></div>
<div class="login-block">
  <h1>Login</h1>
  <form method="post" action="login">
    <input type="hidden"  name="page" value="login">
    <input type="text" value="" placeholder="Username" id="username" name="username" required>
    <input type="password" value="" placeholder="Password" id="password" name="password" required>
    <button>Submit</button>
  </form>

</div>
</body>

</html>