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
	
	
	//find an unseen photo
	public int unseenPhotoId(int userId) {
		int photoId = -1;
		String sqlSelectPhoto = 
		"select rawphotos.photo_id from rawphotos where rawphotos.photo_id NOT IN "
		+ "(select photo_id from votes WHERE user_id = ?)";
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
		
		List<String>animals=new ArrayList<>();
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


		for(int i = 0; i < animals.size(); i+=2) {
			Double aiValue = jdbcTemplate.queryForObject(animals.get(i), Double.class, photoId);
			if (aiValue != null) {
				if (aiValue > 1) {
				probableAnimals.put(animals.get(i+1), aiValue);
				}
			}
		}
		return probableAnimals;
	}
	
	public List<String> returnAnimalTypes (Map<String,Double> probableAnimals){
		List<String> animalTypes = new ArrayList<>();
		
		for(String type: probableAnimals.keySet()) {
			animalTypes.add(type);
		}
		return animalTypes;
	}
	
	//store votes
	public void storeVote(Vote vote) {
		String animalType = vote.getAnimalsSeen();
		int numberOfAnimalsSeen = vote.getNumberOfAnimalsSeen();
		int photoId = vote.getPhotoId();
		int userId = vote.getUserId();
		
		String sqlInsertIntoVote = "INSERT INTO votes(photo_id, user_id) VALUES(?,?)"
				+" RETURNING vote_id";
		int voteId = jdbcTemplate.queryForObject(sqlInsertIntoVote, int.class, photoId, userId);
		
		String sqlInsertIntoVoteAnimal ="INSERT INTO votes_animal(vote_id, animal_id, num_animals) VALUES(?,?,?)";
		jdbcTemplate.update(sqlInsertIntoVoteAnimal, voteId, animalType, numberOfAnimalsSeen);

	}
	
	
	//return animal categories by votes
	
	//set approved photo
	
}
