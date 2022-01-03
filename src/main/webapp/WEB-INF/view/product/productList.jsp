<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/4.4.1/bootstrap.min.css">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>User Manager</title>
</head>
<body>
    <div class="container">
        <div class="row mt-4 p-4">
            <div class="col">
                <h1 class="h1 text-center">
                    Product List
                </h1>
            </div>
        </div>
        <div class="row">
            <table class="table table-hover text-center">
                <thead>
                <tr>
                    <th class="col-sm-1 col-md-6 col-lg-1" scope="col">Product Id</th>
                    <th class="col-sm-1 col-lg-1" scope="col">Product Name</th>
                    <th class="col-sm-1 col-md-6 col-lg-1" scope="col">Product Price</th>
                    <th class="col-sm-1 col-md-6 col-lg-1" scope="col">Product Status</th>
                    <th class="col-sm-1 col-md-6 col-lg-1" scope="col">Category</th>
                    <th class="col-sm-1 col-md-6 col-lg-1" scope="col">Update</th>
                    <th class="col-sm-1 col-md-6 col-lg-1" scope="col">Delete</th>
                </tr>
                </thead>
                <tbody class="text-center">
                    <c:forEach items="${listProduct}" var="product">
                        <tr>
                            <th scope="row">${product.id}</th>
                            <td><a href="${pageContext.request.contextPath}/product/${product.id}">
                                    ${product.productName}</a></td>
                            <td>${product.productPrice}</td>
                            <td>${product.productStatus}</td>
                            <td>${product.category.categoryName}</td>
                            <td><a href="${pageContext.request.contextPath}/admin/productInventory/${product.id}">Edit</a></td>
                            <td><a href="${pageContext.request.contextPath}/product/delete/${product.id}">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>