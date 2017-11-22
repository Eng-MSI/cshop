package CanShop.Utility;

import CanShop.POJOS.Products;
import java.util.Comparator;
import java.util.Date;

public class CompareDate implements Comparator<Products> {

    @Override
    public int compare(Products product1, Products product2) {
        Date dateOfProduct1 = product1.getProductDate();
        Date dateOfProduct2 = product2.getProductDate();
        return dateOfProduct2.compareTo(dateOfProduct1);
    }

}
