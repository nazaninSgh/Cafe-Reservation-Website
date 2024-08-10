<%--
  Created by IntelliJ IDEA.
  User: nazanin
  Date: 7/12/2019
  Time: 10:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        div.box{
            margin: 2px 30px 2px 2px;
            border:1px solid saddlebrown;padding:8px;background-color: rgba(135, 68, 0, 0.05)
        }
    </style>
</head>
<body>

<%@ page import="java.sql.*" %>
<%
    String comment=request.getParameter("comment");
    int uid = Integer.parseInt(request.getParameter("uid"));
    int rid = Integer.parseInt(request.getParameter("rid"));
    String name = null,last = null,file=null;
    if(comment==null||comment.trim().equals("")){

    }else{

        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection= DriverManager.getConnection("jdbc:mysql://localhost/reservation?useUnicode=true&characterEncoding=UTF-8","root","");
            PreparedStatement statement2 = connection.prepareStatement("SELECT * FROM users WHERE uid=?");
            statement2.setInt(1,uid);
            System.out.println("areeee  "+uid);
            ResultSet rs1=statement2.executeQuery();
            while(rs1.next()){
                System.out.println("İto checkam");
                file = rs1.getString("filename");
                name = rs1.getString("name");
                last = rs1.getString("lastname");
            }

            PreparedStatement statement=connection.prepareStatement("INSERT INTO reply(uid,rid,body) VALUES (?,?,?)");
            statement.setInt(1,uid);
            statement.setInt(2,rid);
            statement.setString(3,comment);
            int i=statement.executeUpdate();

            PreparedStatement statement1=connection.prepareStatement("SELECT * FROM reply WHERE rid=?");
            statement1.setInt(1,rid);
            ResultSet rs=statement1.executeQuery();

            String path = "img/user/";
            while(rs.next()){
                out.print("<div class='box'>");
                out.print("<img style=\"width: 35px; height:35px;\" src="+path+file+">");
                out.print("<div>"+name+" "+last+"</div>");
                out.print("<div>"+rs.getString("body")+"</div>");
                out.print("</div>");
            }

            connection.close();
        }catch(Exception e){
            e.printStackTrace();}

    }
%>
</body>
</html>
