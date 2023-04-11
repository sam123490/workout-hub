package com.samuelrodriguez.workouthub.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.samuelrodriguez.workouthub.models.Exercise;
import com.samuelrodriguez.workouthub.repositories.ExerciseRepository;

@Service
public class ExerciseService {
	@Autowired
	private ExerciseRepository exerciseRepo;
	
	public Exercise createOrUpdate(Exercise exercise) {
		return exerciseRepo.save(exercise);
	}
	
	public Exercise getOne(Long id) {
		Optional<Exercise> exercise = exerciseRepo.findById(id);
		if(exercise.isPresent()) {
			return exercise.get();
		} else {
			return null;
		}
	}
	
}
