package reponsitory.impl;

import model.Product;
import reponsitory.IProductReponsitory;

import java.util.ArrayList;
import java.util.List;

public class ProductReponsitory implements IProductReponsitory {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Mỳ Ăn Liền", 3000, "Ăn liên", "Acecook"));
        productList.add(new Product(2, "Sữa", 13000, "Sô cô la", "TH TrueMilk"));
        productList.add(new Product(3, "Xe Máy", 7000000, "Vario 150", "HonDa"));
        productList.add(new Product(4, "Cháo", 5000, "Ăn liên", "Hoa Sen"));
    }

    @Override
    public List<Product> showAll() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public Product searchById(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (id == productList.get(i).getId()) {
                return productList.get(i);
            }
        }
        return null;
    }

    @Override
    public void update(int id, Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (id == productList.get(i).getId()) {
                productList.set(i, product);
            }
        }
    }

    @Override
    public void remove(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (id == productList.get(i).getId()) {
                productList.remove(id);
            }
        }
    }
}
