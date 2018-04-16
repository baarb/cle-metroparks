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
		int totalScore = 0;

		String[] seenAnimalsArray = animalsSeen.keySet().toArray(new String[animalsSeen.size()]);
		if (seenAnimalsArray.length >= 2) {
			response.add("Double Duty");
		}
		for (int i = 0; i < seenAnimalsArray.length; i++) {
			totalScore += animalsSeen.get(seenAnimalsArray[i]);

			if (totalScore >= 10 && totalScore < 50) {
				response.add("Junior Ranger");
			} else if (totalScore >= 50 && totalScore < 100) {
				response.add("Citizen Scientist");
			} else if (totalScore >= 100) {
				response.add("Master Woodsman");
			}

			if (animalsSeen.get(seenAnimalsArray[i]) == 1) {
				response.add("First Photo");
			} else if (animalsSeen.get(seenAnimalsArray[i]) == 10 && seenAnimalsArray[i].equals("Deer")) {
				response.add("Deer Spotter");
			} else if (animalsSeen.get(seenAnimalsArray[i]) == 100 && seenAnimalsArray[i].equals("Deer")) {
				response.add("Master Deer Spotter");
			} else if (animalsSeen.get(seenAnimalsArray[i]) == 10 && seenAnimalsArray[i].equals("Raccoon")) {
				response.add("Raccoon Spotter");
			} else if (animalsSeen.get(seenAnimalsArray[i]) == 100 && seenAnimalsArray[i].equals("Raccoon")) {
				response.add("Master Raccoon Spotter");
			} else {
				response.add(defualt);
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
