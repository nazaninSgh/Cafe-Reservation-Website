package controller.user;

import model.DAO.CafeFileDAO;
import model.DAO.RestaurantDAO;
import model.DAO.UserDAO;
import model.DTO.Restaurant;
import model.DTO.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by Alieyeh on 7/12/19.
 */
@WebServlet("/Search")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String name=request.getParameter("name");
        String type=request.getParameter("type");
        if(type.equals("res")){
            RestaurantDAO rdao=new RestaurantDAO();

            ArrayList<Restaurant> restaurants = rdao.nameSearch(name);
            System.out.println("  resssss  "+restaurants.size());
            CafeFileDAO dao = new CafeFileDAO();
            for (Restaurant res: restaurants) {
                res.setImage(dao.selectImages(res.getId()));
            }
            request.setAttribute("user",null);
            request.setAttribute("restaurants",restaurants);
            request.getRequestDispatcher("search.jsp").forward(request,response);

        }else{
            UserDAO dao=new UserDAO();

            ArrayList<User> users=dao.nameSearch(name);
            request.setAttribute("users",users);
            request.setAttribute("restaurants",null);
            request.getRequestDispatcher("search.jsp").forward(request,response);
        }
    }
}
