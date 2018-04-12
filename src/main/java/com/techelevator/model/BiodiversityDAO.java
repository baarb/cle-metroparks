package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.techelevator.Vote;

public interface BiodiversityDAO {

	//find an unseen photo
	public int unseenPhotoId(int userId);
	
	
	//return an unseen photo url
	public String returnPhotoURL(int photoId);
	
	
	//pull list of probable animals from AI
	public Map<String, Double> probableAnimals(int photoId);
	
	
	//store votes
	public void storeVote(Vote vote);
	
	}
