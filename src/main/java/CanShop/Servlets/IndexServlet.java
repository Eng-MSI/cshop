package CanShop.Servlets;

import CanShop.DAO.ProductDAO;
import CanShop.POJOS.Products;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();

        if (cookies == null) {
            Cookie lang = new Cookie("lang", "en");
            lang.setPath("/");
            lang.setMaxAge(365 * 24 * 60 * 60);
            HttpSession session = request.getSession();
            session.setAttribute("lang", "en");
            response.addCookie(lang);
        }
        ProductDAO productDAO = new ProductDAO();
        List<Products> listByDate = productDAO.getAllProductsOrderedByDate();
        List<Products> listByOrdersNo = productDAO.getAllProductsOrderedByOrdersNo();
        List<Products> featuredProducts = productDAO.getFeaturedProducts();
        request.setAttribute("listByDate", listByDate);
        request.setAttribute("listByOrdersNo", listByOrdersNo);
        request.setAttribute("featuredProducts", featuredProducts);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

}
