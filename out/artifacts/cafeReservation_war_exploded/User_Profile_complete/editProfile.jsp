<%@ page import="model.DAO.UserDAO" %>
<%@ page import="model.DTO.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<%
    HttpSession session1 = request.getSession();
    UserDAO dao = new UserDAO();
    User user = dao.getUserById((Integer) session1.getAttribute("customer_id"));
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>editProfile</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bitter:400,700">
    <link rel="stylesheet" href="assets/css/Header-Dark.css">
    <link rel="stylesheet" href="assets/css/Profile-Edit-Form-1.css">
    <link rel="stylesheet" href="assets/css/Profile-Edit-Form.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <div>
        <div class="header-dark" style="background-image: url(&quot;assets/img/toa-heftiba-274947-unsplash.jpg&quot;);">
            <div class="container hero">
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                        <h1 class="text-center">Edit your profile</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container profile profile-view" id="profile">
        <form>
            <div class="form-row profile-row">
                <div class="col-md-4 relative">
                    <div class="avatar">
                        <div class="avatar-bg center"></div>
                        <%--value="img/user/<%= user.getImage()%>"--%>
                    </div><input type="file" class="form-control" name="file" ></div>
                <form action="editProf" method="post" enctype="multipart/form-data">
                <div class="col-md-8">
                    <h1>Edit Profile </h1>
                    <hr>
                    <div class="form-row">
                        <div class="col-sm-12 col-md-6">

                            <div class="form-group"><label>Name</label> <input type="text" name="name" class="form-control" value="<%= user.getName()%>"></div>
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div class="form-group"><label>LastName</label><input type="text" name="lastname" class="form-control" value="<%= user.getLastname()%>"></div>
                        </div>
                    </div>
                    <div class="form-group"><label>Bio</label><input type="text" name="bio" class="form-control" value="<%= user.getBio()%>"  autocomplete="off" required="" ></div>
                    <div class="form-row">
                        <div class="col-sm-12 col-md-6">
                            <div class="form-group"><label>Email </label><input type="email" name="email" class="form-control" value="<%= user.getEmail()%>"  autocomplete="off" required=""></div>
                        </div>

                    </div>
                    <hr>
                    <div class="form-row">
                        <div class="col-md-12 content-right"><input class="btn" type="submit" value="ویرایش"></div>
                    </div>
                </div></form>
            </div>
        </form>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/Profile-Edit-Form.js"></script>
</body>

</html>