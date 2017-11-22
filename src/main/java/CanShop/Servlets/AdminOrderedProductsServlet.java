
package CanShop.Servlets;

import CanShop.DAO.AdminOrderedProductsDAO;
import CanShop.DAO.OrderedProductsDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminOrderedProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderedProductsDAO orderedProductsDAO = new OrderedProductsDAO();
        AdminOrderedProductsDAO adminOrderedProductsDAO = new AdminOrderedProductsDAO();
        List orderedProductsList = adminOrderedProductsDAO.getAdminOrderedProducts();
        List datesList = orderedProductsDAO.getOrderesDates();
        req.setAttribute("datesList", datesList);
        req.setAttribute("orderedProducts", orderedProductsList);
        req.getRequestDispatcher("/admin/admin_ordered_products.jsp").forward(req, resp);
    }
    
}
