package service;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> showAll();

    boolean add (Employee employee);

    boolean delete(int id);

    List<Employee> search(String nameSearch, String addressSearch, String divisionNameSearch);

    boolean edit(Employee employee);
}
