package com.techelevator.model;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCBadgesDAO implements BadgesDAO {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCBadgesDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public void assignBadge(int userId, String[] animalSeen) {
		Badges badge = new Badges();
		String[] animalsSeenArray = animalSeen;
		Map<String, Integer> seenAnimals = new HashMap<>();
		String sqlCountCategories = "select count(animal_id) from votes_animal "
				+ "inner join votes on votes.vote_id = votes_animal.vote_id "
				+ "where user_id = ? and animal_id= ? group by animal_id";

		for (int i = 0; i < animalsSeenArray.length; i++) {
			SqlRowSet animalGroupsSQL = jdbcTemplate.queryForRowSet(sqlCountCategories, userId, animalsSeenArray[i]);
					while (animalGroupsSQL.next()) {
				seenAnimals.put(animalsSeenArray[i], animalGroupsSQL.getInt("count"));
			}
		}
		
		if (seenAnimals.keySet() != null) {
			String badgeEarned = badge.determineBadge(seenAnimals);
			if (! badgeEarned.equals("no")) {
				String findBAdgeIdSQL= "select badge_id from badges where title = ?";
				int badgeId = jdbcTemplate.queryForObject(findBAdgeIdSQL, int.class, badgeEarned);
				String addBadgeSQL = "INSERT INTO users_badges(user_id, badge_id) VALUES(?,?)";
				jdbcTemplate.update(addBadgeSQL, userId, badgeId);
			}
		}
	}

}
