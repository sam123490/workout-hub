package com.samuelrodriguez.workouthub.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.samuelrodriguez.workouthub.models.Workout;

public interface WorkoutRepository extends CrudRepository<Workout, Long> {

	List<Workout> findByUserId(Long id);
	
	List<Workout> findFirst10ByUserIdNot(Long id);
	
}
