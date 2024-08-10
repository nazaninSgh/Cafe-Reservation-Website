package controller.admin;

import controller.mailer.Mailer;
import credentials.MailCredentials;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by nazanin on 5/18/2019.
 */
@WebServlet("/message")
public class MessageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String to = request.getParameter("to");
        String msg = request.getParameter("response");
        String sub = "نتایج بررسی";

        Mailer.sendEmail(MailCredentials.from,MailCredentials.username,MailCredentials.pass,to,sub,msg);
        response.sendRedirect("/messagePRG");
    }
}
