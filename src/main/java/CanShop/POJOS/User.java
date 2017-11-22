package CanShop.POJOS;
// Generated Nov 16, 2017 3:07:22 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * User generated by hbm2java
 */
public class User  implements java.io.Serializable {


     private Integer userId;
     private String userFname;
     private String userLname;
     private String userMail;
     private String userCity;
     private String userCountry;
     private String userPass;
     private String userPhone;
     private boolean userActivated;
     private String userHash;
     private Set<Cart> carts = new HashSet<Cart>(0);

    public User() {
    }

	
    public User(String userFname, String userLname, String userMail, String userCity, String userCountry, String userPass, String userPhone, boolean userActivated, String userHash) {
        this.userFname = userFname;
        this.userLname = userLname;
        this.userMail = userMail;
        this.userCity = userCity;
        this.userCountry = userCountry;
        this.userPass = userPass;
        this.userPhone = userPhone;
        this.userActivated = userActivated;
        this.userHash = userHash;
    }
    public User(String userFname, String userLname, String userMail, String userCity, String userCountry, String userPass, String userPhone, boolean userActivated, String userHash, Set<Cart> carts) {
       this.userFname = userFname;
       this.userLname = userLname;
       this.userMail = userMail;
       this.userCity = userCity;
       this.userCountry = userCountry;
       this.userPass = userPass;
       this.userPhone = userPhone;
       this.userActivated = userActivated;
       this.userHash = userHash;
       this.carts = carts;
    }
   
    public Integer getUserId() {
        return this.userId;
    }
    
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    public String getUserFname() {
        return this.userFname;
    }
    
    public void setUserFname(String userFname) {
        this.userFname = userFname;
    }
    public String getUserLname() {
        return this.userLname;
    }
    
    public void setUserLname(String userLname) {
        this.userLname = userLname;
    }
    public String getUserMail() {
        return this.userMail;
    }
    
    public void setUserMail(String userMail) {
        this.userMail = userMail;
    }
    public String getUserCity() {
        return this.userCity;
    }
    
    public void setUserCity(String userCity) {
        this.userCity = userCity;
    }
    public String getUserCountry() {
        return this.userCountry;
    }
    
    public void setUserCountry(String userCountry) {
        this.userCountry = userCountry;
    }
    public String getUserPass() {
        return this.userPass;
    }
    
    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }
    public String getUserPhone() {
        return this.userPhone;
    }
    
    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }
    public boolean isUserActivated() {
        return this.userActivated;
    }
    
    public void setUserActivated(boolean userActivated) {
        this.userActivated = userActivated;
    }
    public String getUserHash() {
        return this.userHash;
    }
    
    public void setUserHash(String userHash) {
        this.userHash = userHash;
    }
    public Set<Cart> getCarts() {
        return this.carts;
    }
    
    public void setCarts(Set<Cart> carts) {
        this.carts = carts;
    }




}

