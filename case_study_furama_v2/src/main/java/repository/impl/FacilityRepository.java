package repository.impl;

import model.Facility;
import model.FacilityType;
import model.RentType;
import repository.BaseRepository;
import repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private final String SELECT_ALL = "select * from facility join rent_type on facility.rent_type_id = rent_type.id join facility_type on facility.facility_type_id = facility_type.id;";
    private final String INSERT_FACILITY = "insert into facility(id,`name`,area,cost,max_people,rent_type_id,facility_type_id,standard_room,description_other_convenience,pool_area,numbers_of_floors, facility_free) value(?,?,?,?,?,?,?,?,?,?,?,?);";
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
                Double cost = resultSet.getDouble("cost");
                Integer maxPeople = resultSet.getInt("max_people");
                String standardRoom = resultSet.getString("standard_room");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                Double poolArea = resultSet.getDouble("pool_area");
                Integer numbersOfFloors = resultSet.getInt("numbers_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                String rentTypeName = resultSet.getString("rent_type_name");
                String facilityTypeName = resultSet.getString("facility_type_name");
                RentType rentType = new RentType(rentTypeName);
                FacilityType facilityType = new FacilityType(facilityTypeName);
                Facility facility = new Facility(id, name, area, cost, maxPeople, standardRoom, descriptionOtherConvenience, poolArea, numbersOfFloors, facilityFree, rentType, facilityType);
                facilityList.add(facility);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public boolean add(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_FACILITY);
            ps.setInt(1, facility.getId());
            ps.setString(2, facility.getName());
            ps.setInt(3, facility.getArea());
            ps.setDouble(4, facility.getCost());
            ps.setInt(5, facility.getMaxPeople());
            ps.setInt(6, facility.getRentTypeId());
            ps.setInt(7, facility.getFacilityTypeId());
            ps.setString(8, facility.getStandardRoom());
            ps.setString(9, facility.getDescriptionOtherConvenience());
            ps.setDouble(10, facility.getPoolArea());
            ps.setInt(11, facility.getNumbersOfFloors());
            ps.setString(12, facility.getFacilityFree());
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Facility facility) {
        return false;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }

    @Override
    public List<Facility> search(String name_search, String price_search) {
        return null;
    }

    @Override
    public Facility findById(Integer id) {
        return null;
    }
}
