package com.techelevator.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
public class AuthenticationController {

	private UserDAO userDAO;

	@Autowired
	public AuthenticationController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/userRegistration/login", method=RequestMethod.GET)
	public String displayLoginForm() {
		return "userRegistration/login";
	}
	
	@RequestMapping(path="/userRegistration/login", method=RequestMethod.POST)
	public String login(@RequestParam String userName, 
						@RequestParam String password, 
						@RequestParam(required=false) String destination,
						HttpSession session,
						RedirectAttributes flash) {
		if(userDAO.searchForUsernameAndPassword(userName, password)) {
			session.setAttribute("currentUser", userDAO.getUserByUserName(userName));
			
			if(destination != null && ! destination.isEmpty()) {
				return "redirect:" + destination;
			} else {
				return "redirect:/users/"+userName;
			}
		} else {
			flash.addFlashAttribute("message", "Invalid username/password!");
			return "redirect:/userRegistration/login";
		}
	}

	@RequestMapping(path="/logout", method=RequestMethod.POST)
	public String logout(ModelMap model, HttpSession session) {
		model.remove("currentUser");
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(path="/users/{currentUser}/profile/changePassword", method=RequestMethod.GET)
	public String displayChangePassword() {
		return "userPages/userPage";
	}
	
	@RequestMapping(path="/users/{currentUser}/profile/changePassword", method=RequestMethod.POST)
	public String changePassword(@RequestParam String userName, 
								@RequestParam String password,
								@RequestParam String newPassword,
								RedirectAttributes flash, ModelMap model, HttpSession session) {
		User user = (User) session.getAttribute("currentUser");
		if(user.getUserName().equals(userName)) {
			userDAO.updatePassword(userName, password, newPassword);
			model.remove("currentUser");
			session.invalidate();
			return "redirect:/userRegistration/login";
		} else {
			flash.addFlashAttribute("error", "Invalid username/password!");
			return "redirect:/users/{currentUser}/profile/changePassword";
		}
	}
}
