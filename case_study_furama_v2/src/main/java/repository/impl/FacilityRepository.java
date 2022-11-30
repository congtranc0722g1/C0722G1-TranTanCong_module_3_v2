package repository.impl;

import model.Facility;
import repository.BaseRepository;
import repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private final String SELECT_ALL = "select * from facility";
    @Override
    public List<Facility> findAll() {
        Connection connection = BaseRepository.getConnectDB();
        List<Facility> facilityList = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                Integer id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Integer area = resultSet.getInt("area");
                Double cost = Double.valueOf(resultSet.getString("cost"));
                Integer maxPeople = resultSet.getInt("max_people");
                Integer rentTypeId = resultSet.getInt("rent_type_id");
                Integer facilityTypeId = resultSet.getInt("facility_type_id");
                String standardRoom = resultSet.getString("standard_room");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                Double poolArea = resultSet.getDouble("pool_area");
                Integer numbersOfFloors = resultSet.getInt("numbers_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                Facility facility = new Facility(id, name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, numbersOfFloors, facilityFree);
                facilityList.add(facility);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public boolean add(Facility facility) {
        return false;
    }

    @Override
    public boolean update(Facility facility) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public List<Facility> search(String name_search, String price_search) {
        return null;
    }

    @Override
    public Facility findById(int id) {
        return null;
    }
}
