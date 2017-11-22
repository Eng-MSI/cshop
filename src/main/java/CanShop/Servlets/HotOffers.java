package CanShop.Servlets;

import CanShop.DAO.ProductDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HotOffers extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        List productsList = productDAO.getHotOffers();
        req.setAttribute("list", productsList);
        req.getRequestDispatcher("/special_offer.jsp").forward(req, resp);
    }

}
