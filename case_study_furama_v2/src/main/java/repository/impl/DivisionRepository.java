package repository.impl;

import model.employee.Division;
import repository.BaseRepository;
import repository.IDivisionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepository implements IDivisionRepository {
    private final String SELECT_ALL = "select * from division;";
    @Override
    public List<Division> showAll() {
        Connection connection = BaseRepository.getConnectDB();
        List<Division> divisionList = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("division_name");
                Division division = new Division(id, name);
                divisionList.add(division);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return divisionList;
    }
}
