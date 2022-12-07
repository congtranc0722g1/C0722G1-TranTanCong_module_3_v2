package service.impl;

import model.employee.Division;
import repository.IDivisionRepository;
import repository.impl.DivisionRepository;
import service.IDivisionService;

import java.util.List;

public class DivisionService implements IDivisionService {
    private IDivisionRepository divisionRepository = new DivisionRepository();
    @Override
    public List<Division> showAll() {
        return divisionRepository.showAll();
    }
}
