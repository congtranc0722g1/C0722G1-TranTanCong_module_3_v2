package repository.impl;

import model.employee.EducationDegree;
import repository.BaseRepository;
import repository.IEducationDegreeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepository implements IEducationDegreeRepository {
    private final String SELECT_ALL = "select * from education_degree;";
    @Override
    public List<EducationDegree> showAll() {
        Connection connection = BaseRepository.getConnectDB();
        List<EducationDegree> educationDegreeList = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("education_degree_name");
                EducationDegree educationDegree = new EducationDegree(id, name);
                educationDegreeList.add(educationDegree);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return educationDegreeList;
    }
}
