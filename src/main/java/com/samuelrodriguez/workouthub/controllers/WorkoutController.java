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
		return "redirect:/workouts/" + workout.getId() + "/edit";
	}
	
	@GetMapping("/workouts/{workoutId}/edit")
	public String renderWorkoutAdd(
			@PathVariable("workoutId") Long workoutId,
			@ModelAttribute("newExercise") Exercise newExercise,
			Model model,
			HttpSession session
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		Workout workout = workoutService.getOne(workoutId);
		System.out.println(workout.getUser().getId());
		System.out.println(session.getAttribute("userId"));
//		if(workout.getUser().getId() != (Long) session.getAttribute("userId")) {
//			return "redirect:/dashboard";
//		}
		User user = userService.getOne( (Long) session.getAttribute("userId"));
		model.addAttribute("user", user);
		model.addAttribute("workout", workoutService.getOne(workoutId));
		return "workout-add.jsp";
	}
	
	@PostMapping("/workouts/{workoutId}/edit")
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
		exerciseService.createOrUpdate(newExercise);
		return "redirect:/workouts/" + workoutId + "/edit";
	}
	
	@GetMapping("/workouts/{workoutId}/view")
	public String renderWorkout(
			@PathVariable("workoutId") Long workoutId,
			Model model,
			HttpSession session
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		model.addAttribute("workout", workoutService.getOne(workoutId));
		return "workout-view.jsp";
	}
	
	@GetMapping("/workouts/my_workouts")
	public String renderUserWorkouts(
			Model model,
			HttpSession session
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		model.addAttribute("workouts", workoutService.getByUserId( (Long) session.getAttribute("userId")));
		return "user-workouts.jsp";
	}
	
}
