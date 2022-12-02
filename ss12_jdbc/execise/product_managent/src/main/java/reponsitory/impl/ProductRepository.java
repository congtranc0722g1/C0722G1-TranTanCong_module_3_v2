package reponsitory.impl;

import model.Product;
import reponsitory.BaseRepository;
import reponsitory.IProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private final String SELECT_ALL = "select * from product;";
    @Override
    public List<Product> showAll() {
        List<Product> productList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                String name  = rs.getString("name");
                double price = rs.getDouble("price");
                String describe = rs.getString("describe");
                String company = rs.getString("company");
                Product product = new Product(name, price, describe, company);
                productList.add(product);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productList;
    }
}
