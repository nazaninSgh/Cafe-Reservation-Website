<%@ page import="model.DAO.MessagesDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.DTO.Message" %><%--
  Created by IntelliJ IDEA.
  User: nazanin
  Date: 5/17/2019
  Time: 10:19 PM
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
    <link href="css/admin/inbox.css" rel="stylesheet" type="text/css">
</head>
<body>
<script>
    $(function () {
        $('div button').on('click', function (e) {
            e.preventDefault();
            var page = $(this).attr('href');
            $('.my').load(page);
        });
    });
</script>
<script>

    function reply() {
        var newdiv  = document.createElement('div');
        newdiv.className+='rep';

        var sub = document.createElement('input');
        sub.id='to';
        sub.name = "to";
        sub.innerHTML = "ارسال به : "
        sub.value = document.getElementById("author").innerHTML;

        var newf  = document.createElement('form');
        newf.className+='item';
        newf.action = "/message";
        newf.method = "post";

        var newTxt = document.createElement('textarea');
        newTxt.id='response';
        newTxt.name = "response";

        var newButton = document.createElement('button');
        newButton.innerHTML = "ارسال";
        newButton.className+='btn-success';
        newButton.type = "submit";

        newf.appendChild(newTxt);
        newf.appendChild(newButton);

        newf.appendChild(newTxt);
        newf.appendChild(newButton);
        newf.appendChild(sub);
        newdiv.appendChild(newf);

        document.querySelector('.my-wrap').appendChild(newdiv);
    }
</script>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    MessagesDAO messagesDAO = new MessagesDAO();

    Message message = messagesDAO.getMessage(id);
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
            <li><a href="#">نوشتن پیام<i class="far fa-edit"></i></a></li>
            <li><a href="#">تنظیمات<i class="fas fa-tools"></i></a></li>
            <li><a href="#">کاربران<i class="fas fa-user"></i></a></li>
            <li><a href="#">آمار<i class="far fa-chart-bar"></i></a></li>
            <li><a href="#">اخبار<i class="far fa-bell"></i></a></li>
        </ul>
    </div>

    <div id="content">
        <div class="my container-fluid">

            <div class="my-wrap">
                <h3>فرستنده :</h3>
                <p id="author"><%=message.getAuthor()%></p>
                <h3>موضوع :</h3>
                <p id="sub"><%=message.getSubject()%></p>
                <p id="body"><%=message.getBody()%></p>
                <p id="date"><%=message.getDate()%></p>
                <button style="border: none" class="btn-warning" onclick="reply()">reply</button>
            </div>

        </div>
    </div>
</div>


</body>
</html>
