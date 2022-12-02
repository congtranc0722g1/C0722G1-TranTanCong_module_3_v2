package reponsitory;

import model.Product;

import java.util.List;

public interface IProductReponsitory {
    List<Product> showAll();

    void add (Product product);

    Product searchById(int id);

    void update(int id, Product product);

    void remove(int id);

    List<Product> search(String name);
}
