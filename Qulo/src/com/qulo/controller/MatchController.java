package com.qulo.controller;

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
import com.qulo.model.CrushDate;
import com.qulo.model.MatchList;
import com.qulo.model.User;

@Controller
public class MatchController {

	@Autowired
    private UserDAO userDAO;
	
	@RequestMapping(value = "/userMatchList" , method = RequestMethod.POST)
	public ModelAndView matchList(ModelAndView model , Principal principal, HttpServletRequest request) throws IOException {
		String userName = principal.getName();
		User user = userDAO.get(userName);
		if(request.getParameter("crush") != null){
			int userID = user.getId();
			int crushID = Integer.parseInt(request.getParameter("crush"));
			if(request.getParameter("action").equals("add")){
				userDAO.addToCrush(userID, crushID);
				model.addObject("addSuccess", 1);
				model.addObject("crushName", request.getParameter("crushName"));
			}else if(request.getParameter("action").equals("remove")){
				userDAO.removeFromCrush(userID, crushID);
				model.addObject("removeSuccess", 1);
				model.addObject("crushName", request.getParameter("crushName"));
			}
			
		}
		
		MatchList matchList = new MatchList();
		matchList.setUserMatchList(userDAO.getMatchList( user.getId(), user.getDisplayName(), user.getLookingFor(), user.getScore()));
		model.addObject(matchList);
		model.setViewName("matchList");
		
		return model;
	}
	
	@RequestMapping(value = "/userCrushList")
	public ModelAndView crushList(ModelAndView model , Principal principal, HttpServletRequest request) throws IOException {
		String userName = principal.getName();
		User user = userDAO.get(userName);
		model.addObject("loggedInUser", user);
		if(request.getParameter("crush") != null){
			int userID = user.getId();
			int crushID = Integer.parseInt(request.getParameter("crush"));
			if(request.getParameter("action").equals("add")){
				userDAO.addToCrush(userID, crushID);
			}else if(request.getParameter("action").equals("remove")){
				userDAO.removeFromCrush(userID, crushID);
				model.addObject("removeSuccess", 1);
				model.addObject("crushName", request.getParameter("crushName"));
			}
			
		}
		
		MatchList matchList = new MatchList();
		matchList.setUserMatchList(userDAO.getMatchList( user.getId(), user.getDisplayName(), user.getLookingFor(), user.getScore()));
		model.addObject(matchList);
		model.setViewName("crushList");
		
		return model;
	}
	
	@RequestMapping(value = "/userBookDate")
	public ModelAndView bookDate(@ModelAttribute CrushDate crushDate, ModelAndView model , Principal principal, HttpServletRequest request) throws IOException {
		String userName = principal.getName();
		User user = userDAO.get(userName);
		model.addObject("loggedInUser", user);
		model.addObject("crushName", request.getParameter("crushName"));
		int user1 = Integer.parseInt(request.getParameter("user1"));
		int user2 = Integer.parseInt(request.getParameter("user2"));
		
		if(request.getParameter("action") != null){
			
			String action = request.getParameter("action");
			userDAO.saveOrUpdateDate(crushDate, action);
			MatchList matchList = new MatchList();
			matchList.setUserMatchList(userDAO.getMatchList( user.getId(), user.getDisplayName(), user.getLookingFor(), user.getScore()));
			model.addObject(matchList);
			model.setViewName("crushList");
			model.addObject("dateSuccess",1);
		}else{
			model.addObject("user1", user1);
			model.addObject("user2", user2);
			crushDate = userDAO.getDate(user1, user2);
			if(crushDate == null){
				crushDate = new CrushDate();
			}
			model.addObject(crushDate);
			model.setViewName("bookDate");
		}
		
		return model;
	}
	

}
