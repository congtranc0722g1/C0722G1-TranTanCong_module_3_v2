package service.impl;

import model.employee.EducationDegree;
import repository.IEducationDegreeRepository;
import repository.impl.EducationDegreeRepository;
import service.IEducationDegreeService;

import java.util.List;

public class EducationDegreeService implements IEducationDegreeService {
    private IEducationDegreeRepository educationDegreeRepository = new EducationDegreeRepository();
    @Override
    public List<EducationDegree> showAll() {
        return educationDegreeRepository.showAll();
    }
}
