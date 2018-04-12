package com.techelevator.model;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class JDBCBiodiversityDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCBiodiversityDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//store votes
	public void storeVote(Vote vote) {
		int opposum = 0;
		int deer = 0;
		int rabbit = 0;
		int raccoon = 0;
		int turkey = 0;
		int skunk = 0;
		int bird = 0;
		int fox = 0;
		int human = 0;
		int cat = 0;
		int coyote = 0;
		int squirrel = 0;
		int dog = 0;
		int mmv = 0;
		int bigfoot = 0;
		String insertVote = "INSERT into votes ("
				+ "photo_id, "
				+ "user_id, "
				+ "opposum, "
				+ "deer,"
				+ "rabbit, "
				+ "raccoon, "
				+ "turkey, "
				+ "skunk, "
				+ "bird, "
				+ "fox, "
				+ "human, "
				+ "cat, "
				+ "coyote, "
				+ "squirrel, "
				+ "dog, "
				+ "mmv, "
				+ "bigfoot)"
				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		if (choice = )
			
		
	}
	
	//return animal categories by votes
	
	//set approved photo
	
}
