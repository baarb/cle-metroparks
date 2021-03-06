package com.techelevator.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.Badges;
import com.techelevator.model.BiodiversityDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
public class UserController {

	@Autowired
	private BiodiversityDAO bioDAO;
	
	private UserDAO userDAO;

	@Autowired
	public UserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}


	@RequestMapping(path="/users/new", method=RequestMethod.GET)
	public String displayNewUserForm(ModelMap modelHolder) {
		if( ! modelHolder.containsAttribute("user")) {
			modelHolder.addAttribute("user", new User());
		}
		return "userRegistration/newUser";
	}
	
	@RequestMapping(path="/users", method=RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute User user, BindingResult result, RedirectAttributes flash) {
		if(result.hasErrors()) {
			flash.addFlashAttribute("user", user);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
			return "redirect:/";
		}
		
		if(userDAO.getUserByUserName(user.getUserName()) == null) {
			userDAO.saveUser(user.getUserName(), user.getPassword(), user.getEmail());
			User newUser = (User) userDAO.getUserByUserName(user.getUserName());
			Badges newBadge = bioDAO.newUserInitiation(newUser.getUserId());
			return "redirect:/userRegistration/login";
		} else {
			flash.addFlashAttribute("message", "Username already in use!");
			return "redirect:/users/new";
		}
	}
	
	@RequestMapping(path="/", method=RequestMethod.POST)
	public String createUserLanding(@Valid @ModelAttribute User user, BindingResult result, RedirectAttributes flash) {
		if(result.hasErrors()) {
			flash.addFlashAttribute("user", user);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
			return "redirect:/";
		}

		if(userDAO.getUserByUserName(user.getUserName()) == null) {
			userDAO.saveUser(user.getUserName(), user.getPassword(), user.getEmail());
			User newUser = (User) userDAO.getUserByUserName(user.getUserName());
			Badges newBadge = bioDAO.newUserInitiation(newUser.getUserId());
			return "redirect:/userRegistration/login";
		} else {
			flash.addFlashAttribute("message", "Username already in use!");
			return "redirect:/";
		}

	}
	
	@RequestMapping(path="/popUp", method=RequestMethod.GET)
	public String userPopUp(@Valid @ModelAttribute User user, BindingResult result, RedirectAttributes flash, ModelMap modelHolder) {
		if( ! modelHolder.containsAttribute("user")) {
			modelHolder.addAttribute("user", new User());
		}
		
		return "index";

	}
	
	@RequestMapping(path="/popUp", method=RequestMethod.POST)
	public String createUserPopUp(@Valid @ModelAttribute User user, BindingResult result, RedirectAttributes flash) {
		if(result.hasErrors()) {
			flash.addFlashAttribute("user", user);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
			return "redirect:/";
		}

		if(userDAO.getUserByUserName(user.getUserName()) == null) {
			userDAO.saveUser(user.getUserName(), user.getPassword(), user.getEmail());
			User newUser = (User) userDAO.getUserByUserName(user.getUserName());
			Badges newBadge = bioDAO.newUserInitiation(newUser.getUserId());
			return "redirect:/userRegistration/login";
		} else {
			flash.addFlashAttribute("popUpMessage", "Username already in use!");
			return "redirect:/popUp";
		}

	}
	@RequestMapping(path="/changeAvatar", method=RequestMethod.POST)
	public String setUserAvatar(int userId, int chosenBadge, RedirectAttributes flash) {
		
		bioDAO.setUserAvatar(userId, chosenBadge);
		
		return "redirect:/";
	}
	
}
