package CanShop.Servlets;

import CanShop.DAO.OrderedProductsDAO;
import CanShop.POJOS.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        OrderedProductsDAO orderedProductsDAO = new OrderedProductsDAO();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {
            List productsList = orderedProductsDAO.getOrderedProducts(user.getUserId());
            req.setAttribute("productsList", productsList);
            req.getRequestDispatcher("/product_summary.jsp").forward(req, resp);

        }
    }

}
