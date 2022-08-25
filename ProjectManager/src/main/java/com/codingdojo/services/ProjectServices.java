package com.codingdojo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.models.Project;
import com.codingdojo.repositories.ProjectRepository;



@Service
public class ProjectServices {
	
	@Autowired
	private ProjectRepository projRepo;
	

    // returns all 
    public List<Project> allProjects() {
        return projRepo.findAll();
    }
    // creates 
    public  Project createProject(Project project, BindingResult bindingResult) {
    	
    	if(bindingResult.hasErrors()) {
    		return null;
    	}
		
        return projRepo.save(project);
    }
    // retrieves single item
    public Project findProject(Long id) {
        Optional<Project> optionalProj = projRepo.findById(id);
        if(optionalProj.isPresent()) {
            return optionalProj.get();
        } else {
            return null;
        }
    }
    
    // update
    public Project updateExpense(Project project) {	
		return projRepo.save(project);
	}
    
    
    // delete
    public void deleteExpense(Long id) {
    	projRepo.deleteById(id); 	
    }

}
