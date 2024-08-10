package controller.reservation;

import model.DTO.Restaurant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by nazanin on 7/12/2019.
 */
@WebServlet("/ReservePRG")
public class ReservePRG extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        int success = Integer.parseInt(req.getParameter("s"));
        HttpSession session = req.getSession();
        String error = String.valueOf(session.getAttribute("error"));
        String crushed = String.valueOf(session.getAttribute("crushed"));
        Restaurant restaurant =(Restaurant) session.getAttribute("restaurant");
        int id = restaurant.getId();
        if(success == 1){
            req.setAttribute("crushed",crushed);
            req.getRequestDispatcher("restaurantProf.jsp?id="+id).include(req,res);
        }
        else {
            req.setAttribute("error",error);
            req.getRequestDispatcher("restaurantProf.jsp?id="+id).include(req,res);
        }
    }
}
