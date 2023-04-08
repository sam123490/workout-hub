package com.samuelrodriguez.workouthub.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

public class LoginUser {
	@NotBlank(message="please enter an email")
	@Email(message="please enter a valid email")
	private String email;
	
	@NotBlank(message="please enter a password")
	private String password;
	
	public LoginUser() {}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
