package com.techelevator;

public class Vote {
	private int voteId;
	private int userId;
	private int photoId;
	private String[] animalsSeen;
	private int[] numberOfAnimalsSeen;
	
	
	public int getVoteId() {
		return voteId;
	}
	public void setVoteId(int voteId) {
		this.voteId = voteId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getPhotoId() {
		return photoId;
	}
	public void setPhotoId(int photoId) {
		this.photoId = photoId;
	}
	public String[] getAnimalsSeen() {
		return animalsSeen;
	}
	public void setAnimalsSeen(String[] animalsSeen) {
		this.animalsSeen = animalsSeen;
	}
	public int[] getNumberOfAnimalsSeen() {
		return numberOfAnimalsSeen;
	}
	public void setNumberOfAnimalsSeen(int[] numberOfAnimalsSeen) {
		this.numberOfAnimalsSeen = numberOfAnimalsSeen;
	}


}
