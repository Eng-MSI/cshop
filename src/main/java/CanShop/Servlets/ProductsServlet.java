package CanShop.Servlets;

import CanShop.DAO.CategoryDAO;
import CanShop.DAO.ProductDAO;
import CanShop.POJOS.Category;
import CanShop.POJOS.Products;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        String string = request.getParameter("category");
        String category = null;
        List<Products> productsList = null;
        List<Products> list = null;
        int totalPagesNo = 0;
        int totalProductsNo = 0;
        int pageNo = Integer.parseInt(request.getParameter("pageNo"));
        int listIndex = (pageNo - 1) * 9;

        if (string.contains("_")) {
            CharSequence charSequence = string.subSequence(string.indexOf('_') + 1, string.length());
            category = charSequence.toString();

            productsList = productDAO.getProductsBySubCategory(category);
            if (productsList == null) {
                request.setAttribute("category", string);
                request.getRequestDispatcher("/no_products.jsp").forward(request, response);
            } else {
                totalProductsNo = productsList.size();

                if (productsList.size() % 9 != 0) {
                    totalPagesNo = (productsList.size() / 9) + 1;
                    if (pageNo > (productsList.size() / 9)) {
                        list = productsList.subList(listIndex, productsList.size());
                    } else {
                        list = productsList.subList(listIndex, listIndex + 9);
                    }
                } else {
                    totalPagesNo = productsList.size() / 9;
                    list = productsList.subList(listIndex, listIndex + 9);
                }
                request.setAttribute("category", "Phone Accessories");
                request.setAttribute("arabicCategory", "اكسسوارات موبايل");
                request.setAttribute("totalPagesNo", totalPagesNo);
                request.setAttribute("list", list);
                request.setAttribute("nextPage", pageNo + 1);
                request.setAttribute("prevPage", pageNo - 1);
                request.setAttribute("noOfProducts", totalProductsNo);
                request.getRequestDispatcher("/products.jsp").forward(request, response);

            }

        } else {
            category = string;

            productsList = productDAO.getProductsByCategory(category);
            if (productsList == null) {
                request.setAttribute("category", string);
                request.getRequestDispatcher("/no_products.jsp").forward(request, response);
            } else {
                totalProductsNo = productsList.size();
                CategoryDAO categoryDAO = new CategoryDAO();
                String arabicCategory = categoryDAO.getCategoryArabicName(category);
                if (productsList.size() % 9 != 0) {
                    totalPagesNo = (productsList.size() / 9) + 1;
                    if (pageNo > (productsList.size() / 9)) {
                        list = productsList.subList(listIndex, productsList.size());
                    } else {
                        list = productsList.subList(listIndex, listIndex + 9);
                    }
                } else {
                    totalPagesNo = productsList.size() / 9;
                    list = productsList.subList(listIndex, listIndex + 9);
                }

                request.setAttribute("category", category);
                request.setAttribute("arabicCategory", arabicCategory);
                request.setAttribute("totalPagesNo", totalPagesNo);
                request.setAttribute("list", list);
                request.setAttribute("nextPage", pageNo + 1);
                request.setAttribute("prevPage", pageNo - 1);
                request.setAttribute("noOfProducts", totalProductsNo);
                request.getRequestDispatcher("/products.jsp").forward(request, response);

            }
        }

    }

}
