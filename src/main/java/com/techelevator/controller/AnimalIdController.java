package com.techelevator.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	
	@RequestMapping(path = "/games/gameAnimalId", method = RequestMethod.GET)
	public String displayGame1Page(HttpSession session) {
		User user = (User) session.getAttribute("currentUser");
		int userId = user.getUserId();
		int photoId = bioDao.unseenPhotoId(userId);
		String photoURL = bioDao.returnPhotoURL(photoId);
		
		session.setAttribute("photoId", photoId);
		session.setAttribute("photoURL", photoURL);
		
		return "games/gameAnimalId";
	}

	@RequestMapping(path = "/games/gameAnimalSpotting", method = RequestMethod.GET)
	public String displayGame2Page() {

		return "games/gameAnimalSpotting";
	}
}
