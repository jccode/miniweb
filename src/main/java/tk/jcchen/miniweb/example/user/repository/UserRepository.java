package tk.jcchen.miniweb.example.user.repository;

import org.springframework.data.repository.CrudRepository;

import tk.jcchen.miniweb.example.user.domain.User;

public interface UserRepository extends CrudRepository<User, Integer> {
	
}
