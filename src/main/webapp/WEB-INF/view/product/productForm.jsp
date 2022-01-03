<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Bootstrap 4 Example</title>
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


</head>
<body>
    <div class="container vh-100 vw-100">
            <c:import url="Desktop/Crud-Application/src/main/webapp/WEB-INF/view/header/header.jsp"></c:import>
        <div class="row">
            <div class="col-12 mt-5">
                <h1 class="h1 text-center font-italic font-weight-bold" style="color: #6610f2">
                    Add Product
                </h1>
            </div>
        </div>
        <div class="row m-sm-0 m-md-3 p-3 d-flex justify-content-center">
            <div class="col-sm-12">
                <form:form action="save" method="post" modelAttribute="product" class="">
                    <div class="row d-flex justify-content-center">
                        <div class="form-group col-sm-12 col-md-7 ">
                            <label for="productName">Product Name</label>
                            <form:input path="productName" type="text" class="form-control" id="productName" aria-describedby="emailHelp" placeholder="Product Name"/>
                        </div>
                        <div class="form-group col-md-7">
                            <label for="productPrice">Price</label>
                            <form:input path="productPrice" type="text" class="form-control" id="productPrice" placeholder="Product Price"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <form:label path="category">Category:</form:label>
                            <form:select path="category">
                                <c:forEach items="${listCategory}" var="categories">
                                    <form:option value="${categories.getId()}">${categories.getCategoryName()}</form:option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <div class="col-12 text-center">
                            <form:label path="productStatus">Gender:</form:label>
                            <form:radiobutton path="productStatus" value="true"/>Activate
                            <form:radiobutton path="productStatus" value="false"/>Deactivate<br/>
                        </div>
                        <div class="form-check col-12 text-center mt-3">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Enable</label>
                        </div>
                        <div class="text-center col-12 mt-3 mb-3">
                            <button type="submit" class="btn btn-info">Create</button>
                        </div>
                    </div>
                </form:form>
            </div>

        </div>
    </div>
</body>
</html>