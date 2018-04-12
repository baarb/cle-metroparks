package com.techelevator.model;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.Vote;

@Component
public class JDBCBiodiversityDAO implements BiodiversityDAO {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCBiodiversityDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	
	
//		int opposum = 0;
//		int deer = 0;
//		int rabbit = 0;
//		int raccoon = 0;
//		int turkey = 0;
//		int skunk = 0;
//		int bird = 0;
//		int fox = 0;
//		int human = 0;
//		int cat = 0;
//		int coyote = 0;
//		int squirrel = 0;
//		int dog = 0;
//		int mmv = 0;
//		int bigfoot = 0;
//		String insertVote = "INSERT into votes ("
//				+ "photo_id, "
//				+ "user_id, "
//				+ "opposum, "
//				+ "deer,"
//				+ "rabbit, "
//				+ "raccoon, "
//				+ "turkey, "
//				+ "skunk, "
//				+ "bird, "
//				+ "fox, "
//				+ "human, "
//				+ "cat, "
//				+ "coyote, "
//				+ "squirrel, "
//				+ "dog, "
//				+ "mmv, "
//				+ "bigfoot)"
//				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//		if (choice = )
//			
//		
//	}
	
	//find an unseen photo
	public int unseenPhotoId(int userId) {
		int photoId = -1;
		String sqlSelectPhoto = 
		"select rawphotos.photo_id from rawphotos where rawphotos.photo_id NOT IN (select photo_id from votes WHERE user_id = ?)";
		SqlRowSet photoIdSQL = jdbcTemplate.queryForRowSet(sqlSelectPhoto, userId); 
		if(photoIdSQL.next()) {
			photoId = photoIdSQL.getInt(1);
		}
		return photoId;
	}
	
	
	
	public String returnPhotoURL(int photoId) {
		String photoURL = "";
		String sqlSelectPhotoUrl = 
				"select photo_url from rawphotos where photo_id = ?";
		photoURL = jdbcTemplate.queryForObject(sqlSelectPhotoUrl, String.class, photoId);
		return photoURL;
	}
	
	//pull map of probable animals from AI
	public Map<String, Double> probableAnimals(int photoId){
		Map<String, Double>probableAnimals = new HashMap<>();
		
		
		
		return probableAnimals;
	}
	
	
	//store votes
	public void storeVote(Vote vote) {
		
	}
	
	
	//return animal categories by votes
	
	//set approved photo
	
}
