<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feature List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Feature List</h2>
        <a href="dashbord.jsp" class="btn btn-primary mb-3">Back</a>
        <a href="featuresadmin?action=new" class="btn btn-primary mb-3">Add New Feature</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Icon</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="feature" items="${featureList}">
                    <tr>
                        <td>${feature.id}</td>
                        <td>${feature.title}</td>
                        <td>${feature.description}</td>
                        <td><img src="${feature.icon}" width="50"></td>
                        <td><img src="${feature.imageUrl}" width="50"></td>
                        <td>
                            <a href="featuresadmin?action=edit&id=${feature.id}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="featuresadmin?action=delete&id=${feature.id}" class="btn btn-danger btn-sm" 
                               onclick="return confirm('Are you sure you want to delete this feature?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
