<%-- 
    Document   : product
    Created on : Jul 11, 2021, 5:09:42 PM
    Author     : tamtv
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                                    <a class="nav-link " href="LogoutController">Sign in</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " href="LogoutController">Sign up</a>
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
                <h1 class="jumbotron-heading">BOOK DETAILS</h1>
            </div>
        </section>
        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="LoadProductController">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Product</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <c:choose>
            <c:when test="${sessionScope.PRODUCT != null}">
                <div class="container">
                    <div class="row">
                        <!-- Image -->
                        <div class="col-12 col-lg-6">
                            <div class="card bg-light mb-3">
                                <div class="card-body">
                                    <a href="" data-toggle="modal" data-target="#productModal">
                                        <img class="img-fluid" src="${sessionScope.PRODUCT.image}" />  
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Add to cart -->
                        <div class="col-12 col-lg-6 add_to_cart_block">
                            <div class="card bg-light mb-3">
                                <div class="card-body">
                                    <p class="price" style=" text-align: center; color: red; font-weight: bold">
                                        ${sessionScope.PRODUCT.price} VND</p>
                                    <form method="get" action="LoadCartController">
                                        <div class="form-group">
                                            <label>Quantity :</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <button type="button" class="quantity-left-minus btn btn-danger btn-number"  data-type="minus" data-field="">
                                                        <i class="fa fa-minus"></i>
                                                    </button>
                                                </div>
                                                <input type="text" class="form-control"  id="quantity" name="quantity" min="1" max="100" value="${sessionScope.PRODUCT.quantity}">
                                                <div class="input-group-append">
                                                    <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus" data-field="">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <a  class="btn btn-success btn-lg btn-block text-uppercase">
                                            <input type="hidden" name="cart" value="Add to cart"/>
                                            <input type="hidden" name="pID" value="${sessionScope.PRODUCT.productID}"/>
                                            <input type="hidden" name="price" value="${sessionScope.PRODUCT.price}"/>
                                            <i class="fa fa-shopping-cart"></i> <input type="submit" value="Add To Cart" class="btn btn-success text-uppercase" />
                                        </a>
                                    </form>
                                    <div class="product_rassurance" style=" padding: 10px; margin-top: 15px; background: #ffffff; border: 1px solid #6c757d; color: #6c757d;">
                                        <ul class="list-inline">
                                            <li class="list-inline-item" style=" margin-bottom: 0; text-transform: uppercase; text-align: center;">
                                                <i class="fa fa-truck fa-2x"></i><br/>Fast delivery</li>
                                            <li class="list-inline-item" style=" margin-bottom: 0; text-transform: uppercase; text-align: center;">
                                                <i class="fa fa-credit-card fa-2x">
                                                </i><br/>Secure payment</li>
                                        </ul>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <!-- Description -->
                        <div class="col-12">
                            <div class="card border-light mb-3">
                                <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-align-justify"></i> Description</div>
                                <div class="card-body">
                                    <p class="card-text">
                                        ${sessionScope.PRODUCT.description}
                                    </p>

                                </div>
                            </div>
                        </div>


                    </div>
                </div>
                <script>
                    $(document).ready(function () {
                        var quantity = 1;

                        $('.quantity-right-plus').click(function (e) {
                            e.preventDefault();
                            var quantity = parseInt($('#quantity').val());
                            $('#quantity').val(quantity + 1);
                        });

                        $('.quantity-left-minus').click(function (e) {
                            e.preventDefault();
                            var quantity = parseInt($('#quantity').val());
                            if (quantity > 1) {
                                $('#quantity').val(quantity - 1);
                            }
                        });

                    });
                </script>
            </c:when>
            <c:otherwise>
                <div class="container">
                    <h3>No products selected...</h3>
                </div>

            </c:otherwise>
        </c:choose>
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
