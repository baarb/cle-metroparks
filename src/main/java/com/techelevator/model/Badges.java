package com.techelevator.model;

import java.util.List;
import java.util.Map;

public class Badges {

	public String determineBadge(Map<String, Integer> animalsSeen) {
		String response = "no";
		String[] seenAnimalArray = (String[]) animalsSeen.keySet().toArray();
		for(int i = 0 ; i < seenAnimalArray.length ; i++) {
			if(animalsSeen.get(seenAnimalArray[i]) >= 1) {
				response = "test badge";
			}
			
			
			
		}
		
		System.out.println(response);
		return response;
	}
}
