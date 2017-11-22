package CanShop.Utility;

import CanShop.POJOS.Products;
import java.util.Comparator;

public class CompareOrders implements Comparator<Products> {

    @Override
    public int compare(Products product1, Products product2) {
        int noOfOrders1 = product1.getProductOrdersNo();
        int noOfOrders2 = product2.getProductOrdersNo();

        return noOfOrders2 - noOfOrders1;
    }

}
