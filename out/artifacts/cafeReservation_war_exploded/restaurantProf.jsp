<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="model.DAO.UserDAO" %>
<%@ page import="model.DAO.ReviewDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.DAO.MenuDAO" %>
<%@ page import="model.DTO.*" %>
<%@ page import="model.DAO.ReplyDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .checked{
        color: #ff9a06;
    }
</style>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <script src="js/scrolling.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Pinyon+Script" rel="stylesheet">
    <link rel="stylesheet" href="css/styles-merged.css">
    <link rel="stylesheet" href="css/style.min.css">
    <style>
        @font-face {
            font-family: BK;
            src: url('fonts/BK.ttf') format('truetype')
        }
        body{
            font-family: "BK", cursive;
        }
        div.box{
            margin: 2px 30px 2px 2px;
            border:1px solid saddlebrown;padding:8px;background-color: rgba(135, 68, 0, 0.05)
        }
    </style>
        <%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    int usid=0;
   // Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
    Restaurant restaurant = (Restaurant) session.getAttribute("restaurant");
    ReviewDAO dao = new ReviewDAO();
    ArrayList<Review> reviews = dao.getCafeReviews(Integer.parseInt(request.getParameter("id")));
    //ArrayList<Review> reviews = dao.getCafeReviews(restaurant.getId());
    UserDAO userDAO = new UserDAO();
    if (session.getAttribute("customer_id")!=null){
        User user = userDAO.getUserById((Integer) session.getAttribute("customer_id"));
        usid = user.getId();
    }
    int rate = dao.getRate(restaurant.getId());
    MenuDAO menuDAO = new MenuDAO();
    ArrayList<MenuItem> menuItems = menuDAO.selectItems(restaurant.getId());
    ArrayList<Reply> replies = new ArrayList<>();
    ReplyDAO replyDAO = new ReplyDAO();

%>


</head>
<body>
<script>
    function goto() {
        window.location.href = "index.jsp";
    }
</script>
<nav class="navbar navbar-default navbar-fixed-top probootstrap-navbar">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div id="navbar-collapse" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">

            </ul>
            <ul class="nav navbar-nav navbar-right" style="font-size: 22px">
                <li><a style="" onclick="goto()">صفحه اصلی</a></li>
                <li><a href="#contact" data-nav-section="contact">ارتباط با ما</a></li>
                <li><a href="#reservation" data-nav-section="reservation">رزرو</a></li>
                <li><a href="#review" data-nav-section="review">نظرات</a></li>
                <li><a href="#menu" data-nav-section="menu">منو</a></li>
                <li><a href="#welcome" data-nav-section="welcome">درباره کافه</a></li>
            </ul>
        </div>
        <%
            for (int i = 0; i <rate ; i++) {
        %>
        <span class="fa fa-star checked"></span>
        <%
            }
            for (int i = 0; i <(5-rate) ; i++) {
        %>
        <span class="fa fa-star"></span>
        <%
            }
        %>
    </div>
</nav>

<section id="welcome" class="flexslider" data-section="welcome" style="height: 100vh">
    <ul class="slides" style="height: 100vh">
        <%
            for (int i = 0; i <restaurant.getImage().size() ; i++) {
        %>
        <li class="overlay" data-stellar-background-ratio="0.5" style="height: 100vh">
            <img src="img/cafe/<%= restaurant.getImage().get(i).getName()%>" style="height: 100vh">
        </li>
        <%
            }
        %>
    </ul>
</section>

<section class="probootstrap-section probootstrap-bg-white">
    <div class="container">
        <div class="row">
            <div class="col-md-5 col-md-push-1 probootstrap-animate">
                <p><img src="img/cafe/<%= restaurant.getImage().get(0).getName()%>" alt="" class="img-responsive"></p>
            </div>
            <div class="col-md-2"></div>
            <div class="col-md-5 text-center probootstrap-animate" style="float:right;direction: rtl">
                <div class="probootstrap-heading dark">
                    <strong class="primary-heading" style="font-size: 40px;font-family: BK">${restaurant.getName()}</strong>
                    <br><br><br>
                    <p class="secondary-heading" style="font-size: 22px"> ${restaurant.getDescription()}</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="menu" class="probootstrap-section-bg overlay" style="background-image: url(img/cafe-menu.jpg);"  data-stellar-background-ratio="0.5"  data-section="menu">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center probootstrap-animate">
                <div class="probootstrap-heading">

                    <h3 class="secondary-heading">Our Menu</h3>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="probootstrap-section probootstrap-bg-white">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <ul class="menus">
                    <%
                        for (MenuItem menuItem:menuItems) {

                    %>
                    <li>
                        <%--<figure class="image"><img src="img/post1.jpg" ></figure>--%>
                        <div class="text">
                            <span class="price"><%=menuItem.getPrice()%></span>
                            <h3><%=menuItem.getName()%></h3>
                            <p><%=menuItem.getIngredients()%></p>
                        </div>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </div>
</section>
<div id="review" class="card shadow-none" data-aos="fade" style="direction: rtl;padding: 10px;padding-bottom: 750px;background-color: rgba(180,102,19,0.77)">
    <div class="card-header">
        <h3 style="margin-right: 40px;font-family: BK">نظرات</h3>
    </div>
    <div class="card-body" style="height:233px;">
        <ul class="list-group">
            <%
                for (Review review:reviews){
                    int userId = review.getCustomer_id();
                    User user = userDAO.getUserById(userId);
            %>
            <li class="list-group-item" style="margin-bottom:6px;margin-left: 40px">
                <div class="media">
                    <div></div>
                    <div class="media-body">
                        <div class="media" style="overflow:visible;">
                            <div><img src="img/user/<%= user.getImageName()%>" class="mr-3" style="width: 35px; height:35px;"></div>
                            <div class="media-body" style="overflow:visible;font-size: 20px">
                                <div class="row">
                                    <div class="col-md-12">
                                        <strong><p><a href="userProf.jsp?id="<%= user.getId()%>><%= user.getName()%>&nbsp;<%=user.getLastname()%></a></strong>&nbsp;<br><%= review.getComment()%> <br>
                                        <small class="text-muted"><%= review.getDate()%></small></p>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <%
                }
            %>
        </ul><button class="btn btn-light" type="button" style="margin-right: 40px;margin-top:-9px;"><a href="review.jsp?id=${restaurant.getId()}">نظر دهید</a></button></div>
</div>

<section id="reservation" class="probootstrap-section probootstrap-bg-white">
    <div class="container">
        <div class="col-md-12 probootstrap-animate">
            <form action="reservation?id=${restaurant.getId()}" method="post" class="probootstrap-form">
                <%
                    if (request.getAttribute("error") != null){
                %>
                <div class="btn-danger" style="text-align: center;direction: rtl;padding: 10px;font-size: 18px">
                    <%= request.getAttribute("error")%>
                </div>
                <%
                    }
                %>
                <%
                    if (request.getAttribute("crushed") != null){
                %>
                <div class="btn-success" style="text-align: center;direction: rtl;padding: 10px;font-size: 18px">
                    <%= request.getAttribute("crushed")%>
                </div>
                <%
                    }
                %>
                <div class="row text-center">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="people">تعداد نفرات</label>
                            <div class="form-field">
                                <i class="icon icon-chevron-down"></i>
                                <input name="people" id="people" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="date">تاریخ</label>
                            <div class="form-field">
                                <i class="icon icon-calendar"></i>
                                <input name="date" type="text" id="date" class="form-control">
                                <script type="text/javascript">
                                    $(function () {
                                        $('#date').datetimepicker();
                                    });
                                </script>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <input  style="font-size: 18px" type="submit" name="submit" id="submit" value="رزرو" class="btn btn-lg btn-primary btn-block">
                    </div>
                </div>
            </form>
        </div>
    </div>
    </div>
</section>

<section id="contact" class="probootstrap-footer">
    <div class="container">
        <div class="row">
            <div class="col-md-6 probootstrap-animate">
                <div class="probootstrap-footer-widget">
                    <h3>Locations</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <p> streets<br>${restaurant.getAddress()}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 probootstrap-animate">
                <div class="probootstrap-footer-widget">
                    <h3>Open Hours</h3>
                    <div class="row">
                        <h3>Email</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <p> email <br>${restaurant.getEmail()}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 probootstrap-animate">
                <div class="probootstrap-footer-widget">
                    <h3>Open Hours</h3>
                    <div class="row">
                        <div class="col-md-4">
                            <p>Monday - Thursday <br> 5:30pm - 10:00pm</p>
                        </div>
                        <div class="col-md-4">
                            <p>Friday - Sunday <br> 5:30pm - 10:00pm</p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/-Filterable-Cards-.js"></script>
<script src="assets/js/bs-animation.js"></script>
<script src="assets/js/Card-Carousel.js"></script>
<script src="assets/js/custom.js"></script>
<script src="assets/js/custom.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
<script src="assets/js/scripts.js"></script>
<script src="assets/js/scripts.min.js"></script>
<script src="assets/js/scrolling.js"></script>
<script src="js/scripts.min.js"></script>
<script src="js/custom.min.js"></script>
</body>
</html>

