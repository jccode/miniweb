package tk.jcchen.miniweb.example.user.repository;

import java.util.Collection;

import tk.jcchen.miniweb.example.user.domain.User;

public interface UserRepository {
	
	Collection<User> findAll();

	User findById(int id);
	
	User save(User user);
}
