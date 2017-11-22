package CanShop.Servlets;

import CanShop.DAO.CartDAO;
import CanShop.DAO.OrderedProductsDAO;
import CanShop.DAO.ProductDAO;
import CanShop.DAO.UserDAO;
import CanShop.POJOS.User;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        CartDAO cartDAO = new CartDAO();
        OrderedProductsDAO orderedProductsDAO = new OrderedProductsDAO();
        ProductDAO productDAO = new ProductDAO();
        int productId = Integer.parseInt(req.getParameter("productId"));

        if (session.getAttribute("user") == null) {
            resp.setHeader("REQUIRES_AUTH", "1");
        } else {
            UserDAO userDAO = new UserDAO();
            User user = (User) session.getAttribute("user");
            int userId = user.getUserId();
            boolean isActive = userDAO.isUserActive(userId);
            if (isActive) {
                int cartId = cartDAO.getCartId(userId);
                
                int productQuantity = 1;
                if (req.getParameter("productQuantity") != null) {
                    productQuantity = Integer.parseInt(req.getParameter("productQuantity"));
                }
                
                orderedProductsDAO.addProductToCart(cartId, productId, productQuantity, new Date());
                productDAO.updateProductOrdersNo(productId);
                int noOfProducts = cartDAO.getNoOfProductsInCart(cartDAO.getCartId(user.getUserId()));
                int cartTotalPrice = cartDAO.getCartTotalPrice(cartDAO.getCartId(user.getUserId()));
                session.setAttribute("noOfProducts", noOfProducts);
                session.setAttribute("cartTotalPrice", cartTotalPrice);

            } else {
                resp.setHeader("REQUIRES_AUTH", "2");
            }

        }

    }

}
