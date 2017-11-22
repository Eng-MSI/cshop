package CanShop.DAO;

import CanShop.HibernateUtil;
import CanShop.POJOS.AdminOrderedProducts;
import CanShop.POJOS.ProductInAdminPage;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class AdminOrderedProductsDAO {
    public List getAdminOrderedProducts(){
        
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List productsList = null;
        List ordersList = new ArrayList<ProductInAdminPage>();
        try {
            tx = session.beginTransaction();
            productsList = session.createQuery("from AdminOrderedProducts").list();
            if (productsList.isEmpty()) {
                return null;
            }
            for (Iterator iterator
                    = productsList.iterator(); iterator.hasNext();) {
                AdminOrderedProducts product = (AdminOrderedProducts) iterator.next();
                ordersList.add(new ProductInAdminPage(product.getProducts().getProductId(), product.getProducts().getProductName(), product.getAdminOrderedProductsUserName(), product.getAdminOrderedProductsDate(), product.getAdminOrderedProductsAmount()));

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
        return ordersList;
    }
}
