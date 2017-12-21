<%--
  Created by IntelliJ IDEA.
  User: Nikita
  Date: 11/16/16
  Time: 9:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Score Page</title>
    <link rel="stylesheet" type="text/css" href="../css/navbar.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background: whitesmoke">

<ul class="topnav" id="myTopnav">
    <li style="float: right"><a href="logout?page=logout">Logout</a></li>
</ul>
<br>
<h2 align="center" style="color: dodgerblue;">SCORE LOG</h2><br><br>
<div class="container">
    <div class="row">
        <div class="col-sm-4" style="background-color:white; color: black">
            <h4>Total Questions: ${randomQuestions.size()}</h4>
        </div>
        <div class="col-sm-4">

        </div>
        <div class="col-sm-4" style="background-color:white; color: black">
            <h4>Correct Answers: ${score}</h4>
        </div>
    </div>
</div>
<br><br>
<div class="row">
    <c:forEach items="${randomQuestions}" var="ques"  varStatus="loop">
    <div class="col-md-4" >
        <div style="background-color: white">
        <div class="card">

            <div class="card-block">
                <br>
                <h4 class="card-title"> ${ques.question}</h4>
                <p class="card-text"></p>
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">${ques.option1}</li>
                <li class="list-group-item">${ques.option2}</li>
                <li class="list-group-item">${ques.option3}</li>
                <li class="list-group-item">${ques.option4}</li>
            </ul>

            <div class="card-block">
                <c:if test="${ques.correct_ans == selectedAns.get(loop.index)}" >
                    <a href="#" class="btn btn-success" style="width: 50%"><span class="glyphicon glyphicon-ok"></span> ${selectedAns.get(loop.index)} </a>
                </c:if>
                <c:if test="${ques.correct_ans != selectedAns.get(loop.index)}" >
                    <a href="#" class="btn btn-danger" style="width: 50%"><span class="glyphicon glyphicon-remove"></span> ${selectedAns.get(loop.index)} </a>
               </c:if> 

                <a href="#" class="btn btn-primary" style="width: 48%"><span style="color:white">Correct: </span> ${ques.correct_ans}</a>
            </div>
            <br><br>
        </div>
        </div>
      </div>
    </c:forEach>

</div>





</body>
</html>
