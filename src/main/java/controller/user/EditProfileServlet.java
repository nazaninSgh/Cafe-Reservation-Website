package controller.user;

import model.DAO.CafeFileDAO;
import model.DAO.RestaurantDAO;
import model.DAO.UserDAO;
import model.DTO.Restaurant;
import model.DTO.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;


@WebServlet("/editProf")
@MultipartConfig
public class EditProfileServlet extends HttpServlet {

    private String savePath = "C:/Users/HP/IdeaProjects/cafeReservation/web/img/user";
    String fileName;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int id = (int) session.getAttribute("customer_id");
        String name=request.getParameter("name");
        String lastname=request.getParameter("lastname");
        String email=request.getParameter("email");
        String bio = request.getParameter("bio");
        File img = new File(savePath);
        Part part = request.getPart("file");
        System.out.println("part  "+part);
        fileName = ext(part);
        String path = savePath+File.separator+fileName;
        part.write(path);
        System.out.println("yuyuuyuyuyuuyuyuy");
        User user = new User();
        user.setId(id);
        user.setEmail(email);
        user.setName(name);
        user.setLastname(lastname);
        user.setImageName(fileName);
        user.setImagePath(savePath);
        user.setBio(bio);
        UserDAO userDAO = new UserDAO();
        userDAO.update(user);
        request.getRequestDispatcher("userProf.jsp").forward(request,response);
    }

    private String ext(Part part){
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s: items){
            if (s.trim().startsWith("filename")){
                return s.substring(s.indexOf("=")+2,s.length()-1);
            }
        }
        return "";

    }
}
