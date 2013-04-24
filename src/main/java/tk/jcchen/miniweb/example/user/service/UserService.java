package tk.jcchen.miniweb.example.user.service;

import java.util.Collection;

import tk.jcchen.miniweb.example.user.domain.User;

public interface UserService {

	public abstract User saveUser(User user);

	public abstract User findUserById(int id);

	public abstract Collection<User> findUsers();

}