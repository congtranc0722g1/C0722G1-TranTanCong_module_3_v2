package service.impl;

import model.Facility;
import repository.IFacilityRepository;
import repository.impl.FacilityRepository;
import service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    private IFacilityRepository facilityRepository = new FacilityRepository();
    @Override
    public List<Facility> findAll() {
        return facilityRepository.findAll();
    }

    @Override
    public boolean add(Facility facility) {
        return facilityRepository.add(facility);
    }

    @Override
    public boolean update(Facility facility) {
        return facilityRepository.update(facility);
    }

    @Override
    public boolean delete(Integer id) {
        return facilityRepository.delete(id);
    }

    @Override
    public List<Facility> search(String name_search, String price_search) {
        return null;
    }

    @Override
    public Facility findById(Integer idSearch) {
        return facilityRepository.findById(idSearch);
    }
}
