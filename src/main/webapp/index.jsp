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

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Nunito:600,700" rel="stylesheet"> 
        
        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>

<%@ include file="/WEB-INF/view/NavBar.jsp" %>

        <!-- Carousel Start -->
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
        <!-- Carousel End -->
        
        <!-- Food Start -->
        <div class="food">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-4">
                        <div class="food-item">
                            <i class="flaticon-snack"></i>
                            <h2>Appetizers</h2>
                            <p>
                                Start your meal with our mouth-watering appetizers, featuring a variety of flavors that will whet your appetite. From crispy bites to flavorful soups, there’s something for everyone to enjoy before the main course.</p>
                            <a href="">View Menu</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="food-item">
                            <i class="flaticon-burger"></i>
                            <h2>Main Courses</h2>
                            <p>
                            Indulge in our hearty and satisfying main courses, crafted with the freshest ingredients and packed with bold flavors. Whether you crave local specialties or international delights, we have something to satisfy every palate. </p>
                            <a href="">View Menu</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="food-item">
                            <i class="flaticon-cocktail"></i>
                            <h2>Desserts & Beverages</h2>
                            <p>
                               Treat yourself to our selection of delightful desserts and refreshing beverages. From sweet treats to thirst-quenching drinks, our menu offers the perfect ending to your meal.</p>
                            <a href="">View Menu</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Food End -->
        
        
        <!-- Menu Start -->
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
                                        <div class="menu-img">
                        					<img src="${product.imageUrl}" alt="${product.name}" class="img-fluid">
                                        </div>
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
                    <div class="testimonial-item">
                        <div class="testimonial-img">
                            <img src="img/testimonial-1.jpg" alt="Image">
                        </div>
                        <p>
                           The food at ABC Restaurent is absouletly amazing ! I have never had such a flavorful meal, and the atmosphere is so welcoming . I cannot wait to come back </p>
                        <h2>Sehansa</h2>
                        <h3>Food Blogger</h3>
                    </div>
                    <div class="testimonial-item">
                        <div class="testimonial-img">
                            <img src="img/testimonial-2.jpg" alt="Image">
                        </div>
                        <p>
                           A perfect place for a family dinner. The service is top-notch, </p>
                        <h2>Tehan Perera </h2>
                        <h3>Travel Enthusiat </h3>
                    </div>
                    <div class="testimonial-item">
                        <div class="testimonial-img">
                            <img src="img/testimonial-3.jpg" alt="Image">
                        </div>
                        <p>
                            I was blown away by the quality of the ingredients and the creativity of the menu. The chef is a true artist, and every dish is a masterpiece!</p>
                        <h2>Shen Kosta</h2>
                        <h3>Chef and Restaurateur</h3>
                    </div>

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
