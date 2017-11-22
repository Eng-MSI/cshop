package CanShop.POJOS;
// Generated Nov 16, 2017 3:07:22 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Category generated by hbm2java
 */
public class Category  implements java.io.Serializable {


     private Integer categoryId;
     private String categoryName;
     private String categoryArabicName;
     private Set<Subcategory> subcategories = new HashSet<Subcategory>(0);
     private Set<Products> productses = new HashSet<Products>(0);

    public Category() {
    }

	
    public Category(String categoryName, String categoryArabicName) {
        this.categoryName = categoryName;
        this.categoryArabicName = categoryArabicName;
    }
    public Category(String categoryName, String categoryArabicName, Set<Subcategory> subcategories, Set<Products> productses) {
       this.categoryName = categoryName;
       this.categoryArabicName = categoryArabicName;
       this.subcategories = subcategories;
       this.productses = productses;
    }
   
    public Integer getCategoryId() {
        return this.categoryId;
    }
    
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
    public String getCategoryName() {
        return this.categoryName;
    }
    
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    public String getCategoryArabicName() {
        return this.categoryArabicName;
    }
    
    public void setCategoryArabicName(String categoryArabicName) {
        this.categoryArabicName = categoryArabicName;
    }
    public Set<Subcategory> getSubcategories() {
        return this.subcategories;
    }
    
    public void setSubcategories(Set<Subcategory> subcategories) {
        this.subcategories = subcategories;
    }
    public Set<Products> getProductses() {
        return this.productses;
    }
    
    public void setProductses(Set<Products> productses) {
        this.productses = productses;
    }




}


