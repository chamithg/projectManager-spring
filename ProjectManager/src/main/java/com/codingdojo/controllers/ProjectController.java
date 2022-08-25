package com.codingdojo.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.models.Project;
import com.codingdojo.models.UserLogin;
import com.codingdojo.services.ProjectServices;

@Controller
public class ProjectController {
	
	
	@Autowired
	private ProjectServices projectServ;
	
	
	@GetMapping("/addProject")
	public String displayProjectCreate(@ModelAttribute("newProject") Project newProject) {
		return "newProject.jsp";
	}
	
	@PostMapping("/process/create")
	public String createProj(@Valid @ModelAttribute("newProject") Project newProject,
			BindingResult bindingResult,
			Model model) {

		Project createdProject = projectServ.createProject(newProject, bindingResult);
		
		if(bindingResult.hasErrors()) {	
			System.out.println("HEllow");
			return "newProject.jsp";
		}
		
		return "redirect:/home";
		

	}
	@GetMapping("/home")
	public String allProjects(Model model) {
		model.addAttribute("projects",projectServ.allProjects());
		return "home.jsp";
	}
	
}
