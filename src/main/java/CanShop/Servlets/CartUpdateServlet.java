package CanShop.Servlets;

import CanShop.DAO.CartDAO;
import CanShop.DAO.OrderedProductsDAO;
import CanShop.POJOS.User;
import CanShop.POJOS.OrderedProudcts;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CartUpdateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        CartDAO cartDAO = new CartDAO();
        OrderedProductsDAO orderedProductsDAO = new OrderedProductsDAO();
        
        int productQuantity = Integer.parseInt(req.getParameter("productQuantity"));
        if (user == null) {
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {
            int cartId = cartDAO.getCartId(user.getUserId());
            int productId = Integer.parseInt(req.getParameter("productId"));
            OrderedProudcts orderedProduct = orderedProductsDAO.getOrderedProductById(productId, cartId);
            int orderedProductId = orderedProduct.getOrderedProductsId();
            orderedProductsDAO.updateOrderedProduct(orderedProductId, cartId, productQuantity);
            int noOfProducts = cartDAO.getNoOfProductsInCart(cartDAO.getCartId(user.getUserId()));
            int cartTotalPrice = cartDAO.getCartTotalPrice(cartDAO.getCartId(user.getUserId()));
            session.setAttribute("noOfProducts", noOfProducts);
            session.setAttribute("cartTotalPrice", cartTotalPrice);
            req.getRequestDispatcher("/Checkout").forward(req, resp);

        }

        //
    }

}
