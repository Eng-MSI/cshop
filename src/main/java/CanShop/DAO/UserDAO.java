package CanShop.DAO;

import CanShop.HibernateUtil;
import CanShop.POJOS.User;
import CanShop.Utility.Utilities;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class UserDAO {

    // Method to add new user
    public void addUser(String userFname, String userLname, String userMail, String userCity, String userCountry, String userPass, String userPhone) {
        Utilities utilities = new Utilities();
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        String hash = utilities.randomString(20);

        try {
            tx = session.beginTransaction();
            User user = new User(userFname, userLname, userMail, userCity, userCountry, userPass, userPhone, false, hash);
            session.save(user);
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

    // Method to get user ID using his mail
    public int getUserIdByMail(String userMail) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        int userId = 0;
        try {
            tx = session.beginTransaction();
            List userList = session.createQuery("select user.userId from User as user  where user.userMail = \'" + userMail + "\'\n"
                    + "").list();

            userId = (int) userList.get(0);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return userId;
    }

    // Method to check if an email is used before
    public boolean isMailUsed(String userMail) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List userList = null;
        int userId = 0;
        try {
            tx = session.beginTransaction();
            userList = session.createQuery("select user.userId from User as user  where user.userMail = \'" + userMail + "\'\n"
                    + "").list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        if (userList.isEmpty()) {
            return false;
        } else {
            return true;
        }
    }

    // Method to check if user mail and pass are correct
    public boolean isUserSignedUp(String userPass, String userMail) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        String userPassInDB = null;

        if (isMailUsed(userMail)) {
            try {
                tx = session.beginTransaction();
                List userList = session.createQuery("select user.userPass from User as user  where user.userMail = \'" + userMail + "\'\n"
                        + "").list();

                userPassInDB = (String) userList.get(0);
                tx.commit();
            } catch (HibernateException e) {
                if (tx != null) {
                    tx.rollback();
                }
                e.printStackTrace();
            } finally {
                session.close();
            }
            if (userPassInDB.equals(userPass)) {
                return true;
            } else {
                return false;

            }
        } else {
            return false;
        }
    }

    public User getUserById(int userId) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List list = null;
        User user = null;
        try {
            tx = session.beginTransaction();
            list = session.createQuery("from User as user  where user.userId = " + userId).list();
            user = (User) list.get(0);
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
        return user;
    }

    public User getUserByEmail(String userEmail) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List list = null;
        User user = null;
        try {
            tx = session.beginTransaction();

            list = session.createQuery("from User as user  where user.userMail = \'" + userEmail + "\'").list();
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
            user = (User) list.get(0);

            return user;
        }

    }

    public void activateUser(int userId) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        Query query;

        try {
            tx = session.beginTransaction();
            query = session.createQuery("update User as user set user.userActivated = true where user.userId = " + userId);
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

    public String getUserHash(int userId) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List list = null;
        String hash = null;
        try {
            tx = session.beginTransaction();

            list = session.createQuery("select user.userHash from User as user where user.userId = " + userId).list();
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
            hash = (String) list.get(0);

            return hash;
        }

    }

    public List getAllUsers() {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List usersList = null;
        try {
            tx = session.beginTransaction();
            usersList = session.createQuery("from User").list();
            if (usersList.isEmpty()) {
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
        return usersList;
    }

    public boolean isUserActive(int userId) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        String userPassInDB = null;
        boolean isActive = false;
    
            try {
                tx = session.beginTransaction();
                List userList = session.createQuery("select user.userActivated from User as user  where user.userId = " + userId).list();
                 isActive = (boolean) userList.get(0);
                 System.out.println(isActive);
                tx.commit();
            } catch (HibernateException e) {
                if (tx != null) {
                    tx.rollback();
                }
                e.printStackTrace();
            } finally {
                session.close();
            }
            return isActive;

            }


    }
