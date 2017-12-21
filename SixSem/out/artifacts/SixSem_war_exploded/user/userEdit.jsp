<%--
  Created by IntelliJ IDEA.
  User: Nikita
  Date: 9/14/16
  Time: 8:11 AM
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
<h2 align="center">Update User</h2><br>
<form method="post" action="update" style="margin-right: 16%; margin-left: 16%;">
    <input type="hidden" name="page" value="update">
    <input type="hidden" name="id" value="${user.id}">
    <div class="form-group row">
        <label for="username" class="col-xs-2 col-form-label">Username</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="${user.username}" id="username" name="username" required>
        </div>
    </div>
    <div class="form-group row">
        <label for="password" class="col-xs-2 col-form-label">Password</label>
        <div class="col-xs-10">
            <input class="form-control" type="password" value="${user.password}" id="password" name="password" required>
        </div>
    </div>

    <div class="form-group row">
        <label for="role" class="col-xs-2 col-form-label">Select Role</label>
        <div class="col-xs-10">
            <select class="form-control" id="role" name="role" required="required">
                <c:if test="${user.role == 'ROLE_ADMIN'}">
                    <option value="">--Select Role--</option>
                    <option value="ROLE_ADMIN" selected="selected">ROLE_ADMIN</option>
                    <option value="ROLE_USER">ROLE_USER</option>
                </c:if>
                <c:if test="${user.role == 'ROLE_USER'}">
                    <option value="">--Select Role--</option>
                    <option value="ROLE_USER" selected="selected">ROLE_USER</option>
                    <option value="ROLE_ADMIN">ROLE_ADMIN</option>
                </c:if>

            </select>
        </div>
    </div>

    <div  class="form-group row" >
        <button type="submit" class="btn btn-primary"> Update User</button>
    </div>
</form>

<div class="footer">
    <strong>User Edit Page</strong>
</div>


</body>

</html>