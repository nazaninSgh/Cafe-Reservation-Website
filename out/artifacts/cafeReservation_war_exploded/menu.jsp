<%--
  Created by IntelliJ IDEA.
  User: nazanin
  Date: 5/16/2019
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="css/admin/menu.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="admin-panel clearfix">
    <div class="slidebar">
        <div class="logo">
            <p>مدیریت</p>
        </div>
        <ul>
            <li><a href="show-all-cafe.jsp" id="targeted">کافه ها<i class="fas fa-coffee"></i></a></li>
            <li><a href="best-of-cafe.jsp">بالاترین امتیازها<i class="fas fa-star"></i></a></li>
            <li><a href="restaurant-info.jsp">افزودن کافه<i class="fas fa-plus"></i></a></li>
            <li><a href="menu.jsp">منوها<i class="fas fa-list"></i></a></li>
            <li><a href="messages.jsp">پیام ها<i class="fas fa-envelope"></i></a></li>
            <li><a href="send-message.jsp">نوشتن پیام<i class="far fa-edit"></i></a></li>
            <li><a href="#">تنظیمات<i class="fas fa-tools"></i></a></li>
            <li><a href="#">کاربران<i class="fas fa-user"></i></a></li>
            <li><a href="#">آمار<i class="far fa-chart-bar"></i></a></li>
            <li><a href="#">اخبار<i class="far fa-bell"></i></a></li>
        </ul>
    </div>

    <div id="content">
        <div class="container">

            <div id="wrap" class="wrap">
                <div style="padding-left: 5%;padding-right: 5%;padding-top: 3%;padding-bottom: 5%;width: 85%;
    margin: 30px;" name="search">
                    <input style="border-radius: 5px;color: black;
    outline: none;
    padding: 5px 40px;
    text-align: right;
    direction: rtl;" type="text" id="search_id" name="search_id" placeholder="کد شناسه کافه">
                    <button class="btn-success" onclick="searchInfo()">نمایش منو</button>
                </div>
                <div id="add-form" style="display: none" class="form-wrap">

                    <br><br>
                    <form action="menu" method="post">
                        <div class="form-group">
                            <i class="fa fa-coffee"></i>
                            <input type="text" name="cafe_id" class="form-control" placeholder="کد کافه">
                        </div>
                        <div class="form-group">
                            <i class="fa fa-edit"></i>
                            <input type="text" name="name" class="form-control" placeholder="اسم">
                        </div>
                        <div class="form-group">
                            <i class="fa fa-utensils"></i>
                            <input type="text" name="ing" class="form-control" placeholder="محتویات">
                        </div>
                        <div class="form-group">
                            <i class="fa fa-dollar-sign"></i>
                            <input type="text" name="price" class="form-control" placeholder="قیمت">
                        </div>
                        <button class="btn-success" type="submit">اضافه کن</button>
                    </form>
                </div>


            </div>
            <div style="padding: 30px" id="mylocation"></div>
        </div>
    </div>
</div>

<script src="js/search_menu.js"></script>
</body>
</html>
