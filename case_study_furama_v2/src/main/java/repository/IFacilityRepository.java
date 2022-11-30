package repository;

import model.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> findAll();

    boolean add(Facility facility);

    boolean update(Facility facility);

    boolean delete(int id);

    List<Facility> search (String name_search, String price_search);

    Facility findById(int id);
}
