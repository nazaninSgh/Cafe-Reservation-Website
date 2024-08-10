<%@ page import="model.DAO.CafeFileDAO" %>
<%@ page import="model.DTO.Restaurant" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.DAO.RestaurantDAO" %>
<%@ page import="model.DTO.CafeImage" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>cafe</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,700">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:400,600,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="assets/css/--mp---Multiple-items-slider-responsive.css">
    <link rel="stylesheet" href="assets/css/Bold-BS4-CSS-Image-Slider.css">
    <link rel="stylesheet" href="assets/css/Clients-slide-1.css">
    <link rel="stylesheet" href="assets/css/Clients-slide-2.css">
    <link rel="stylesheet" href="assets/css/Clients-slide.css">
    <link rel="stylesheet" href="assets/css/Dark-NavBar-1.css">
    <link rel="stylesheet" href="assets/css/Dark-NavBar-2.css">
    <link rel="stylesheet" href="assets/css/Dark-NavBar.css">
    <link rel="stylesheet" href="assets/css/dh-header-cover-image-button.css">
    <link rel="stylesheet" href="assets/css/divider-text-middle.css">
    <link rel="stylesheet" href="assets/css/Fixed-Navbar-1.css">
    <link rel="stylesheet" href="assets/css/Fixed-Navbar-2.css">
    <link rel="stylesheet" href="assets/css/Fixed-Navbar.css">
    <link rel="stylesheet" href="assets/css/Full-Screen-Hero-Image-1.css">
    <link rel="stylesheet" href="assets/css/Full-Screen-Hero-Image.css">
    <link rel="stylesheet" href="assets/css/Pretty-Footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
    <link rel="stylesheet" href="assets/css/MUSA_carousel-product-cart-slider-1.css">
    <link rel="stylesheet" href="assets/css/MUSA_carousel-product-cart-slider.css">
    <link rel="stylesheet" href="assets/css/Simple-Slider.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/Team-with-rotating-cards.css">
    <link rel="stylesheet" href="assets/css/testimonialSlider-1.css">
    <link rel="stylesheet" href="assets/css/testimonialSlider.css">
    <link rel="stylesheet" href="assets/css/WOWSlider-about-us-1.css">
    <link rel="stylesheet" href="assets/css/WOWSlider-about-us-2.css">
    <link rel="stylesheet" href="assets/css/WOWSlider-about-us.css">
</head>
<style>
    @font-face {
        font-family: BK;
        src: url('fonts/BK.ttf') format('truetype')
    }
    body{
        font-family: "BK", cursive;
    }
</style>

<body>
<%
    ArrayList<CafeImage> images = new ArrayList<>();
    RestaurantDAO dao = new RestaurantDAO();
    ArrayList<Restaurant> restaurants = dao.selectRestaurants();
    CafeFileDAO fileDAO = new CafeFileDAO();
%>
    <nav class="navbar navbar-light navbar-expand-md fixed-top" style="background-color: #37434d;opacity: 0.88;">
        <div class="container-fluid"><a class="navbar-brand" style="color: #fff" href="cafe-owner-link.jsp"><strong>صاحب کافه هستم</strong></a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse"
                id="navcol-1" style="font-size: 20px;color: #000000;">
                <ul class="nav navbar-nav navbar-right ml-auto">
                    <%
                        if(session.getAttribute("customer_id") == null){

                    %>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="#" style="color: #fff;margin-left: 10px;margin-right: 10px;"><strong>درباره ما</strong></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="login.jsp" style="color: #fff;margin-left: 10px;margin-right: 10px;"><strong>ورود</strong></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="signup.jsp" style="color: #fff;margin-left: 10px;margin-right: 10px;"><strong>ثبت نام</strong></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="#" style="color: #fff;margin-left: 10px;margin-right: 10px;"><strong>ارتباط با ما</strong></a></li>
                <%
                    }
                    else {
                %>
                        <li class="nav-item" role="presentation"><a class="nav-link active" href="#" style="color: #fff;margin-left: 10px;margin-right: 10px;"><strong>درباره ما</strong></a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="userProf.jsp" style="color: #fff;margin-left: 10px;margin-right: 10px;"><strong>پروفایل</strong></a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#" style="color: #fff;margin-left: 10px;margin-right: 10px;"><strong>ارتباط با ما</strong></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="/logout" style="color: #fff;margin-left: 10px;margin-right: 10px;"><strong>خروج</strong></a></li>
                          <%
                              }
                          %>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid" id="splash" style="background-image: url(assets/img/back.jpg);filter: blur(1px);opacity: 0.99;">
        <h1 class="visible" style="filter: saturate(74%);color: #000000;"><strong>cafe reservation</strong></h1>
        <p>welcome</p>
    </div>
<script>
    function change() {
        window.location.href = "search.jsp";
    }
</script>
<div class="container">
    <h2 data-aos="fade" class="divider-style"><span>جست و جو</span></h2>
    <div class="row" style="margin: 30px;">
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">

                <div class="form-row">
                    <div class="col-12 col-md-9 mb-2 mb-md-0"><input class="form-control form-control-lg"  placeholder="..." style="width: 428px;height: 35px;" onclick="change()"></div>
                    <div class="col-12 col-md-3"><button class="btn btn-primary btn-block btn-lg"  style="height: 37px;font-size: 14px;width: 136px;" onclick="change()">search</button></div>
                </div>

        </div>
    </div>
</div>
    <div style="text-align:center;">
        <h2 data-aos="fade-up" class="divider-style"><span>درباره ی ما</span></h2>
    </div>
    <div class="text-center shadow-lg align-content-center" data-aos="fade-up" data-aos-offset="150px" data-aos-delay="300" id="promo" style="background-image: url(assets/img/context.jpg);padding: 40px;margin-top: 30px;height: 350px;padding-top: 80px;opacity: 0.92;filter: blur(0px) brightness(86%);background-color: #e0c5c5;">
        <div class="jumbotron" style="opacity: 0.72;">
            <h1>در باره ی ما</h1>
            <p>ما یک وبسایت.......</p>
        </div>
    </div>
    <div style="text-align:center;">
        <h2 data-aos="fade" class="divider-style"><span>بهترین ها</span></h2>
    </div>
    <section data-aos="fade" data-aos-duration="350" style="margin-top: 20px;">
        <div class="d-flex flex-row multiple-item-slider">
            <%
                for (Restaurant restaurant:restaurants) {
                    images.clear();
                    images = fileDAO.selectImages(restaurant.getId());
            %>
            <div class="justify-content-center spacer-slider">
                <figure class="figure"><img class="img-fluid figure-img" src="img/cafe/<%= images.get(0).getName()%>" onclick="goToCafe(<%= restaurant.getId()%>)" style="width: 100vw;height: 300px" alt="alt text here">
                    <figcaption style="font-family: BK;font-size: 19px" class="figure-caption"><%= restaurant.getName()%></figcaption>
                </figure>
            </div>
            <%
                }
            %>
        </div>
    </section>
    <div data-aos="fade" style="text-align:center;">
        <h2 data-aos="fade" class="divider-style"><span>نزدیک ترین ها</span></h2>
    </div>
    <section data-aos="fade" style="margin-top: 20px;">
        <div class="d-flex flex-row multiple-item-slider">
            <div class="justify-content-center spacer-slider">
                <figure class="figure"><img class="img-fluid figure-img" src="https://picsum.photos/1080/1335?image=0" alt="alt text here">
                    <figcaption class="figure-caption">Caption</figcaption>
                </figure>
            </div>
            <div class="justify-content-center spacer-slider">
                <figure class="figure"><img class="img-fluid figure-img mx-auto d-block" src="https://picsum.photos/1080/1335?image=1083" alt="alt text here">
                    <figcaption class="figure-caption">Caption</figcaption>
                </figure>
            </div>
            <div class="justify-content-center spacer-slider">
                <figure class="figure"><img class="img-fluid figure-img" src="https://picsum.photos/1080/1335?image=1076" alt="alt text here">
                    <figcaption class="figure-caption">Caption</figcaption>
                </figure>
            </div>
            <div class="justify-content-center spacer-slider">
                <figure class="figure"><img class="img-fluid figure-img" src="https://picsum.photos/1080/1335?image=1075" alt="alt text here">
                    <figcaption class="figure-caption">Caption</figcaption>
                </figure>
            </div>
            <div class="justify-content-center spacer-slider">
                <figure class="figure"><img class="img-fluid figure-img" src="https://picsum.photos/1080/1335?image=1074" alt="alt text here">
                    <figcaption class="figure-caption">Caption</figcaption>
                </figure>
            </div>
            <div class="justify-content-center spacer-slider">
                <figure class="figure"><img class="img-fluid figure-img" src="https://picsum.photos/1080/1335?image=1071" alt="alt text here">
                    <figcaption class="figure-caption">Caption</figcaption>
                </figure>
            </div>
            <div class="justify-content-center spacer-slider">
                <figure class="figure"><img class="img-fluid figure-img" src="https://picsum.photos/1080/1335?image=1060" alt="alt text here">
                    <figcaption class="figure-caption">Caption</figcaption>
                </figure>
            </div>
            <div class="justify-content-center spacer-slider">
                <figure class="figure"><img class="img-fluid figure-img d-flex" src="https://picsum.photos/1080/1335?image=1045" alt="alt text here">
                    <figcaption class="figure-caption">Caption</figcaption>
                </figure>
            </div>
        </div>
    </section>
    <div style="text-align:center;">
        <h2 data-aos="fade" class="divider-style"><span>جدید ترین ها</span></h2>
    </div>
    <div class="container-fluid" data-aos="fade">
        <section class="customer-logos slider">
            <div class="col-sm-4 col-md-3 col-lg-2 col-xl-2 slide" style="height: 150px;width: 300px;padding: 20px;"><img src="assets/img/slider_2.jpg" width="100%" style="width: 130px;"></div>
            <div class="col-sm-4 col-md-3 col-lg-2 col-xl-2 slide" style="height: 150px;width: 250px;padding: 20px;"><img src="assets/img/slider_1.jpg" width="100%" style="width: 130px;"></div>
            <div class="col-sm-4 col-md-3 col-lg-2 col-xl-2 slide" style="height: 150px;width: 250px;padding: 20px;"><img class="img-fluid" src="assets/img/1.jpg" width="100%" height="100%" style="width: 130px;opacity: 0.91;height: 104px;"></div>
            <div class="col-sm-4 col-md-3 col-lg-2 col-xl-2 slide" style="height: 150px;width: 250px;padding: 20px;"><img class="img-fluid" src="assets/img/4.jpg" width="100%" style="width: 130px;height: 104px;"></div>
            <div class="col-sm-4 col-md-3 col-lg-2 col-xl-2 slide" style="height: 150px;width: 250px;padding: 20px;"><img src="assets/img/5.jpg" width="100%" style="width: 130px;height: 104px;"></div>
            <div class="col-sm-4 col-md-3 col-lg-2 col-xl-2 slide" style="height: 150px;width: 250px;padding: 20px;"><img src="assets/img/1.jpg" width="100%" style="width: 130px;height: 104px;"></div>
            <div class="col-sm-4 col-md-3 col-lg-2 col-xl-2 slide" style="height: 150px;width: 250px;padding: 20px;"><img src="assets/img/5-1.jpg" width="100%" style="width: 130px;height: 104px;"></div>
            <div class="col-sm-4 col-md-3 col-lg-2 col-xl-2 slide" style="height: 150px;width: 250px;padding: 20px;"><img src="assets/img/6.jpg" width="100%" style="width: 130px;height: 104px;"></div>
        </section>
        <div class="row"></div>
    </div>
    <footer>
        <div class="row">
            <div class="col-sm-6 col-md-4 footer-navigation">

                <p class="links"><a href="#">خانه</a><strong> · </strong><a href="#">بلاگ ما</a><strong> · </strong><a href="#">قوانین و مقررات</a><strong> · </strong><a href="#">درباره ما</a><strong> · </strong><a href="#">سوالات متداول</a><strong> · </strong><a href="#">ارتباط با ما</a></p>

            </div>
            <div class="col-sm-6 col-md-4 footer-contacts">
                <div><span class="fa fa-map-marker footer-contacts-icon"> </span>
                    <p><span class="new-line-span">خیابان فلانی شرقی</span>ایران, تهران</p>
                </div>
                <div><i class="fa fa-phone footer-contacts-icon"></i>
                    <p class="footer-center-info email text-left"> +98 555 123456</p>
                </div>
                <div><i class="fa fa-envelope footer-contacts-icon"></i>
                    <p> <a href="#" target="_blank">support@gmail.com</a></p>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-4 footer-about">
                <h4>ارتباط با ما</h4>
                <p>شما میتوانید از طریق ایمیل و شبکه های اجتماعی ما را پیدا کنید</p>
                <div class="social-links social-icons"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-linkedin"></i></a><a href="#"><i class="fa fa-github"></i></a></div>
            </div>
        </div>
    </footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/--mp---Multiple-items-slider-responsive-1.js"></script>
    <script src="assets/js/--mp---Multiple-items-slider-responsive.js"></script>
    <script src="assets/js/bs-animation.js"></script>
    <script src="assets/js/Clients-slide-1.js"></script>
    <script src="assets/js/Clients-slide-2.js"></script>
    <script src="assets/js/Clients-slide-3.js"></script>
    <script src="assets/js/Clients-slide.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
    <script src="assets/js/Simple-Slider.js"></script>
    <script src="assets/js/testimonialSlider.js"></script>
    <script src="assets/js/WOWSlider-about-us.js"></script>
    <script src="js/indexPageController.js"></script>
</body>

</html>