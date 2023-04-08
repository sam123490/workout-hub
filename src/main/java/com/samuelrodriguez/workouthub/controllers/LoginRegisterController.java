package com.samuelrodriguez.workouthub.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginRegisterController {

	@GetMapping("/")
	public String redirect() {
		return "redirect:/login";
	}
	
	@GetMapping("/login")
	public String renderLogin() {
		return "login.jsp";
	}
	
}
