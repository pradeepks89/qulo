package com.qulo.dao;

import java.util.List;


import com.qulo.model.CompatibilityQuestion;;

public interface CompatibilityQuestionDAO {
	
	public void insert(CompatibilityQuestion compatibitlityQuestion, int userID);
	
	public void update(CompatibilityQuestion compatibitlityQuestion, int userID);
     
    public List<CompatibilityQuestion> list();
    
    public void updateCompatibilityQuestionOver(int userID);
}
