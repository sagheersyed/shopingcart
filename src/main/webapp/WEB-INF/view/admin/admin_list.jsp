<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>User Manager</title>
</head>
<body>
<div align="center">
    <h2>User Manager</h2>
    <table border="1" cellpadding="5">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>E-mail</th>
            <th>Status</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${listAdmin}" var="admin">
            <tr>
                <td>${admin.id}</td>
                <td>${admin.name}</td>
                <td>${admin.email}</td>
                <td>${admin.status}</td>
                <td><a href="getAdmin/${admin.id}">Edit</a></td>
                <td><a href="deleteUser/${admin.id}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>