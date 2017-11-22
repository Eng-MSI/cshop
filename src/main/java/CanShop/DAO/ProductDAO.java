package CanShop.DAO;

import CanShop.HibernateUtil;
import CanShop.POJOS.Category;
import CanShop.POJOS.Products;
import CanShop.POJOS.Subcategory;
import CanShop.Utility.CompareDate;
import CanShop.Utility.CompareOrders;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class ProductDAO {

    public void addNewProduct(int categoryId, int subcategoryId, String productName, int productPrice, Integer productNprice, int productAmount, int productViewer, int productOrdersNo, String productDescription, String productBrand, Date productDate, String productDimentions, String productSerialNo, Boolean productHotOffer, String productArabicName, String productArabicDescription, String productArabicBrand, Boolean productFeatured) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        Subcategory subcategory = null;
        CategoryDAO categoryDAO = new CategoryDAO();
        Category category = categoryDAO.getCategoryByName(categoryId);
        if (subcategoryId == 0) {
            try {
                tx = session.beginTransaction();
                Products product = new Products(category, subcategory, productName, productPrice, productNprice, productAmount, productViewer, productOrdersNo, productDescription, productBrand, productDate, productDimentions, productSerialNo, productHotOffer, productArabicName, productArabicDescription, productArabicBrand, productFeatured);
                session.save(product);
                tx.commit();
            } catch (HibernateException e) {
                if (tx != null) {
                    tx.rollback();
                }
                e.printStackTrace();
            } finally {
                session.close();
            }
        } else {
            subcategory = categoryDAO.getSubCategoryByName(subcategoryId);
            try {
                tx = session.beginTransaction();
                Products product = new Products(category, subcategory, productName, productPrice, productNprice, productAmount, productViewer, productOrdersNo, productDescription, productBrand, productDate, productDimentions, productSerialNo, productHotOffer, productArabicName, productArabicDescription, productArabicBrand, productFeatured);
                session.save(product);
                tx.commit();
            } catch (HibernateException e) {
                if (tx != null) {
                    tx.rollback();
                }
                e.printStackTrace();
            } finally {
                session.close();
            }
        }

    }

    public List getProductsByCategory(String category) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List productsList = null;
        try {
            tx = session.beginTransaction();
            productsList = session.createQuery("from Products as product where product.category.categoryName = '" + category + "'").list();
            if (productsList.isEmpty()) {
                productsList = null;
            }

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return productsList;
    }

    public List getProductsBySubCategory(String subCategoryName) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List productsList = null;
        try {
            tx = session.beginTransaction();
            productsList = session.createQuery("from Products as product where product.subcategory.subCategoryName =\'" + subCategoryName + "\'").list();
            if (productsList.isEmpty()) {
                return null;
            }
//            for (Iterator iterator
//                    = productsList.iterator(); iterator.hasNext();) {
//                Products products = (Products) iterator.next();
//                System.out.print(" Name: " + products.getProductName());
//
//            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return productsList;
    }

    public Products getProductById(int productId) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List list = null;
        Products product = null;
        try {
            tx = session.beginTransaction();
            list = session.createQuery("from Products as product  where product.productId= " + productId).list();
            product = (Products) list.get(0);
//            for (Iterator iterator
//                    = productsList.iterator(); iterator.hasNext();) {
//                Products products = (Products) iterator.next();
//                System.out.print(" Name: " + products.getProductName());
//
//            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return product;
    }

    public List getAllProducts() {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List productsList = null;
        try {
            tx = session.beginTransaction();
            productsList = session.createQuery("from Products").list();
            if (productsList.isEmpty()) {
                return null;
            }
//            for (Iterator iterator
//                    = productsList.iterator(); iterator.hasNext();) {
//                Products products = (Products) iterator.next();
//                System.out.print(" Name: " + products.getProductName());
//
//            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return productsList;
    }

    public List getAllProductsOrderedByOrdersNo() {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List productsList = null;
        try {
            tx = session.beginTransaction();
            productsList = session.createQuery("from Products").list();
            Collections.sort(productsList, new CompareOrders());
            if (productsList.isEmpty()) {
                return null;
            }
//            for (Iterator iterator
//                    = productsList.iterator(); iterator.hasNext();) {
//                Products products = (Products) iterator.next();
//                System.out.print(" Name: " + products.getProductName());
//
//            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return productsList;
    }

    public List getAllProductsOrderedByDate() {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List productsList = null;
        try {
            tx = session.beginTransaction();
            productsList = session.createQuery("from Products").list();
            if (productsList.isEmpty()) {
                return null;
            }
            Collections.sort(productsList, new CompareDate());
//            for (Iterator iterator
//                    = productsList.iterator(); iterator.hasNext();) {
//                Products products = (Products) iterator.next();
//                System.out.print(" Name: " + products.getProductName());
//
//            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return productsList;
    }

    public int getProductPrice(int productId) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        int productPrice = 0;
        try {
            tx = session.beginTransaction();
            List productsList = session.createQuery("select product.productPrice from Products as product where product.productId = " + productId).list();
            if (productsList.isEmpty()) {
                return 0;
            }
            productPrice = ((int) productsList.get(0));
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return productPrice;
    }

    public int getProductNewPrice(int productId) {

        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        int productPrice = 0;
        try {
            tx = session.beginTransaction();
            List productsList = session.createQuery("select product.productNprice from Products as product where product.productId = " + productId).list();
            if (productsList.isEmpty()) {
                return 0;
            }
            productPrice = ((int) productsList.get(0));
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return productPrice;
    }

    public List searchProducts(String searchString, String category) {

        if (searchString != null && !searchString.isEmpty() && searchString != "" && searchString != " ") {
            if (category.equals("all")) {
                Session session = HibernateUtil.getSession();
                Transaction tx = null;
                List productsList = null;
                List resultList = new ArrayList<Products>();
                try {
                    tx = session.beginTransaction();
                    productsList = session.createQuery("from Products").list();
                    if (productsList.isEmpty()) {
                        return null;
                    }
                    for (Iterator iterator
                            = productsList.iterator(); iterator.hasNext();) {
                        Products products = (Products) iterator.next();
                        if (products.getProductName().toLowerCase().contains(searchString.toLowerCase()) || products.getProductArabicName().contains(searchString)) {
                            resultList.add(products);
                        }

                    }
                    tx.commit();
                } catch (HibernateException e) {
                    if (tx != null) {
                        tx.rollback();
                    }
                    e.printStackTrace();
                } finally {
                    session.close();
                }
                if (resultList.isEmpty()) {
                    return null;
                } else {
                    return resultList;
                }

            } else {

                List productsList = getProductsByCategory(category);
                List resultList = new ArrayList<Products>();
                if (productsList == null) {
                    return null;
                }
                for (Iterator iterator
                        = productsList.iterator(); iterator.hasNext();) {
                    Products products = (Products) iterator.next();
                    if (products.getProductName().toLowerCase().contains(searchString.toLowerCase()) || products.getProductArabicName().contains(searchString)) {
                        resultList.add(products);
                    }

                }
                if (resultList.isEmpty()) {
                    return null;
                } else {
                    return resultList;
                }

            }
        } else {
            return null;
        }
    }

    public List searchArabicProducts(String searchString, String category) {

        if (category.equals("all")) {
            Session session = HibernateUtil.getSession();
            Transaction tx = null;
            List productsList = null;
            List resultList = new ArrayList<Products>();
            try {
                tx = session.beginTransaction();
                productsList = session.createQuery("from Products").list();
                if (productsList.isEmpty()) {
                    return null;
                }
                for (Iterator iterator
                        = productsList.iterator(); iterator.hasNext();) {
                    Products products = (Products) iterator.next();
                    if (products.getProductArabicName().contains(searchString)) {
                        resultList.add(products);
                    }

                }
                tx.commit();
            } catch (HibernateException e) {
                if (tx != null) {
                    tx.rollback();
                }
                e.printStackTrace();
            } finally {
                session.close();
            }
            return resultList;
        } else {

            List productsList = getProductsByCategory(category);
            List resultList = new ArrayList<Products>();
            if (productsList.isEmpty()) {
                return null;
            }
            for (Iterator iterator
                    = productsList.iterator(); iterator.hasNext();) {
                Products products = (Products) iterator.next();
                if (products.getProductArabicName().contains(searchString)) {
                    resultList.add(products);
                }

            }

            return resultList;
        }
    }

    public List getHotOffers() {

        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List productsList = null;
        List hotOffers = new ArrayList<Products>();
        try {
            tx = session.beginTransaction();
            productsList = session.createQuery("from Products").list();
            if (productsList.isEmpty()) {
                return null;
            }
            for (Iterator iterator
                    = productsList.iterator(); iterator.hasNext();) {
                Products products = (Products) iterator.next();
                if (products.getProductHotOffer()) {
                    hotOffers.add(products);
                }

            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return hotOffers;
    }

    public List getFeaturedProducts() {

        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List productsList = null;
        List featuredProducts = new ArrayList<Products>();
        try {
            tx = session.beginTransaction();
            productsList = session.createQuery("from Products").list();
            if (productsList.isEmpty()) {
                return null;
            }
            for (Iterator iterator
                    = productsList.iterator(); iterator.hasNext();) {
                Products products = (Products) iterator.next();
                if (products.getProductFeatured()) {
                    featuredProducts.add(products);
                }

            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return featuredProducts;
    }

    public Products getProductByName(String productName) {

        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        Products product = null;

        try {
            tx = session.beginTransaction();
            Criteria criteria = session.createCriteria(Products.class);
            criteria.add(Restrictions.eq("productName", productName));
            List products = criteria.list();
            product = (Products) products.get(0);
            System.out.println(product.getProductArabicName());
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return product;

    }

    public void UpdateProduct(int productId, int categoryId, int subcategoryId, String productName, int productPrice, Integer productNprice, int productAmount, int productViewer, int productOrdersNo, String productDescription, String productBrand, Date productDate, String productDimentions, String productSerialNo, Boolean productHotOffer, String productArabicName, String productArabicDescription, String productArabicBrand, Boolean productFeatured) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        CategoryDAO categoryDAO = new CategoryDAO();
        Category category = categoryDAO.getCategoryByName(categoryId);
        Subcategory subcategory = null;
        if (subcategoryId != 0) {
            subcategory = categoryDAO.getSubCategoryByName(subcategoryId);
        }

        try {
            tx = session.beginTransaction();
            Products product = (Products) session.get(Products.class, productId);
            product.setCategory(category);
            if (subcategoryId != 0) {
                product.setSubcategory(subcategory);
            }
            product.setProductName(productName);
            product.setProductPrice(productPrice);
            product.setProductNprice(productNprice);
            product.setProductAmount(productAmount);
            product.setProductViewer(productViewer);
            product.setProductOrdersNo(productOrdersNo);
            product.setProductDescription(productDescription);
            product.setProductArabicDescription(productArabicDescription);
            product.setProductBrand(productBrand);
            product.setProductDate(productDate);
            product.setProductDimentions(productDimentions);
            product.setProductSerialNo(productSerialNo);
            product.setProductHotOffer(productHotOffer);
            product.setProductArabicName(productArabicName);
            product.setProductArabicBrand(productArabicBrand);
            product.setProductFeatured(productFeatured);
            session.update(product);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public void removeProduct(int productId) {
        List list = null;
        Products Product = null;
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            list = session.createQuery("from Products as product where product.productId =" + productId).list();
            Product = (Products) list.get(0);
            session.delete(Product);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void updateProductViewers(int productId) {

        List list = null;
        Products Product = null;
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            list = session.createQuery("from Products as product where product.productId =" + productId).list();
            Product = (Products) list.get(0);
            int productViewers = Product.getProductViewer();
            Product.setProductViewer(productViewers + 1);
            session.update(Product);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void updateProductOrdersNo(int productId) {

        List list = null;
        Products Product = null;
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            list = session.createQuery("from Products as product where product.productId =" + productId).list();
            Product = (Products) list.get(0);
            int productOrdersNo = Product.getProductOrdersNo();
            Product.setProductOrdersNo(productOrdersNo + 1);
            session.update(Product);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}
