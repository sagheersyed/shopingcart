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
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/4.4.1/bootstrap.min.css">
</head>
<body>
<div class="container vh-100 vw-100">
    <div class="row">
        <div class="col-12 mt-5">
            <h1 class="h1 text-center font-italic font-weight-bold" style="color: #6610f2">
                Update Product
            </h1>
        </div>
    </div>
    <div class="row m-sm-0 m-md-3 p-3 d-flex justify-content-center">
        <div class="col-sm-12">
            <form:form action="${pageContext.request.contextPath}/product/update" method="post" modelAttribute="product" class="">
                <div class="row">
                    <div class="col-md-6 d-flex justify-content-center">
                        <table border="0" cellpadding="5" class="">
                            <tr>
                                <td>ID: </td>
                                <td>${product.id}
                                    <form:hidden path="id"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
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
                    <div class="col-12 d-flex justify-content-center">
                        <div class="row">
                    <div class="col-md-6 d-flex justify-content-center align-items-center">
                        <form:label cssClass="btn-outline-dark pr-3" path="category">Selected Category: </form:label>
                        <form:select cssClass="" path="category.id">
                            <c:forEach items="${listCategory}" var="categories">
                                <form:option cssClass="text-primary dropdown" value="${categories.id}">${categories.categoryName}</form:option>
                            </c:forEach>
                        </form:select>
                    </div>
                    <div class="col-6 text-center">
                        <form:label path="productStatus">Gender:</form:label>
                        <form:radiobutton path="productStatus" value="true"/>Activate
                        <form:radiobutton path="productStatus" value="false"/>Deactivate<br/>
                    </div>
                    <div class="text-center col-12 mt-3 mb-3">
                        <button type="submit" class="btn btn-info">Update</button>
                    </div>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>

    </div>
</div>
</body>
</html>