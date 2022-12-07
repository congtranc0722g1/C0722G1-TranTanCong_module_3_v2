package repository;

import model.facility.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> findAll();

    boolean add(Facility facility);

    boolean update(Facility facility);

    boolean delete(Integer id);

    List<Facility> search (String nameSearch, String facilityTypeNameSearch);

    Facility findById(Integer idSearch);
}
