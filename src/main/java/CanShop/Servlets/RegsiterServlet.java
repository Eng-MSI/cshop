package CanShop.Servlets;

import CanShop.DAO.CartDAO;
import CanShop.DAO.UserDAO;
import CanShop.POJOS.User;
import CanShop.Utility.Utilities;
import java.io.IOException;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegsiterServlet extends HttpServlet {

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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        CartDAO cartDAO = new CartDAO();
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String mobile = req.getParameter("mobile");
        String firstPass = req.getParameter("firstPass");
        String secondPass = req.getParameter("secondPass");
        String country = req.getParameter("country");
        String city = req.getParameter("city");
        String email = req.getParameter("email");
        String page = "Home";
        if (userDAO.isMailUsed(email) || !firstPass.equals(secondPass)) {
            
            page = "/register.jsp";
        } else {
            HttpSession Session = req.getSession(false);
            userDAO.addUser(firstName, lastName, email, city, country, firstPass, mobile);
            cartDAO.addCart(userDAO.getUserIdByMail(email));
            User user = userDAO.getUserByEmail(req.getParameter("email"));
            int noOfProducts = cartDAO.getNoOfProductsInCart(cartDAO.getCartId(user.getUserId()));
            int cartTotalPrice = cartDAO.getCartTotalPrice(cartDAO.getCartId(user.getUserId()));
            Session.setAttribute("user", user);
            Session.setAttribute("noOfProducts", noOfProducts);
            Session.setAttribute("cartTotalPrice", cartTotalPrice);
            Utilities utilities = new Utilities();
            try {
                String message = "Thanks for registeringon Canshop please click this link to activate your account http://localhost:8080/CanShop/Verify?i=" + String.valueOf(user.getUserId()) + "&h=" + user.getUserHash();
                utilities.sendEmail(host, port, adminMail, pass, email, "Cashop Avtivation Mail", message);
                page = "Home";
            } catch (MessagingException ex) {
                page = "/register.jsp";
            }
            
        }
        resp.sendRedirect(page);

    }

}
