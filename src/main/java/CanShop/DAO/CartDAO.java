package CanShop.DAO;

import CanShop.HibernateUtil;
import CanShop.POJOS.Cart;
import CanShop.POJOS.OrderedProudcts;
import CanShop.POJOS.Products;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CartDAO {

    // Method to get cart id
    public int getCartId(int userId) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        int cartId = 0;
        try {
            tx = session.beginTransaction();
            List list = session.createQuery("select cart.cartId from Cart as cart  where cart.user = " + userId).list();

            cartId = (int) list.get(0);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return cartId;
    }

    public void addCart(int userId) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        UserDAO userDAO = new UserDAO();

        try {
            tx = session.beginTransaction();
            Cart cart = new Cart(userDAO.getUserById(userId));
            session.save(cart);
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

    public Cart getCartById(int cartId) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List list = null;
        Cart cart = null;
        try {
            tx = session.beginTransaction();
            list = session.createQuery("from Cart as cart  where cart.cartId= " + cartId).list();
            cart = (Cart) list.get(0);
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
        return cart;
    }

    public int getNoOfProductsInCart(int cartId) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        int noOfProducts = 0;
        try {
            tx = session.beginTransaction();
            List productsList = session.createQuery("select products.productQuantity from OrderedProudcts as products  where products.cart.cartId = " + cartId).list();
            if (productsList.isEmpty()) {
                return 0;
            }
            for (Iterator iterator
                    = productsList.iterator(); iterator.hasNext();) {
                noOfProducts += (int) iterator.next();

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

        return noOfProducts;
    }

    public int getCartTotalPrice(int cartId) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        int totalPrice = 0;
        ProductDAO productDAO = new ProductDAO();
        try {
            tx = session.beginTransaction();
            List productsList = session.createQuery("from OrderedProudcts as products where products.cart.cartId = " + cartId).list();
            if (productsList.isEmpty()) {
                return 0;
            }
            for (Iterator iterator
                    = productsList.iterator(); iterator.hasNext();) {
                OrderedProudcts orderedProduct = (OrderedProudcts) iterator.next();
                Products product = orderedProduct.getProducts();
                if (product.getProductHotOffer()) {
                    totalPrice += (orderedProduct.getProductQuantity() * productDAO.getProductNewPrice(orderedProduct.getProducts().getProductId()));
                } else {
                    totalPrice += (orderedProduct.getProductQuantity() * productDAO.getProductPrice(orderedProduct.getProducts().getProductId()));
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
        return totalPrice;

    }

    public void removeProductFromCart(int cartId, int ProductId) {
        List list = null;
        OrderedProudcts orderedProudcts = null;
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            list = session.createQuery("from OrderedProudcts as products where products.cart.cartId = " + cartId + " and products.products.productId= " + ProductId).list();
            orderedProudcts = (OrderedProudcts) list.get(0);
            session.delete(orderedProudcts);
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

    public void emptyCart(int cartId) {
        List list = null;
        OrderedProudcts orderedProudcts = null;
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            list = session.createQuery("from OrderedProudcts as products where products.cart.cartId = " + cartId).list();
            for (Iterator iterator
                    = list.iterator(); iterator.hasNext();) {
                orderedProudcts = (OrderedProudcts) iterator.next();
                session.delete(orderedProudcts);

            }
            orderedProudcts = (OrderedProudcts) list.get(0);
            session.delete(orderedProudcts);
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
