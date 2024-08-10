<%@ page import="model.DAO.MenuDAO" %>
<%@ page import="model.DTO.MenuItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: nazanin
  Date: 5/19/2019
  Time: 7:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("search_id"));
    MenuDAO menuDAO = new MenuDAO();
    ArrayList<MenuItem> menuItems = menuDAO.selectItems(id);

    for (MenuItem menuItem : menuItems) {

%>
<div class="text">
    <span class="price"><%=menuItem.getPrice()%></span>
    <h3><%=menuItem.getName()%></h3>
    <p><%=menuItem.getIngredients()%></p>
</div>
<%
    }
%>

</body>
</html>
