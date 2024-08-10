
<%@ page import="model.DAO.UserDAO" %>
<%@ page import="model.DTO.User" %>
<%@ page import="model.DAO.PostDAO" %>
<%@ page import="model.DTO.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Following</title>
    <link rel="stylesheet" href="assetse/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assetse/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bitter:400,700">
    <link rel="stylesheet" href="assetse/css/Forum---Thread-listing-1.css">
    <link rel="stylesheet" href="assetse/css/Forum---Thread-listing.css">
    <link rel="stylesheet" href="assetse/css/Header-Dark.css">
    <link rel="stylesheet" href="assetse/css/styles.css">
</head>
<%
    //   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    HttpSession session1 = request.getSession();
    UserDAO dao = new UserDAO();
    User user=dao.getUserById((Integer) session1.getAttribute("customer_id"));
    ArrayList<User> following;
    following = dao.getFollowing(user.getId());
    int numOffol = following.size();

%>
<body>
    <div class="media"></div>
    <div>
        <div class="header-dark" style="background-image: url(&quot;assetse/img/back.jpg&quot;);">
            <div class="container hero">
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                        <h1 class="text-center">Followings</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <form>
                    <div class="form-group">
                        <div class="input-group"><span class="input-group-addon"> <i class="fa fa-search"></i></span><input class="form-control" type="search" name="search"></div>
                    </div>
                </form>
                <div>
                    <ul class="nav nav-tabs">
                        <li class="nav-item"><a class="nav-link active" role="tab" data-toggle="tab" href="#tab-1">Followings<span class="badge badge-pill badge-primary"><%= numOffol%></span></a></li>
                        <li class="nav-item"><a class="nav-link text-left" role="tab" data-toggle="tab" href="#tab-2" style="color: rgb(156,167,179);"></a></li>
                        <li class="nav-item"><a class="nav-link" role="tab" data-toggle="tab" href="#tab-3" style="color: rgb(175,178,181);"></a></li>
                        <li class="nav-item"><a class="nav-link" role="tab" data-toggle="tab" href="#tab-4" style="color: rgb(175,178,181);"></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" role="tabpanel" id="tab-1">
                            <div class="thread-list-head">
                                <nav class="thread-pages">
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                        <li class="page-item"><a class="page-link">1</a></li>
                                        <li class="page-item"><a class="page-link">2</a></li>
                                        <li class="page-item"><a class="page-link">3</a></li>
                                        <li class="page-item"><a class="page-link">4</a></li>
                                        <li class="page-item"><a class="page-link">5</a></li>
                                        <li class="page-item"><a class="page-link" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                    </ul>
                                </nav>
                            </div>

                            <ul class="thread-list">

                                <%
                                    for (User foll:following){
                                %>
                                <li class="thread" >
                                    <form action = "otherUser.jsp?id=<%=foll.getId()%>" method="post">
                                        <button type ="submit" id="id"><%=foll.getId()%></button>

                                        <span class="time"><img src="img/user/<%= foll.getImageName()%>" style="width: 55px;height: 39px;"></span>
                                        <span class="title"><%= foll.getName()%></span><span class="icon"> <a href="javascript:void(0)" class="subscribe">
                                        <i class="fa fa-user"></i></a><a href="javascript:void(0)" class="flag"></a></span>
                                    </form>
                                </li>
                                 <%
                                    }
                                %>
                            </ul>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="tab-2"></div>
                        <div class="tab-pane" role="tabpanel" id="tab-3"></div>
                        <div class="tab-pane" role="tabpanel" id="tab-4"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assetse/js/jquery.min.js"></script>
    <script src="assetse/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>