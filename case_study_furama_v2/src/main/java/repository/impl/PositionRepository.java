package repository.impl;

import model.employee.Position;
import repository.BaseRepository;
import repository.IPositionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IPositionRepository {
    private final String SELECT_ALL = "select * from position;";
    @Override
    public List<Position> showAll() {
        Connection connection = BaseRepository.getConnectDB();
        List<Position> positionList = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("position_name");
                Position position = new Position(id, name);
                positionList.add(position);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return positionList;
    }
}
