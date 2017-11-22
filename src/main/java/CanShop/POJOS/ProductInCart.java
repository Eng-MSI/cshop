package CanShop.POJOS;

public class ProductInCart {
    int productId;
    String productName;
    String productArabicName;
    int productPrice;
    int productNewPrice;
    boolean hotOffer;
    int orderedQuantity;

    public ProductInCart(int productId, String productName,String productArabicName ,int productPrice, int productNewPrice, boolean hotOffer, int orderedQuantity) {
        this.productId = productId;
        this.productName = productName;
        this.productArabicName = productArabicName;
        this.productPrice = productPrice;
        this.productNewPrice = productNewPrice;
        this.hotOffer = hotOffer;
        this.orderedQuantity = orderedQuantity;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductArabicName() {
        return productArabicName;
    }

    public void setProductArabicName(String productArabicName) {
        this.productArabicName = productArabicName;
    }
    

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductNewPrice() {
        return productNewPrice;
    }

    public void setProductNewPrice(int productNewPrice) {
        this.productNewPrice = productNewPrice;
    }

    public boolean isHotOffer() {
        return hotOffer;
    }

    public void setHotOffer(boolean hotOffer) {
        this.hotOffer = hotOffer;
    }

    public int getOrderedQuantity() {
        return orderedQuantity;
    }

    public void setOrderedQuantity(int orderedQuantity) {
        this.orderedQuantity = orderedQuantity;
    }
    
    
}
