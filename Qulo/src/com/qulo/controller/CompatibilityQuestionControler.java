package com.qulo.controller;
/*
	This controller is used to fetch compability questions from the databse and also to save the answers back to the database once the user answers it 
*/
import java.io.IOException;
import java.security.Principal;

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
import com.qulo.model.MatchList;
import com.qulo.model.User;

@Controller
public class CompatibilityQuestionControler {

	@Autowired
	private CompatibilityQuestionDAO compDAO;

	@Autowired
	private UserDAO userDAO;

	@RequestMapping(value = "/userCompatibility")
	public ModelAndView listQuestion(ModelAndView model, Principal principal,
			HttpServletRequest request) throws IOException {

		CompatibilityQuestionList compQueList = new CompatibilityQuestionList();
		compQueList.setCompatibilityQuestion(compDAO.list());
		model.addObject("compQueList", compQueList);
		model.setViewName("compatibilityQuestion");
		String userName = principal.getName();
		User user = userDAO.get(userName);
		if(user.getCompatibilityQuestionsOver() == 1){
			MatchList matchList = new MatchList();
			matchList.setUserMatchList(userDAO.getMatchList( user.getId(), user.getDisplayName(), user.getLookingFor(), user.getScore()));
			model.addObject(matchList);
			request.getSession().setAttribute("user", user);
			model.setViewName("matchList");
		}
		return model;
	}

	@RequestMapping(value = "/userCompatibilitySave", method = RequestMethod.POST)
	public ModelAndView saveQuestion(@ModelAttribute("compQueList") CompatibilityQuestionList compQueList,
			BindingResult bindResult, ModelAndView model, Principal principal) throws IOException {

		String userName = principal.getName();
		User user = userDAO.get(userName);

		if (0 == user.getCompatibilityQuestionsOver()) {

			System.out.println("1111");
			for (CompatibilityQuestion compQuestion : compQueList.getCompatibilityQuestion()) {
				compDAO.insert(compQuestion, user.getId());
				compDAO.updateCompatibilityQuestionOver(user.getId());
			}
		} else {
			for (CompatibilityQuestion compQuestion : compQueList.getCompatibilityQuestion()) {
				compDAO.update(compQuestion, user.getId());

			}
		}
		user = userDAO.get(userName);
		model.addObject(user);
		model.setViewName("userInfoPage");
		
		return model;
	}

}
