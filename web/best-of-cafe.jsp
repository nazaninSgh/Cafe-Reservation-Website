<%@ page import="model.DAO.RestaurantDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.DTO.Restaurant" %>
<%@ page import="model.DAO.CafeFileDAO" %>
<%@ page import="model.DAO.ReviewDAO" %>
<%@ page import="model.DTO.CafeImage" %><%--
  Created by IntelliJ IDEA.
  User: nazanin
  Date: 4/26/2019
  Time: 5:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .checked{
        color: #ff9a06;
    }
</style>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/admin/show_all_cafe.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
    RestaurantDAO dao = new RestaurantDAO();
    ArrayList<Restaurant> restaurants = dao.selectHighRatedRestaurants();
    CafeFileDAO fileDAO = new CafeFileDAO();
    ReviewDAO reviewDAO = new ReviewDAO();
    ArrayList<CafeImage> cafeImages = new ArrayList<>();
%>
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
        <div class="wrap">
            <%
                for (Restaurant restaurant:restaurants){
                    cafeImages.clear();
                    cafeImages = fileDAO.selectImages(restaurant.getId());
            %>
            <div class="row each-wrap">
                <div class="col-md-6">
                    <p id="cafe-name"><%=restaurant.getName()%></p><br>
                    <p><%=restaurant.getEmail()%></p><br>
                    <p><%=restaurant.getAddress()%></p><br>
                    <%
                        for (int i = 0; i <reviewDAO.getRate(restaurant.getId()) ; i++) {
                    %>
                    <span class="fa fa-star checked"></span>
                    <%
                        }
                        for (int i = 0; i <(5-reviewDAO.getRate(restaurant.getId())) ; i++) {
                    %>
                    <span class="fa fa-star"></span>
                    <%
                        }
                    %>
                    <button class="btn-danger">حذف</button>
                </div>
                <img class="col-md-6" src="img/cafe/<%=cafeImages.get(0).getName()%>">
                <p id="id-code">کد شناسه کافه : <%=restaurant.getId()%></p>

            </div>
            <%
                }
            %>
        </div>
    </div>
</div>


</body>
</html>
