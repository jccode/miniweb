package tk.jcchen.miniweb.example.user.service;

import java.util.Collection;

import tk.jcchen.miniweb.example.user.domain.User;

public interface UserService {

	public abstract User saveUser(User user);

	public abstract Collection<User> findUsers();

	public abstract User findOneUser(int id);

	public abstract void deleteUser(int id);

}