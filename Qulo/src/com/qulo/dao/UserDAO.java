package com.qulo.dao;

import java.util.List;

import com.qulo.model.CrushDate;
import com.qulo.model.User;
import com.qulo.model.UserImage;

public interface UserDAO {

	public void saveOrUpdate(User user);
    
    public void delete(int userId);
     
    public User get(String displayName);
     
    public List<User> list();
    
    public List<User> getMatchList(int userID, String displayName, String lookingFor, int score);
    
    public void addToCrush( int userID, int crushID);
    
    public void removeFromCrush( int userID, int crushID);
    
    public void saveOrUpdateDate(CrushDate crushDate, String action);
    
    public CrushDate getDate(int user1, int user2);
    
    public void insertImage( UserImage userImage);
    
    public UserImage getImage(int userID);
    
    public void enable(int userId);
}


