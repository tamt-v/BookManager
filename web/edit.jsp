<%-- 
    Document   : edit.jsp
    Created on : Jul 9, 2021, 10:48:08 AM
    Author     : tamtv
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
    </head>
    <body>
        <h1>Welcome ${sessionScope.EDIT_USER.name}</h1>
        <h3>Change your information </h3>
        <form action="MainController">
            <div> User ID <br/>
                <input type="text" name="userID" value="${sessionScope.EDIT_USER.userID}" readonly="" style="margin-left: 15px; margin-bottom: 5px"/>
            </div>
            <div> Password <br/>
                <input type="password" name="password" value="${sessionScope.EDIT_USER.password}"style="margin-left: 15px; margin-bottom: 5px"/>
                <h6 style="color: red">${requestScope.PASS_ERROR}</h6>
            </div>
            <div> Name <br/>
                <input type="text" name="name" value="${sessionScope.EDIT_USER.name}"style="margin-left: 15px; margin-bottom: 5px"/>
                <h6 style="color: red">${requestScope.NAME_ERROR}</h6>
            </div>
            <div> Phone <br/>
                <input type="text" name="phone" value="${sessionScope.EDIT_USER.phone}"style="margin-left: 15px; margin-bottom: 5px"/>
                <h6 style="color: red">${requestScope.PHONE_ERROR}</h6>
            </div>
            <div> Address <br/>
                <input type="text" name="address" value="${sessionScope.EDIT_USER.address}"style="margin-left: 15px; margin-bottom: 5px"/>
                <h6 style="color: red">${requestScope.ADDRESS_ERROR}</h6>
            </div>
            <input type="hidden" name="search" value="${param.search}"/>
            <c:choose>
                
                <c:when test="${sessionScope.EDIT_USER.role == requestScope.ROLE_AD}">
                        <input type="submit" name="action" value="Back"/>
                </c:when>
                
                <c:otherwise>
                    <input type="submit" name="action" value="Home"/>
                </c:otherwise>
            </c:choose>
            
            <input type="submit" name="action" value="Save"/><br/>
        </form>
    </body>
</html>
