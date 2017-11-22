package CanShop.DAO;

import CanShop.HibernateUtil;
import CanShop.POJOS.AdminOrderedProducts;
import CanShop.POJOS.Cart;
import CanShop.POJOS.Products;
import CanShop.POJOS.OrderedProudcts;
import CanShop.POJOS.ProductInCart;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class OrderedProductsDAO {

    public void addProductToCart(int cartId, int productId, int productAmount, Date date) {
        CartDAO cartDAO = new CartDAO();
        ProductDAO productDAO = new ProductDAO();
        Cart cart = cartDAO.getCartById(cartId);
        Products product = productDAO.getProductById(productId);
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        if (isProductBought(productId, cartId)) {
            OrderedProudcts orderedProudcts = getOrderedProductById(productId, cartId);
            productAmount += orderedProudcts.getProductQuantity();
            updateOrderedProduct(orderedProudcts.getOrderedProductsId(), cartId, productAmount);
        } else {
            try {
                tx = session.beginTransaction();
                OrderedProudcts orderedProduct = new OrderedProudcts(cart, product, productAmount, date);
                session.save(orderedProduct);
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

    public OrderedProudcts getOrderedProductById(int productId, int cartId) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List list = null;
        OrderedProudcts orderedProudcts = null;
        try {
            tx = session.beginTransaction();
            list = session.createQuery("from OrderedProudcts as orderedProduct  where orderedProduct.products.productId = " + productId + "and orderedProduct.cart.cartId =" + cartId).list();

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        if (list.isEmpty()) {
            return null;
        } else {
            orderedProudcts = (OrderedProudcts) list.get(0);
        }
        return orderedProudcts;

    }

    public List getOrderedProducts(int userId) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List list = null;
        List<ProductInCart> productsList = new ArrayList<>();
        try {
            tx = session.beginTransaction();
            list = session.createQuery("from OrderedProudcts as product  where product.cart.user.userId=" + userId).list();
            if (list.isEmpty()) {
                System.out.println("empty list");
                return null;
            }
            for (Iterator iterator
                    = list.iterator(); iterator.hasNext();) {
                OrderedProudcts OrderedProudct = (OrderedProudcts) iterator.next();
                if (OrderedProudct.getProducts().getProductHotOffer()) {
                    productsList.add(new ProductInCart(OrderedProudct.getProducts().getProductId(), OrderedProudct.getProducts().getProductName(), OrderedProudct.getProducts().getProductArabicName(), OrderedProudct.getProducts().getProductPrice(), OrderedProudct.getProducts().getProductNprice(), OrderedProudct.getProducts().getProductHotOffer(), OrderedProudct.getProductQuantity()));
                } else {
                    int productId = OrderedProudct.getProducts().getProductId();
                    String productName = OrderedProudct.getProducts().getProductName();
                    String productArabicName = OrderedProudct.getProducts().getProductArabicName();
                    int productPrice = OrderedProudct.getProducts().getProductPrice();
                    int productNewPrice = OrderedProudct.getProducts().getProductNprice();
                    boolean b = OrderedProudct.getProducts().getProductHotOffer();
                    int productQuan = OrderedProudct.getProductQuantity();
                    ProductInCart PIC = new ProductInCart(productId, productName, productArabicName, productPrice, productNewPrice, b, productQuan);
                    productsList.add(PIC);
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
        return productsList;
    }

    public boolean isProductBought(int productID, int cartID) {

        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List list = null;
        List<ProductInCart> productsList = new ArrayList<>();
        try {
            tx = session.beginTransaction();
            list = session.createQuery("from OrderedProudcts as orderedProduct  where orderedProduct.products.productId = " + productID + "and orderedProduct.cart.cartId = " + cartID).list();

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        if (list.isEmpty()) {
            return false;
        } else {
            return true;
        }

    }

    public void updateOrderedProduct(int orderedProductId, int cartId, int quantity) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("update OrderedProudcts as orderedProudct set productQuantity =" + quantity + " where orderedProudct.orderedProductsId =" + orderedProductId + " and orderedProudct.cart.cartId =" + cartId);
            query.executeUpdate();
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

    public void deleteOrderedProduct(int cartId, int ProductId) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("delete from OrderedProudcts as product where product.cart.cartId =" + cartId + "and product.products.productId =" + ProductId);
            query.executeUpdate();
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

    public List getOrderesDates() {

        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List list = null;
        List datesList = new ArrayList<Date>();

        try {
            tx = session.beginTransaction();
            list = session.createQuery("select op.orderedProudctsDate from OrderedProudcts as op").list();
            if (list.isEmpty()) {
                return null;
            }
            for (Iterator iterator
                    = list.iterator(); iterator.hasNext();) {
                Date date = (Date) iterator.next();
                if (!(datesList.contains(date))) {
                    datesList.add(date);
                }

            }
            for (Iterator iterator
                    = datesList.iterator(); iterator.hasNext();) {
                Date date = (Date) iterator.next();
                if (!(datesList.contains(date))) {
                    datesList.add(date);
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
        return datesList;

    }
    public List getUsersMadeOrders(){
        

        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List list = null;
        List usersList = new ArrayList<String>();

        try {
            tx = session.beginTransaction();
            list = session.createQuery("from OrderedProudcts").list();
            if (list.isEmpty()) {
                return null;
            }
            for (Iterator iterator
                    = list.iterator(); iterator.hasNext();) {
                OrderedProudcts orderedProudcts  = (OrderedProudcts) iterator.next();
                String fName = orderedProudcts.getCart().getUser().getUserFname();
                String lName = orderedProudcts.getCart().getUser().getUserLname();
                String userName = fName + " "+lName;
                if (!(usersList.contains(userName))) {
                    usersList.add(userName);
                    System.out.println(userName);
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
        return usersList;
    
    }

    public void finishOrder(int userId) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List orderedProducts = null;
        UserDAO userDAO = new UserDAO();
        String fName = userDAO.getUserById(userId).getUserFname();
        String lName = userDAO.getUserById(userId).getUserLname();
        String userName = fName +" "+lName;
        try {
            tx = session.beginTransaction();
            orderedProducts = session.createQuery("from OrderedProudcts as product  where product.cart.user.userId=" + userId).list();
         
            for (Iterator iterator
                    = orderedProducts.iterator(); iterator.hasNext();) {
                OrderedProudcts OrderedProudct = (OrderedProudcts) iterator.next();
                Products product = OrderedProudct.getProducts();
                Date date = OrderedProudct.getOrderedProudctsDate();
                int amount = OrderedProudct.getProductQuantity();
                AdminOrderedProducts adminOrderedProducts = new AdminOrderedProducts(product, userName, date.toString(), String.valueOf(amount));
                session.save(adminOrderedProducts);
                

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

    }
}


