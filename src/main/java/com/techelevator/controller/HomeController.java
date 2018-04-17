package com.techelevator.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.techelevator.model.Badges;
import com.techelevator.model.BiodiversityDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
public class HomeController {

	@Autowired
	UserDAO userDAO;

	@Autowired
	BiodiversityDAO bioDAO;
	// below code returns a list of the approved photo URLs
	// bioDAO.returnApprovedPhotoUrls();


	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String displayLandingPage(HttpSession session) {
		if (session.getAttribute("currentUser") == null) {
			return "index";
		} else {
			User user = (User) session.getAttribute("currentUser");
			return "redirect:/users/" + user.getUserName();
		}
	}

	@RequestMapping(path = "/users/{currentUser}", method = RequestMethod.GET)
	public String displayHomePage(HttpSession session) {
		if (session.getAttribute("currentUser") == null) {
			return "index";
		} else {
			User user = (User) session.getAttribute("currentUser");
			int userId = user.getUserId();
			List<Integer> badgeIds = bioDAO.pullBadgeIdsByUser(userId);
			if (badgeIds != null) {
				int badgeCount = badgeIds.size();
				List<Badges> userBadges = bioDAO.returnBadges(badgeIds);
				session.setAttribute("userBadges", userBadges);
				session.setAttribute("badgeCount", badgeCount);
				Map<Integer, Integer> userRankings = bioDAO.pullAllUsersRankings();
				int userRank = bioDAO.findUserRanking(userId, userRankings);
				session.setAttribute("userRank", userRank);
			}
			return "userPages/userPage";
		}
	}

	@ResponseBody
	@RequestMapping(path = "/users/{currentUser}/badges", method = RequestMethod.GET)
	public List<Badges> getUserBadges(HttpSession session) {
		User user = (User) session.getAttribute("currentUser");

		if (user == null) {
			return new ArrayList<Badges>();
		} else {
			int userId = user.getUserId();
			List<Integer> badgeIds = bioDAO.pullBadgeIdsByUser(userId);
			if (badgeIds != null) {
				return bioDAO.returnBadges(badgeIds);
			}
			
			return new ArrayList<Badges>();
		}
	}
}