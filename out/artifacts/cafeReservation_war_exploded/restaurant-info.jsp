<%--
  Created by IntelliJ IDEA.
  User: nazanin
  Date: 3/30/2019
  Time: 11:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
    <link href="css/admin/restaurant-info.css" rel="stylesheet" type="text/css">
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
            <div class="row">
                <%--<div class="col-md-2"></div>--%>
                <div class="">
                    <div class="form-wrap">
                        <form action="restaurant-info" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <i class="fa fa-user"></i>
                                <input type="text" name="name" class="form-control" placeholder="اسم کافه">
                            </div>
                            <div class="form-group">
                                <i class="fa fa-map-marker"></i>
                                <input type="text" name="address" class="form-control" placeholder="آدرس">
                            </div>
                            <div class="form-group">
                                <i class="fa fa-envelope"></i>
                                <input type="email" name="email" class="form-control" placeholder="ایمیل">
                            </div>
                            <div class="form-group">
                                <i class="fa fa-pencil"></i>
                                <textarea style="color: black" rows="4" cols="50" name="description" class="form-control" placeholder="توضیحات کافه"></textarea>
                                <%--<input type="password" name="pass" class="form-control" placeholder="password">--%>
                            </div>
                            <div class="form-group">
                                <%--<i class="fa fa-pencil"></i>--%>
                                <input type="number" name="table" class="form-control" placeholder="ظرفیت">
                            </div>
                            <div class="form-group">
                                <input type="file" name="file" id="file" class="inputfile" multiple>
                                <label for="file"><i class="fas fa-camera"></i></label>
                            </div>
                            <button class="btn" type="submit">اضافه کردن</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>
