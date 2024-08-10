package controller.post;

import model.DAO.PostDAO;
import model.DTO.Post;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;


@WebServlet("/MakePost")
@MultipartConfig
public class MakePostServlet extends HttpServlet {
    private String picPath = "C:/Users/HP/IdeaProjects/cafeReservation/web/img/post";
    String fileName;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        if (session.getAttribute("customer_id")== null){
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
        else {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            String caption = request.getParameter("caption");
            File img = new File(picPath);
            Part part = request.getPart("file");
            System.out.println("part  "+part);
            fileName = ext(part);
            String path = picPath+File.separator+fileName;
            part.write(path);
            int customerId = Integer.parseInt(String.valueOf(session.getAttribute("customer_id")));
            Post post = new Post(fileName,picPath,caption,customerId);
            PostDAO dao = new PostDAO();
            dao.insert(post);
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            response.setDateHeader("Expires", 0);
            request.getRequestDispatcher("userProf.jsp").include(request,response);
        }
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
