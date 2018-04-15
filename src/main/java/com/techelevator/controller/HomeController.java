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

		return "index";
	}


	@RequestMapping(path = "/users/{currentUser}", method = RequestMethod.GET)
	public String displayHomePage(HttpSession session) {

		return "userPages/userPage";
	}
	
	@RequestMapping(path = "/users/{currentUser}/profile", method = RequestMethod.GET)
	public String displayUserProfile(HttpSession session) {

		return "userPages/userPage";
	}



}
