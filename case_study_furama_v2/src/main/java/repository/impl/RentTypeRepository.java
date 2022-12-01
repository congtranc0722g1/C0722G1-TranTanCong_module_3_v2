package repository.impl;

import model.FacilityType;
import model.RentType;
import repository.BaseRepository;
import repository.IRentTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepository implements IRentTypeRepository {
    private final String SELECT_ALL = "select * from rent_type;";
    @Override
    public List<RentType> findAll() {
        Connection connection = BaseRepository.getConnectDB();
        List<RentType> rentTypeList = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("rent_type_name");
                RentType rentType = new RentType(id, name);
                rentTypeList.add(rentType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rentTypeList;
    }
}
