package com.techelevator.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.Vote;
import com.techelevator.model.BiodiversityDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
public class AnimalIdController {

	@Autowired
	BiodiversityDAO bioDao;
	
	@Autowired
	UserDAO userDao;

	@Autowired
	BasicDataSource dataSource;
	
	
	@RequestMapping(path ="/games/gameAnimalId", method=RequestMethod.GET)
	public String displayGame1Page(HttpSession session) {
		User user = (User) session.getAttribute("currentUser");
		int userId = user.getUserId();
		int photoId = bioDao.unseenPhotoId(userId);
		String photoURL = bioDao.returnPhotoURL(photoId);
		Map<String, Double> probableAnimals = bioDao.probableAnimals(photoId);
		List<String> animalTypes = bioDao.returnAnimalTypes(probableAnimals);
		session.setAttribute("probableAnimals", probableAnimals);
		session.setAttribute("animalTypes", animalTypes);
		session.setAttribute("photoId", photoId);
		session.setAttribute("photoURL", photoURL);
		session.setAttribute("userId", userId);
		
		return "/games/gameAnimalId";
	}
	
	
	@RequestMapping(path ="/games/gameAnimalId", method=RequestMethod.POST)
	public String displayGame1PagePOST(
			HttpSession session, 
			@RequestParam String animalSeen, 
			@RequestParam int quantity
			) {
		Vote vote = new Vote();
		vote.setAnimalsSeen(animalSeen);
		vote.setNumberOfAnimalsSeen(quantity);
		vote.setPhotoId( (int) session.getAttribute("photoId"));
		vote.setUserId((int)session.getAttribute("userId"));
		
		bioDao.storeVote(vote);
		
		session.removeAttribute("photoId");
		session.removeAttribute("photoURL");
		
		return "redirect:/games/gameAnimalId";
	}

	@RequestMapping(path = "/games/gameAnimalSpotting", method = RequestMethod.GET)
	public String displayGame2Page() {

		return "games/gameAnimalSpotting";
	}
}
