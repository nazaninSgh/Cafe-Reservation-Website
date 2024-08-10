package controller.restaurant;

import model.DAO.CafeFileDAO;
import model.DAO.RestaurantDAO;
import model.DTO.Restaurant;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;


/**
 * Created by nazanin on 3/31/2019.
 */
@WebServlet("/restaurant-info")
@MultipartConfig(fileSizeThreshold = 1024*1024*2,maxFileSize = 1024*1024*10,maxRequestSize = 1024*1024*50)
public class RestaurantInfoServlet extends HttpServlet {

    private String savePath = "C:/Users/HP/IdeaProjects/cafeReservation/web/img/cafe";
    String fileName;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String name=request.getParameter("name");
        String address=request.getParameter("address");
        String email=request.getParameter("email");
        String description=request.getParameter("description");
        File img = new File(savePath);
        String path = savePath+File.separator+fileName;

        Restaurant restaurant = new Restaurant();
        restaurant.setEmail(email);
        restaurant.setName(name);
        restaurant.setAddress(address);
        restaurant.setDescription(description);
        RestaurantDAO restaurantDAO = new RestaurantDAO();
        restaurantDAO.insertRestaurant(restaurant);
        int cafe_id = restaurantDAO.selectCafeId(email);
        CafeFileDAO cafeFileDAO = new CafeFileDAO();
        List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName())).collect(Collectors.toList()); // Retrieves <input type="file" name="file" multiple="true">

        for (Part filePart : fileParts) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            InputStream fileContent = filePart.getInputStream();
            filePart.write(savePath+File.separator+fileName);
            cafeFileDAO.insertImg(cafe_id,path,fileName);
        }
        response.sendRedirect("show-all-cafe.jsp");

    }
}
