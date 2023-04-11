package com.samuelrodriguez.workouthub.repositories;

import org.springframework.data.repository.CrudRepository;

import com.samuelrodriguez.workouthub.models.Exercise;

public interface ExerciseRepository extends CrudRepository<Exercise, Long> {

}
