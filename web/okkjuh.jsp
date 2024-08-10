<%@ page import="model.DAO.UserDAO" %>
<%@ page import="model.DTO.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/user/edit-profile.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">

    <title>editProfile</title>
</head>

<body>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<%
    HttpSession session1 = request.getSession();
    UserDAO dao = new UserDAO();
    User user = dao.getUserById((Integer) session1.getAttribute("customer_id"));
%>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4 side"></div>
        <div class="col-md-4 profile-container">
            <div class="profile-menu ">
                <div class="image-container text-center">
                    <img class="resize profile-img" src="img/user/<%= user.getImageName()%>">
                </div>
                <div class="form-wrap">
                    <form action="editProf" method="post" enctype="multipart/form-data">
                        <input type="file" name="file" id="file" class="inputfile" />
                        آپلود عکس
                        <label for="file"><i class="fas fa-camera"></i></label>
                        <br><br>
                        <div class="form-group">
                            <input type="text" name="name" class="form-control" value="<%= user.getName()%>" placeholder="name">
                        </div>
                        <div class="form-group">
                            <input type="text" name="lastname" class="form-control" value="<%= user.getLastname()%>" placeholder="lastname">
                        </div>
                        <div class="form-group">
                            <input type="text" name="bio" class="form-control" value="<%= user.getBio()%>" placeholder="bio">
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" class="form-control" value="<%= user.getEmail()%>" placeholder="email">
                        </div>
                        <input class="btn" type="submit" value="ویرایش">
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-4 side"></div>
    </div>
</div>


</body>