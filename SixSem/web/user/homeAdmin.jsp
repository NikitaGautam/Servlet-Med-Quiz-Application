<%@ page import="domains.User" %><%--
  Created by IntelliJ IDEA.
  User: Nikita
  Date: 8/11/16
  Time: 2:02 PM
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
<div class="footer">
    <strong>This is Home Page</strong>
</div>

</body>

</html>