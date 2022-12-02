package service.impl;

import model.Product;
import reponsitory.IProductReponsitory;
import reponsitory.impl.ProductReponsitory;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductReponsitory productReponsitory = new ProductReponsitory();

    @Override
    public List<Product> showAll() {
        return productReponsitory.showAll();
    }

    @Override
    public void add(Product product) {
        productReponsitory.add(product);
    }

    @Override
    public Product searchById(int id) {
        return productReponsitory.searchById(id);
    }

    @Override
    public void update(int id, Product product) {
        productReponsitory.update(id, product);
    }

    @Override
    public void remove(int id) {
        productReponsitory.remove(id);
    }

    @Override
    public List<Product> search(String name) {
        return productReponsitory.search(name);
    }
}
