package com.techelevator.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
public class HomeController {

	UserDAO userDAO;

	@Autowired
	public HomeController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String displayLandingPage(HttpSession session) {

//		try {
//			if (session.getAttribute("currentUser") != null) {
//				return "redirect:/users/{currentUser}";
//			}
//		} catch (Exception e) {
//			
//		}

		return "index";
	}

	@RequestMapping(path = "/", method = RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute User user, BindingResult result, RedirectAttributes flash) {
		if (result.hasErrors()) {
			flash.addFlashAttribute("user", user);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
			return "redirect:/";
		}

		userDAO.saveUser(user.getUserName(), user.getPassword(), user.getEmail());
		return "redirect:/userRegistration/login";
	}

	@RequestMapping(path = "/users/{currentUser}", method = RequestMethod.GET)
	public String displayHomePage(HttpSession session) {

		return "homePage";
	}
	
	@RequestMapping(path = "/users/{currentUser}/profile", method = RequestMethod.GET)
	public String displayUserProfile(HttpSession session) {

		return "userPages/userPage";
	}

	@RequestMapping(path = "/games/gameAnimalId", method = RequestMethod.GET)
	public String displayGame1Page() {

		return "games/gameAnimalId";
	}

	@RequestMapping(path = "/games/gameAnimalSpotting", method = RequestMethod.GET)
	public String displayGame2Page() {

		return "games/gameAnimalSpotting";
	}

}
