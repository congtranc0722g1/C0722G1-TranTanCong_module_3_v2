package service.impl;

import model.Product;
import reponsitory.IProductRepository;
import reponsitory.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> showAll() {
        return productRepository.showAll();
    }
}
