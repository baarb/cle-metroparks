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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.Vote;
import com.techelevator.model.Badges;
import com.techelevator.model.BiodiversityDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
public class AnimalIdController {

	@Autowired
	BiodiversityDAO bioDao;
	
	@Autowired
	UserDAO userDao;
	
//	@Autowired
//	BadgesDAO badgeDao;

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
			RedirectAttributes flashScope,
			@RequestParam String[] animalSeen, 
			int[] quantity,
			int rating,
			boolean saveAsFav
			) {
		Vote vote = new Vote();
		vote.setAnimalsSeen(animalSeen);
		if (quantity == null) { 
			quantity = new int[animalSeen.length];
			// FEATURE if AI and user both say no animal then value is 0.
			// If AI says animal and user says not animal value is 1
			quantity[0] = 0;
			
		} else if (quantity.length < animalSeen.length){ // this means both animal and no animal were selected
			// kill trolls
			quantity = new int[animalSeen.length];
			for (int i = 0; i < animalSeen.length; i++) {
				quantity[i] = 0;
			}
		};
		vote.setNumberOfAnimalsSeen(quantity);
		int photoId = (int) session.getAttribute("photoId");
		vote.setPhotoId(photoId);
		int userId = (int)session.getAttribute("userId");
		vote.setUserId(userId);
		vote.setRating(rating);
		vote.setSaved(saveAsFav);
		
		bioDao.storeVote(vote);
			
		if(bioDao.isApprovedPhoto(photoId)) {
			bioDao.setApprovedPhoto(photoId);
		}
		
		List<Integer> earnedBadgeIds = bioDao.assignBadge(userId, animalSeen);
		if(earnedBadgeIds.size() > 0) {
			List<Badges> listOfBadges = bioDao.returnBadges(earnedBadgeIds);
			flashScope.addFlashAttribute("listOfBadges", listOfBadges);
		}
		
		session.removeAttribute("photoId");
		session.removeAttribute("photoURL");
		
		return "redirect:/games/gameAnimalId";
	}

	@RequestMapping(path = "/games/gameAnimalSpotting", method = RequestMethod.GET)
	public String displayGame2Page() {

		return "games/gameAnimalSpotting";
	}
}
