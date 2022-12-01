package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> showAll();

    void add (Product product);

    Product searchById(int id);

    void remove(int id);
}
