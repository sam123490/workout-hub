package com.samuelrodriguez.workouthub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.samuelrodriguez.workouthub.models.Workout;
import com.samuelrodriguez.workouthub.repositories.WorkoutRepository;

@Service
public class WorkoutService {
	@Autowired
	private WorkoutRepository workoutRepo;
	
	public Workout create(Workout workout) {
		return workoutRepo.save(workout);
	}
	
	public Workout getOne(Long id) {
		Optional<Workout> workout = workoutRepo.findById(id);
		if(workout.isPresent()) {
			return workout.get();
		} else {
			return null;
		}
	}
	
	public List<Workout> getByUserId(Long id){
		return workoutRepo.findByUserId(id);
	}
	
}
