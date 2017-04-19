package com.qulo.dao;

import java.util.List;
import com.qulo.model.User;

public interface UserDAO {

	public void saveOrUpdate(User user);
    
    public void delete(int userId);
     
    public User get(String displayName);
     
    public List<User> list();
    
    public List<User> userMatchList(String displayName, String lookingFor, int score);
}


