<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>ABC Restaurant</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free Website Template" name="keywords">
        <meta content="Free Website Template" name="description">

        <link href="img/favicon.ico" rel="icon">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Nunito:600,700" rel="stylesheet"> 
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />


        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>

<%@ include file="/WEB-INF/view/NavBar.jsp" %>

        <div class="carousel">
            <div class="container-fluid">
                <div class="owl-carousel">
                    <div class="carousel-item">
                        <div class="carousel-img">
                            <img src="img/carousel-1.jpg" alt="Image">
                        </div>
                        <div class="carousel-text">
                            <h1>Best <span>Quality</span> Ingredients</h1>
                            <p>
                                Bringing real food traditions to the hearts of food lovers.
                            </p>
                            <div class="carousel-btn">
                                <a class="btn custom-btn" href="menu">View Menu</a>
                                <a class="btn custom-btn" href="booking">Book Table</a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="carousel-img">
                            <img src="img/carousel-2.jpg" alt="Image">
                        </div>
                        <div class="carousel-text">
                            <h1>Your <span>Wondrful </span> Flavors </h1>
                            <p>
                            We want you to sit down and enjoy your meal just like the way you enjoy your homemade dishes! We have embarked on this journey and e are glad that you have taken the time off of your schedule to know our story to experience our experience.
                             </p>
                            <div class="carousel-btn">
                                <a class="btn custom-btn" href="">View Menu</a>
                                <a class="btn custom-btn" href="">Book Table</a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="carousel-img">
                            <img src="img/carousel-4.jpg" alt="Image">
                        </div>
                        <div class="carousel-text">
                            <h1>Fastest Order <span>Delivery</span></h1>
                               <p>
                                   We understand the value of your time, and that’s why we are committed to delivering your orders at lightning speed. Whether it’s a quick snack or a full meal, we ensure that your food reaches you fresh and fast, so you can enjoy every bite without any delay!
                              </p>

                            <div class="carousel-btn">
                                <a class="btn custom-btn" href="">View Menu</a>
                                <a class="btn custom-btn" href="">Book Table</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="food">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-4">
                        <div class="food-item">
                            <i class="flaticon-snack"></i>
                            <h2>Appetizers</h2>
                            <p>
                                Start your meal with our mouth-watering appetizers, featuring a variety of flavors that will whet your appetite. From crispy bites to flavorful soups, there’s something for everyone to enjoy before the main course.</p>
                           
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="food-item">
                            <i class="flaticon-burger"></i>
                            <h2>Main Courses</h2>
                            <p>
                            Indulge in our hearty and satisfying main courses, crafted with the freshest ingredients and packed with bold flavors. Whether you crave local specialties or international delights, we have something to satisfy every palate. </p>
                          
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="food-item">
                            <i class="flaticon-cocktail"></i>
                            <h2>Desserts & Beverages</h2>
                            <p>
                               Treat yourself to our selection of delightful desserts and refreshing beverages. From sweet treats to thirst-quenching drinks, our menu offers the perfect ending to your meal.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="special-offers my-5">
    <div class="container">
        <div class="section-header text-center">
            <p>Exclusive Deals</p>
            <h2>Special Offers Just For You</h2>
        </div>
        <div class="row">
            <c:forEach var="promotion" items="${promotionList}">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="offer-item card h-100">
                        <img src="${promotion.imageUrl}" class="card-img-top" alt="${promotion.title}">
                        <div class="card-body text-center">
                            <h3 class="card-title">${promotion.title}</h3>
                            <p class="card-text">${promotion.description}</p>
                            <h4><strong>${promotion.offRate}%</strong> Off</h4>
                            <a href="menu" class="btn custom-btn mt-3">Claim Offer</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>


        <div class="menu">
            <div class="container">
                <div class="section-header text-center">
                    <p>Food Menu</p>
                    <h2>Delicious Food Menu</h2>
                </div>
                <div class="menu-tab">
                    
                    <div class="tab-content">
                        <div id="burgers" class="container tab-pane active">
                            <div class="row">
                                <div class="col-lg-7 col-md-12">
                                 <c:forEach var="product" items="${productList}">
                                    <div class="menu-item">
<img src="${product.imageUrl}" alt="${product.name}" 
         style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); margin-right: 15px;">
                                        <div class="menu-text">
                                            <h3><span>${product.name}</span> <strong>${product.price}</strong></h3>
                                            <p>${product.description}</p>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>                                <div class="col-lg-5 d-none d-lg-block">
                                    <img src="img/menu.jpg" alt="Image">
                                </div>
                            </div>
                        </div>
                        
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Menu End -->
        
       
        
        <!-- Testimonial Start -->
        <div class="testimonial">
            <div class="container">
                <div class="owl-carousel testimonials-carousel">
                    <c:forEach var="feedback" items="${feedbackList}">
                    <div class="testimonial-item">
                        <div class="testimonial-img">
                        </div>
                         <p>${feedback.comments}</p>
                        <h2>${feedback.name}</h2>
                        <h3>${feedback.email}</h3>
                    </div>
                     </c:forEach>

                </div>
            </div>
        </div>
        <!-- Testimonial End -->
        
     

       <%@ include file="/WEB-INF/view/Footer.jsp" %>


        

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        
        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
