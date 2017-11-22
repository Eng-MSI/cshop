package CanShop.POJOS;

public class ProductInAdminPage {
     Integer orderedProductId;
      String productName;
      String userName;
      String productDate;
      String productsAmount;

    public ProductInAdminPage(Integer OrderedProductId, String productName, String UserName, String ProductDate, String ProductsAmount) {
        this.orderedProductId = OrderedProductId;
        this.productName = productName;
        this.userName = UserName;
        this.productDate = ProductDate;
        this.productsAmount = ProductsAmount;
    }

    public Integer getOrderedProductId() {
        return orderedProductId;
    }

    public void setOrderedProductId(Integer OrderedProductId) {
        this.orderedProductId = OrderedProductId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String UserName) {
        this.userName = UserName;
    }

    public String getProductDate() {
        return productDate;
    }

    public void setProductDate(String ProductDate) {
        this.productDate = ProductDate;
    }

    public String getProductsAmount() {
        return productsAmount;
    }

    public void setProductsAmount(String ProductsAmount) {
        this.productsAmount = ProductsAmount;
    }
     
    
}
