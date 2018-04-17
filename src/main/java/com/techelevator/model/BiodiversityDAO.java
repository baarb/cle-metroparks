package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.techelevator.Vote;

public interface BiodiversityDAO {
	
	//pulls a list of urls for photos saved by the user
	public List<String> savedUserPhotos(int userId);
	
	//pulls a list of all the badgeIds that a user has not earned yet
	public List<Integer> pullUnearnedBadgeIds(int userId);
	
	//pulls a list of all available badgeIds
	public List<Integer> pullAllBadgeIds();
	
	//while a user is voting, find out if their last vote earned them a badge, returns list of badgeIds
	public List<Integer> assignBadge(int userId, String[] animalSeen);
	
	//given a list of badgeIds, will return badge objects for each id
	public List<Badges> returnBadges(List<Integer> badgeIds);
	
	//pulls a likst of badgeIds of badges earned by a user
	public List<Integer> pullBadgeIdsByUser (int userId);

	//pulls a Map ranking of each registered user 
	public Map<Integer, Integer> pullAllUsersRankings();
	
	//finds personal ranking for specific user
	public int findUserRanking(int userId, Map<Integer, Integer> userIdAndRankMap);

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
