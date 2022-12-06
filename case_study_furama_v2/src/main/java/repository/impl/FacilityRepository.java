package repository.impl;

import model.Facility;
import model.FacilityType;
import model.RentType;
import repository.BaseRepository;
import repository.IFacilityRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;

public class FacilityRepository implements IFacilityRepository {
    private final String SELECT_ALL = "select * from facility join rent_type on facility.rent_type_id = rent_type.id join facility_type on facility.facility_type_id = facility_type.id;";
    private final String INSERT_FACILITY_VILLA = "insert into facility(id,`name`,area,cost,max_people,rent_type_id,facility_type_id,standard_room,description_other_convenience,pool_area,numbers_of_floors) value(?,?,?,?,?,?,?,?,?,?,?);";
    private final String INSERT_FACILITY_HOUSE = "insert into facility(id,`name`,area,cost,max_people,rent_type_id,facility_type_id,standard_room,description_other_convenience,numbers_of_floors) value(?,?,?,?,?,?,?,?,?,?);";
    private final String INSERT_FACILITY_ROOM = "insert into facility(id,`name`,area,cost,max_people,rent_type_id,facility_type_id,facility_free) value(?,?,?,?,?,?,?,?);";
    private final String SEARCH_BY_ID = "select * from facility where id = ?;";
    private final String UPDATE_VILLA = "call update_villa(?,?,?,?,?,?,?,?,?,?,?);";
    private final String UPDATE_HOUSE = "call update_house(?,?,?,?,?,?,?,?,?,?);";
    private final String UPDATE_ROOM = "call update_room(?,?,?,?,?,?,?,?);";
    private final String DELETE_FACILITY = "delete from facility where id = ?;";
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
        PreparedStatement ps = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            if (facility.getFacilityTypeId() == 1){
                ps = connection.prepareStatement(INSERT_FACILITY_VILLA);
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
            }else if (facility.getFacilityTypeId() == 2){
                ps = connection.prepareStatement(INSERT_FACILITY_HOUSE);
                ps.setInt(1, facility.getId());
                ps.setString(2, facility.getName());
                ps.setInt(3, facility.getArea());
                ps.setDouble(4, facility.getCost());
                ps.setInt(5, facility.getMaxPeople());
                ps.setInt(6, facility.getRentTypeId());
                ps.setInt(7, facility.getFacilityTypeId());
                ps.setString(8, facility.getStandardRoom());
                ps.setString(9, facility.getDescriptionOtherConvenience());
                ps.setInt(10, facility.getNumbersOfFloors());
            } else {
                ps = connection.prepareStatement(INSERT_FACILITY_ROOM);
                ps.setInt(1, facility.getId());
                ps.setString(2, facility.getName());
                ps.setInt(3, facility.getArea());
                ps.setDouble(4, facility.getCost());
                ps.setInt(5, facility.getMaxPeople());
                ps.setInt(6, facility.getRentTypeId());
                ps.setInt(7, facility.getFacilityTypeId());
                ps.setString(8, facility.getFacilityFree());
            }
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Facility facility) {
        CallableStatement cs = null;
        Connection connection = BaseRepository.getConnectDB();

            try {
                if(facility.getFacilityTypeId() == 1){
                    cs = connection.prepareCall(UPDATE_VILLA);
                    cs.setInt(1, facility.getId());
                    cs.setString(2, facility.getName());
                    cs.setInt(3, facility.getArea());
                    cs.setDouble(4, facility.getCost());
                    cs.setInt(5, facility.getMaxPeople());
                    cs.setInt(6, facility.getRentTypeId());
                    cs.setInt(7, facility.getFacilityTypeId());
                    cs.setString(8, facility.getStandardRoom());
                    cs.setString(9, facility.getDescriptionOtherConvenience());
                    cs.setDouble(10, facility.getPoolArea());
                    cs.setInt(11, facility.getNumbersOfFloors());
                }else if(facility.getFacilityTypeId() == 2){
                    cs = connection.prepareCall(UPDATE_HOUSE);
                    cs.setInt(1, facility.getId());
                    cs.setString(2, facility.getName());
                    cs.setInt(3, facility.getArea());
                    cs.setDouble(4, facility.getCost());
                    cs.setInt(5, facility.getMaxPeople());
                    cs.setInt(6, facility.getRentTypeId());
                    cs.setInt(7, facility.getFacilityTypeId());
                    cs.setString(8, facility.getStandardRoom());
                    cs.setString(9, facility.getDescriptionOtherConvenience());
                    cs.setInt(10, facility.getNumbersOfFloors());
                }else {
                    cs = connection.prepareCall(UPDATE_ROOM);
                    cs.setInt(1, facility.getId());
                    cs.setString(2, facility.getName());
                    cs.setInt(3, facility.getArea());
                    cs.setDouble(4, facility.getCost());
                    cs.setInt(5, facility.getMaxPeople());
                    cs.setInt(6, facility.getRentTypeId());
                    cs.setInt(7, facility.getFacilityTypeId());
                    cs.setString(8, facility.getFacilityFree());
                }
                return cs.executeUpdate() > 0;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        return false;
    }

    @Override
    public boolean delete(Integer id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_FACILITY);
            ps.setInt(1, id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Facility> search(String name_search, String price_search) {
        return null;
    }

    @Override
    public Facility findById(Integer idSearch) {
        Connection connection = BaseRepository.getConnectDB();
        Facility facility = null;
        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH_BY_ID);
            ps.setInt(1, idSearch);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Integer id = rs.getInt("id");
                String name = rs.getString("name");
                Integer area = rs.getInt("area");
                Double cost = rs.getDouble("cost");
                Integer maxPeople = rs.getInt("max_people");
                Integer rentTypeId = rs.getInt("rent_type_id");
                Integer facilityTypeId = rs.getInt("facility_type_id");
                String standardRoom = rs.getString("standard_room");
                String descriptionOtherConvenience = rs.getString("description_other_convenience");
                Double poolArea = rs.getDouble("pool_area");
                Integer numbersOfFloors = rs.getInt("numbers_of_floors");
                String facilityFree = rs.getString("facility_free");
                facility = new Facility(id, name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, numbersOfFloors, facilityFree);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facility;
    }
}
