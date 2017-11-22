package CanShop.Servlets;

import CanShop.DAO.CartDAO;
import CanShop.DAO.OrderedProductsDAO;
import CanShop.POJOS.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RemoveItemServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CartDAO cartDAO = new CartDAO();
        OrderedProductsDAO orderedProductsDAO = new OrderedProductsDAO();
        int productId = Integer.parseInt(req.getParameter("productId"));
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {
            int cartId = cartDAO.getCartId(user.getUserId());
            orderedProductsDAO.deleteOrderedProduct(cartId, productId);
            int noOfProducts = cartDAO.getNoOfProductsInCart(cartDAO.getCartId(user.getUserId()));
            int cartTotalPrice = cartDAO.getCartTotalPrice(cartDAO.getCartId(user.getUserId()));
            session.setAttribute("noOfProducts", noOfProducts);
            session.setAttribute("cartTotalPrice", cartTotalPrice);
            req.getRequestDispatcher("/Checkout").forward(req, resp);
        }
    }

}
