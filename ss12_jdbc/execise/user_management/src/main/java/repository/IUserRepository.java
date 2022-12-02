package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> showAll();

    boolean add(User user);

    boolean edit(User user);

    User findById(int idSearch);

    boolean delete(int id);

    List<User> search(String countrySearch);
}
