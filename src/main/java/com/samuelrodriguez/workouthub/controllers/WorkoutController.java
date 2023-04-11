package com.samuelrodriguez.workouthub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.samuelrodriguez.workouthub.models.User;
import com.samuelrodriguez.workouthub.models.Workout;
import com.samuelrodriguez.workouthub.services.UserService;
import com.samuelrodriguez.workouthub.services.WorkoutService;

@Controller
public class WorkoutController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private WorkoutService workoutService;
	
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
	
}
