package com.techelevator.model;

import java.util.Map;

public class Badges {

	public String determineBadge(Map<String, Integer> animalsSeen) {
		String response = "no";
		String[] seenAnimalsArray = animalsSeen.keySet().toArray(new String[animalsSeen.size()]);		
		for(int i = 0 ; i < seenAnimalsArray.length ; i++) {
			if(animalsSeen.get(seenAnimalsArray[i]) >= 1) {
				response = "test badge";
			}
			
			
			
		}
			return response;
	}
}
