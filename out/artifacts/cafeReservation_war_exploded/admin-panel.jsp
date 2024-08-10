<%@ page import="com.ibm.icu.util.ULocale" %>
<%@ page import="com.ibm.icu.util.Calendar" %>
<%@ page import="com.ibm.icu.text.DateFormat" %><%--
  Created by IntelliJ IDEA.
  User: nazanin
  Date: 4/25/2019
  Time: 4:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
    <link href="css/admin/admin-panel.css" rel="stylesheet" type="text/css">
</head>
<body>


    <div class="content">

    </div>

<script type="text/javascript">
$(document).ready(function(){
$('.content').load('show-all-cafe.jsp');
});
</script>
</body>
</html>
