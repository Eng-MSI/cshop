package CanShop.Servlets;

import CanShop.DAO.CategoryDAO;
import CanShop.DAO.ProductDAO;
import CanShop.POJOS.Products;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminAddProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        CategoryDAO categoryDAO = new CategoryDAO();
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
        System.out.println("productFeatured " + productFeatured);
        System.out.println("productHotoffer " + productHotoffer);
        int categoryId = categoryDAO.getCategoryId(productCategory);
        int subCategoryId = 0;
        if (productSubcategory == null) {
            subCategoryId = 0;
        } else {
            subCategoryId = categoryDAO.getSubCategoryId(productSubcategory);

        }

        ProductDAO productDAO = new ProductDAO();
        productDAO.addNewProduct(categoryId, subCategoryId, productName, productPrice, productNewPrice, productQuantity, productViewers, productOrders, productDescription, productBrand, productDate, productDimension, productSerial, productHotoffer, productArabicName, productArabicDescription, productArabicBrand, productFeatured);
        Products product = productDAO.getProductByName(productName);
        req.setAttribute("product", product);
        req.getRequestDispatcher("/admin/admin_add_images.jsp").forward(req, resp);

    }

}
