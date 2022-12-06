package service;

import model.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> findAll();

    boolean add(Facility facility);

    boolean update(Facility facility);

    boolean delete(Integer id);

    List<Facility> search (String name_search, String price_search);

    Facility findById(Integer idSearch);
}
