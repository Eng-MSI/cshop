package CanShop.Servlets;

import CanShop.POJOS.User;
import CanShop.Utility.Utilities;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ActivationMail extends HttpServlet {

    private String host;
    private String port;
    private String adminMail;
    private String pass;

    @Override
    public void init() throws ServletException {
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        adminMail = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {
            Utilities utilities = new Utilities();
            try {
                String message = "Thanks for registeringon Canshop please click this link to activate your account http://localhost:8080/CanShop/Verify?i="+String.valueOf(user.getUserId())+"&h="+user.getUserHash();
                utilities.sendEmail(host, port, adminMail, pass, user.getUserMail(), "Cashop Avtivation Mail", message);
                req.getRequestDispatcher("Home").forward(req, resp);
            } catch (MessagingException ex) {
                req.getRequestDispatcher("Home").forward(req, resp);
            }
        }

    }

}
