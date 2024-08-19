<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gallery Form</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>${gallery != null ? 'Edit Gallery' : 'Add New Gallery'}</h2>
        <form action="gallery?action=${gallery != null ? 'update' : 'insert'}" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${gallery != null ? gallery.id : ''}">
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" name="title" class="form-control" value="${gallery != null ? gallery.title : ''}" required>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea name="description" class="form-control" required>${gallery != null ? gallery.description : ''}</textarea>
            </div>
            <div class="form-group">
                <label for="image">Image</label>
                <input type="file" name="image" class="form-control-file" required>
                <c:if test="${gallery != null}">
                    <img src="${gallery.imageUrl}" width="100" class="mt-2">
                </c:if>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</body>
</html>
