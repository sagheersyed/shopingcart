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

<script>
    $(document).ready(function(){
        $(".quantity-field").change(function(){
            calculateTotal();
        });
        calculateTotal();
    });

    function calculateTotal(){
        var quantities = [];
        var prices = []
        var total = 0;
        $(".list-data").find(".quantity-field").each(function(index){
            quantities.push(this.value)
        });
        $(".list-data").find(".price-field").each(function(index){
            prices.push(this.innerHTML)
        });
        console.log(prices);

        for (let i = 0; i < quantities.length; i++) {   //4, 3 , 1 , 5
            //10 , 25 , 40 , 29
            total += quantities[i] * prices[i];
            console.log(total)
        }
        $("#total").html(total);
    }
</script>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>User Manager</title>
</head>
<div class="page-holder">
    <div class="container px-lg-3">
        <jsp:include page="../header/header.jsp"></jsp:include>
        <section class="py-5">
            <h2 class="h5 text-uppercase mb-4">Shopping cart</h2>
    <div class="row">
        <div class="col-lg-8 mb-4 mb-lg-0">
            <!-- CART TABLE-->
            <div class="table-responsive mb-4">
                <table class="table text-nowrap">
                    <thead class="bg-light">
                    <tr>
                        <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase">Product</strong></th>
                        <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase">Price</strong></th>
                        <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase">Quantity</strong></th>
                        <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase">Total</strong></th>
                        <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase"></strong></th>
                    </tr>
                    </thead>
                    <tbody class="border-0">
                    <c:forEach items="${cartItemList}" var="cartItem">
                    <tr class="list-data">
                        <th class="ps-0 py-3 border-light" scope="row">
                            <div class="d-flex align-items-center"><a class="reset-anchor d-block animsition-link" href="detail.html"><img src="${pageContext.request.contextPath}/static/img/product-detail-3.jpg" alt="..." width="70"/></a>
                                <div class="ms-3"><strong class="h6"><a class="reset-anchor animsition-link" href="detail.html">${cartItem.product.productName}</a></strong></div>
                            </div>
                        </th>
                        <td class="p-3 align-middle border-light">
                            <p id="id" class="mb-0 small price-field">${cartItem.product.productPrice}</p>
                        </td>
                        <td class="p-3 align-middle border-light">
                            <div class="border d-flex align-items-center justify-content-between px-3"><span class="small text-uppercase text-gray headings-font-family">Quantity</span>
                                <div class="quantity">
                                    <button class="dec-btn p-0"><i class="bi bi-arrow-left-circle-fill"></i></button>
                                     <input class="form-control form-control-sm border-0 shadow-0 p-0 quantity-field" type="text" value="${cartItem.quantity}"/>
                                    <button class="inc-btn p-0"><i class="bi bi-arrow-right-circle-fill"></i></button>
                                </div>
                            </div>
                        </td>
                        <td class="p-3 align-middle border-light">
                            <p class="mb-0 small qnt">$${cartItem.product.productPrice * cartItem.quantity}</p>
                        </td>
                        <td class="p-3 align-middle border-light"><a class="reset-anchor" href="#!"><i class="fas fa-trash-alt small text-muted"></i></a></td>
                        <td class="p-3 align-middle border-0"><a class="reset-anchor" href="<%=request.getContextPath()%>/cart/shoppingCart/${cartItem.product.id}"><i class="bi bi-trash-fill"></i></a></td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- CART NAV-->
            <div class="bg-light px-4 py-3">
                <div class="row align-items-center text-center">
                    <div class="col-md-6 mb-3 mb-md-0 text-md-start"><a class="btn btn-link p-0 text-dark btn-sm" href="shop.html"><i class="fas fa-long-arrow-alt-left me-2"> </i>Continue shopping</a></div>
                    <div class="col-md-6 text-md-end"><a class="btn btn-outline-dark btn-sm" href="checkout.html">Procceed to checkout<i class="fas fa-long-arrow-alt-right ms-2"></i></a></div>
                </div>
            </div>
        </div>
        <!-- ORDER TOTAL-->
        <div class="col-lg-4">
            <div class="card border-0 rounded-0 p-lg-4 bg-light">
                <div class="card-body">
                    <h5 class="text-uppercase mb-4">Cart total</h5>
                    <ul class="list-unstyled mb-0">
                        <li class="d-flex align-items-center justify-content-between mb-4"><strong class="text-uppercase small font-weight-bold">Total</strong><span>$<span id="total">${totalAmount}</span></span></li>
                        <li>
                            <form action="#">
                                <div class="input-group mb-0">
                                    <input class="form-control" type="text" placeholder="Enter your coupon">
                                    <button class="btn btn-dark btn-sm w-100" type="submit"> <i class="fas fa-gift me-2"></i>Apply coupon</button>
                                </div>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
        </div>
</div>
</html>