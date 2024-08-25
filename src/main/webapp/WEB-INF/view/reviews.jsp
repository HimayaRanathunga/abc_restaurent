<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="User Reviews" name="description">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <title>Reviews</title>
    </head>
    
    <body>
        <%@ include file="NavBar.jsp" %>

        <!-- Page Header Start -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Customer Reviews</h2>
                    </div>
                </div>
            </div>
        </div>
        
                <!-- Display Success or Error Message -->
        <div class="container mt-4">
            <c:if test="${not empty param.success}">
                <div class="alert alert-success" role="alert">
                    ${param.success}
                </div>
            </c:if>
            <c:if test="${not empty param.error}">
                <div class="alert alert-danger" role="alert">
                    ${param.error}
                </div>
            </c:if>
        </div>

        <!-- Reviews Section Start -->
        <div class="container mt-5">
            <!-- Display Existing Reviews -->
            <div class="row">
                <div class="col-12">
                    <h3>Recent Reviews</h3>
                    <div class="reviews-list">
                        <c:forEach var="review" items="${reviewList}">
                            <div class="review-item border rounded p-3 mb-4 shadow-sm">
                                <h5 class="review-author">${review.author}</h5>
                                <p class="text-muted mb-2">${review.date}</p>
                                <div class="review-rating mb-2">
                                    <c:forEach var="i" begin="1" end="${review.rating}">
                                        <i class="fas fa-star text-warning"></i>
                                    </c:forEach>
                                    <c:forEach var="i" begin="1" end="${5 - review.rating}">
                                        <i class="far fa-star text-warning"></i>
                                    </c:forEach>
                                </div>
                                <p>${review.comment}</p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- Submit a Review Section -->
            <div class="row mt-5">
                <div class="col-12">
                    <h3>Submit Your Review</h3>
                    <form action="submitReview" method="post" class="p-4 border rounded shadow-sm">
                        <div class="form-group">
                            <label for="author">Name</label>
                            <input type="text" name="author" class="form-control" id="author" placeholder="Enter your name" required>
                        </div>

                        <div class="form-group">
                            <label for="rating">Rating</label>
                            <select name="rating" id="rating" class="form-control" required>
                                <option value="5">5 - Excellent</option>
                                <option value="4">4 - Very Good</option>
                                <option value="3">3 - Good</option>
                                <option value="2">2 - Fair</option>
                                <option value="1">1 - Poor</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="comment">Comment</label>
                            <textarea name="comment" id="comment" rows="4" class="form-control" placeholder="Share your experience" required></textarea>
                        </div>

                        <button type="submit" class="btn btn-primary">Submit Review</button>
                    </form>
                </div>
            </div>
        </div>
        
        <div class="container mt-4">
            <c:if test="${not empty requestScope.success}">
                <div class="alert alert-success" role="alert">
                    ${requestScope.success}
                </div>
            </c:if>
            <c:if test="${not empty requestScope.error}">
                <div class="alert alert-danger" role="alert">
                    ${requestScope.error}
                </div>
            </c:if>
        </div>
        
        <!-- Reviews Section End -->

        <%@ include file="Footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
