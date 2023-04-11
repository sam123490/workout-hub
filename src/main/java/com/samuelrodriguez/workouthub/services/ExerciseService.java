package com.samuelrodriguez.workouthub.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.samuelrodriguez.workouthub.models.Exercise;
import com.samuelrodriguez.workouthub.repositories.ExerciseRepository;

@Service
public class ExerciseService {
	@Autowired
	private ExerciseRepository exerciseRepo;
	
	public Exercise create(Exercise exercise) {
		return exerciseRepo.save(exercise);
	}
	
}
