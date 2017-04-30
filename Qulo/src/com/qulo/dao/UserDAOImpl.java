package com.qulo.dao;
/*
This file performs all the data access requests. It performs data selects, updates and deletes which are user related
*/
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Month;
import java.time.Period;
import java.util.Base64;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import com.qulo.model.CompatibilityQuestion;
import com.qulo.model.CrushDate;
import com.qulo.model.User;
import com.qulo.model.UserImage;

public class UserDAOImpl implements UserDAO {

	private JdbcTemplate jdbcTemplate;

	public UserDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// insert user record during registration
	@Override
	public void saveOrUpdate(User user) {
		if (user.getId() > 0) {
			// update
			String sql = "UPDATE USER SET EmailAddress=?, LookingFor=?, AboutMe=?, City=?, State=?, Country=? "
					+ "WHERE UserID=?";
			jdbcTemplate.update(sql, user.getEmail(), user.getLookingFor(), user.getAboutMe(), user.getCity(),
					user.getState(), user.getCountry(), user.getId());
		} else {
			// insert
			String sql = "INSERT INTO USER (DisplayName, Password, UserRole, FirstName , LastName, "
					+ " City, State, Country, DOB,EmailAddress, DateOfJoining, Gender, LookingFor, AboutMe, CompatibilityQuestionsOver"
					+ ", IsEnabled ) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, STR_TO_DATE(?, '%Y-%m-%d'), ?, CURDATE(), ?, ?, ?, ?, ?)";
			jdbcTemplate.update(sql, user.getDisplayName(), user.getPassword(), user.getRole(), user.getFirstName(),
					user.getLastName(), user.getCity(), user.getState(), user.getCountry(), user.getDob(),
					user.getEmail(), user.getGender(), user.getLookingFor(), user.getAboutMe(), 0, 1);
		}
	}

	// Disable user by admin
	@Override
	public void delete(int userId) {
		String sql = "update USER set IsEnabled = 0 WHERE UserID=?";
		jdbcTemplate.update(sql, userId);
	}
	@Override
	public void enable(int userId) {
		String sql = "update USER set IsEnabled = 1 WHERE UserID=?";
		jdbcTemplate.update(sql, userId);
	}
	// List of users for admin
	@Override
	public List<User> list() {
		String sql = "SELECT * FROM USER order by DateOfJoining Desc";
		List<User> listUser = jdbcTemplate.query(sql, new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User aUser = new User();

				aUser.setId(rs.getInt("UserID"));
				aUser.setDisplayName(rs.getString("DisplayName"));
				aUser.setJoinDate(rs.getString("DateOfJoining"));
				aUser.setIsEnabled(rs.getInt("IsEnabled"));
				return aUser;
			}

		});

		return listUser;
	}

	// get User record
	@Override
	public User get(String displayName) {
		String sql = "SELECT * FROM USER WHERE IsEnabled = 1 and DisplayName='" + displayName + "'";
		User user = jdbcTemplate.query(sql, new ResultSetExtractor<User>() {
			@Override
			public User extractData(ResultSet rs) throws SQLException, DataAccessException {
				if (rs.next()) {
					User user = new User();
					user.setId(rs.getInt("UserID"));
					user.setDisplayName(rs.getString("DisplayName"));
					user.setFirstName(rs.getString("FirstName"));
					user.setLastName(rs.getString("LastName"));
					user.setCity(rs.getString("City"));
					user.setState(rs.getString("State"));
					user.setCountry(rs.getString("Country"));
					user.setDob(rs.getString("DOB"));
					user.setEmail(rs.getString("EmailAddress"));
					user.setAboutMe(rs.getString("AboutMe"));
					user.setLookingFor(rs.getString("LookingFor"));
					user.setGender(rs.getString("Gender"));
					user.setCompatibilityQuestionsOver(rs.getInt("CompatibilityQuestionsOver"));
					user.setFileName(null);
					UserImage userImage = getImage(rs.getInt("UserID"));
					if(userImage != null){
						user.setFileName(userImage.getFilename().substring(userImage.getFilename().lastIndexOf(".")+1));
						try {
							user.setFileData(new String(Base64.getEncoder().encode(userImage.getFileData()), "UTF-8"));
						} catch (UnsupportedEncodingException e) {
							
							e.printStackTrace();
						}
					}
					return user;
				}

				return null;
			}

		});

		String sql1 = "select sum(SelfScore) from SCORE, USER_COMPATIBILITY_ANSWERS, USER"
				+ " where USER_COMPATIBILITY_ANSWERS.Selection = SCORE.Option and USER.UserID = USER_COMPATIBILITY_ANSWERS.UserID"
				+ " and USER.IsEnabled = 1 and USER.DisplayName ='" + displayName + "'";
		user.setScore(jdbcTemplate.query(sql1, new ResultSetExtractor<Integer>() {
			@Override
			public Integer extractData(ResultSet rs) throws SQLException, DataAccessException {
				if (rs.next()) {
					return rs.getInt(1);
				}

				return null;
			}

		}));
		return user;
	}

	// Obtain Match list and also of the record exists in crush list and if its
	// a mutual crush
	@Override
	public List<User> getMatchList(int userID, String displayName, String lookingFor, int score) {
		String sql = "select USER.DisplayName, USER.UserID, USER.DOB, USER.FirstName, USER.LastName, USER.City,(SelfScore) as score, USER.Gender "
				+ "from SCORE, USER_COMPATIBILITY_ANSWERS, USER"
				+ " where USER_COMPATIBILITY_ANSWERS.Selection = SCORE.Option "
				+ "and USER.UserID = USER_COMPATIBILITY_ANSWERS.UserID" + " and USER.Gender = '" + lookingFor + "'"
				+ " and USER.IsEnabled = 1 and USER.DisplayName <> '" + displayName + "' " + " group by USER.UserID"
				+ " having sum(SelfScore) between " + (score - 10000) + " and " + (score + 10000);

		List<User> matchList = jdbcTemplate.query(sql, new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {

				User user = new User();
				user.setId(rs.getInt("UserID"));
				user.setDisplayName(rs.getString("DisplayName"));
				user.setFirstName(rs.getString("FirstName"));
				user.setLastName(rs.getString("LastName"));
				user.setCity(rs.getString("City"));
				user.setDob(rs.getString("DOB"));
				user.setGender(rs.getString("Gender"));
				String dob = rs.getString("DOB");

				// calculate Age
				LocalDate today = LocalDate.now();
				LocalDate birthday = LocalDate.of(Integer.parseInt(dob.substring(0, 4)),
						Integer.parseInt(dob.substring(5, 7)), Integer.parseInt(dob.substring(8, 10)));
				Period p = Period.between(birthday, today);
				user.setAge(Integer.toString(p.getYears()));

				// Check if match is in crush list
				String sql1 = "select 1 from CRUSHLIST where UserID = " + userID + " and " + "CrushID = "
						+ rs.getInt("UserID");
				user.setIsCrush(jdbcTemplate.query(sql1, new ResultSetExtractor<Integer>() {
					@Override
					public Integer extractData(ResultSet rs) throws SQLException, DataAccessException {
						if (rs.next()) {
							return 1;
						}

						return 0;
					}

				}));

				// Check if its mutual crush
				String sql2 = "SELECT UserID, CrushID FROM qulo.CRUSHLIST L1 WHERE "
						+ "EXISTS ( SELECT * FROM   qulo.CRUSHLIST L2 WHERE  L1.UserID = L2.CrushID AND L1.CrushID = L2.UserID) "
						+ "and UserID = " + userID + " and CrushID = " + rs.getInt("UserID");

				user.setMutualCrush(jdbcTemplate.query(sql2, new ResultSetExtractor<Integer>() {
					@Override
					public Integer extractData(ResultSet rs) throws SQLException, DataAccessException {
						if (rs.next()) {
							return 1;
						}

						return 0;
					}

				}));
				user.setFileName(null);
				UserImage userImage = getImage(rs.getInt("UserID"));
				if(userImage != null){
					user.setFileName(userImage.getFilename().substring(userImage.getFilename().lastIndexOf(".")+1));
					try {
						user.setFileData(new String(Base64.getEncoder().encode(userImage.getFileData()), "UTF-8"));
					} catch (UnsupportedEncodingException e) {
						
						e.printStackTrace();
					}
				}
				
;				return user;
			}
		});
		return matchList;
	}

	// Add to crush
	@Override
	public void addToCrush(int userID, int crushID) {
		String sql = "INSERT INTO CRUSHLIST (UserID, CrushID) " + "VALUES (?, ?)";
		jdbcTemplate.update(sql, userID, crushID);
	}

	// remove from crush
	@Override
	public void removeFromCrush(int userID, int crushID) {
		String sql = "Delete from CRUSHLIST where UserID = ? and  CrushID = ? ";
		jdbcTemplate.update(sql, userID, crushID);
	}

	// save or update date
	@Override
	public void saveOrUpdateDate(CrushDate crushDate, String action) {
		
		if (action.equals("insert")) {
			String sql = "INSERT INTO CRUSHDATE (User1, User2, MeetDate, MeetLocation , MeetNote )"
					+ "VALUES (?, ?, STR_TO_DATE(?, '%Y-%m-%d'), ?, ?)";
			jdbcTemplate.update(sql, crushDate.getUser1(), crushDate.getUser2(),
					crushDate.getMeetDate(), crushDate.getMeetLocation(), crushDate.getMeetNote());
		} else if (action.equals("update")) {
			String sql = "UPDATE CRUSHDATE SET MeetDate=?, MeetLocation=?, MeetNote=? "
					+ "WHERE User1=? and User2=?";
			jdbcTemplate.update(sql, crushDate.getMeetDate(), crushDate.getMeetLocation(), crushDate.getMeetNote(),
					crushDate.getUser1(), crushDate.getUser2());
		}
	}

	// get date
	@Override
	public CrushDate getDate(int user1, int user2) {
		String sql = "SELECT * FROM CRUSHDATE WHERE (user1=" + user1 + " and user2 = " + user2 +") or "
				+ "(user2=" + user1 + " and user1 = " + user2 +")";
		CrushDate date = jdbcTemplate.query(sql, new ResultSetExtractor<CrushDate>() {
			@Override
			public CrushDate extractData(ResultSet rs) throws SQLException, DataAccessException {
				if (rs.next()) {
					CrushDate date = new CrushDate();
					date.setUser1(rs.getInt("User1"));
					date.setUser2(rs.getInt("User2"));
					date.setMeetDate(rs.getString("MeetDate"));
					date.setMeetLocation(rs.getString("MeetLocation"));
					date.setMeetNote(rs.getString("MeetNote"));
					return date;
				}
				return null;
			}
		});
		return date;
	}
	
	//insert image
	public void insertImage(UserImage userImage){
		String sql = "SELECT 1 FROM USERIMAGE WHERE UserID=" + userImage.getUserID() ;
		int existImage = 0;
		existImage = jdbcTemplate.query(sql, new ResultSetExtractor<Integer>() {
			@Override
			public Integer extractData(ResultSet rs) throws SQLException, DataAccessException {
				if (rs.next()) {
					return 1;
				}
				return 0;
			}
		});
		if (existImage == 0){
			String sql1 = "INSERT INTO USERIMAGE (UserID, UserImageTitle, UserImage)"
					+ "VALUES (?, ?, ?)";
			jdbcTemplate.update(sql1, userImage.getUserID() , userImage.getFilename(),
					userImage.getFileData());
		} else if (existImage == 1){
			String sql1 = "UPDATE USERIMAGE SET  UserImageTitle = ?, UserImage = ? "
					+ "where UserID = ?";
					
			jdbcTemplate.update(sql1 , userImage.getFilename(),
					userImage.getFileData() , userImage.getUserID());
		}
	}
	
	//insert image
		public UserImage getImage(int userID){
			
			String sql = "SELECT * FROM USERIMAGE WHERE UserID=" + userID ;
			UserImage userImage = jdbcTemplate.query(sql, new ResultSetExtractor<UserImage>() {
				@Override
				public UserImage extractData(ResultSet rs) throws SQLException, DataAccessException {
					
					if (rs.next()) {
						
						UserImage userImage = new UserImage();
						userImage.setFilename(rs.getString("UserImageTitle"));
						userImage.setFileData(rs.getBytes("UserImage"));
						return userImage;
					}
					return null;
				}
			});
			return userImage;
			
		}
}
