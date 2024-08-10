package controller.post;

import model.DAO.PostDAO;
import model.DAO.UserDAO;
import model.DTO.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by nazanin on 7/13/2019.
 */
@WebServlet("/LikePostO")
public class LikePostOServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0);
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int uid = Integer.parseInt(String.valueOf(session.getAttribute("customer_id")));
        String pid=request.getParameter("like");
        PostDAO dao=new PostDAO();
        dao.like(uid,Integer.parseInt(String.valueOf(pid)));

        int id = Integer.parseInt(request.getParameter("id"));
        UserDAO DAO = new UserDAO();
        User user =DAO.getUserById(id);
        System.out.println("dieeeeeeee   "+id);
        request.setAttribute("user",user);
        request.getRequestDispatcher("otherUser.jsp").forward(request,response);
    }
}
