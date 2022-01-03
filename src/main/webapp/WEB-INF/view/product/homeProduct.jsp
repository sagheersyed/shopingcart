<%@ page import="java.util.List" %>
<%@ page import="com.crud.entity.Product" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.crud.service.CategoryService" %>
<%@ page import="com.crud.entity.Category" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/vendor/bootstrap/css/bootstrap.min.css">
<meta name=?viewport? content=?width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="robots" content="all,follow">
<!-- gLightbox gallery-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/vendor/glightbox/css/glightbox.min.css">
<!-- Range slider-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/vendor/nouislider/nouislider.min.css">
<!-- Choices CSS-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/vendor/choices.js/public/assets/styles/choices.min.css">
<!-- Swiper slider-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/vendor/swiper/swiper-bundle.min.css">
<!-- Google fonts-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300;400;700&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Martel+Sans:wght@300;400;800&amp;display=swap">
<!-- theme stylesheet-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/style.default.css" id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/static/img/favicon.png">'

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/3.4.1/jquery.min.js"></script>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>User Manager</title>
    <script type="text/javascript">
        $(document).ready(function(){
            $.ajax({
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                url: "/crud/product/test?productId=73",
                success: function (result) {
                    console.log("SUCCESS: ", result);
                    $("#name").html(result.productName);
                    $("#description").html(result.id);
                },
                error: function (e) {
                    console.log("ERROR: ", e);
                }
            });
        });

        function addToCart(productId) {
            $.ajax({
                type: "POST",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                url: "<%=request.getContextPath()%>/cart/add/" + productId,
                success: function (result) {
                    console.log(result);
                    $("#cart-size").html(result.items.length)
                },
                error: function (e) {
                    alert("the function is not working")
                }
            });
        }

            function favouriteProduct(id) {
                $.ajax({
                    type: "POST",
                    contentType: 'application/json; charset=utf-8', dataType: 'json',
                    url: "<%=request.getContextPath()%>/favourite/add/"+id,
                    success: function (result) {
                        alert(JSON.stringify(result))
                        console.log(result);
                        $("#fav-product-size").html(result.length);
                        result
                    },
                    error: function (e) {
                        alert("the function is not working")
                    }
                });
        }

    </script>
</head>
<body>
<nav class=?navbar fixed-top navbar-expand-md navbar-light bg-light?>
    <div class="container">
        <jsp:include page="../header/header.jsp"></jsp:include>
        <!--List Of CATEGORIES SECTION-->
        <section class="pt-5">
            <header class="text-center">
                <p class="small text-muted small text-uppercase mb-1">Carefully created collections</p>
                <h2 class="h5 text-uppercase mb-4">Browse our categories</h2>
            </header>
            <div class="row">
                <div id="product73">
                    <div id="name"></div>
                    <div id="description"></div>
                </div>
                <%-- GETTING A LIST OF CATEGORY --%>
                <c:forEach var="category" items="${listCategory}" varStatus="status">
                    <c:choose>
                        <c:when test="${status.index % 4 == 0}">
                            <div class="col-md-3 mb-4">
                                <a class="category-item" href="<%=request.getContextPath()%>/category/${category.id}">
                                    <img class="img-fluid" src="<%=request.getContextPath()%>/${category.imageUrl}" alt=""/>
                                    <strong class="category-item-title">${category.categoryName}</strong>
                                </a>
                            </div>
                        </c:when>
                        <c:when test="${status.index % 4 == 1}">
                            <div class="col-md-4">
                            <a class="category-item" style="height: 50vh" href="<%=request.getContextPath()%>/category/${category.id}">
                                <img class="img-fluid" src="<%=request.getContextPath()%>/${category.imageUrl}" alt=""/>
                                <strong class="category-item-title">${category.categoryName}</strong>
                            </a>
                        </c:when>
                        <c:when test="${status.index % 4 == 2}">
                            <a class="category-item mb-0" style="height: 30vh" href="<%=request.getContextPath()%>/category/${category.id}">
                                <img class="img-fluid" src="<%=request.getContextPath()%>/${category.imageUrl}" alt=""/>
                                <strong class="category-item-title">${category.categoryName}</strong>
                            </a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="col-md-4">
                                <a class="category-item" href="<%=request.getContextPath()%>/category/${category.id}">
                                    <img class="img-fluid" src="<%=request.getContextPath()%>/static/img/cat-img-1.jpg" alt=""/>
                                    <strong class="category-item-title">${category.categoryName}</strong>
                                </a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </section>
    </div>
</nav>
        </section>
<%--List Of Products--%>
<div class="container">
    <section class="py-5">
        <header>
            <p class="small text-muted small text-uppercase mb-1">Made the hard way</p>
            <h2 class="h5 text-uppercase mb-4">Top trending products</h2>
        </header>
        <div class="row">
    <div class="row mb-4">
        <c:forEach items="${listProduct}" var="list">
            <div class="col-xl-3 col-lg-4 col-sm-6 col-12">
                <div class="product text-center">
                    <div class="position-relative mb-3">
                        <div class="badge text-white bg-"></div><a class="d-block" href="detail.html">
                        <img class="img-fluid w-100" src="<%=request.getContextPath()%>/static/img/product-2.jpg" alt="..."></a>
                        <div class="product-overlay">
                            <ul class="mb-0 list-inline">
                                <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-outline-dark" href="#!" onclick="favouriteProduct(${list.id})"><i class="bi bi-suit-heart-fill"></i></a></li>
                                <li class="list-inline-item m-0 p-0">
                                        <a class="btn btn-sm btn-dark" onclick="addToCart(${list.id})"> Add to cart </a>
                                </li>
                                <li class="list-inline-item mr-0"><a class="btn btn-sm btn-outline-dark" href="#productView" data-bs-toggle="modal"><i class="bi bi-arrows-fullscreen"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <h6> <a class="reset-anchor" href="detail.html">${list.productName}</a></h6>
                    <p class="small text-muted">$${list.productPrice}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
    </section>
<%--  Services  --%>
    <section class="py-5 bg-light mb-5">
        <div class="container">
            <div class="row text-center gy-3">
                <div class="col-lg-4">
                    <div class="d-inline-block">
                        <div class="d-flex align-items-end">
                            <svg class="svg-icon svg-icon-big svg-icon-light">
                                <use xlink:href="#delivery-time-1"> </use>
                            </svg>
                            <div class="text-start ms-3">
                                <h6 class="text-uppercase mb-1">Free shipping</h6>
                                <p class="text-sm mb-0 text-muted">Free shipping worldwide</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="d-inline-block">
                        <div class="d-flex align-items-end">
                            <svg class="svg-icon svg-icon-big svg-icon-light">
                                <use xlink:href="#helpline-24h-1"> </use>
                            </svg>
                            <div class="text-start ms-3">
                                <h6 class="text-uppercase mb-1">24 x 7 service</h6>
                                <p class="text-sm mb-0 text-muted">Free shipping worldwide</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="d-inline-block">
                        <div class="d-flex align-items-end">
                            <svg class="svg-icon svg-icon-big svg-icon-light">
                                <use xlink:href="#label-tag-1"> </use>
                            </svg>
                            <div class="text-start ms-3">
                                <h6 class="text-uppercase mb-1">Festival offers</h6>
                                <p class="text-sm mb-0 text-muted">Free shipping worldwide</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
</html>