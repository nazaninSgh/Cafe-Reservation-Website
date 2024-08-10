<%@ page import="model.DAO.UserDAO" %>
<%@ page import="model.DTO.User" %>
<%@ page import="model.DAO.PostDAO" %>
<%@ page import="model.DTO.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/user/cssUserP.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">




</head>
    <%
 //   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    HttpSession session1 = request.getSession();
    UserDAO dao = new UserDAO();
    User user=dao.getUserById((Integer) session1.getAttribute("customer_id"));
    PostDAO pdao = new PostDAO();
    ArrayList<Post> posts;
    posts = pdao.getPosts(user.getId());
    int numOfPosts = posts.size();
    System.out.println(numOfPosts);

%>
<body>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<div class="profile-container">
    <div class="profile-menu ">
        <div class="image-container ">
            <img class="resize profile-img" src="img/<%= user.getImageName()%>" alt="">

        </div>


        <div class="summery">
            <div class="username">
                <p><%= user.getName()%></p>
            </div>
            <button class="content" type="button">
               <span>
                   <%= dao.calculateFollowers((Integer) session1.getAttribute("customer_id"))%>
               </span>
                <span>follower</span>
            </button>
            <button class="content" type="Button">
                <span>
                     <%= dao.calculateFollowing((Integer) session1.getAttribute("customer_id"))%>
                </span>
                <span>following</span>
            </button>

        </div>

        <ul>
            <div id="bio" class="desc" >
                <%= user.getBio()%>
            </div>
            <li class="active list" onclick=""> My Posts</li>
            <li onclick="">My Feed</li>
            <li onclick="">My Reserves</li>
            <li onclick="">My Deposite / History</li>
            <li onclick="Edit()">Edit</li>
            <li>logOut from your account</li>

        </ul>
    </div>
    <div class="profile-content">
        <div class="actions">
            <i class=" fas fa-3x fa-bell"></i>
            <i class="fas fa-3x fa-cogs "></i>
            <div class="pic">
            </div>

        </div>
        <%
            int counter=0;
            for (Post post:posts){
                counter++;
                if(counter==1){
        %>
        <div class="row">
            <%
                }
            %>
            <div class="post text-center" style="height: 330px;width: 330px">
                <img src="img/post/<%= post.getPic()%>">
                <span><form action="/LikePost" method="post"><button class="likeBtn" type="submit" name = "like"id="like"  value="<%=post.getPid()%>"><i class="fa fa-heart"></i></button ></form><%=post.getLikes()%></span>
                <span class=""><%=post.getCaption()%></span>
                <span class=""><%=post.getDate()%></span>
            </div>

            <%
                }
                if(counter==3){counter=0;
            %>
        </div>
        <%
            }if(counter != 0 && numOfPosts != 0){
        %>
        </div>
    <%
        }
    %>
        <br><br><br><br><br><br><br><br><br><br><br><br>

        <form action="MakePost" method="post" enctype="multipart/form-data">
            <input type="file" name="file">
            <input type="text" name="caption">
            <input class="btn" type="submit" value="submit">
        </form>

    </div>
</div>

<script>
    function Edit() {
        window.location.href = "../EditProfile.jsp"
    }
    function like(pid) {

    }
</script>

</body>
