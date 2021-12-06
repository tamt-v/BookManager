<%-- 
    Document   : products
    Created on : Jul 10, 2021, 5:02:52 PM
    Author     : tamtv
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Store</title>
    </head>
    <body>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="LoadProductController">Book Store</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="LoadProductController">Home</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="LoadAProductController">Product</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="LoadCartController?cart=Cart">Cart</a>
                        </li>
                        <c:choose>
                            <c:when test="${sessionScope.LOGIN_USER != null}">
                                <li class="nav-item">
                                    <a class="nav-link " href="MainController?action=EditInfomation">
                                        ${sessionScope.LOGIN_USER.name}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " href="LogoutController">Logout</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item">
                                    <a class="nav-link " href="login.jsp">Sign in</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " href="MainController?action=Add Account">Sign up</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>

                    <form class="form-inline my-2 my-lg-0">
                        <div class="input-group input-group-sm">
                            <input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                            <div class="input-group-append">
                                <button type="button" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                        <a class="btn btn-success btn-sm ml-3" href="LoadCartController?cart=Cart">
                            <i class="fa fa-shopping-cart"></i> Cart
                            <span class="badge badge-light">${sessionScope.CART_QUANTUM}</span>
                        </a>
                    </form>
                </div>
            </div>
        </nav>
        <section class="jumbotron text-center">
            <div class="container">
                <h1 class="jumbotron-heading">BOOK STORE</h1>
                <p class="lead text-muted mb-0">Welcome to our bookstore wish you a happy shopping...</p>
            </div>
        </section>
        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active"><a href="LoadProductController">Home</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                        <c:forEach items="${sessionScope.LIST_CATEGORY}" var="c">
                            <ul class="list-group category_block">
                                <li class="list-group-item ">
                                    <a href="category?cID=${c.cID}">${c.cName}</a>
                                </li>
                            </ul>
                        </c:forEach>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <c:forEach items="${sessionScope.LIST_PRODUCT}" var="p">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <img class="card-img-top" src="${p.image}" alt="Card image cap" >
                                    <div class="card-body">
                                        <form action="LoadCartController">
                                            <h4 class="card-title"><a href="LoadAProductController?pID=${p.productID}" title="View Product">${p.productName}</a></h4>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-danger btn-block">${p.price} VND</p>
                                                </div>
                                                <div class="col">
                                                    <%--<a href="LoadCartController?cart=AddCart" class="btn btn-success btn-block">Add to cart</a>--%>
                                                    <input type="hidden" name="pID" value="${p.productID}"/>
                                                    <input type="hidden" name="quantity" value="1"/>
                                                    <input type="hidden" name="price" value="${p.price}"/>
                                                    <input type="submit" name="cart" value="Add to cart" class="btn btn-success btn-block" />
                                                </div>
                                            </div>
                                        </form>
                                        
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>

        <!-- Footer -->
        <footer class="text-light">
            <div class="container">
                <div class="row">
                    <div class="col-12 copyright mt-3">
                        <p class="float-left">
                            <a href="#">Back to top</a>
                        </p>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
