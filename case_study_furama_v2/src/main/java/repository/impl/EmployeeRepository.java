package repository.impl;

import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;
import repository.BaseRepository;
import repository.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private final String SELECT_ALL = "select * from employee join `position` on employee.position_id = `position`.id join education_degree on employee.education_degree_id = education_degree.id join division on employee.division_id = division.id;";
    private final String INSERT_EMPLOYEE = "insert into employee(`name`,date_of_birth,id_card,salary,phone_number,email,address,position_id,education_degree_id,division_id)value(?,?,?,?,?,?,?,?,?,?);";
    private final String DELETE_EMPLOYEE = "delete from employee where id = ?";
    private final String SEARCH_EMPLOYEE = "select * from employee join `position` on employee.position_id = `position`.id join education_degree on employee.education_degree_id = education_degree.id join division on employee.division_id = division.id where employee.`name` like ? and employee.address like ? and division.division_name like ?;";
    private final String UPDATE_EMPLOYEE = "update employee set `name` = ?, date_of_birth = ?, id_card = ?, salary = ?, phone_number = ?, email = ?, address = ?,  position_id = ?, education_degree_id = ?, division_id = ? where id = ?;";
    @Override
    public List<Employee> showAll() {
        Connection connection = BaseRepository.getConnectDB();
        List<Employee> employeeList = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                LocalDate dateOfBirth = LocalDate.parse(rs.getString("date_of_birth"));
                String idCard = rs.getString("id_card");
                double salary = rs.getDouble("salary");
                String phone = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int positionId = rs.getInt("position_id");
                int educationDegreeId = rs.getInt("education_degree_id");
                int divisionId = rs.getInt("division_id");
                String positionName = rs.getString("position_name");
                String educationDegreeName = rs.getString("education_degree_name");
                String divisionName = rs.getString("division_name");
                Position position = new Position(positionId, positionName);
                EducationDegree educationDegree = new EducationDegree(educationDegreeId, educationDegreeName);
                Division division = new Division(divisionId, divisionName);
                Employee employee = new Employee(id, name, dateOfBirth, idCard, salary, phone, email, address, position, educationDegree, division);
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return employeeList;
    }

    @Override
    public boolean add(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_EMPLOYEE);
            ps.setString(1, employee.getName());
            ps.setString(2, String.valueOf(employee.getDateOfBirth()));
            ps.setString(3, employee.getIdCard());
            ps.setDouble(4, employee.getSalary());
            ps.setString(5, employee.getPhone());
            ps.setString(6, employee.getEmail());
            ps.setString(7, employee.getAddress());
            ps.setInt(8, employee.getPositionId());
            ps.setInt(9, employee.getEducationDegreeId());
            ps.setInt(10, employee.getDivisionId());
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_EMPLOYEE);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Employee> search(String nameSearch, String addressSearch, String divisionNameSearch) {
        Connection connection = BaseRepository.getConnectDB();
        List<Employee> employeeList = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH_EMPLOYEE);
            ps.setString(1, "%" + nameSearch + "%");
            ps.setString(2, "%" + addressSearch + "%");
            ps.setString(3, "%" + divisionNameSearch + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                LocalDate dateOfBirth = LocalDate.parse(rs.getString("date_of_birth"));
                String idCard = rs.getString("id_card");
                double salary = rs.getDouble("salary");
                String phone = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int positionId = rs.getInt("position_id");
                int educationDegreeId = rs.getInt("education_degree_id");
                int divisionId = rs.getInt("division_id");
                String positionName = rs.getString("position_name");
                String educationDegreeName = rs.getString("education_degree_name");
                String divisionName = rs.getString("division_name");
                Position position = new Position(positionId, positionName);
                EducationDegree educationDegree = new EducationDegree(educationDegreeId, educationDegreeName);
                Division division = new Division(divisionId, divisionName);
                Employee employee = new Employee(id, name, dateOfBirth, idCard, salary, phone, email, address, position, educationDegree, division);
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public boolean edit(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_EMPLOYEE);
            ps.setString(1, employee.getName());
            ps.setString(2, String.valueOf(employee.getDateOfBirth()));
            ps.setString(3, employee.getIdCard());
            ps.setDouble(4, employee.getSalary());
            ps.setString(5, employee.getPhone());
            ps.setString(6, employee.getEmail());
            ps.setString(7, employee.getAddress());
            ps.setInt(8, employee.getPositionId());
            ps.setInt(9, employee.getEducationDegreeId());
            ps.setInt(10, employee.getDivisionId());
            ps.setInt(11, employee.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
