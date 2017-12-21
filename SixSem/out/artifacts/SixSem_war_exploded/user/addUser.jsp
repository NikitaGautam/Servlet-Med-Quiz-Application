<%--
  Created by IntelliJ IDEA.
  User: Nikita
  Date: 9/14/16
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <link rel="stylesheet" type="text/css" href="../css/navbar.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
</head>

<body>

<ul class="topnav" id="myTopnav">
    <li><a href="homePage?page=home">Home</a></li>
    <li><a href="userList?page=userList">User List</a></li>
    <li><a href="qa?page=qaList">Question Answers List</a></li>
    <li><a href="#">News</a></li>
    <li><a href="#">Contact</a></li>
    <li style="float: right"><a href="logout?page=logout">Logout</a></li>
</ul>
<br><br>
<h2 align="center">Add New User</h2><br>

<form method="post" action="update" id="userAddForm" style="margin-right: 13%; margin-left: 13%;">
    <input type="hidden" name="page" value="addUser">
<div class="form-group row">
    <label for="username" class="col-xs-2 col-form-label">Username</label>
    <div class="col-xs-10">
        <input class="form-control" type="text" value="" id="username" name="username" required>
    </div>
</div>
<div class="form-group row">
    <label for="password" class="col-xs-2 col-form-label">Password</label>
    <div class="col-xs-10">
        <input class="form-control" type="password" value="" id="password" name="password" required>
    </div>
</div>

<div class="form-group row">
    <label for="role" class="col-xs-2 col-form-label">Select Role</label>
    <div class="col-xs-10">
    <select class="form-control" id="role" name="role" required="required">
        <option selected="selected" value="">--Select Role--</option>
        <option value="ROLE_ADMIN">ROLE_ADMIN</option>
        <option value="ROLE_USER">ROLE_USER</option>
    </select>
    </div>
</div>

    <div>
        <button type="submit" class="btn btn-primary" > Add User</button>
    </div>
</form>
<div class="footer">
    <strong>User Add Page</strong>
</div>


</body>

</html>
