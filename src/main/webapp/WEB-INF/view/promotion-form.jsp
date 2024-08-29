<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Promotion Form</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">${promotion != null ? "Edit Promotion" : "Add New Promotion"}</h2>
    <form action="promotions" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="${promotion != null ? 'update' : 'insert'}">
        <c:if test="${promotion != null}">
            <input type="hidden" name="promotionId" value="${promotion.promotionId}">
        </c:if>
        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" class="form-control" id="title" name="title" value="${promotion != null ? promotion.title : ''}" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description" required>${promotion != null ? promotion.description : ''}</textarea>
        </div>
        <div class="form-group">
            <label for="offRate">Off Rate (%)</label>
            <input type="number" class="form-control" id="offRate" name="offRate" step="0.01" value="${promotion != null ? promotion.offRate : ''}" required>
        </div>
        <div class="form-group">
            <label for="image">Image</label>
            <input type="file" class="form-control-file" id="image" name="image" ${promotion == null ? 'required' : ''}>
            <c:if test="${promotion != null}">
                <img src="${promotion.imageUrl}" alt="${promotion.title}" width="100" class="mt-2">
            </c:if>
        </div>
        <button type="submit" class="btn btn-primary">${promotion != null ? "Update" : "Add"} Promotion</button>
    </form>
</div>
</body>
</html>
