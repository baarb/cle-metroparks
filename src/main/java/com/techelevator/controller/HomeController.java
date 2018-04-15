package com.techelevator.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.BiodiversityDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
public class HomeController {

UserDAO userDAO;

@Autowired
BiodiversityDAO bioDAO;
// below code returns a list of the approved photo URLs
// bioDAO.returnApprovedPhotoUrls();

@Autowired
public HomeController(UserDAO userDAO) {
    this.userDAO = userDAO;
}

@RequestMapping(path = "/", method = RequestMethod.GET)
public String displayLandingPage(HttpSession session) {
    if ( session.getAttribute("currentUser") == null) {
        return "index";
    } else {
        User user = (User) session.getAttribute("currentUser");
        return "redirect:/users/"+ user.getUserName();
    }
}


@RequestMapping(path = "/users/{currentUser}", method = RequestMethod.GET)
public String displayHomePage(HttpSession session) {
    if ( session.getAttribute("currentUser") == null) {
        return "index";
    } else {
        return "userPages/userPage";
    }
}

@RequestMapping(path = "/users/{currentUser}/profile", method = RequestMethod.GET)
public String displayUserProfile(HttpSession session) {
    if ( session.getAttribute("currentUser") == null) {
        return "index";
    } else {
    return "userPages/userPage";
    }
}
}