package CanShop.Servlets;

import CanShop.DAO.ProductDAO;
import CanShop.POJOS.Products;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProductDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        int productId = Integer.parseInt(req.getParameter("productId"));
        productDAO.updateProductViewers(productId);
        Products product = productDAO.getProductById(productId);
        req.setAttribute("product", product);
        req.getRequestDispatcher("/product_details.jsp").forward(req, resp);

    }
    
}
