package service;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> showAll();

    boolean add (Employee employee);
}
