package com.techelevator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.UserDAO;

@Controller
public class HomeController {
	
	UserDAO userDAO;

	@Autowired
	public HomeController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String displayHomePage() {
		
		return "index";
	}
	
	@RequestMapping(path="/animalId", method=RequestMethod.GET)
	public String displayGame1Page() {
		
		return "animalId";
	}
	
	@RequestMapping(path="/animalSpotting", method=RequestMethod.GET)
	public String displayGame2Page() {
		
		return "animalSpotting";
	}
	
	
}
