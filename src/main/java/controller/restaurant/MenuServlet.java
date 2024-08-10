package controller.restaurant;

import com.ibm.icu.text.DateFormat;
import com.ibm.icu.util.Calendar;
import com.ibm.icu.util.ULocale;
import model.DAO.MenuDAO;
import model.DAO.ReviewDAO;
import model.DTO.MenuItem;
import model.DTO.Review;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 * Created by nazanin on 5/16/2019.
 */
@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String name=request.getParameter("name");
        String ing = request.getParameter("ing");
        int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
        String price = request.getParameter("price");

        MenuItem menuItem = new MenuItem();
        menuItem.setPrice(price);
        menuItem.setCafe_id(cafe_id);
        menuItem.setIngredients(ing);
        menuItem.setName(name);
        MenuDAO menuDAO = new MenuDAO();
        menuDAO.insertItem(menuItem);

    }

//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("search_id"));
//        MenuDAO menuDAO = new MenuDAO();
//        ArrayList<MenuItem> menuItems = menuDAO.selectItems(id);
//        PrintWriter out = response.getWriter();
//        for (MenuItem menuItem : menuItems) {
//            out.print("<table border='1' cellpadding='2' width='100%'>");
//            out.print("<tr><th>Id</th><th>Name</th><th>Email</th><th>Address</th><th>City</th><th>State</th><th>Country</th></tr>");
////            out.print("<tr><td>" + menuItem.getName() + "</td><td>" + menuItem.getPrice() + "</td></tr>");
//            out.print("</table>");
//        }
////        request.setAttribute("menu",menuItems);
//      //  request.getRequestDispatcher("admin-panel.jsp").include(request,response);
//    }
}
