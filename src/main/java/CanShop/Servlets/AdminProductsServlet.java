package CanShop.Servlets;

import CanShop.DAO.ProductDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        List productsList = productDAO.getAllProducts();
        req.setAttribute("productsList", productsList);
        req.getRequestDispatcher("/admin/admin_proudcts.jsp").forward(req, resp);
    }

}
