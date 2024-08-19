<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gallery List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Gallery List</h2>
        
         <a href="dashbord.jsp" class="btn btn-primary mb-3">Back</a>
         <a href="gallery?action=new" class="btn btn-primary mb-3">Add New Gallery Item</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="gallery" items="${galleries}">
                    <tr>
                        <td>${gallery.id}</td>
                        <td>${gallery.title}</td>
                        <td>${gallery.description}</td>
                        <td><img src="${gallery.imageUrl}" alt="${gallery.title}" width="100"></td>
                        <td>
                            <a href="gallery?action=edit&id=${gallery.id}" class="btn btn-warning">Edit</a>
                            <a href="gallery?action=delete&id=${gallery.id}" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
