package repository;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> showAll();

    boolean add (Employee employee);

    boolean delete(int id);

    List<Employee> search(String nameSearch, String addressSearch, String divisionNameSearch);

    boolean edit(Employee employee);
}
