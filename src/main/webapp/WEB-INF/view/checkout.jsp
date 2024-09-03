<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <meta content="width=device-width, initial-scale=1.0" name="viewport">
   <meta content="Free Website Template" name="keywords">
   <meta content="Free Website Template" name="description">
   <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
   <link href="css/style.css" rel="stylesheet">
 </head>
<body>
   <%@ include file="NavBar.jsp" %>
  
    <div class="page-header" style="background-image: url('img/image03.jpeg'); background-size: cover; background-position: center;">
       <div class="container">
           <div class="row">
               <div class="col-12">
                   <h2>Checkout</h2>
               </div>
           </div>
       </div>
   </div>
   <div class="cart">
       <div class="container">
           <form action="cart?action=checkout" method="post">
               <!-- Full Name Field -->
               <div class="form-group">
                   <label for="fullName">Full Name</label>
                   <c:choose>
                       <c:when test="${sessionScope.user != null}">
                           <!-- If user is logged in, show read-only field with user's name -->
                           <input type="text" class="form-control" id="fullName" name="fullName"
                                  value="<c:out value='${sessionScope.user.username}'/>" readonly required>
                       </c:when>
                       <c:otherwise>
                           <!-- If user is not logged in, show editable field -->
                           <input type="text" class="form-control" id="fullName" name="fullName" required>
                       </c:otherwise>
                   </c:choose>
               </div>
              
               <!-- Email Address Field -->
               <div class="form-group">
                   <label for="email">Email Address</label>
                   <c:choose>
                       <c:when test="${sessionScope.user != null}">
                           <!-- If user is logged in, show read-only field with user's email -->
                           <input type="email" class="form-control" id="email" name="email"
                                  value="<c:out value='${sessionScope.user.email}'/>" readonly required>
                       </c:when>
                       <c:otherwise>
                           <!-- If user is not logged in, show editable field -->
                           <input type="email" class="form-control" id="email" name="email" required>
                       </c:otherwise>
                   </c:choose>
               </div>
               <!-- Other Fields -->
               <div class="form-group">
                   <label for="address">Address</label>
                   <input type="text" class="form-control" id="address" name="address" required>
               </div>
               <div class="form-group">
                   <label for="city">City</label>
                   <input type="text" class="form-control" id="city" name="city" required>
               </div>
               <div class="form-group">
                   <label for="zipCode">Zip Code</label>
                   <input type="text" class="form-control" id="zipCode" name="zipCode" required>
               </div>
               <div class="form-group">
                   <label for="phone">Phone Number</label>
                   <input type="text" class="form-control" id="phone" name="phone" required>
               </div>
               <div class="form-group">
                   <label for="paymentMethod">Payment Method</label>
                   <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                       <option value="credit_card">Credit Card</option>
                       <option value="paypal">PayPal</option>
                       <option value="cash_on_delivery">Cash on Delivery</option>
                   </select>
               </div>
               <button type="submit" class="btn btn-warning btn-block">Complete Purchase</button>
           </form>
       </div>
   </div>
   <%@ include file="Footer.jsp" %>
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>


