<%@ page import="model.DTO.Message" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.DAO.MessagesDAO" %><%--
  Created by IntelliJ IDEA.
  User: nazanin
  Date: 5/18/2019
  Time: 9:59 PM
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
    <link href="css/admin/message.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
    MessagesDAO messagesDAO = new MessagesDAO();
    ArrayList<Message> messages = messagesDAO.selectInbox("m");
%>
<script>
    function view(id) {
        document.location.href="inbox.jsp?id="+id;
    }
</script>
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
            <li><a href="send-message.jsp">پیام ها<i class="fas fa-envelope"></i></a></li>
            <li><a href="#">نوشتن پیام<i class="far fa-edit"></i></a></li>
            <li><a href="#">تنظیمات<i class="fas fa-tools"></i></a></li>
            <li><a href="#">کاربران<i class="fas fa-user"></i></a></li>
            <li><a href="#">آمار<i class="far fa-chart-bar"></i></a></li>
            <li><a href="#">اخبار<i class="far fa-bell"></i></a></li>
        </ul>
    </div>

    <div id="content">
        <div class="my container-fluid">
            <%
                int count=0;
                for (Message message:messages){
//                    if (!message.isRead()){
//                        count++;
//                    }
            %>

            <div onclick="view(<%=message.getId()%>)" class="my-wrap">
                <span id="author"><%=message.getAuthor()%></span>
                <span id="sub"><%=message.getSubject()%></span>
                <span id="body"><%=message.getBody()%></span>
                <p id="date"><%=message.getDate()%></p>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>

</body>
</html>
