package controller.owner;

import com.ibm.icu.text.DateFormat;
import com.ibm.icu.util.Calendar;
import com.ibm.icu.util.ULocale;
import controller.mailer.Mailer;
import model.DAO.MessagesDAO;
import model.DTO.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by nazanin on 5/13/2019.
 */
@WebServlet("/send")
public class SendDetailsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String cafe = request.getParameter("cafe");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String description = request.getParameter("description");
        int phone = Integer.parseInt(request.getParameter("phone"));

        ULocale locale = new ULocale("fa_IR@calendar=persian");
        Calendar calendar = Calendar.getInstance(locale);
        DateFormat df = DateFormat.getDateInstance(DateFormat.FULL, locale);

        Message message = new Message();
        message.setRead(false);
        message.setDate(df.format(calendar));
        message.setSubject("درخواست بررسی");
        message.setBody(name+"\n"+cafe+"\n"+description+"\n"+address+"\n"+phone);
        message.setAuthor(email);

        MessagesDAO messagesDAO = new MessagesDAO();
        messagesDAO.insertMessage(message);

    }
}
