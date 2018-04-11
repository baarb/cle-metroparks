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
	
	//return animal categories by votes
	
	//set approved photo
	
}
