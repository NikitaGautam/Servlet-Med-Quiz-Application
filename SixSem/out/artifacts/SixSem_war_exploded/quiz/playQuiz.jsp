<%--
  Created by IntelliJ IDEA.
  User: Nikita
  Date: 11/16/16
  Time: 6:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quiz Page</title>
    <link rel="stylesheet" type="text/css" href="../css/navbar.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">

</head>
<body style="background: whitesmoke">
<ul class="topnav" id="myTopnav">
    <li style="float: right"><a href="logout?page=logout">Logout</a></li>
</ul>

<div class="container" >
    <br><br>
    <div class="row">
        <div class="col-md-6 col-md-offset-3" style="width: 80%; margin-right: 20%; margin-left: 13%">
            <div class="panel panel-login">
                <div class="panel-body">
                    <div class="panel-heading">
                        <h3 align="center">Questions</h3>
                        <hr>
                    </div>
                    <div class="row">
                        <div class="col-lg-12" align="center">
                            <form method="post" action="/playquiz" class="form">
                                <input type="hidden" value="play" name="action">
                                <c:set var="question" value="${randomQuestions.get(index)}" scope="request"/>
                                <div class="panel-heading">
                                    <h2 class="question">${question.question}</h2>
                                    <hr>
                                </div>

                                <div class="btn-group-lg btn-group" data-toggle="buttons" id="check" style="width: auto">
                                    <row>
                                        <div class="col-lg-6" >
                                            <label class="btn btn-primary">
                                               <input type="radio" value="${question.option1}" name="options">  ${question.option1}
                                            </label>
                                        </div>
                                        <!--<span>or</span>-->
                                        <div class="col-lg-6">
                                            <label class="btn btn-primary">
                                                <input type="radio" value="${question.option2}" name="options">  ${question.option2}
                                            </label>
                                        </div>
                                        <br><br>
                                        <div class="col-lg-6">
                                            <label class="btn btn-primary">
                                                <input type="radio" value="${question.option3}" name="options">  ${question.option3}
                                            </label>
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="btn btn-primary">
                                                <input type="radio" value="${question.option4}" name="options">  ${question.option4}
                                            </label>
                                        </div>

                                        <input type="hidden" name="index" value="${index}">
                                        <input type="hidden" name="randomQuestions" value="${randomQuestions}">
                                        <input type="hidden" name="score" value="${score}">
                                        <input type="hidden" name="selectedAns" value="${selectedAns}">

                                    </row>
                                </div>

                                <br><br>
                                <input id="sub" type = "submit" class="btn btn-success" style="height: 40px; width: 40%; color: #ffffff; font-size: large" value="Submit & Next">
                                <br><br>
                            </form>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<input type="hidden" name="randomQuestions" value="${randomQuestions}">--%>


<%--<div class="container" align="center" style="margin-top: 10%;">--%>
    <%--<a href="playquiz?action=play" class="btn btn-info btn-lg">--%>
        <%--<span class="glyphicon glyphicon-th-list"></span> Play Quiz--%>
    <%--</a>--%>
<%--</div>--%>
</body>
</html>
