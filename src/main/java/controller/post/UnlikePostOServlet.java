package controller.post;

import model.DAO.PostDAO;

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
@WebServlet("/UnlikePostO")
public class UnlikePostOServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        if (session.getAttribute("customer_id") == null){
            response.sendRedirect("login.jsp");
        }
        else {
            int uid = Integer.parseInt(String.valueOf(session.getAttribute("customer_id")));
            String pid=request.getParameter("unlike");
            PostDAO dao=new PostDAO();
            dao.unlike(uid,Integer.parseInt(String.valueOf(pid)));

            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            response.setDateHeader("Expires", 0);
            request.getRequestDispatcher("otherUser.jsp").forward(request,response);
        }

    }
}
