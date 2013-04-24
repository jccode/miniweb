package tk.jcchen.miniweb.example.user.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tk.jcchen.miniweb.example.user.domain.User;
import tk.jcchen.miniweb.example.user.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	private UserRepository userRepository;

	@Autowired
	public UserServiceImpl(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	/* (non-Javadoc)
	 * @see tk.jcchen.miniweb.example.user.service.UserService#saveUser(tk.jcchen.miniweb.example.user.domain.User)
	 */
	@Override
	@Transactional(readOnly = true)
	public User saveUser(User user) {
		return userRepository.save(user);
	}
	
	/* (non-Javadoc)
	 * @see tk.jcchen.miniweb.example.user.service.UserService#findUserById(int)
	 */
	@Override
	@Transactional(readOnly = true)
	public User findUserById(int id) {
		return userRepository.findById(id);
	}
	
	/* (non-Javadoc)
	 * @see tk.jcchen.miniweb.example.user.service.UserService#findUsers()
	 */
	@Override
	@Transactional(readOnly = true)
	public Collection<User> findUsers() {
		return userRepository.findAll();
	}
}
