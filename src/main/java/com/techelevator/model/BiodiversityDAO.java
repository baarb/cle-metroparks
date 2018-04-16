package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.techelevator.Vote;

public interface BiodiversityDAO {
	
	
	public void assignBadge(int userId, String[] animalSeen);

	//find an unseen photo
	public int unseenPhotoId(int userId);
	
	
	//return an unseen photo url
	public String returnPhotoURL(int photoId);
	
	//determine if photo is approved
	public Boolean isApprovedPhoto(int photoId);
	
	//store photo as approved
	public void setApprovedPhoto(int photoId);
	
	//pull urls of approved photos
	public List<String> returnApprovedPhotoUrls();
	
	//pull list of probable animals from AI
	public List<String> returnAnimalTypes (Map<String,Double> probableAnimals);
	
	//create map of animals with AI data
	public Map<String, Double> probableAnimals(int photoId);
	
	//store votes
	public void storeVote(Vote vote);
	
	}
