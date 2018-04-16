package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Badges {

	private int badgeId;
	private String badgeTitle;
	private String badgeDescription;
	private String badgeUrl;
	private String inactiveBadgeUrl;
	
	
	public List<String> determineBadge(Map<String, Integer> animalsSeen) {
		List<String> response = new ArrayList<>();
		
		String defualt = "no";
		String[] seenAnimalsArray = animalsSeen.keySet().toArray(new String[animalsSeen.size()]);		
		for(int i = 0 ; i < seenAnimalsArray.length ; i++) {
			if(animalsSeen.get(seenAnimalsArray[i]) >= 1) {
				response.add("test badge");
			}
			
			
			
		}
			return response;
	}


	public int getBadgeId() {
		return badgeId;
	}


	public void setBadgeId(int badgeId) {
		this.badgeId = badgeId;
	}


	public String getBadgeTitle() {
		return badgeTitle;
	}


	public void setBadgeTitle(String badgeTitle) {
		this.badgeTitle = badgeTitle;
	}


	public String getBadgeDescription() {
		return badgeDescription;
	}


	public void setBadgeDescription(String badgeDescription) {
		this.badgeDescription = badgeDescription;
	}


	public String getBadgeUrl() {
		return badgeUrl;
	}


	public void setBadgeUrl(String badgeUrl) {
		this.badgeUrl = badgeUrl;
	}


	public String getInactiveBadgeUrl() {
		return inactiveBadgeUrl;
	}


	public void setInactiveBadgeUrl(String inactiveBadgeUrl) {
		this.inactiveBadgeUrl = inactiveBadgeUrl;
	}
}
