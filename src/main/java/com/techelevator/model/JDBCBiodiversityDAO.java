package com.techelevator.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
	
	//returns a list of URLs for photos that a user has saved
	public List<String> savedUserPhotos(int userId){
		List<String> savedPhotoUrls = new ArrayList<>();
		String findPhotoUrlsByUserId = "SELECT photo_url from rawphotos inner join users_photos on rawphotos.photo_id = users_photos.photo_id where user_id = ?";
		SqlRowSet savedPhotos = jdbcTemplate.queryForRowSet(findPhotoUrlsByUserId, userId);
		while (savedPhotos.next()) {
			savedPhotoUrls.add(savedPhotos.getString("photo_url"));
		}
		return savedPhotoUrls;
	}
	
	//returns a list of all available badges
	public List<Integer> pullAllBadgeIds() {
		List<Integer> badgeIds = new ArrayList<>();
		String sqlReturnBadgeIds = "select badge_id from badges";
		SqlRowSet badgeId = jdbcTemplate.queryForRowSet(sqlReturnBadgeIds);
		while (badgeId.next()) {
			badgeIds.add(badgeId.getInt("badge_id"));
		}
		return badgeIds;
	}
	
	//returns a list of badges that havent yet been earned by a user
	public List<Integer> pullUnearnedBadgeIds(int userId) {
		List<Integer> badgeIds = new ArrayList<>();
		String sqlReturnBadgeIds = "select badge_id from badges where badge_id NOT IN(select badge_id from users_badges where user_id = ?)";
		SqlRowSet badgeId = jdbcTemplate.queryForRowSet(sqlReturnBadgeIds, userId);
		while (badgeId.next()) {
			badgeIds.add(badgeId.getInt("badge_id"));
		}
		return badgeIds;
	}

	// finds if badge is earned and if so adds earned badge to badges_users table
	public List<Integer> assignBadge(int userId, String[] animalSeen) {
		Badges badge = new Badges();
		String[] animalsSeenArray = animalSeen;
		List<Integer> badgeIDs = new ArrayList<>();
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
			List<String> badgeEarned = badge.determineBadge(seenAnimals);
			for (int i = 0; i < badgeEarned.size(); i++) {
				if (!badgeEarned.get(i).equals("no")) {
					String findBadgeIdSQL = "select badge_id from badges where title = ?";
					int badgeId = jdbcTemplate.queryForObject(findBadgeIdSQL, int.class, badgeEarned.get(i));

					String checkBageExists = "select badge_id from badges where badge_id NOT IN(select badge_id from users_badges where user_id = ? AND badge_id = ?)";
					SqlRowSet badgeCheck = jdbcTemplate.queryForRowSet(checkBageExists, userId, badgeId);
					while (badgeCheck.next()) {
						if (badgeId == badgeCheck.getInt("badge_id")) {
							String addBadgeSQL = "INSERT INTO users_badges(user_id, badge_id) VALUES(?,?)";
							jdbcTemplate.update(addBadgeSQL, userId, badgeId);
							badgeIDs.add(badgeId);
						}
					}
				}
			}
		}
		return badgeIDs;
	}

	// returns a list of earned badges as objects
	public List<Badges> returnBadges(List<Integer> badgeIds) {
		List<Badges> earnedBadges = new ArrayList<>();
		for (int i = 0; i < badgeIds.size(); i++) {
			Badges newBadge = new Badges();
			String sqlReturnBadgeInfo = "select * from badges where badge_id = ?";
			SqlRowSet badgeInfo = jdbcTemplate.queryForRowSet(sqlReturnBadgeInfo, badgeIds.get(i));
			while (badgeInfo.next()) {
				newBadge.setBadgeDescription(badgeInfo.getString("description"));
				newBadge.setBadgeId(badgeInfo.getInt("badge_id"));
				newBadge.setBadgeTitle(badgeInfo.getString("title"));
				newBadge.setBadgeUrl(badgeInfo.getString("badge_url"));
				newBadge.setInactiveBadgeUrl(badgeInfo.getString("disabled_badge_url"));
				earnedBadges.add(newBadge);
			}
		}
		return earnedBadges;
	}

	//returns a list of badge ids earned by the user
	public List<Integer> pullBadgeIdsByUser(int userId) {
		List<Integer> badgeIds = new ArrayList<>();
		String sqlReturnBadgeIds = "select badge_id from users_badges where user_id = ?";
		SqlRowSet badgeId = jdbcTemplate.queryForRowSet(sqlReturnBadgeIds, userId);
		while (badgeId.next()) {
			badgeIds.add(badgeId.getInt("badge_id"));
		}
		return badgeIds;
	}

	//returns a Map of all the users and their rankings
	public Map<Integer, Integer> pullAllUsersRankings() {
		Map<Integer, Integer> userIdAndRank = new HashMap<>();
		String pullScoreAndUserId = "select user_id, score from users order by score desc";
		SqlRowSet userAndRankSQL = jdbcTemplate.queryForRowSet(pullScoreAndUserId);
		while (userAndRankSQL.next()) {
			userIdAndRank.put(userAndRankSQL.getInt("user_id"), userAndRankSQL.getInt("score"));
		}
		return userIdAndRank;
	}

	//finds the personal ranking of a specific user
	public int findUserRanking(int userId, Map<Integer, Integer> userIdAndRankMap) {
		int userRank = userId;
		if (userIdAndRankMap.containsKey(userId)) {
			userRank = userIdAndRankMap.get(userId);
		}
		return userRank;
	}

	// find an unseen photo
	public int unseenPhotoId(int userId) {
		int photoId = -1;
		String sqlSelectPhoto = "select rawphotos.photo_id from rawphotos where rawphotos.photo_id NOT IN "
				+ "(select photo_id from votes WHERE user_id = ?)"
				+ " AND rawphotos.photo_id NOT IN (select raw_photo_id from approvedphotos)";
		SqlRowSet photoIdSQL = jdbcTemplate.queryForRowSet(sqlSelectPhoto, userId);
		if (photoIdSQL.next()) {
			photoId = photoIdSQL.getInt(1);
		}
		return photoId;
	}

	// return unseen photo URL
	public String returnPhotoURL(int photoId) {
		String photoURL = "";
		String sqlSelectPhotoUrl = "select photo_url from rawphotos where photo_id = ?";
		photoURL = jdbcTemplate.queryForObject(sqlSelectPhotoUrl, String.class, photoId);
		return photoURL;
	}

	// set approved photo
	public Boolean isApprovedPhoto(int photoId) {
		Boolean approved = false;
		int numVotes = 0;
		int categoryCount = 0;
		Map<String, Integer> seenAnimals = new HashMap<>();

		String sqlNumVotes = "select count(photo_id) from votes where photo_id = ?";
		numVotes = jdbcTemplate.queryForObject(sqlNumVotes, int.class, photoId);
		String sqlCountCategories = "select count(animal_id), animal_id from votes_animal "
				+ "inner join votes on votes.vote_id = votes_animal.vote_id " + "where photo_id = ? group by animal_id";
		SqlRowSet animalGroupsSQL = jdbcTemplate.queryForRowSet(sqlCountCategories, photoId);
		while (animalGroupsSQL.next()) {
			seenAnimals.put(animalGroupsSQL.getString("animal_id"), animalGroupsSQL.getInt("count"));
		}
		if (seenAnimals.keySet() != null) {
			String[] seenAnimalsArray = seenAnimals.keySet().toArray(new String[seenAnimals.size()]);
			while (!approved) {
				for (int i = 0; i < seenAnimalsArray.length; i++) {
					if (seenAnimals.get(seenAnimalsArray[i]) / numVotes >= .8) {
						approved = true;
					}
				}
			}
		}
		return approved;
	}

	// return list of approved photo URLS
	public List<String> returnApprovedPhotoUrls() {
		List<String> photoUrls = new ArrayList<>();
		String sqlApprovedPhotos = "select photo_url from rawphotos where photo_id "
				+ "IN (select photo_id from approvedphotos)";
		SqlRowSet photoUrlsSQL = jdbcTemplate.queryForRowSet(sqlApprovedPhotos);
		while (photoUrlsSQL.next()) {
			photoUrls.add(photoUrlsSQL.getString("photo_url"));
		}
		return photoUrls;
	}

	// set photo as approved
	public void setApprovedPhoto(int photoId) {
		String approvedPhotoSQL = "INSERT INTO approvedphotos(raw_photo_id) VALUES (?)";
		jdbcTemplate.update(approvedPhotoSQL, photoId);
	}

	// pull map of probable animals from AI
	public Map<String, Double> probableAnimals(int photoId) {
		Map<String, Double> probableAnimals = new HashMap<>();

		List<String> animals = new ArrayList<>();
		String oppossum = "SELECT oppossum FROM rawphotos WHERE photo_id = ?";
		String deer = "SELECT deer FROM rawphotos WHERE photo_id = ?";
		String rabbit = "SELECT rabbit FROM rawphotos WHERE photo_id = ?";
		String raccoon = "SELECT raccoon FROM rawphotos WHERE photo_id = ?";
		String turkey = "SELECT turkey FROM rawphotos WHERE photo_id = ?";
		String skunk = "SELECT skunk FROM rawphotos WHERE photo_id = ?";
		String bird = "SELECT bird FROM rawphotos WHERE photo_id = ?";
		String fox = "SELECT fox FROM rawphotos WHERE photo_id = ?";
		String human = "SELECT human FROM rawphotos WHERE photo_id = ?";
		String cat = "SELECT cat FROM rawphotos WHERE photo_id = ?";
		String coyote = "SELECT coyote FROM rawphotos WHERE photo_id = ?";
		String squirrel = "SELECT squirrel FROM rawphotos WHERE photo_id = ?";
		String dog = "SELECT dog FROM rawphotos WHERE photo_id = ?";
		String mmv = "SELECT mmv FROM rawphotos WHERE photo_id = ?";
		String bigfoot = "SELECT bigfoot FROM rawphotos WHERE photo_id = ?";
		animals.add(oppossum);
		animals.add("Oppossum");
		animals.add(deer);
		animals.add("Deer");
		animals.add(rabbit);
		animals.add("Rabbit");
		animals.add(raccoon);
		animals.add("Raccoon");
		animals.add(turkey);
		animals.add("Turkey");
		animals.add(skunk);
		animals.add("Skunk");
		animals.add(bird);
		animals.add("Bird");
		animals.add(fox);
		animals.add("Fox");
		animals.add(human);
		animals.add("Human");
		animals.add(cat);
		animals.add("Cat");
		animals.add(coyote);
		animals.add("Coyote");
		animals.add(squirrel);
		animals.add("Squirrel");
		animals.add(dog);
		animals.add("Dog");
		animals.add(mmv);
		animals.add("Vehicle");
		animals.add(bigfoot);
		animals.add("Bigfoot");

		for (int i = 0; i < animals.size(); i += 2) {
			Double aiValue = jdbcTemplate.queryForObject(animals.get(i), Double.class, photoId);
			if (aiValue != null) {
				if (aiValue > 1) {
					probableAnimals.put(animals.get(i + 1), aiValue);
				}
			}
		}
		return probableAnimals;
	}

	public List<String> returnAnimalTypes(Map<String, Double> probableAnimals) {
		List<String> animalTypes = new ArrayList<>();

		for (String type : probableAnimals.keySet()) {
			animalTypes.add(type);
		}
		return animalTypes;
	}

	// store votes
	public void storeVote(Vote vote) {
		String[] animalType = vote.getAnimalsSeen();
		int[] numberOfAnimalsSeen = vote.getNumberOfAnimalsSeen();
		int photoId = vote.getPhotoId();
		int userId = vote.getUserId();
		boolean saved = vote.isSaved();
		int rating = vote.getRating();
		String findUserScore = "select score from users where user_id = ?";
		if (jdbcTemplate.queryForObject(findUserScore, int.class, userId) != null) {
			int userScore = jdbcTemplate.queryForObject(findUserScore, int.class, userId);
			String sqlUpdateUserScoreNotNull = "update users set score = score+1 where user_id = ?";
			jdbcTemplate.update(sqlUpdateUserScoreNotNull, userId);
		} else {
			String sqlUpdateUserScoreNull = "update users set score = 1 where user_id = ?";
			jdbcTemplate.update(sqlUpdateUserScoreNull, userId);
		}
		if (rating == 0) {
			String sqlInsertIntoVote = "INSERT INTO votes(photo_id, user_id) VALUES(?,?)" + " RETURNING vote_id";
			int voteId = jdbcTemplate.queryForObject(sqlInsertIntoVote, int.class, photoId, userId);
			for (int i = 0; i < animalType.length; i++) {
				String sqlInsertIntoVoteAnimal = "INSERT INTO votes_animal(vote_id, animal_id, num_animals) VALUES(?,?,?)";
				jdbcTemplate.update(sqlInsertIntoVoteAnimal, voteId, animalType[i], numberOfAnimalsSeen[i]);
			}
		} else {
			String sqlInsertIntoVoteWithRating = "INSERT INTO votes(photo_id, user_id, rating) VALUES(?,?,?)"
					+ " RETURNING vote_id";
			int voteId = jdbcTemplate.queryForObject(sqlInsertIntoVoteWithRating, int.class, photoId, userId, rating);
			for (int i = 0; i < animalType.length; i++) {
				String sqlInsertIntoVoteAnimal = "INSERT INTO votes_animal(vote_id, animal_id, num_animals) VALUES(?,?,?)";
				jdbcTemplate.update(sqlInsertIntoVoteAnimal, voteId, animalType[i], numberOfAnimalsSeen[i]);
			}
		}
		if (saved) {
			String sqlInsertSavedPhoto = "INSERT INTO users_photos(user_id, photo_id) VALUES(?,?)";
			jdbcTemplate.update(sqlInsertSavedPhoto, userId, photoId);
		}

	}

}
