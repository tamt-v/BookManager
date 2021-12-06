<%-- 
    Document   : logup
    Created on : Jul 12, 2021, 11:47:02 AM
    Author     : tamtv
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up Page</title>
    </head>
    <body style="justify-content: center">
        <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <div class="span3">
            <h2>Sign Up</h2>
            <form method="POST" action="MainController">
                <label>User ID</label>
                <input type="text" name="userID" class="span3"/><h6 style="color: red">${requestScope.ID_ERROR}</h6>
                <label>Name</label>
                <input type="text" name="name" class="span3"/>
                <label>Phone</label>
                <input type="text" name="phone" class="span3"/><h6 style="color: red">${requestScope.PHONE_ERROR}</h6>
                <label>Address</label>
                <input type="text" name="address" class="span3"/>
                <label>Password</label>
                <input type="password" name="password" class="span3"/><h6 style="color: red">${requestScope.PASS_ERROR}</h6>

                <input type="submit" name="action" value="Create" class="btn btn-primary pull-right"/> 
                <input type="submit" name="action" value="Home"/>
                <input type="submit" name="action" value="Login"/>

                <div class="clearfix"></div>
            </form>
        </div>
    </body>
</html>
