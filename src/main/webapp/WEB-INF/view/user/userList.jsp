<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/4.4.1/bootstrap.min.css">
    <title>User Manager</title>
</head>
<body>
<div class="container">
    <div class="row mt-4 p-4">
        <div class="col">
            <h1 class="h1 text-center">
                User List
            </h1>
        </div>
    </div>
    <div class="row">
        <table class="table table-hover text-center">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>E-mail</th>
                    <th>Role</th>
                    <th>Update</th>
                    <th>Delete</th>
                 </tr>
            </thead>
            <tbody class="text-center">
                <c:forEach items="${listUsers}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                       <td>
                           <c:forEach items="${user.roles}" var="role">
                                ${role.name}
                            </c:forEach>
                        </td>
                        <td><a href="getUser/${user.id}">Edit</a></td>
                        <td><a href="deleteUser/${user.id}">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
    </table>
</div>
</body>
</html>