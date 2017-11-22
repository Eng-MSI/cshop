package CanShop.Servlets;

import CanShop.DAO.CartDAO;
import CanShop.DAO.OrderedProductsDAO;
import CanShop.POJOS.ProductInCart;
import CanShop.POJOS.User;
import CanShop.Utility.Utilities;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FinishPurchase extends HttpServlet {

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
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        String page;

        if (user == null) {
            page = "/login.jsp";

        } else {
            int userId = user.getUserId();
            List orderedProducts = new ArrayList<ProductInCart>();
            OrderedProductsDAO orderedProductsDAO = new OrderedProductsDAO();
            orderedProducts = orderedProductsDAO.getOrderedProducts(userId);
            if (orderedProducts == null) {
                page = "/unsuccessful_purchase.jsp";
            } else {
                String userNotes = req.getParameter("userNote");
                Utilities utilities = new Utilities();
                String userName = user.getUserFname() + " " + user.getUserLname();
                String userAddress = user.getUserCountry() + "/" + user.getUserCity();
                String userMobile = user.getUserPhone();
                String userMail = user.getUserMail();
                String message = userName + " made this order ";
                for (Iterator iterator
                        = orderedProducts.iterator(); iterator.hasNext();) {
                    ProductInCart productInCart = (ProductInCart) iterator.next();
                    message = message.concat(String.valueOf(productInCart.getOrderedQuantity()) + " " + productInCart.getProductName() + " ");

                }
                message = message.concat("user notes " + userNotes + " user phone : " + userMobile + " user mail : " + userMail + " user address : " + userAddress);
                try {
                    utilities.sendEmail(host, port, adminMail, pass, userMail, "User order (" + userName + ")", message);
                    orderedProductsDAO.finishOrder(userId);
                    CartDAO cartDAO = new CartDAO();
                    cartDAO.emptyCart(userId);
                    int noOfProducts = cartDAO.getNoOfProductsInCart(userId);
                    int cartTotalPrice = cartDAO.getCartTotalPrice(userId);
                    session.setAttribute("noOfProducts", noOfProducts);
                    session.setAttribute("cartTotalPrice", cartTotalPrice);
                    page = "/successful_purchase.jsp";
                } catch (MessagingException ex) {
                    Logger.getLogger(FinishPurchase.class.getName()).log(Level.SEVERE, null, ex);
                    page = "/unsuccessful_purchase.jsp";
                }
            }
        }

        req.getRequestDispatcher(page).forward(req, resp);
    }
}
