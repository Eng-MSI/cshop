package CanShop.Servlets;

import CanShop.DAO.ProductDAO;
import CanShop.POJOS.Products;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AdminEditProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("Product_Id"));
        ProductDAO productDAO = new ProductDAO();
        Products product = productDAO.getProductById(productId);
        req.setAttribute("product", product);
        req.getRequestDispatcher("/admin/admin_edit_proudct.jsp").forward(req, resp);
    }
    
}
