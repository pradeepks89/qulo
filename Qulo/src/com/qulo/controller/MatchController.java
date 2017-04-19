package com.qulo.controller;

import java.io.IOException;
import java.security.Principal;
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
import com.qulo.model.MatchList;
import com.qulo.model.User;

@Controller
public class MatchController {

	@Autowired
    private UserDAO userDAO;
	
	@RequestMapping(value = "/userMatchList")
	public ModelAndView listQuestion(ModelAndView model , Principal principal) throws IOException {
		String userName = principal.getName();
		User user = userDAO.get(userName);
		
		MatchList matchList = new MatchList();
		matchList.setMatchList(userDAO.userMatchList(user.getDisplayName(), user.getLookingFor(), user.getScore()));
		model.addObject("matchList", matchList);
		model.setViewName("matchList");

		return model;
	}
}
