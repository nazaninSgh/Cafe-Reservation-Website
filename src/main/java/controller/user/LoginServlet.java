package controller.user;

import model.DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by HP on 1/31/2019.
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email=request.getParameter("email");
        String password=request.getParameter("pass");

        UserDAO dao=new UserDAO();
        if(dao.loginCheck(email,password)){
            int customer_id = dao.getCustomerId(email);
            HttpSession session=request.getSession();
            session.setAttribute("customer_id",customer_id);
            request.setAttribute("email",email);
            if (request.getAttribute("reserve") == null){
              //  request.getRequestDispatcher("userProf.jsp").forward(request,response);
                response.sendRedirect("userProf.jsp");
            }
            else {
              //  request.getRequestDispatcher("/reservation").forward(request,response);
                response.sendRedirect("/reservation");
            }
        }
        else {

            request.setAttribute("error","اطلاعات وارد شده اشتباه است");
            request.getRequestDispatcher("login.jsp").include(request,response);
        }
    }
}
