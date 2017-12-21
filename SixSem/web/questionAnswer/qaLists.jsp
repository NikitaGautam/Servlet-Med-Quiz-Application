<%--
  Created by IntelliJ IDEA.
  User: Nikita
  Date: 9/19/16
  Time: 11:52 AM
  To change this template use File | Settings | File Templates.
--%>

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
    <a href="qaAdd?page=questionAddPage" class="btn btn-info btn-lg" style="background-color: #337ab7">
        <span class="glyphicon glyphicon-plus"></span> Add QuestionAnswer
    </a>
</div>
<br><br>
<div style="margin-left: 5%; margin-right: 5%">
    <table class="table table-striped" >
        <thead  style="color: white; background-color: seagreen">
        <tr>
            <th>Question Id</th>
            <th>Question</th>
            <th>Option1</th>
            <th>Option2</th>
            <th>Option3</th>
            <th>Option4</th>
            <th>Correct Answer</th>
            <th>Category</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${qaList}" var="qa">
            <tr>
                <td>${qa.id}</td>
                <td>${qa.question}</td>
                <td>${qa.option1}</td>
                <td>${qa.option2}</td>
                <td>${qa.option3}</td>
                <td>${qa.option4}</td>
                <td>${qa.correct_ans}</td>
                <td>${qa.category}</td>
                <td><a href="qaUpdate?page=editQA&qaId=${qa.id}" class="editdelButton"><img src="../Images/edit.png" style="width: 50px; height: 50px"></a></td>
                <td><a href="qaUpdate?page=deleteQA&qaId=${qa.id}" class="editdelButton"><img src="../Images/delete.png" style="width: 50px; height: 50px"></a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>

<div class="footer">
    <strong>This is Q/A List Page</strong>
</div>
</body>
</html>

