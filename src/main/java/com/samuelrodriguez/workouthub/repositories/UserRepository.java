package com.samuelrodriguez.workouthub.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.samuelrodriguez.workouthub.models.User;

public interface UserRepository extends CrudRepository<User, Long> {

	Optional<User> findByEmail(String email);
	
}
