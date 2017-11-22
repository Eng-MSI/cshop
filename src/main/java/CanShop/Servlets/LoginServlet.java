package CanShop.Servlets;

import CanShop.DAO.CartDAO;
import CanShop.DAO.UserDAO;
import CanShop.POJOS.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        CartDAO cartDAO = new CartDAO();
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        if (userDAO.isUserSignedUp(password, email)) {
            HttpSession Session = req.getSession(false);
            User user = userDAO.getUserByEmail(req.getParameter("email"));
            int noOfProducts = cartDAO.getNoOfProductsInCart(cartDAO.getCartId(user.getUserId()));
            int cartTotalPrice = cartDAO.getCartTotalPrice(cartDAO.getCartId(user.getUserId()));
            Session.setAttribute("user", user);
            Session.setAttribute("noOfProducts", noOfProducts);
            Session.setAttribute("cartTotalPrice", cartTotalPrice);
            System.out.println("no of products = " + noOfProducts);
            System.out.println("total price = " + cartTotalPrice);
            resp.sendRedirect("Home");
        } else {

            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }

}
