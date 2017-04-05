package com.qulo.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import com.qulo.model.CompatibilityQuestion;

public class CompatibilityQuestionDAOImpl implements CompatibilityQuestionDAO {
	
	private JdbcTemplate jdbcTemplate;
	 
	public CompatibilityQuestionDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
	
	@Override
	public void update(CompatibilityQuestion compatibitlityQuestion, int userID){
		String sql = "UPDATE USER_COMPATIBILITY_ANSWERS SET Selection =? "
                + "WHERE UserID=? and QuestionID = ?";
    jdbcTemplate.update(sql, compatibitlityQuestion.getSelection() , userID, compatibitlityQuestion.getQuestionID() );
	}
	
	@Override
	public void insert(CompatibilityQuestion compatibitlityQuestion, int userID){
		String sql = "INSERT INTO USER_COMPATIBILITY_ANSWERS ( UserID, QuestionID, Selection ) "
                + "VALUES (?, ?, ?)";
    jdbcTemplate.update(sql, userID, compatibitlityQuestion.getQuestionID(), compatibitlityQuestion.getSelection());
	}
	
	@Override
    public List<CompatibilityQuestion> list(){
    	String sql = "SELECT * FROM qulo.COMPATIBITLITY_QUESTIONS";
    	
    	List<CompatibilityQuestion> listQuestion = jdbcTemplate.query(sql, new RowMapper<CompatibilityQuestion>() {
    		@Override
	        public CompatibilityQuestion mapRow(ResultSet rs, int rowNum) throws SQLException {
    			CompatibilityQuestion compQue = new CompatibilityQuestion();
    			
    			compQue.setQuestionID(rs.getString("ID"));
    			compQue.setQuestion(rs.getString("Question"));
    			compQue.setOptions(rs.getString("Options"));
    			return compQue;
    		}
    	});
    			
    			return listQuestion;
    	
    }
	
	@Override
	public void updateCompatibilityQuestionOver(int userID){
		String sql = "UPDATE USER SET CompatibilityQuestionsOver=?"
                + " WHERE UserID=?";
    jdbcTemplate.update(sql, 1, userID);
	}

}
