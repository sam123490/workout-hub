package com.samuelrodriguez.workouthub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.samuelrodriguez.workouthub.models.LoginUser;
import com.samuelrodriguez.workouthub.models.User;

@Controller
public class LoginRegisterController {

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
			@ModelAttribute("user") User user
			) {
		return "register.jsp";
	}
	
	@PostMapping("/register")
	public String processRegister(
			@Valid @ModelAttribute("user") User user,
			BindingResult result,
			HttpSession session
			) {
		return "redirect:/dashboard";
	}
	
	@GetMapping("/dashboard")
	public String renderDashboard() {
		return "dashbaord.jsp";
	}
	
}
