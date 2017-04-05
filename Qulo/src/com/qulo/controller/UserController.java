package com.qulo.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.qulo.dao.UserDAO;
import com.qulo.model.User;

@Controller
public class UserController {

	@Autowired
    private UserDAO userDAO;
	
	//list user. Used my admin rename to admin based mapping
	@RequestMapping(value="/userList")
	public ModelAndView listUser(ModelAndView model) throws IOException{
	    List<User> listUser = userDAO.list();
	    model.addObject("listUser", listUser);
	    model.setViewName("userList");
	 
	    return model;
	}
	
	
	//Registering user for the first time. Send to registration page
	@RequestMapping(value = { "/", "/welcome", "/login" }, method = RequestMethod.GET)
	public ModelAndView newUser(ModelAndView model) {
	    User newUser = new User();
	    model.addObject("user", newUser);
	    model.setViewName("loginPage");
	    return model;
	}
	
	//Landing page
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
    public ModelAndView userInfo(ModelAndView model, Principal principal , HttpServletRequest request) {
 
        // After user login successfully.
        String userName = principal.getName();
        System.out.println("UserDAO Name: "+ userName);
        
        User newUser = userDAO.get(userName);
        model.setViewName("userInfoPage");
        request.getSession().setAttribute("user", newUser);
	    return model;
    }
	
	//Save user data and send to confirmation page
	@RequestMapping(value="/registerUser" , method = RequestMethod.POST)
	public ModelAndView registerUser(@ModelAttribute User user) throws IOException{
		userDAO.saveOrUpdate(user);
		ModelAndView model = new ModelAndView();
		model.addObject(user);
		model.setViewName("registerSuccessPage");
		return model;
	}
	
	//After logging in edit user profile
	@RequestMapping(value = "/userProfileEdit")
	public ModelAndView editUser(Principal principal, ModelAndView model) {
		String userName = principal.getName();
	    User user = userDAO.get(userName);
	    
	    model.setViewName("editProfile");
	    model.addObject("user", user);
	 
	    return model;
	}
	
	//After logging in save user profile
		@RequestMapping(value = "/userProfileSave" , method = RequestMethod.POST)
		public ModelAndView saveUser(@ModelAttribute User user, ModelAndView model) {
			
			userDAO.saveOrUpdate(user);
		    model.setViewName("userInfoPage");
		    model.addObject("user", user);
		 
		    return model;
		}
}
