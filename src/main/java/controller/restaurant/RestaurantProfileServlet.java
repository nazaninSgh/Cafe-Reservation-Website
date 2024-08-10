package controller.restaurant;

import model.DAO.CafeFileDAO;
import model.DAO.RestaurantDAO;
import model.DTO.Restaurant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by nazanin on 3/31/2019.
 */
@WebServlet("/restaurant-profile")
public class RestaurantProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        RestaurantDAO restaurantDAO = new RestaurantDAO();
        Restaurant restaurant = restaurantDAO.selectRestaurantsById(id);
        CafeFileDAO dao = new CafeFileDAO();
        restaurant.setImage(dao.selectImages(id));
        HttpSession session1 = request.getSession();
        session1.setAttribute("restaurant",restaurant);
        response.sendRedirect("restaurantProf.jsp?id="+id);
       // request.setAttribute("restaurant",restaurant);
       // request.getRequestDispatcher("restaurantProf.jsp").forward(request,response);
    }

}
