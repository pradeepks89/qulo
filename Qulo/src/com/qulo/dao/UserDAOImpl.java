package com.qulo.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import com.qulo.model.CompatibilityQuestion;
import com.qulo.model.User;

public class UserDAOImpl implements UserDAO {

	private JdbcTemplate jdbcTemplate;

	public UserDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

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

	@Override
	public void delete(int userId) {
		String sql = "update USER set IsEnabled = 0 WHERE UserID=?";
		jdbcTemplate.update(sql, userId);
	}

	@Override
	public List<User> list() {
		String sql = "SELECT * FROM USER";
		List<User> listUser = jdbcTemplate.query(sql, new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User aUser = new User();

				aUser.setId(rs.getInt("UserID"));
				aUser.setDisplayName(rs.getString("DisplayName"));
				aUser.setPassword(rs.getString("Password"));

				return aUser;
			}

		});

		return listUser;
	}

	@Override
	public User get(String displayName) {
		String sql = "SELECT * FROM USER WHERE DisplayName='" + displayName + "'";
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

					return user;
				}

				return null;
			}

		});

		String sql1 = "select sum(SelfScore) from SCORE, USER_COMPATIBILITY_ANSWERS, USER"
				+ " where USER_COMPATIBILITY_ANSWERS.Selection = SCORE.Option and USER.UserID = USER_COMPATIBILITY_ANSWERS.UserID"
				+ " and USER.DisplayName ='" + displayName + "'";
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

	@Override
	    public List<User> userMatchList(String displayName, String lookingFor, int score){
	    	String sql = "select sum(SelfScore) from SCORE, USER_COMPATIBILITY_ANSWERS, USER"
	    				+" where USER_COMPATIBILITY_ANSWERS.Selection = SCORE.Option "
	    				+ "and USER.UserID = USER_COMPATIBILITY_ANSWERS.UserID" 
	    				+" and USER.Gender = '"+lookingFor+"'"
	    				+ " and USER.UserID = '"+displayName+"'" 
	    				+" group by USER.UserID"
	    				+" having sum(SelfScore) between "+( score - 1000 )+" and "+( score + 1000 );
	    	
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
	    			return user;
	    		}
	    	});
	    			
	    			return matchList;
	    	
	    }
}
