<%--
  Created by IntelliJ IDEA.
  User: Nikita
  Date: 8/25/16
  Time: 6:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
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
<br>

<div class="container" align="center">
        <a href="update?page=userAddPage" class="btn btn-info btn-lg" style="background-color: #337ab7">
            <span class="glyphicon glyphicon-plus"></span> Add User
        </a>
</div>
<br><br>
<div style="margin-left: 5%; margin-right: 5%">
<table class="table table-striped" >
    <thead  style="color: white; background-color: seagreen">
    <tr>
        <th>User Id</th>
        <th>UserName</th>
        <th>Role</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
        <c:forEach items="${userList}" var="user">
    <tr>
        <td>${user.id}</td>
        <td>${user.username}</td>
        <td>${user.role}</td>
        <td><a href="update?page=editUser&userID=${user.id}" class="editdelButton"><img src="../Images/edit.png" style="width: 50px; height: 50px"></a></td>
        <td><a href="update?page=deleteUser&userID=${user.id}" class="editdelButton"><img src="../Images/delete.png" style="width: 50px; height: 50px"></a></td>
    </tr>
    </c:forEach>

    </tbody>
</table>
</div>

<div class="footer">
    <strong>This is User List Page</strong>
</div>
</body>
</html>

