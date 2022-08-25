package com.codingdojo.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.models.User;
import com.codingdojo.models.UserLogin;
import com.codingdojo.services.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userServ;
	
	@GetMapping("/")
	public String displayIndex(@ModelAttribute("newUser") User newUser, @ModelAttribute("loginAuth") UserLogin loginAuth) {
		return "index.jsp";
	}
	
	@PostMapping("/process/registration")
	public String regirsterUser(@Valid @ModelAttribute("newUser") User newUser,
			
			BindingResult bindingResult,
			Model model,
			HttpSession session) {
		
		User createdUser = userServ.registerUser(newUser,bindingResult);
		
		if(bindingResult.hasErrors()) {
			
			model.addAttribute("loginAuth", new UserLogin());
			
			
			return "index.jsp";
		}
		
		
		
		session.setAttribute("firstName", createdUser.getFirstName());
		session.setAttribute("lastName", createdUser.getLastName());
		session.setAttribute("useId", createdUser.getId());
		
		return "redirect:/home";
	}
	
	@PostMapping("/process/login")
	public String loginUser (@Valid @ModelAttribute("loginAuth") UserLogin loginAuth,
			BindingResult bindingResult,
			Model model,
			HttpSession session ) {
		
		User currentUser = userServ.loginUser(loginAuth, bindingResult);
		if(bindingResult.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}
		session.setAttribute("firstName", currentUser.getFirstName());
		session.setAttribute("lastName", currentUser.getLastName());
		session.setAttribute("useId", currentUser.getId());
		
		return "redirect:/home";
	}
	
	@GetMapping("/process/logout")
	public String logoutUser(HttpSession session) {
		session.setAttribute("firstName", null);
		session.setAttribute("lastName", null);
		session.setAttribute("useId", null);
		
		return "redirect:/";
	}
	

}
