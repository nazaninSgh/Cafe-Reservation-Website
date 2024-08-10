package controller.user;

import model.DAO.UserDAO;
import model.DTO.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Alieyeh on 5/19/19.
 */
@WebServlet("/OtherUser")
public class OtherUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
//        UserDAO DAO = new UserDAO();
//        User user =DAO.getUserById(id);
//        request.setAttribute("user",user);
        request.getRequestDispatcher("otherUser.jsp?id="+id).forward(request,response);
    }
}
