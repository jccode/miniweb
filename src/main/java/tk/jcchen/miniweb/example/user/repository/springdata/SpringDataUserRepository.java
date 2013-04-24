package tk.jcchen.miniweb.example.user.repository.springdata;

import org.springframework.data.repository.CrudRepository;

import tk.jcchen.miniweb.example.user.domain.User;
import tk.jcchen.miniweb.example.user.repository.UserRepository;

public interface SpringDataUserRepository extends CrudRepository<User, Integer>, UserRepository {

}
