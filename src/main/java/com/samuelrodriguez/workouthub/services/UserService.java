package com.samuelrodriguez.workouthub.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.samuelrodriguez.workouthub.models.User;
import com.samuelrodriguez.workouthub.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepo;
	
	public User register(User newUser, BindingResult result) {
		if (result.hasErrors()) {
			return null;
		}
		
		Optional<User> u = userRepo.findByEmail(newUser.getEmail());
		if (u.isPresent()) {
			result.rejectValue("email", "email", "this email has already been used, please login");
			return null;
		}
		
		if(!newUser.getPassword().equals(newUser.getConfirmPassword())) {
			result.rejectValue("confirmPassword", "password", "passwords do not match");
			return null;
		}
		
		String pw_hash = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(pw_hash);
		return userRepo.save(newUser);
	}
	
}
