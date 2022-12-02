package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();

    @Override
    public List<User> showAll() {
        return userRepository.showAll();
    }

    @Override
    public boolean add(User user) {
        return userRepository.add(user);
    }

    @Override
    public boolean edit(User user) {
        return userRepository.edit(user);
    }

    @Override
    public User findById(int idSearch) {
        return userRepository.findById(idSearch);
    }

    @Override
    public boolean delete(int id) {
        return userRepository.delete(id);
    }

    @Override
    public List<User> search(String countrySearch) {
        return userRepository.search(countrySearch);
    }
}
