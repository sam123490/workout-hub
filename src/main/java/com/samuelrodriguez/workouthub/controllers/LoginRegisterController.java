package com.samuelrodriguez.workouthub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.samuelrodriguez.workouthub.models.LoginUser;
import com.samuelrodriguez.workouthub.models.User;
import com.samuelrodriguez.workouthub.services.UserService;

@Controller
public class LoginRegisterController {
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String redirect() {
		return "redirect:/login";
	}
	
	@GetMapping("/login")
	public String renderLogin(
			@ModelAttribute("loginUser") LoginUser loginUser
			) {
		return "login.jsp";
	}
	
	@PostMapping("/login")
	public String processLogin(
			@Valid @ModelAttribute("loginUser") LoginUser loginUser,
			BindingResult result,
			HttpSession session
			) {
		return "redirect:/dashboard";
	}
	
	@GetMapping("/register")
	public String renderRegister(
			@ModelAttribute("newUser") User newUser
			) {
		return "register.jsp";
	}
	
	@PostMapping("/register")
	public String processRegister(
			@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result,
			HttpSession session
			) {
		User user = userService.register(newUser, result);
		if(user == null) {
			return "register.jsp";
		}
		session.setAttribute("userId", user.getId());
		return "redirect:/dashboard";
	}
	
	@GetMapping("/dashboard")
	public String renderDashboard() {
		return "dashbaord.jsp";
	}
	
}
