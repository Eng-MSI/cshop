package CanShop.Servlets;

import CanShop.DAO.ProductDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        String category = req.getParameter("category");
        String searchString = req.getParameter("searchString");
        List list = productDAO.searchProducts(searchString, category);
        if ( list == null) {
            req.setAttribute("searchString", searchString);
            req.getRequestDispatcher("/search_result_no_products.jsp").forward(req, resp);
        } else {
            req.setAttribute("list", list);
            req.setAttribute("searchString", searchString);
            req.getRequestDispatcher("/search_result.jsp").forward(req, resp);
        }

    }

}
