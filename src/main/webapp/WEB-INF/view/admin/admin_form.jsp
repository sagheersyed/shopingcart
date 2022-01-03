<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/4.4.1/bootstrap.min.css">
    <title>New Customer</title>
</head>
<body>
<div class="container vh-100 vw-100">
    <div class="row">
        <div class="col-12 mt-5">
            <h1 class="h1 text-center font-italic font-weight-bold" style="color: #6610f2">
                New Customer
            </h1>
        </div>
    </div>

    <div class="row m-sm-0 m-md-3 p-3 d-flex justify-content-center">
        <div class="col-sm-12">
        <form:form action="save" method="post" modelAttribute="admin">
        <table border="0" cellpadding="5">
            <tr>
                <td>Name: </td>
                <td><form:input path="name" /></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><form:input path="email" /></td>
            </tr>
            <tr>
                <td>Status: </td>
                <td><form:input path="status" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Save"></td>
            </tr>
        </table>
    </form:form>
        </div></div>
</div>
</body>