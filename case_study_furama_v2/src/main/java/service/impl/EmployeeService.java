package service.impl;

import model.employee.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    private IEmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    public List<Employee> showAll() {
        return employeeRepository.showAll();
    }

    @Override
    public boolean add(Employee employee) {
        return employeeRepository.add(employee);
    }

    @Override
    public boolean delete(int id) {
        return employeeRepository.delete(id);
    }

    @Override
    public List<Employee> search(String nameSearch, String addressSearch, String divisionNameSearch) {
        return employeeRepository.search(nameSearch, addressSearch, divisionNameSearch);
    }

    @Override
    public boolean edit(Employee employee) {
        return employeeRepository.edit(employee);
    }
}
