package controller.user;

import model.DAO.UserDAO;

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
@WebServlet("/Unfollow")
public class UnfollowServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int uid = Integer.parseInt(String.valueOf(session.getAttribute("customer_id")));
        int id= Integer.parseInt(request.getParameter("id"));
        UserDAO dao=new UserDAO();
        dao.unfollow(uid,Integer.parseInt(String.valueOf(id)));
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0);
        request.getRequestDispatcher("otherUser.jsp?id="+id).forward(request,response);
    }
}
