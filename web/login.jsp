<%-- 
    Document   : login
    Created on : Jul 8, 2021, 11:15:57 AM
    Author     : tamtv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link href="login.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="css/form2.css">
</head>
<body>

      <div class="login">
          <h2>Sign In</h2>
          <form action="MainController" method="POST">
              <div class="input-group">
                  <input type="text" name="userID" required="required">
                  <span>Username</span>
              </div>

              <div class="input-group">
                  <input type="password" name="password" required="required">
                  <span>Password</span>
              </div>

              <div class="input-group">
                  <input type="submit" name="action" value="Login">
              </div>
          </form>
          <a href="MainController?action=Add Account" style="text-align: center;">Create account</a>
      </div>
  </div>
</body>
</html>
</html>
