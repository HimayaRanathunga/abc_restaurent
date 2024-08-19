<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feature Form</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2><c:out value="${feature == null ? 'Add' : 'Edit'}" /> Feature</h2>
        <form action="featuresadmin" method="post" enctype="multipart/form-data">
            <c:if test="${feature != null}">
                <input type="hidden" name="id" value="${feature.id}">
                <input type="hidden" name="action" value="update">
            </c:if>
            <c:if test="${feature == null}">
                <input type="hidden" name="action" value="insert">
            </c:if>
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" id="title" name="title" value="${feature.title}">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description">${feature.description}</textarea>
            </div>
            <div class="form-group">
                <label for="icon">Icon</label>
                <input type="file" class="form-control" id="icon" name="icon">
                <c:if test="${feature != null && feature.icon != null}">
                    <img src="${feature.icon}" width="50">
                </c:if>
            </div>
            <div class="form-group">
                <label for="image">Image</label>
                <input type="file" class="form-control" id="image" name="image">
                <c:if test="${feature != null && feature.imageUrl != null}">
                    <img src="${feature.imageUrl}" width="50">
                </c:if>
            </div>
            <button type="submit" class="btn btn-success"><c:out value="${feature == null ? 'Add' : 'Update'}" /> Feature</button>
        </form>
    </div>
</body>
</html>
