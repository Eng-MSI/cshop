package CanShop.DAO;

import CanShop.HibernateUtil;
import CanShop.POJOS.Subcategory;
import CanShop.POJOS.Category;
import CanShop.POJOS.Products;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CategoryDAO {

    public void addNewCategory(String categoryName, String categoryArabicName) {

        Session session = HibernateUtil.getSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Category category = new Category(categoryName, categoryArabicName);
            session.save(category);
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

    public Category getCategoryByName(int categoryId) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List list = null;
        Category category = null;

        try {
            tx = session.beginTransaction();
            list = session.createQuery("from Category as category where category.categoryId =" + categoryId).list();
            category = (Category) list.get(0);
            System.out.println(category.getCategoryName());

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return category;
    }

    public void addNewSubCategory(int categoryId, String subCategoryName, String subCategoryArabicName) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        CategoryDAO categoryDAO = new CategoryDAO();
        Category category = categoryDAO.getCategoryByName(categoryId);
        try {
            tx = session.beginTransaction();
            Subcategory subcategory = new Subcategory(category, subCategoryName, subCategoryArabicName);
            session.save(subcategory);
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

    public Subcategory getSubCategoryByName(int subCategoryId) {
                Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List list = null;
        Subcategory subCategory = null;

        try {
            tx = session.beginTransaction();
            list = session.createQuery("from Subcategory as sub where sub.subCategoryId =" + subCategoryId).list();
            subCategory = (Subcategory) list.get(0);
            System.out.println(subCategory.getSubCategoryName());

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return subCategory;
    }

    public String getCategoryArabicName(String categoryName) {
        Session session = HibernateUtil.getSession();
        Transaction tx = null;
        List productsList = null;
        String arabicName = null;
        try {
            tx = session.beginTransaction();
            productsList = session.createQuery("from Products as product where product.category.categoryName =\'" + categoryName + "\'").list();
            if (productsList.isEmpty()) {
                return null;
            }
            Products p = (Products) productsList.get(0);
            arabicName = p.getCategory().getCategoryArabicName();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return arabicName;

    }

    public int getCategoryId(String categoryName) {
        int categoryId = 0;

        if (categoryName.equals("mobile")) {
            categoryId = 2;
        } else if (categoryName.equals("Computer Accessories")) {
            categoryId = 3;
        } else if (categoryName.equals("Beauty And Personal Care")) {
            categoryId = 4;
        } else if (categoryName.equals("Gifts")) {
            categoryId = 5;
        } else if (categoryName.equals("Toys")) {
            categoryId = 6;
        } else if (categoryName.equals("Others")) {
            categoryId = 7;
        } else if (categoryName.equals("Glasses")) {
            categoryId = 8;
        } else if (categoryName.equals("Camping Equipment")) {
            categoryId = 9;
        } else if (categoryName.equals("Shoes And Bags")) {
            categoryId = 10;
        } else if (categoryName.equals("House Utensils")) {
            categoryId = 11;
        } else if (categoryName.equals("Cups")) {
            categoryId = 12;
        }
        return categoryId;

    }
    public int getSubCategoryId(String subCategoryName) {
        int categoryId = 0;

        if (subCategoryName.equals("Apple")) {
            categoryId = 2;
        } else if (subCategoryName.equals("Samsung")) {
            categoryId = 3;
        } else if (subCategoryName.equals("Sony")) {
            categoryId = 4;
        } else if (subCategoryName.equals("HTC")) {
            categoryId = 5;
        } else if (subCategoryName.equals("Huawei")) {
            categoryId = 6;
        } 
        return categoryId;

    }
}
