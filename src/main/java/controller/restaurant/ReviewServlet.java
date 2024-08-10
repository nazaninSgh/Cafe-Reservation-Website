package controller.restaurant;

import com.ibm.icu.text.DateFormat;
import com.ibm.icu.util.Calendar;
import com.ibm.icu.util.ULocale;
import model.DAO.ReviewDAO;
import model.DTO.Review;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by nazanin on 4/8/2019.
 */
@WebServlet("/review")
public class ReviewServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String comment=request.getParameter("comment");
        String occasion = request.getParameter("occasion");
        int qualityLevel= Integer.parseInt(request.getParameter("ql"));
        String priceLevel=request.getParameter("pl");
        int cafe_id = Integer.parseInt(request.getParameter("id"));
        int user_id = (int) session.getAttribute("customer_id");


        ULocale locale = new ULocale("fa_IR@calendar=persian");
        Calendar calendar = Calendar.getInstance(locale);
        DateFormat df = DateFormat.getDateInstance(DateFormat.FULL, locale);


        Review review = new Review();
        review.setComment(comment);
        review.setPriceLevel(priceLevel);
        review.setQualityLevel(qualityLevel);
        review.setOccasion(occasion);
        review.setCafe_id(cafe_id);
        review.setCustomer_id(user_id);
        review.setDate(df.format(calendar));
        ReviewDAO dao = new ReviewDAO();
        dao.insertReview(review);
        response.sendRedirect("restaurant-profile?id="+cafe_id);

    }
}
