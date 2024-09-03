<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Promotion List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Promotions</h2>
    <a href="dashbord.jsp" class="btn btn-primary mb-3">Back</a>
    <a href="promotions?action=new" class="btn btn-primary mb-3">Add New Promotion</a>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Image</th>
            <th>Title</th>
            <th>Description</th>
            <th>Off Rate (%)</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="promotion" items="${promotionList}">
            <tr>
                <td><img src="${promotion.imageUrl}" alt="${promotion.title}" width="100"></td>
                <td>${promotion.title}</td>
                <td>${promotion.description}</td>
                <td>${promotion.offRate}</td>
                <td>
                    <a href="promotions?action=edit&promotionId=${promotion.promotionId}" class="btn btn-warning btn-sm">Edit</a>
                    <a href="promotions?action=delete&promotionId=${promotion.promotionId}" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
