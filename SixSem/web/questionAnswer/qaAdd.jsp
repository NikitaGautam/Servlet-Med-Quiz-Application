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
    <title>QA Add Page</title>
    <link rel="stylesheet" type="text/css" href="../css/navbar.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <%--<script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>--%>
    <%--<script src="../js/jquery.validate.min.js" type="text/javascript"></script>--%>
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
<h2 align="center">Add Question Answers</h2><br>
<form method="post" action="qaAdd" style="margin-right: 16%; margin-left: 16%;">
    <input type="hidden" name="page" value="qaAdd">
    <div class="form-group row">
        <label for="question" class="col-xs-2 col-form-label">Question</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="" id="question" name="question" required>
        </div>
    </div>
    <div class="form-group row">
        <label for="option1" class="col-xs-2 col-form-label">Option1</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="" id="option1" name="option1" required>
        </div>
    </div>

    <div class="form-group row">
        <label for="option2" class="col-xs-2 col-form-label">Option2</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="" id="option2" name="option2" required>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <label for="option3" class="col-xs-2 col-form-label">Option3</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="" id="option3" name="option3" required>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <label for="option4" class="col-xs-2 col-form-label">Option4</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="" id="option4" name="option4" required>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-xs-2 col-form-label">Correct Answer</label>
        <div class="col-xs-10">
                    <label class="radio-inline"><input type="radio" name="correct_ans" value="1" checked="checked">Option 1</label>
                    <label class="radio-inline"><input type="radio" name="correct_ans" value="2">Option 2</label>
                    <label class="radio-inline"><input type="radio" name="correct_ans" value="3">Option 3</label>
                    <label class="radio-inline"><input type="radio" name="correct_ans" value="4">Option 4</label>
        </div>
    </div>

    <div class="form-group row">
        <label for="category" class="col-xs-2 col-form-label">Category</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="" id="category" name="category" required>
            </select>
        </div>
    </div>


    <div  class="form-group row" >
        <button type="submit" class="btn btn-primary"> Add Question Answers</button>
    </div>
</form>

<div class="footer">
    <strong>Q/A Add Page</strong>
</div>


</body>

</html>