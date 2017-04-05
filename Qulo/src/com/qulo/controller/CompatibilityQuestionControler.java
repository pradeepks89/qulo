package com.qulo.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.qulo.dao.CompatibilityQuestionDAO;
import com.qulo.dao.UserDAO;
import com.qulo.model.CompatibilityQuestion;
import com.qulo.model.CompatibilityQuestionList;
import com.qulo.model.User;

@Controller
public class CompatibilityQuestionControler {

	@Autowired
    private CompatibilityQuestionDAO compDAO;
	
	@Autowired
    private UserDAO userDAO;
	
	@RequestMapping(value="/userCompatibility")
	public ModelAndView listQuestion(ModelAndView model) throws IOException{
		
		
		CompatibilityQuestionList compQueList = new CompatibilityQuestionList();
		compQueList.setCompatibilityQuestion(compDAO.list());
		model.addObject("compQueList", compQueList);
	    model.setViewName("compatibilityQuestion");
		
		return model;
	}
	
	@RequestMapping(value="/userCompatibilitySave", method = RequestMethod.POST)
	public ModelAndView saveQuestion(@ModelAttribute("compQueList") CompatibilityQuestionList compQueList, BindingResult bindResult
			,ModelAndView model, Principal principal) throws IOException{
		
		String userName = principal.getName();
		User user = userDAO.get(userName);
		
		if (0 == user.getCompatibilityQuestionsOver()){
			
			System.out.println("1111");
			for (CompatibilityQuestion compQuestion : compQueList.getCompatibilityQuestion()) {
				compDAO.insert(compQuestion, user.getId());
				compDAO.updateCompatibilityQuestionOver(user.getId());
			}
		}else{
			for (CompatibilityQuestion compQuestion : compQueList.getCompatibilityQuestion()) {
				compDAO.update(compQuestion, user.getId());
				
			}
		}
		
		model.setViewName("userInfoPage");
		return  model;
	}
	
}
