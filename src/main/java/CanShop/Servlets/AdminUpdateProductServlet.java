package CanShop.Servlets;

import CanShop.DAO.CategoryDAO;
import CanShop.DAO.ProductDAO;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminUpdateProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        CategoryDAO categoryDAO = new CategoryDAO();
        int productId = Integer.parseInt(req.getParameter("productId"));
        String productName = req.getParameter("ProductName");
        String productArabicName = req.getParameter("ProductArabicName");
        int productPrice = Integer.parseInt(req.getParameter("ProductPrice"));
        int productNewPrice = Integer.parseInt(req.getParameter("NewPrice"));
        int productQuantity = Integer.parseInt(req.getParameter("ProductQuantity"));
        int productViewers = Integer.parseInt(req.getParameter("ProductViewers"));
        int productOrders = Integer.parseInt(req.getParameter("ProductOrders"));
        String productDescription = req.getParameter("ProductDescription");
        String productArabicDescription = req.getParameter("ProductArabicDescription");
        String productBrand = req.getParameter("ProductBrand");
        String productArabicBrand = req.getParameter("ProductArabicBrand");
        Date productDate = new Date(req.getParameter("ProductDate"));
        String productDimension = req.getParameter("ProductDimentions");
        String productSerial = req.getParameter("ProductSerial");
        Boolean productHotoffer = false;
        Boolean productFeatured = false;
        if (req.getParameter("chkPrice") == null) {
            productHotoffer = false;
        } else {
            productHotoffer = true;
        }
        if (req.getParameter("productFeatured") == null) {
            productFeatured = false;
        } else {
            productFeatured = true;
        }
        String productCategory = req.getParameter("ProductCategory");
        String productSubcategory = req.getParameter("subCategory");
        int categoryId = categoryDAO.getCategoryId(productCategory);
        int subCategoryId = 0;
        if (productSubcategory == null) {
            subCategoryId = 0;
        } else {
            subCategoryId = categoryDAO.getSubCategoryId(productSubcategory);
           
        }

        ProductDAO productDAO = new ProductDAO();
        productDAO.UpdateProduct(productId, categoryId, subCategoryId, productName, productPrice, productNewPrice, productQuantity, productViewers, productOrders, productDescription, productBrand, productDate, productDimension, productSerial, productHotoffer, productArabicName, productArabicDescription, productArabicBrand, productFeatured);
        req.getRequestDispatcher("Admin_Products").forward(req, resp);
    }

}
