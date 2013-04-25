package tk.jcchen.miniweb.example.user.web;

import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tk.jcchen.miniweb.example.user.domain.User;
import tk.jcchen.miniweb.example.user.service.UserService;
import tk.jcchen.miniweb.util.FileuploadUtils;

/**
 * UserControler
 * 
 * /user		GET		to list
 * /user		POST	insert
 * /user/{id}	POST	update a user(multipart request, PUT not supported)
 * /user/{id}	GET		get a user
 * /user/{id}	DELETE	del a user
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
		return "user/user";
	}
	
	/**
	 * get user list. for ajax.
	 * 
	 * @return
	 */
	@RequestMapping(value="/user", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Collection<User> findUsers() {
		Collection<User> users = userService.findUsers();
		return users;
	}
	
	@RequestMapping(value="/user/{id}", method=RequestMethod.GET)
	public @ResponseBody User findOneUser(@PathVariable int id) {
		return userService.findOneUser(id);
	}
	
	@RequestMapping(value="/user", method=RequestMethod.POST)
	public @ResponseBody User insertUser(@ModelAttribute User user, @RequestParam MultipartFile file, 
			BindingResult result) throws Exception {
		String image = FileuploadUtils.saveImage(file);
		user.setImage(image);
		User newUser = userService.saveUser(user);
		return newUser;
	}
	
	@RequestMapping(value="/user/{id}", method={RequestMethod.POST, RequestMethod.PUT})
	public @ResponseBody User updateUser(@ModelAttribute User user, @PathVariable int id, 
			@RequestParam(required=false) MultipartFile file, BindingResult result) throws Exception {
		logger.info("------------ update user -----------");
		logger.info(user.toString());
		
		if(file != null) {
			String image = FileuploadUtils.saveImage(file);
			user.setImage(image);
		}
		User newUser = userService.saveUser(user);
		
		return newUser;
	}
	
	@RequestMapping(value="/user/{id}", method=RequestMethod.DELETE)
	public @ResponseBody void deleteUser(@PathVariable int id) {
		userService.deleteUser(id);
	}
	
	
	@ExceptionHandler
	public String handle(Exception e) {
		e.printStackTrace();
		logger.error(e.getMessage());
		return "error/500";
	}
	
	
	@RequestMapping("/test")
	public String toUserTest() {
		logger.info("-------- test -------");
		return "test";
	}
}
