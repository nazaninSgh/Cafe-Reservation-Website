<%@ page import="model.DAO.ReservationDAO" %>
<%@ page import="model.DAO.ReviewDAO" %><%--
  Created by IntelliJ IDEA.
  User: nazanin
  Date: 4/8/2019
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<link href="css/restaurant/review.css" rel="stylesheet" type="text/css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    HttpSession session1 = request.getSession();
    if (session1.getAttribute("customer_id") == null){
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }
    int cafeId = Integer.parseInt(request.getParameter("id"));
    ReservationDAO dao = new ReservationDAO();
    String name = dao.getCafeNameById(cafeId);
%>
<div class="cafe-name">
    <h1><%= name%></h1>
</div>
<br><br>
<div class="container-fluid">
    <div class="review">
        <form action="review?id=<%= cafeId%>" method="post">
            <div class="q">
                <p>نظر شما درباره این کافه چیست؟</p>
            </div>
            <div class="comment">
                <input type="text" name="comment">
            </div>
            <br><br>
            <div class="">
                <div class="">
                    <div class="q">
                        <p>شما به طور کلی به این کافه چه امتیاز میدهید؟</p>
                    </div>
                        <label class="ql">
                            <img src="img/great.png">
                            <input type="radio" name="ql" value="5">عالی
                        </label>
                        <label class="ql">
                            <img src="img/good.png">
                            <input type="radio" name="ql" value="4">خوب
                        </label>
                        <label class="ql">
                            <img src="img/ok.png">
                            <input type="radio" name="ql" value="3">متوسط
                        </label>
                        <label class="ql">
                            <img src="img/bad.png">
                            <input type="radio" name="ql" value="2">بد
                        </label>
                        <label class="ql">
                            <img src="img/awful.png">
                            <input type="radio" name="ql" value="1">فاجعه
                        </label>
                </div>
                <br><br><br><br><br><br><br><br><br><br><br>
                <div class="">
                    <div class="q">
                        <p>سطح قیمت این کافه از نظر شما چگونه است؟</p>
                    </div>
                        <label class="ql">
                            <i class="fas fa-meh-rolling-eyes"></i>
                            <input type="radio" name="pl" value="گرون">گرون
                        </label>
                        <label class="ql">
                            <i class="fas fa-smile-beam"></i>
                            <input type="radio" name="pl" value="متوسط">متوسط
                        </label>
                        <label class="ql">
                            <i class="fas fa-grin-hearts"></i>
                            <input type="radio" name="pl" value="ارزون">ارزون
                        </label>
                    </div>
                <br><br><br><br><br><br><br><br><br><br><br>
                <div class="">
                    <div class="q">
                        <p>این کافه را بیشتر برای چه مناسبتی انتخاب میکنید؟</p>
                    </div>
                    <label class="occasion">
                        <input type="radio" name="occasion" value="خانوادگی">خانوادگی
                        <span class="checkmark"></span>
                    </label>
                    <label class="occasion">
                        <input type="radio" name="occasion" value="دوستانه">دوستانه
                        <span class="checkmark"></span>
                    </label>
                    <label class="occasion">
                        <input type="radio" name="occasion" value="کاری">کاری
                        <span class="checkmark"></span>
                    </label>
                    <label class="occasion">
                        <input type="radio" name="occasion" value="قرار دو نفره">قرار دو نفره
                        <span class="checkmark"></span>
                    </label>
                    <label class="occasion">
                        <input type="radio" name="occasion" value="جشن">جشن
                        <span class="checkmark"></span>
                    </label>
                </div>
            </div>
            <br><br><br><br><br><br>
            <input class="btn" type="submit" value="ثبت نظر">
        </form>
    </div>
</div>
<script>
    $("input[name='ql']").click(function() {
        $("label").removeClass("select-ql");
        if ($(this).is(":checked")) { $(this).parent().addClass("select-ql"); }
    });
    $("input[name='pl']").click(function() {
        $("label").removeClass("select-pl");
        if ($(this).is(":checked")) { $(this).parent().addClass("select-pl"); }
    });
</script>
</body>
</html>
