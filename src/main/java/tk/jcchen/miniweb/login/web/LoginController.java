package tk.jcchen.miniweb.login.web;

import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {

	@RequestMapping("/login")
	public String toLogin() {
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public @ResponseBody ResultJson login(@Valid LoginForm loginForm, Model model, BindingResult errors ) {
		ResultJson ret = new ResultJson();
		if(errors.hasErrors()) {
			ret.setResult(false);
			ret.setMessage(errors.getAllErrors().toString());
			return ret;
		}
		UsernamePasswordToken token = new UsernamePasswordToken(loginForm.getUsername(), loginForm.getPassword(), loginForm.isRememberMe());
		
		try {
			SecurityUtils.getSubject().login(token);
		} catch (AuthenticationException e) {
			ret.setResult(false);
			ret.setMessage("Invalid username or password. Please try again.");
			return ret;
		}
		
		ret.setResult(true);
		return ret;
	}
	
	@RequestMapping("/logout")
	public String logout() {
		SecurityUtils.getSubject().logout();
		return "redirect:/";
	}
}
