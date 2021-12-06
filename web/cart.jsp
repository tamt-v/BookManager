<%-- 
    Document   : cart
    Created on : Jul 11, 2021, 3:27:25 PM
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
                        <li class="nav-item">
                            <a class="nav-link " href="MainController?action=EditInfomation">
                                ${sessionScope.LOGIN_USER.name}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="LogoutController">Logout</a>
                        </li>

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
                            <span class="badge badge-light">
                                ${sessionScope.CART_QUANTUM}
                            </span>
                        </a>
                    </form>
                </div>
            </div>
        </nav>
        <section class="jumbotron text-center">
            <div class="container">
                <h1 class="jumbotron-heading">BOOK CART</h1>
            </div>
        </section>

        <div class="container mb-4">
            <div class="row">
                <c:choose>
                    <c:when test="${sessionScope.CART_USER != null}"> 
                        <div class="col-12">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col"> </th>
                                            <th scope="col">Product</th>
                                            <th scope="col">Available</th>
                                            <th scope="col" class="text-center">Quantity</th>
                                            <th scope="col" class="text-right">Price</th>
                                            <th> </th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach var="o" items="${sessionScope.CART_USER}">
                                            <tr>
                                                <td><img src="${o.oImage}" style="height: 100px;width: 80px"/> </td>
                                                <td>${o.oName}</td>
                                                <td>${o.oQuantityProduct>0?"In Stock":"Out stock"}</td>
                                                <td><input class="form-control" type="text" value="${o.oQuantity}" /></td>
                                                <td class="text-right">${o.totalMoney} VND</td>
                                        <form action="MainController">
                                            <input type="hidden" name="pID" value="${o.producID}"/>
                                            <input type="hidden" name="action" value="delete"/>
                                            <td class="text-right"><button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button> </td>
                                        </form>

                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>Sub-Total</td>
                                        <td class="text-right">${requestScope.TOTAL_MONEY} VND</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>Shipping</td>
                                        <td class="text-right">Free</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td><strong>Total</strong></td>
                                        <td class="text-right"><strong>${requestScope.TOTAL_MONEY} VND</strong></td>
                                    </tr>
                                    </tbody>                                
                                </table>
                            </div>
                        </div>
                        <div class="col mb-2">
                            <div class="row">
                                <div class="col-sm-12  col-md-6">
                                    <button class="btn btn-block btn-light">
                                        <form action="MainController">
                                            <input type="submit" name="action" value="Continue Shopping" class="btn btn-block btn-light"/>
                                        </form>                                        
                                    </button>
                                </div>
                                <div class="col-sm-12 col-md-6 text-right">
                                    <button class="btn btn-lg btn-block btn-success text-uppercase">
                                        <form action="MainController">
                                            <input type="submit" name="action" value="Checkout" class="btn btn-lg btn-block btn-success text-uppercase"/>
                                        </form>
                                    </button>

                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <h5>Buy something to create your own shopping cart</h5>
                    </c:otherwise>
                </c:choose>
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
