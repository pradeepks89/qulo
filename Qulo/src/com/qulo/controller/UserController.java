package com.qulo.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qulo.dao.CompatibilityQuestionDAO;
import com.qulo.dao.UserDAO;
import com.qulo.model.User;
import com.qulo.model.UserImage;

@Controller
public class UserController {

	@Autowired
    private UserDAO userDAO;
	
	@RequestMapping(value="/adminDelete")
	public ModelAndView blockUser(ModelAndView model, HttpServletRequest request) throws IOException{
	    
		int userID = Integer.parseInt(request.getParameter("userID"));
		String action = request.getParameter("action");
	    if(action.equals("b")){
	    	userDAO.delete(userID);
	    }else if (action.equals("e")){
	    	userDAO.enable(userID);
	    }
	    List<User> userList = userDAO.list();
   	 	model.addObject(userList);
   	 	model.setViewName("adminPage"); 
	    return model;
	}
	
	//list user. Used my admin rename to admin based mapping
	@RequestMapping(value="/userList")
	public ModelAndView listUser(ModelAndView model ) throws IOException{
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
    public ModelAndView userInfo(ModelAndView model, Principal principal , HttpServletRequest request,
    		HttpServletResponse response) throws UnsupportedEncodingException {
		if(request.isUserInRole("ROLE_USER")){
			// After user login successfully.
	        String userName = principal.getName();
	        System.out.println();

	        User user = userDAO.get(userName);
	        model.setViewName("userInfoPage");
	        model.addObject(user);
	        request.getSession().setAttribute("user", user);
	        addImage(model, response, user.getId());
        }else if(request.isUserInRole("ROLE_ADMIN")){
        	List<User> userList = userDAO.list();
        	 model.addObject(userList);
        	model.setViewName("adminPage"); 
        }
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
		
		@RequestMapping(value = "/userImageUpload" , method = RequestMethod.POST)
		public ModelAndView saveImage( HttpServletRequest request, @RequestParam CommonsMultipartFile[] fileUpload, 
				ModelAndView model, Principal principal, HttpServletResponse response) throws UnsupportedEncodingException {
			String userName = principal.getName();
		    User user = userDAO.get(userName);
			if (fileUpload != null && fileUpload.length > 0) {
	            for (CommonsMultipartFile aFile : fileUpload){
	                  
	                System.out.println("Saving file: " + aFile.getOriginalFilename());
	                 
	                UserImage userImage = new UserImage();
	                userImage.setUserID(user.getId());
	                userImage.setFilename(aFile.getOriginalFilename());
	                userImage.setFileData(aFile.getBytes());	                
	                userDAO.insertImage(userImage);          
	            }
	        }
			model.setViewName("userInfoPage");
	        model.addObject(user);
	        request.getSession().setAttribute("user", user);
	        addImage(model, response, user.getId());
			return model;
		}
		//Retrieve and add image
		public void addImage(ModelAndView model, HttpServletResponse response, int userID) throws UnsupportedEncodingException{
			response.setContentType("image/jpeg");
	        UserImage userImage = userDAO.getImage(userID);
	        if(userImage != null){
	        	byte[] encodeBase64 = Base64.getEncoder().encode(userImage.getFileData());
	        	String base64Encoded = new String(encodeBase64, "UTF-8");
	        	model.addObject("userImage", base64Encoded);
	        	String fileExt = userImage.getFilename();
	        	fileExt = fileExt.substring(fileExt.lastIndexOf(".")+1);
	        	model.addObject("userImageExt", fileExt);
	        }
			
		}
}
