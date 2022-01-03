<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>New Customer</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/4.4.1/bootstrap.min.css">
</head>
<body>
<div align="center">
    <div class="container vh-100 vw-100">
        <div class="row">
            <div class="col-12 mt-5">
                <h1 class="h1 text-center font-italic font-weight-bold" style="color: #6610f2">
                    New User
                </h1>
            </div>
        </div>
        <div class="row m-sm-0 m-md-3 p-3 d-flex justify-content-center">
            <div class="col-sm-12">
                <form:form action="save" method="post" modelAttribute="user" class="">
                    <div class="row d-flex justify-content-center">
                        <div class="form-group col-sm-12 col-md-7 ">
                            <label for="name">User Name</label>
                            <form:input path="name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Your Name"/>
                        </div>
                        <div class="form-group col-md-7">
                            <label for="email">Email</label>
                            <form:input path="email" type="email" class="form-control" id="email" placeholder="Enter Email"/>
                        </div>
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