<%-- 
    Document   : admin
    Created on : Jul 8, 2021, 2:54:17 PM
    Author     : tamtv
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <h2>Welcome Admin: ${ sessionScope.LOGIN_USER.name }</h2>

        <form action="MainController">
            <input type="text" name="search" value="${param.search}" placeholder="Search"/>
            <input type="submit" name="action" value="Search"/>
        </form>
        <c:choose>
            <c:when test="${not empty LIST_USER}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>User ID</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Role</th>
                            <th>Create Day</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="dto" varStatus="counter" items="${sessionScope.LIST_USER}">
                            <tr>
                                <td>${ counter.count }</td>
                                <td>${ dto.userID }</td>
                                <td>${ dto.name }</td>
                                <td>${ dto.phone }</td>
                                <td>${ dto.address }</td>

                                <c:choose>

                                    <c:when test="${dto.userID == sessionScope.LOGIN_USER.userID}">
                                <form action="MainController">
                                    <td>${dto.role}</td>
                                    <td>${ dto.createDay }</td>
                                    <td style="width: auto">
                                        <input type="hidden" name="search" value="${param.search}"/>
                                        <input type="submit" name="action" value="Edit Infomation"/>
                                    </td>
                                    <td>
                                        <input type="button" value="Delete"/>
                                    </td> 
                                </form>
                            </c:when>

                            <c:otherwise>
                                <form action="MainController">
                                    <td>
                                        <input type="text" name="role" value="${dto.role}" style="width: 30px"/>
                                    </td>
                                    <td>${ dto.createDay }</td>
                                    <td>
                                        <input type="hidden" name="userID" value="${dto.userID}"/>
                                        <input type="hidden" name="search" value="${param.search}"/>
                                        <input type="submit" name="action" value="Confirm Update"/>
                                    </td>
                                    <td>
                                        <input type="submit" name="action" value="Delete"/>
                                    </td>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <h4>Can't not find search name</h4>
    </c:otherwise>
</c:choose>
<form action="MainController">
    <input type="submit" name="action" value="Create Account" style="margin-right: 30px; margin-top: 10px"/></t></t></t>
<input type="submit" name="action" value="Logout"/>
</form>

<form action="LoadProductController">
    <input type="submit" value="Book Store" style="margin-top: 10px"/>
</form>
</body>
</html>
