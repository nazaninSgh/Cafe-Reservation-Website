package controller.filter;

import model.DTO.Reservation;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by nazanin on 4/2/2019.
 */
@WebFilter(filterName = "LoginFilter")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession(false);

        HttpSession reservationSession = request.getSession();
        int cafeId = Integer.parseInt(request.getParameter("id"));
        int numOfPeople= Integer.parseInt(request.getParameter("people"));
        String date=request.getParameter("date");


        Reservation reservation = new Reservation();
        reservation.setDate(date);
        reservation.setNumOfPeople(numOfPeople);

        reservation.setCafeId(cafeId);
        reservationSession.setAttribute("reservation",reservation);

        if (session == null || session.getAttribute("customer_id") == null) {
            //request.setAttribute("reserve","true");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        } else {
            chain.doFilter(req, resp);
        }

    }

    public void init(FilterConfig config) throws ServletException {

    }
}
