package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {

    List<Customer> findAll();

    boolean add(Customer customer);

    boolean update(Customer customer);

    boolean delete(int id);

    List<Customer> search (String nameSearch, String addressSearch);

    Customer findById(int id);
}
