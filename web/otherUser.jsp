<%--
  Created by IntelliJ IDEA.
  User: Alieyeh
  Date: 5/19/19
  Time: 7:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="model.DAO.UserDAO" %>
<%@ page import="model.DTO.User" %>
<%@ page import="model.DAO.PostDAO" %>
<%@ page import="model.DTO.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
   // User user = (User) request.getAttribute("user");

%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>UserProfile</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Actor">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="assets/css/-Filterable-Cards-.css">
    <link rel="stylesheet" href="assets/css/Button-Outlines---Pretty.css">
    <link rel="stylesheet" href="assets/css/Dark-NavBar-1.css">
    <link rel="stylesheet" href="assets/css/Dark-NavBar-2.css">
    <link rel="stylesheet" href="assets/css/Dark-NavBar.css">
    <link rel="stylesheet" href="assets/css/Data-Table-1.css">
    <link rel="stylesheet" href="assets/css/Data-Table.css">
    <link rel="stylesheet" href="assets/css/divider-text-middle.css">
    <link rel="stylesheet" href="assets/css/Dynamic-Table.css">
    <link rel="stylesheet" href="assets/css/Fixed-Navbar-1.css">
    <link rel="stylesheet" href="assets/css/Fixed-Navbar-2.css">
    <link rel="stylesheet" href="assets/css/Fixed-Navbar.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark.css">
    <link rel="stylesheet" href="assets/css/Google-Style-Text-Input.css">
    <link rel="stylesheet" href="assets/css/Table-with-search-1-1.css">
    <link rel="stylesheet" href="assets/css/Pretty-Footer.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
    <link rel="stylesheet" href="assets/css/MUSA_no-more-tables-1.css">
    <link rel="stylesheet" href="assets/css/MUSA_no-more-tables.css">
    <link rel="stylesheet" href="assets/css/Profile-Card-1.css">
    <link rel="stylesheet" href="assets/css/Projects-Clean.css">
    <link rel="stylesheet" href="assets/css/Projects-Horizontal.css">
    <link rel="stylesheet" href="assets/css/Social-Follow-Button.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/Table-With-Search-1.css">
    <link rel="stylesheet" href="assets/css/Table-With-Search.css">



</head>
<%
    HttpSession session1 = request.getSession();
    int id = Integer.parseInt(request.getParameter("id"));

    UserDAO dao = new UserDAO();
    User user = dao.getUserById(id);
    PostDAO pdao = new PostDAO();
    System.out.println("useeeeeer   "+user);
    ArrayList<Post> posts = pdao.getPosts(user.getId());
%>

<body>
<div></div>
<div class="border-white profile-card" style="background-color: #565b5a;background-image: url(&quot;assets/img/nathan-dumlao-314123-unsplash.jpg&quot;);filter: blur(0px);background-repeat: round;">
    <div class="bg-dark profile-back">
        <nav class="navbar navbar-light navbar-expand-md fixed-top" data-aos="fade" style="background-color: rgb(52,58,66);">
            <div class="container-fluid"><a class="navbar-brand" href="#">My profile</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse"
                     id="navcol-1">
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item" role="presentation"><a class="nav-link active" href="#">درباره ی من</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link active" href="#">پست ها</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#">feeds</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#">رزرو ها</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#">پرداخت ها</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#">خروج از حساب</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div><img class="rounded-circle profile-pic" src="img/user/<%= user.getImageName()%>">
    <h3 class="bg-dark profile-name"><%= user.getName()%></h3>
    <%--<button class="btn btn-link text-dark bg-light social-outline" type="button" style="color:#3097d1;padding-right:8px;padding-left:8px;padding-top:4px;padding-bottom:3px;"><i class="icon-user-follow" style="color:#3097d1;"></i> Follow</button>--%>
    <p
            class="profile-bio" style="background-repeat: no-repeat;"><%= user.getBio()%><br><br><br>
    <%
    String follow="follow";
    if(dao.isFollowing(user.getId(),(Integer) session1.getAttribute("customer_id"))){
        follow="unfollow";
    }
            if(follow.equals("follow")){
            %>
    <form action="Follow?id=<%=user.getId()%>" method="post" enctype="multipart/form-data">

    <button class="btn btn-link text-dark bg-light social-outline" type="submit" id="id" style="color: #ce9c95;margin-left: 8px;padding-left: 40px;padding-right: 40px;" value=""></i><%= follow%></button>
    </form>
    <%}else{%>
    <form action="/Unfollow?id=<%=user.getId()%>" method="post" enctype="multipart/form-data">

        <button class="btn btn-link text-dark bg-light social-outline" type="submit" id="fid" style="color: #ce9c95;margin-left: 8px;padding-left: 40px;padding-right: 40px;" value=""></i><%= follow%></button>
    </form>

    <%}%>
    <button class="btn btn-light text-dark border-dark border-pretty" type="button" style="color: #14242d;">
        following &nbsp;<%= dao.calculateFollowing(user.getId())%></button>
    <button class="btn btn-light text-dark border-dark border-pretty" type="button"
            style="color: #14242d;">followers &nbsp;<%= dao.calculateFollowers(user.getId())%></button><br></p>
    <ul class="social-list">
        <li> <i class="fa fa-facebook-official bg-dark"></i></li>
        <li> <i class="fa fa-twitter-square bg-dark"></i></li>
        <li> <i class="fa fa-linkedin-square bg-dark"></i></li>
    </ul>
</div>
<div class="projects-horizontal"></div>
<div class="projects-clean">
    <div class="container">
        <div class="intro">
            <h2 class="text-center">پست ها</h2>
            <p class="text-center">مطالبی در مورد پست ها<br>به طور کلی</p>
        </div>


        <div class="row projects">
            <%
                int uid = Integer.parseInt(String.valueOf(session.getAttribute("customer_id")));
                for (Post post:posts){
            %>
            <div class="col-sm-6 col-lg-4 item" style="height: 330px;width: 330px">
                <img class="img-fluid" src="img/post/<%= post.getPic()%>">
                <p class="name">
                        <%
                if(!pdao.liked(uid,post.getPid())){
                                     %>
                <form action="LikePostO?id=<%=user.getId()%>" method="post">
                <%
                    System.out.println("kkkkkkkkkkkkkkk "+post.getPid());
                %>

                <button class="likeBtn" type="submit" name = "like"id="like"  value="<%=post.getPid()%>"><i class="fa fa-heart"></i></button >
                </form><%=post.getLikes()%>
                <br><br>
                <p><%=post.getDate()%></p>
                <p class="description">.<%=post.getCaption()%>.</p>

                <%
                }else{
                %>
                <form action="UnlikePostO" method="post">
                    <button class="likeBtn" type="submit" name = "unlike"id="unlike"  value="<%=post.getPid()%>"><i class="fa fa-heart"></i></button >
                </form><%=post.getLikes()%>
                <br><br>
                <p><%=post.getDate()%></p>
                <p class="description">.<%=post.getCaption()%>.</p>


                <%
                    }
                %>

            </div>



            <%
                }
            %>

        </div>

    </div>
    <div class="row p-0 m-0"></div>
    <div class="row">
        <div class="col">
            <div class="row">

            </div>
            <%--<section class="py-5">--%>
                <%--<div class="container">--%>
                    <%--<h1 class="text-center mb-4">My feeds</h1>--%>
                    <%--<div class="filtr-controls text-center lead text-uppercase mb-3"><span class="active d-inline-block mx-3 py-1 position-relative" data-filter="all">همه</span><span class="d-inline-block mx-3 py-1 position-relative" data-filter="1"></span><span class="d-inline-block mx-3 py-1 position-relative"--%>
                                                                                                                                                                                                                                                                       <%--data-filter="2">دوستان</span><span class="d-inline-block mx-3 py-1 position-relative" data-filter="3">کافی شاپ ها</span></div>--%>
                    <%--<div class="row filtr-container">--%>
                        <%--<div class="col-md-6 col-lg-4 filtr-item" data-category="2,3">--%>
                            <%--<div class="card border-dark">--%>
                                <%--<div class="card-header bg-dark text-light">--%>
                                    <%--<h5 class="m-0">cafe ...</h5>--%>
                                <%--</div><img class="img-fluid card-img w-100 d-block rounded-0" src="assets/img/6.jpg">--%>
                                <%--<div class="card-body" style="height: 213px;">--%>
                                    <%--<p class="card-text" style="height: 55px;">زیر نویس<br>زیر نویس عکس<br></p>--%>
                                    <%--<p class="card-text" style="height: 71px;"><strong>نظرات : &nbsp;&nbsp;</strong><br>بسیار زیبا<br>عالی است</p><span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-heart fa-stack-1x fa-inverse"></i></span>--%>
                                    <%--<div class="media"></div><i class="fa fa-heart fa-stack-1x fa-inverse"></i><i class="fa fa-heart fa-stack-1x fa-inverse"></i></div>--%>
                                <%--<div class="d-flex card-footer"><button class="btn btn-dark btn-sm" type="button"><i class="fa fa-eye"></i>&nbsp;visit</button><button class="btn btn-outline-dark btn-sm ml-auto" type="button"><i class="fa fa-plus"></i>&nbsp;comment</button></div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-6 col-lg-4 filtr-item" data-category="1,3">--%>
                            <%--<div class="card border-dark">--%>
                                <%--<div class="card-header bg-dark text-light">--%>
                                    <%--<h5 class="m-0">coffee</h5>--%>
                                <%--</div><img class="img-fluid card-img w-100 d-block rounded-0" src="assets/img/4.jpg">--%>
                                <%--<div class="card-body">--%>
                                    <%--<p class="card-text"><br>زیر نویس<br>زیر نویس عکس<br><br></p>--%>
                                    <%--<p class="card-text" style="height: 71px;"><strong>نظرات : &nbsp;&nbsp;</strong><br>بسیار زیبا<br>عالی است</p><span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-heart fa-stack-1x fa-inverse"></i></span><i class="fa fa-heart fa-stack-1x fa-inverse"></i></div>--%>
                                <%--<div--%>
                                        <%--class="d-flex card-footer"><button class="btn btn-dark btn-sm" type="button"><i class="fa fa-eye"></i>&nbsp;visit</button><button class="btn btn-outline-dark btn-sm ml-auto" type="button"><i class="fa fa-plus"></i>&nbsp;comment</button></div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-6 col-lg-4 filtr-item" data-category="2,3">--%>
                            <%--<div class="card border-dark">--%>
                                <%--<div class="card-header bg-dark text-light">--%>
                                    <%--<h5 class="m-0">foood</h5>--%>
                                <%--</div><img class="img-fluid card-img w-100 d-block rounded-0" src="assets/img/5.jpg">--%>
                                <%--<div class="card-body">--%>
                                    <%--<p class="card-text"><br>زیر نویس<br>زیر نویس عکس<br><br></p>--%>
                                    <%--<p class="card-text" style="height: 71px;"><strong>نظرات : &nbsp;&nbsp;</strong><br>بسیار زیبا<br>عالی است</p><span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-heart fa-stack-1x fa-inverse"></i></span></div>--%>
                                <%--<div class="d-flex card-footer"><button class="btn btn-dark btn-sm" type="button"><i class="fa fa-eye"></i>&nbsp;visit</button><button class="btn btn-outline-dark btn-sm ml-auto" type="button"><i class="fa fa-plus"></i>&nbsp;comment</button></div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-6 col-lg-4 filtr-item" data-category="3">--%>
                            <%--<div class="card border-dark">--%>
                                <%--<div class="card-header bg-dark text-light">--%>
                                    <%--<h5 class="m-0">salad</h5>--%>
                                <%--</div><img class="img-fluid card-img w-100 d-block rounded-0" src="assets/img/slide2.jpg">--%>
                                <%--<div class="card-body">--%>
                                    <%--<p class="card-text"><br>زیر نویس<br>زیر نویس عکس<br><br></p>--%>
                                    <%--<p class="card-text" style="height: 71px;"><strong>نظرات : &nbsp;&nbsp;</strong><br>بسیار زیبا<br>عالی است</p><span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-heart fa-stack-1x fa-inverse"></i></span></div>--%>
                                <%--<div class="d-flex card-footer"><button class="btn btn-dark btn-sm" type="button"><i class="fa fa-eye"></i>&nbsp;visit</button><button class="btn btn-outline-dark btn-sm ml-auto" type="button"><i class="fa fa-plus"></i>&nbsp;comment</button></div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-6 col-lg-4 filtr-item" data-category="1,2">--%>
                            <%--<div class="card border-dark">--%>
                                <%--<div class="card-header bg-dark text-light">--%>
                                    <%--<h5 class="m-0">tea</h5>--%>
                                <%--</div><img class="img-fluid card-img w-100 d-block rounded-0" src="assets/img/post4.jpg">--%>
                                <%--<div class="card-body">--%>
                                    <%--<p class="card-text"><br>زیر نویس<br>زیر نویس عکس<br><br></p>--%>
                                    <%--<p class="card-text" style="height: 71px;"><strong>نظرات : &nbsp;&nbsp;</strong><br>بسیار زیبا<br>عالی است</p><span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-heart fa-stack-1x fa-inverse"></i></span></div>--%>
                                <%--<div class="d-flex card-footer"><button class="btn btn-dark btn-sm" type="button"><i class="fa fa-eye"></i>&nbsp;visit</button><button class="btn btn-outline-dark btn-sm ml-auto" type="button"><i class="fa fa-plus"></i>&nbsp;comment</button></div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-6 col-lg-4 filtr-item" data-category="1,3">--%>
                            <%--<div class="card border-dark">--%>
                                <%--<div class="card-header bg-dark text-light">--%>
                                    <%--<h5 class="m-0">Lorem Ipsum</h5>--%>
                                <%--</div><img class="img-fluid card-img w-100 d-block rounded-0" src="assets/img/th-08.jpg">--%>
                                <%--<div class="card-body">--%>
                                    <%--<p class="card-text"><br>زیر نویس<br>زیر نویس عکس<br><br></p>--%>
                                    <%--<p class="card-text" style="height: 71px;"><strong>نظرات : &nbsp;&nbsp;</strong><br>بسیار زیبا<br>عالی است</p><span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-heart fa-stack-1x fa-inverse"></i></span></div>--%>
                                <%--<div class="d-flex card-footer"><button class="btn btn-dark btn-sm" type="button"><i class="fa fa-eye"></i>&nbsp;visit</button><button class="btn btn-outline-dark btn-sm ml-auto" type="button"><i class="fa fa-plus"></i>&nbsp;comment</button></div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-6 col-lg-4 filtr-item" data-category="1,3">--%>
                            <%--<div class="card border-dark">--%>
                                <%--<div class="card-header bg-dark text-light">--%>
                                    <%--<h5 class="m-0">Lorem Ipsum</h5>--%>
                                <%--</div><img class="img-fluid card-img w-100 d-block rounded-0" src="assets/img/toa-heftiba-274947-unsplash.jpg">--%>
                                <%--<div class="card-body">--%>
                                    <%--<p class="card-text"><br>زیر نویس<br>زیر نویس عکس<br><br></p>--%>
                                    <%--<p class="card-text" style="height: 71px;"><strong>نظرات : &nbsp;&nbsp;</strong><br>بسیار زیبا<br>عالی است</p><span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-heart fa-stack-1x fa-inverse"></i></span></div>--%>
                                <%--<div class="d-flex card-footer"><button class="btn btn-dark btn-sm" type="button"><i class="fa fa-eye"></i>&nbsp;vsit</button><button class="btn btn-outline-dark btn-sm ml-auto" type="button"><i class="fa fa-plus"></i>&nbsp;comment</button></div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-6 col-lg-4 filtr-item" data-category="3">--%>
                            <%--<div class="card border-dark">--%>
                                <%--<div class="card-header bg-dark text-light">--%>
                                    <%--<h5 class="m-0">Lorem Ipsum</h5>--%>
                                <%--</div><img class="img-fluid card-img w-100 d-block rounded-0" src="assets/img/th-11.jpg">--%>
                                <%--<div class="card-body">--%>
                                    <%--<p class="card-text"><br>زیر نویس<br>زیر نویس عکس<br><br></p>--%>
                                    <%--<p class="card-text" style="height: 71px;"><strong>نظرات : &nbsp;&nbsp;</strong><br>بسیار زیبا<br>عالی است</p><span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-heart fa-stack-1x fa-inverse"></i></span></div>--%>
                                <%--<div class="d-flex card-footer"><button class="btn btn-dark btn-sm" type="button"><i class="fa fa-eye"></i>&nbsp;visit</button><button class="btn btn-outline-dark btn-sm ml-auto" type="button"><i class="fa fa-plus"></i>&nbsp;comment</button></div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-6 col-lg-4 filtr-item" data-category="1">--%>
                            <%--<div class="card border-dark">--%>
                                <%--<div class="card-header bg-dark text-light">--%>
                                    <%--<h5 class="m-0">Lorem Ipsum</h5>--%>
                                <%--</div><img class="img-fluid card-img w-100 d-block rounded-0" src="assets/img/th-12.jpg">--%>
                                <%--<div class="card-body">--%>
                                    <%--<p class="card-text"><br>زیر نویس<br>زیر نویس عکس<br><br></p>--%>
                                    <%--<p class="card-text" style="height: 71px;"><strong>نظرات : &nbsp;&nbsp;</strong><br>بسیار زیبا<br>عالی است</p><span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-heart fa-stack-1x fa-inverse"></i></span></div>--%>
                                <%--<div class="d-flex card-footer"><button class="btn btn-dark btn-sm" type="button"><i class="fa fa-eye"></i>&nbsp;visit</button><button class="btn btn-outline-dark btn-sm ml-auto" type="button"><i class="fa fa-plus"></i>comment</button></div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</section>--%>
            <%--<div style="text-align:center;">--%>
                <%--<h2 class="divider-style"><span>لیست رزرو ها</span></h2>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="col-md-12 search-table-col">--%>
            <%--<div class="form-group pull-right col-lg-4"><input type="text" placeholder="Search by typing here.." class="search form-control"></div><span class="counter pull-right"></span>--%>
            <%--<div class="table-responsive table-bordered table table-hover table-bordered results">--%>
                <%--<table class="table table-bordered table-hover">--%>
                    <%--<thead class="bill-header cs">--%>
                    <%--<tr>--%>
                        <%--<th id="trs-hd" class="col-lg-1">ادرس</th>--%>
                        <%--<th id="trs-hd" class="col-lg-2">شماره میز</th>--%>
                        <%--<th id="trs-hd" class="col-lg-3">ساعت</th>--%>
                        <%--<th id="trs-hd" class="col-lg-2">نام کافه</th>--%>
                        <%--<th id="trs-hd" class="col-lg-2">تاریخ</th>--%>
                        <%--<th id="trs-hd" class="col-lg-2">Action</th>--%>
                    <%--</tr>--%>
                    <%--</thead>--%>
                    <%--<tbody>--%>
                    <%--<tr class="warning no-result">--%>
                        <%--<td colspan="12"><i class="fa fa-warning"></i>&nbsp; No Result !!!</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>خیابان......</td>--%>
                        <%--<td>23</td>--%>
                        <%--<td>4 عصز</td>--%>
                        <%--<td>کافه .......</td>--%>
                        <%--<td>4.8.98</td>--%>
                        <%--<td><button class="btn btn-danger" type="submit" style="margin-left: 5px;background-color: rgb(59,62,62);"><i class="fa fa-trash" style="font-size: 15px;"></i></button></td>--%>
                    <%--</tr>--%>
                    <%--</tbody>--%>
                <%--</table>--%>
            <%--</div><button class="btn btn-link social-outline" type="button" style="color:#3097d1;padding-right:8px;padding-left:8px;padding-top:4px;padding-bottom:3px;"><i class="icon-event" style="color:#3097d1;"></i>&nbsp;رزرو جدید</button>--%>
            <%--<div style="text-align:center;">--%>
                <%--<h2 class="divider-style"><span>پرداخت ها</span></h2>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="col-md-12 search-table-col"><span class="counter pull-right"></span>--%>
            <%--<div class="table-responsive table-bordered table table-hover table-bordered results">--%>
                <%--<table class="table table-bordered table-hover">--%>
                    <%--<thead class="bill-header cs">--%>
                    <%--<tr>--%>
                        <%--<th id="trs-hd" class="col-lg-1">مبلغ واریز سده</th>--%>
                        <%--<th id="trs-hd" class="col-lg-2">از بانک</th>--%>
                        <%--<th id="trs-hd" class="col-lg-3">اسم کافه</th>--%>
                        <%--<th id="trs-hd" class="col-lg-2">به حساب</th>--%>
                        <%--<th id="trs-hd" class="col-lg-2">تاریخ واریز</th>--%>
                        <%--<th id="trs-hd" class="col-lg-2">Action</th>--%>
                    <%--</tr>--%>
                    <%--</thead>--%>
                    <%--<tbody>--%>
                    <%--<tr class="warning no-result">--%>
                        <%--<td colspan="12"><i class="fa fa-warning"></i>&nbsp; No Result !!!</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>90,0000</td>--%>
                        <%--<td>پاسارگاد</td>--%>
                        <%--<td>کافه الالالالال</td>--%>
                        <%--<td>9974645322</td>--%>
                        <%--<td>5.4.68</td>--%>
                        <%--<td><button class="btn btn-danger" type="submit" style="margin-left: 5px;background-color: rgb(59,62,62);"><i class="fa fa-trash" style="font-size: 15px;"></i></button></td>--%>
                    <%--</tr>--%>
                    <%--</tbody>--%>
                <%--</table>--%>
            <%--</div>--%>
            <footer>
                <div class="row">
                    <div class="col-sm-6 col-md-4 footer-navigation">
                        <h3><a href="#">Company<span>logo </span></a></h3>
                        <p class="links"><a href="#">خانه</a><strong> · </strong><a href="#">بلاگ ما</a><strong> · </strong><a href="#">قوانین و مقررات</a><strong> · </strong><a href="#">درباره ما</a><strong> · </strong><a href="#">سوالات متداول</a><strong> · </strong>
                            <a
                                    href="#">ارتباط با ما</a>
                        </p>
                        <p class="company-name">Company Name © 2015 </p>
                    </div>
                    <div class="col-sm-6 col-md-4 footer-contacts">
                        <div><span class="fa fa-map-marker footer-contacts-icon"> </span>
                            <p><span class="new-line-span">خیابان فلانی شرقی</span>ایران, تهران</p>
                        </div>
                        <div><i class="fa fa-phone footer-contacts-icon"></i>
                            <p class="footer-center-info email text-left"> +1 555 123456</p>
                        </div>
                        <div><i class="fa fa-envelope footer-contacts-icon"></i>
                            <p> <a href="#" target="_blank">support@company.com</a></p>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-4 footer-about">
                        <h4>ارتباط با ما</h4>
                        <p>شما میتوانید از طریق ایمیل و شبکه های اجتماعی ما را پیدا کنید</p>
                        <div class="social-links social-icons"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-linkedin"></i></a><a href="#"><i class="fa fa-github"></i></a></div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
</div>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<script src="assets/js/-Filterable-Cards-.js"></script>
<script src="assets/js/bs-animation.js"></script>
<script src="assets/js/Dynamic-Table.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
<script src="assets/js/Table-with-search-1.js"></script>
<script src="assets/js/Table-With-Search.js"></script>
<script>
    function Edit() {
        window.location.href = "../EditProfile.jsp"
    }

</script>
</body>

</html>
