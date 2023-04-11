package com.samuelrodriguez.workouthub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.samuelrodriguez.workouthub.models.Exercise;
import com.samuelrodriguez.workouthub.models.User;
import com.samuelrodriguez.workouthub.models.Workout;
import com.samuelrodriguez.workouthub.services.ExerciseService;
import com.samuelrodriguez.workouthub.services.UserService;
import com.samuelrodriguez.workouthub.services.WorkoutService;

@Controller
public class WorkoutController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private WorkoutService workoutService;
	
	@Autowired
	private ExerciseService exerciseService;
	
	@GetMapping("/workouts/create")
	public String renderCreateWorkout(
			@ModelAttribute("newWorkout") Workout newWorkout,
			Model model,
			HttpSession session
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		User user = userService.getOne( (Long) session.getAttribute("userId"));
		model.addAttribute("user", user);
		return "workout-create.jsp";
	}
	
	@PostMapping("/workouts/create")
	public String processCreateWorkout(
			@Valid @ModelAttribute("newWorkout") Workout newWorkout,
			BindingResult result,
			Model model,
			HttpSession session
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		else if(result.hasErrors()) {
			User user = userService.getOne( (Long) session.getAttribute("userId"));
			model.addAttribute("user", user);
			return "workout-create.jsp";
		}
		Workout workout = workoutService.create(newWorkout);
		return "redirect:/workouts/" + workout.getId() + "/add_exercise";
	}
	
	@GetMapping("/workouts/{workoutId}/add_exercise")
	public String renderWorkoutAdd(
			@PathVariable("workoutId") Long workoutId,
			@ModelAttribute("newExercise") Exercise newExercise,
			Model model,
			HttpSession session
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		User user = userService.getOne( (Long) session.getAttribute("userId"));
		model.addAttribute("user", user);
		model.addAttribute("workout", workoutService.getOne(workoutId));
		return "workout-add.jsp";
	}
	
	@PostMapping("/workouts/{workoutId}/add_exercise")
	public String processWorkoutAdd(
			@PathVariable("workoutId") Long workoutId,
			@Valid @ModelAttribute("newExercise") Exercise newExercise,
			BindingResult result,
			Model model,
			HttpSession session
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		else if(result.hasErrors()) {
			User user = userService.getOne( (Long) session.getAttribute("userId"));
			model.addAttribute("user", user);
			model.addAttribute("workout", workoutService.getOne(workoutId));
			return "workout-add.jsp";
		}
		exerciseService.create(newExercise);
		return "redirect:/workouts/" + workoutId + "/add_exercise";
	}
	
}
