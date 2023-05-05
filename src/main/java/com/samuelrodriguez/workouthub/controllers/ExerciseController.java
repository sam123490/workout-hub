package com.samuelrodriguez.workouthub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import com.samuelrodriguez.workouthub.models.Exercise;
import com.samuelrodriguez.workouthub.models.Workout;
import com.samuelrodriguez.workouthub.services.ExerciseService;
import com.samuelrodriguez.workouthub.services.UserService;
import com.samuelrodriguez.workouthub.services.WorkoutService;

@Controller
public class ExerciseController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private WorkoutService workoutService;
	
	@Autowired
	private ExerciseService exerciseService;
	
	@GetMapping("/workouts/{workoutId}/exercises/{exerciseId}/edit")
	public String renderExerciseEdit(
			@PathVariable("workoutId") Long workoutId,
			@PathVariable("exerciseId") Long exerciseId,
			Model model,
			HttpSession session
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		Workout workout = workoutService.getOne(workoutId);
//		if(workout.getUser().getId() == (Long) session.getAttribute("userId")) {
//			return "redirect:/dashboard";
//		}
		model.addAttribute("workout", workoutService.getOne(workoutId));
		model.addAttribute("editExercise", exerciseService.getOne(exerciseId));
		return "exercise-edit.jsp";
	}
	
	@PutMapping("/workouts/{workoutId}/exercises/{id}/edit")
	public String processExerciseEdit(
			@PathVariable("workoutId") Long workoutId,
			@PathVariable("id") Long exerciseId,
			@Valid @ModelAttribute("editExercise") Exercise editExercise,
			BindingResult result,
			Model model,
			HttpSession session
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		else if(result.hasErrors()) {
			model.addAttribute("workout", workoutService.getOne(workoutId));
			return "exercise-edit.jsp";
		}
		exerciseService.createOrUpdate(editExercise);
		return "redirect:/workouts/" + workoutId + "/edit";
	}
	
	@DeleteMapping("/workouts/{workoutId}/exercises/{id}/delete")
	public String processExerciseDelete(
			@PathVariable("workoutId") Long workoutId,
			@PathVariable("id") Long exerciseId,
			HttpSession session
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		exerciseService.deleteExercise(exerciseId);
		return "redirect:/workouts/" + workoutId + "/edit";
	}
	
}
