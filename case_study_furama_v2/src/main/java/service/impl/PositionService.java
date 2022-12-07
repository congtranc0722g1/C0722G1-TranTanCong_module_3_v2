package service.impl;

import model.employee.Position;
import repository.IPositionRepository;
import repository.impl.PositionRepository;
import service.IPositionService;

import java.util.List;

public class PositionService implements IPositionService {
    private IPositionRepository positionRepository = new PositionRepository();
    @Override
    public List<Position> showAll() {
        return positionRepository.showAll();
    }
}
