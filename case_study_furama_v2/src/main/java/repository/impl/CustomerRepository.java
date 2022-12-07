package repository.impl;

import model.customer.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String SELECT_ALL = "select * from customer;";
    private final String INSERT_CUSTOMER = "insert into customer(id,customer_type_id,`name`,date_of_birth,gender,id_card,phone_number,email,address)value(?,?,?,?,?,?,?,?,?);";
    private final String DELETE_CUSTOMER = "call delete_customer(?);";
    private final String SEARCH_CUSTOMER = "select * from customer where name like ? and address like ?";
    private final String SEARCH_CUSTOMER_BY_ID = "select * from customer where id=?";
    private final String UPDATE_CUSTOMER = "call update_customer(?,?,?,?,?,?,?,?,?);";

    @Override
    public List<Customer> findAll() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int customerTypeId = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("name");
                LocalDate dateOfBirth = LocalDate.parse(resultSet.getString("date_of_birth"));
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                Customer customer = new Customer(id, customerTypeId, name, dateOfBirth, gender, idCard, phone, email, address);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public boolean add(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_CUSTOMER);
            ps.setInt(1, customer.getId());
            ps.setInt(2, customer.getCustomerTypeId());
            ps.setString(3, customer.getName());
            ps.setDate(4, Date.valueOf(customer.getDateOfBirth()));
            ps.setBoolean(5, customer.isGender());
            ps.setString(6, customer.getIdCard());
            ps.setString(7, customer.getPhone());
            ps.setString(8, customer.getEmail());
            ps.setString(9, customer.getAddress());
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE_CUSTOMER);
            callableStatement.setInt(1, customer.getId());
            callableStatement.setInt(2, customer.getCustomerTypeId());
            callableStatement.setString(3, customer.getName());
            callableStatement.setDate(4, Date.valueOf(customer.getDateOfBirth()));
            callableStatement.setBoolean(5, customer.isGender());
            callableStatement.setString(6, customer.getIdCard());
            callableStatement.setString(7, customer.getPhone());
            callableStatement.setString(8, customer.getEmail());
            callableStatement.setString(9, customer.getAddress());
            return callableStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement cs = connection.prepareCall(DELETE_CUSTOMER);
            cs.setInt(1, id);
            return cs.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Customer> search(String nameSearch, String addressSearch) {
        Connection connection = BaseRepository.getConnectDB();
        List<Customer> customerList = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH_CUSTOMER);
            ps.setString(1, "%" + nameSearch + "%");
            ps.setString(2, "%" + addressSearch + "%");
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int customerTypeId = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("name");
                LocalDate dateOfBirth = LocalDate.parse(resultSet.getString("date_of_birth"));
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                Customer customer = new Customer(id, customerTypeId, name, dateOfBirth, gender, idCard, phone, email, address);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public Customer findById(int id) {
        Connection connection = BaseRepository.getConnectDB();
        Customer customer = null;
        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH_CUSTOMER_BY_ID);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int customerTypeId = rs.getInt("customer_type_id");
                String name = rs.getString("name");
                LocalDate dateOfBirth = LocalDate.parse(rs.getString("date_of_birth"));
                boolean gender = rs.getBoolean("gender");
                String idCard = rs.getString("id_card");
                String phone = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                customer = new Customer(id, customerTypeId, name, dateOfBirth, gender, idCard, phone, email, address);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customer;
    }
}
