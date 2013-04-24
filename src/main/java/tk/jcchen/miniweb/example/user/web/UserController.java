package tk.jcchen.miniweb.example.user.web;

import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.jcchen.miniweb.example.user.domain.User;
import tk.jcchen.miniweb.example.user.service.UserService;

/**
 * UserControler
 * 
 * /user		GET		to list
 * /user		POST	insert
 * /user/{id}	GET		get a user
 * /user/{id}	DELETE	del a user
 * /user/{id}	PUT		update a user
 * 
 * @author jcchen
 * 
 */
@Controller
public class UserController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/user")
	public String toUserList(Model model) {
		Collection<User> users = userService.findUsers();
		model.addAttribute("users", users);
		
		logger.info("----- toUserList -----");
		logger.info(users.toString());
		return "user/user";
	}
	
	/**
	 * get user list. for ajax.
	 * 
	 * @return
	 */
	@RequestMapping(value="/user", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Collection<User> users() {
		Collection<User> users = userService.findUsers();
		
		logger.info("----- users -----");
		logger.info(users.toString());
		return users;
	}
	
	@RequestMapping("/test")
	public String toUserTest() {
		logger.info("-------- test -------");
		return "test";
	}
}
