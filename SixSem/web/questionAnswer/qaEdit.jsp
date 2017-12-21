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
    <title>QA Edit Page</title>
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
<h2 align="center">Update Question Answer</h2><br>
<form method="post" action="qaUpdate" style="margin-right: 16%; margin-left: 16%;">
    <input type="hidden" name="page" value="updateQA">
    <input type="hidden" name="id" value="${qa.id}">
    <div class="form-group row">
        <label for="question" class="col-xs-2 col-form-label">Question</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="${qa.question}" id="question" name="question" required>
        </div>
    </div>
    <div class="form-group row">
        <label for="option1" class="col-xs-2 col-form-label">Option1</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="${qa.option1}" id="option1" name="option1" required>
        </div>
    </div>

    <div class="form-group row">
        <label for="option2" class="col-xs-2 col-form-label">Option2</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="${qa.option2}" id="option2" name="option2" required>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <label for="option3" class="col-xs-2 col-form-label">Option3</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="${qa.option3}" id="option3" name="option3" required>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <label for="option4" class="col-xs-2 col-form-label">Option4</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="${qa.option4}" id="option4" name="option4" required>
            </select>
        </div>
    </div>

    <%--<div class="form-group row">--%>
        <%--<label for="correct_ans" class="col-xs-2 col-form-label">Correct Answer</label>--%>
        <%--<div class="col-xs-10">--%>
            <%--<input class="form-control" type="text" value="${qa.correct_ans}" id="correct_ans" name="correct_ans" required>--%>
            <%--</select>--%>
        <%--</div>--%>
    <%--</div>--%>

    <div class="form-group row">
        <label class="col-xs-2 col-form-label">Correct Answer</label>
        <div class="col-xs-10">

                <label class="radio-inline"><input type="radio" name="correct_ans" value="1" <c:if test="${qa.correct_ans == qa.option1}">checked="checked"</c:if>>Option 1</label>
                <label class="radio-inline"><input type="radio" name="correct_ans" value="2" <c:if test="${qa.correct_ans == qa.option2}"> checked="checked" </c:if>>Option 2</label>
                <label class="radio-inline"><input type="radio" name="correct_ans" value="3" <c:if test="${qa.correct_ans == qa.option3}"> checked="checked" </c:if>>Option 3</label>
                <label class="radio-inline"><input type="radio" name="correct_ans" value="4" <c:if test="${qa.correct_ans == qa.option4}"> checked="checked"   </c:if>>Option 4</label>

        </div>
    </div>

    <div class="form-group row">
        <label for="category" class="col-xs-2 col-form-label">Category</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="${qa.category}" id="category" name="category" required>
            </select>
        </div>
    </div>


    <div  class="form-group row" >
        <button type="submit" class="btn btn-primary"> Update Question Answers</button>
    </div>
</form>

<div class="footer">
    <strong>Q/A Edit Page</strong>
</div>


</body>

</html>