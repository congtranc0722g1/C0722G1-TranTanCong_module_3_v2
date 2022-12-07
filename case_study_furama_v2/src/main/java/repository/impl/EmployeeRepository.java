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
}
