<%@ page import="model.DTO.User" %>
<%@ page import="model.DAO.UserDAO" %>
<%@ page import="model.DTO.User" %>
<%@ page import="model.DAO.PostDAO" %>
<%@ page import="model.DTO.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.DTO.Post" %>
<%@ page import="model.DAO.PostDAO" %>
<%@ page import="model.DAO.UserDAO" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>UserProfile</title>
    <link rel="stylesheet" href="assets1/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets1/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets1/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Actor">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="assets1/css/-Filterable-Cards-.css">
    <link rel="stylesheet" href="assets1/css/Button-Outlines---Pretty.css">
    <link rel="stylesheet" href="assets1/css/Dark-NavBar-1.css">
    <link rel="stylesheet" href="assets1/css/Dark-NavBar-2.css">
    <link rel="stylesheet" href="assets1/css/Dark-NavBar.css">
    <link rel="stylesheet" href="assets1/css/Data-Table-1.css">
    <link rel="stylesheet" href="assets1/css/Data-Table.css">
    <link rel="stylesheet" href="assets1/css/divider-text-middle.css">
    <link rel="stylesheet" href="assets1/css/Dynamic-Table.css">
    <link rel="stylesheet" href="assets1/css/Fixed-Navbar-1.css">
    <link rel="stylesheet" href="assets1/css/Fixed-Navbar-2.css">
    <link rel="stylesheet" href="assets1/css/Fixed-Navbar.css">
    <link rel="stylesheet" href="assets1/css/Footer-Dark.css">
    <link rel="stylesheet" href="assets1/css/Google-Style-Text-Input.css">
    <link rel="stylesheet" href="assets1/css/Table-with-search-1-1.css">
    <link rel="stylesheet" href="assets1/css/Pretty-Footer.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
    <link rel="stylesheet" href="assets1/css/MUSA_no-more-tables-1.css">
    <link rel="stylesheet" href="assets1/css/MUSA_no-more-tables.css">
    <link rel="stylesheet" href="assets1/css/Profile-Card-1.css">
    <link rel="stylesheet" href="assets1/css/Projects-Clean.css">
    <link rel="stylesheet" href="assets1/css/Projects-Horizontal.css">
    <link rel="stylesheet" href="assets1/css/Social-Follow-Button.css">
    <link rel="stylesheet" href="assets1/css/styles.css">
    <link rel="stylesheet" href="assets1/css/Table-With-Search-1.css">
    <link rel="stylesheet" href="assets1/css/Table-With-Search.css">
</head>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    HttpSession session1 = request.getSession();
    UserDAO dao = new UserDAO();
    User user=dao.getUserById((Integer) session1.getAttribute("customer_id"));
    PostDAO pdao = new PostDAO();
    ArrayList<Post> posts;
    posts = pdao.getPosts(user.getId());
    int numOfPosts = posts.size();
    //System.out.println(numOfPosts);
    ArrayList<User> following;
    following = dao.getFollowing(user.getId());
    boolean like=false;
%>

<body>
<div></div>
<div class="border-white profile-card" style="background-color: #565b5a;background-image: url(&quot;assets1/img/nathan-dumlao-314123-unsplash.jpg&quot;);filter: blur(0px);background-repeat: round;">
    <div class="bg-dark profile-back">
        <nav class="navbar navbar-light navbar-expand-md fixed-top" data-aos="fade" style="background-color: rgb(52,58,66);">
            <div class="container-fluid"><a class="navbar-brand" href="#">My profile</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse"
                     id="navcol-1">
                    <ul style="color: whitesmoke" class="nav navbar-nav ml-auto">
                        <li style="color: whitesmoke" class="nav-item" role="presentation"><a style="color: whitesmoke" class="nav-link active" href="#">درباره ی من</a></li>
                        <li class="nav-item" role="presentation"><a style="color: whitesmoke" class="nav-link active" href="#">پست ها</a></li>
                        <li class="nav-item" role="presentation"><a style="color: whitesmoke" class="nav-link" href="#">feeds</a></li>
                        <li class="nav-item" role="presentation"><a style="color: whitesmoke" class="nav-link" href="#">رزرو ها</a></li>
                        <li class="nav-item" role="presentation"><a style="color: whitesmoke" class="nav-link" href="#">پرداخت ها</a></li>
                        <li class="nav-item" role="presentation"><a style="color: whitesmoke" class="nav-link" href="#">خروج از حساب</a></li>
                        <li class="nav-item" role="presentation"><a style="color: whitesmoke" class="nav-link" href="index.jsp">صفحه اصلی</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div><img class="rounded-circle profile-pic" src="img/user/<%= user.getImageName()%>">
    <h3 class="bg-dark profile-name"><%= user.getName()%></h3><button onclick="Edit()" class="btn btn-link text-dark bg-light social-outline" type="button" style="color:#3097d1;padding-right:8px;padding-left:8px;padding-top:4px;padding-bottom:3px;"><i class="icon-user-follow" style="color:#3097d1;"></i> Edit</button>
    <p
            class="profile-bio" style="background-repeat: no-repeat;"><%= user.getBio()%><br><br><br><button class="btn btn-light text-dark border-dark border-pretty" onclick="Following()" type="button" style="color: #14242d;"> following &nbsp;<%= dao.calculateFollowing((Integer) session1.getAttribute("customer_id"))%></button><button class="btn btn-light text-dark border-dark border-pretty" onclick="Followers()" type="button"
                                                                                                                                                                                                                                                  style="color: #14242d;">followers &nbsp;<%= dao.calculateFollowers((Integer) session1.getAttribute("customer_id"))%></button><br></p>
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
                for (Post post:posts){
            %>
            <div class="col-sm-6 col-lg-4 item"><img class="img-fluid" src="img/post/<%= post.getPic()%>">
                <%--<h3 class="name">عکس اول</h3>--%>
                <form action="/LikePost" method="post"><button class="likeBtn" type="button" name = "like"  value="<%=post.getPid()%>"><i class="fa fa-heart"></i></button ></form><%=post.getLikes()%>
                <br><br>
                   <p><%=post.getDate()%></p>
                <p class="description">.<%=post.getCaption()%>.</p>
            </div>
            <%
                }
            %>
        </div>
        <br><br> <br><br>


        <form action="MakePost" method="post" enctype="multipart/form-data">
            <input class="btn btn-link border-pretty" type="file" name="file">
            <input class="btn btn-link border-pretty" type="text" name="caption" placeholder="caption">
            <input class="btn btn-link border-pretty" type="submit"  style="color: #ce9c95;margin-left: 8px;padding-left: 40px;padding-right: 40px;" value="پست جدید">
        </form>




        <br><br> <br><br>
        <div class="row p-0 m-0"></div>
        <div class="row">
            <div class="col">
                <section class="py-5">
                    <div class="container">
                        <h1 class="text-center mb-4">My feeds</h1>
                        <div class="filtr-controls text-center lead text-uppercase mb-3">
                            <span class="active d-inline-block mx-3 py-1 position-relative" data-filter="all">همه</span><span class="d-inline-block mx-3 py-1 position-relative" data-filter="1"></span><span class="d-inline-block mx-3 py-1 position-relative"data-filter="2">دوستان</span><span class="d-inline-block mx-3 py-1 position-relative" data-filter="3">کافی شاپ ها</span></div>


                        <div class="row filtr-container">
                            <%
                                //ArrayList<Post> feed=new ArrayList<Post>();
                                for (User u:following){
                                    ArrayList<Post> p=pdao.getPosts(u.getId());
                                    System.out.println("id "+u.getId());
                                    System.out.println("uid " +u.getId());
                                    System.out.println("size " +p.size());
                                    for (Post post:p){
                                        System.out.println("size " +p.size());
                            %>

                            <div class="col-md-6 col-lg-4 filtr-item" data-category="2,3">
                                <div class="card border-dark">
                                    <div class="card-header bg-dark text-light">
                                        <h5 class="m-0"></h5>
                                    </div><img class="img-fluid card-img w-100 d-block rounded-0" src="img/post/<%= post.getPic()%>">
                                    <%
                                        if(pdao.liked(u.getId(),post.getPid())){
                                            System.out.println("true or false "+pdao.liked(u.getId(),post.getPid()));
                                    %>
                                    <form action="/LikePost" method="post">
                                        <button class="likeBtn" type="submit" name = "like"id="like"  value="<%=post.getPid()%>"><i class="fa fa-heart"></i><%=post.getLikes()%></button >
                                    </form>
                                    <%
                                    }else{
                                    %>
                                    <form action="UnlikePost" method="post">
                                        <button class="likeBtn" type="submit" name = "unlike"id="unlike"  value="<%=post.getPid()%>"><i class="fa fa-heart"></i><%=post.getLikes()%></button >
                                    </form>
                                    <%
                                        }
                                    %>
                                    <div class="card-body" style="height: 213px;">
                                        <p class="card-text" style="height: 55px;">.<%=post.getCaption()%>.<br></p>
                                        <p class="card-text" style="height: 71px;"><br><p><%=post.getDate()%></p><br></p><span class="fa-stack"></span>
                                        <div class="media"></div><i class="fa-stack-1x fa-inverse"></i><i class="fa-stack-1x fa-inverse"></i></div>

                                </div>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>



                    </div>
                </section>
                <div style="text-align:center;">
                    <h2 class="divider-style"><span>لیست رزرو ها</span></h2>
                </div>
            </div>
            </div>
            <div class="col-md-12 search-table-col">
                <div class="form-group pull-right col-lg-4"><input type="text" placeholder="Search by typing here.." class="search form-control"></div><span class="counter pull-right"></span>
                <div class="table-responsive table-bordered table table-hover table-bordered results">
                    <table class="table table-bordered table-hover">
                        <thead class="bill-header cs">
                        <tr>
                            <th id="trs-hd" class="col-lg-1">ادرس</th>
                            <th id="trs-hd" class="col-lg-2">شماره میز</th>
                            <th id="trs-hd" class="col-lg-3">ساعت</th>
                            <th id="trs-hd" class="col-lg-2">نام کافه</th>
                            <th id="trs-hd" class="col-lg-2">تاریخ</th>
                            <th id="trs-hd" class="col-lg-2">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="warning no-result">
                            <td colspan="12"><i class="fa fa-warning"></i>&nbsp; No Result !!!</td>
                        </tr>
                        <tr>
                            <td>خیابان......</td>
                            <td>23</td>
                            <td>4 عصز</td>
                            <td>کافه .......</td>
                            <td>4.8.98</td>
                            <td><button class="btn btn-danger" type="submit" style="margin-left: 5px;background-color: rgb(59,62,62);"><i class="fa fa-trash" style="font-size: 15px;"></i></button></td>
                        </tr>
                        </tbody>
                    </table>
                </div><button class="btn btn-link social-outline" type="button" style="color:#3097d1;padding-right:8px;padding-left:8px;padding-top:4px;padding-bottom:3px;"><i class="icon-event" style="color:#3097d1;"></i>&nbsp;رزرو جدید</button>
                <div style="text-align:center;">
                    <h2 class="divider-style"><span>پرداخت ها</span></h2>
                </div>
            </div>
            <div class="col-md-12 search-table-col"><span class="counter pull-right"></span>
                <div class="table-responsive table-bordered table table-hover table-bordered results">
                    <table class="table table-bordered table-hover">
                        <thead class="bill-header cs">
                        <tr>
                            <th id="trs-hd" class="col-lg-1">مبلغ واریز سده</th>
                            <th id="trs-hd" class="col-lg-2">از بانک</th>
                            <th id="trs-hd" class="col-lg-3">اسم کافه</th>
                            <th id="trs-hd" class="col-lg-2">به حساب</th>
                            <th id="trs-hd" class="col-lg-2">تاریخ واریز</th>
                            <th id="trs-hd" class="col-lg-2">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="warning no-result">
                            <td colspan="12"><i class="fa fa-warning"></i>&nbsp; No Result !!!</td>
                        </tr>
                        <tr>
                            <td>90,0000</td>
                            <td>پاسارگاد</td>
                            <td>کافه الالالالال</td>
                            <td>9974645322</td>
                            <td>5.4.68</td>
                            <td><button class="btn btn-danger" type="submit" style="margin-left: 5px;background-color: rgb(59,62,62);"><i class="fa fa-trash" style="font-size: 15px;"></i></button></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
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
<script>
    function Edit() {
        window.location.href = "EditProfile.jsp"
    }
    function Followers() {
        window.location.href = "followers.jsp"
    }
    function Following() {
        window.location.href = "following.jsp"
    }

</script>
<script src="assets1/js/jquery.min.js"></script>
<script src="assets1/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<script src="assets1/js/-Filterable-Cards-.js"></script>
<script src="assets1/js/bs-animation.js"></script>
<script src="assets1/js/Dynamic-Table.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
<script src="assets1/js/Table-with-search-1.js"></script>
<script src="assets1/js/Table-With-Search.js"></script>
</body>

</html>