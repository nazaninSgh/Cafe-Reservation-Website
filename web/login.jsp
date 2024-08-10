
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/user/login.css" rel="stylesheet" type="text/css">
<html>
  <head>
    <title>login</title>
  </head>
  <body>
  <%
      response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
  %>
  <div class="container">
      <div class="col-sm-4"></div>
      <div class="col-sm-4 col-md-4 col-lg-4 text-center">
          <div class="form-wrap">
              <%
                  if (request.getAttribute("error") != null){
              %>
              <div class="btn-danger">
                  <%= request.getAttribute("error")%>
              </div>
              <%
                  }
              %>
              <div class="logo">
                  <h1>ورود</h1>
              </div>
              <br><br>
              <form action="login" method="post">
                  <div class="form-group">
                      <i class="fa fa-envelope"></i>
                      <input type="email" name="email" class="form-control" placeholder="ایمیل">
                  </div>
                  <div class="form-group">
                      <i class="fa fa-lock"></i>
                      <input type="password" name="pass" class="form-control" placeholder="رمزعبور">
                  </div>
                  <button class="btn" type="submit">ورود</button>
              </form>
              <a href="signup.jsp">رمز عبورم را فراموش کرده ام</a>
              <br><br>
              <a href="signup.jsp">حساب کاربری ندارید؟کلیک کنید</a>
          </div>
      </div>
  </div>
  </body>
</html>
