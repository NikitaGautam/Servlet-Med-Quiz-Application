<%--
  Created by IntelliJ IDEA.
  User: Nikita
  Date: 11/16/16
  Time: 6:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
    <link rel="stylesheet" type="text/css" href="../css/navbar.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<ul class="topnav" id="myTopnav">
    <li style="float: right"><a href="logout?page=logout">Logout</a></li>
</ul>

<div class="container" align="center" style="margin-top: 10%; width: 60%; height: 200px">
        <a href="playquiz?action=play" class="btn btn-info btn-lg">
            <span class="glyphicon glyphicon-th-list"></span> Play Quiz
        </a>
</div>
<div class="footer">
    <strong>Home Page</strong>
</div>
</body>
</html>
