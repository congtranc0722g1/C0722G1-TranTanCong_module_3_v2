package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();

    boolean add(Customer customer);

    boolean update(Customer customer);

    boolean delete(int id);

    List<Customer> search (String name_search, String address_search);

    Customer findById(int id);
}
