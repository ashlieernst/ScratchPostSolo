package com.codingdojo.scratchpost.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.scratchpost.models.Login;
import com.codingdojo.scratchpost.models.User;
import com.codingdojo.scratchpost.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	
	public User getUser(Long id) {
        Optional<User> optionalUser = userRepository.findById(id);
        if(optionalUser.isEmpty()) {
        	return null;
        } 
            
            return optionalUser.get();
        
			}

	public User register(User user, BindingResult result) {
	
	
	
	Optional<User> thisUser = userRepository.findByEmail(user.getEmail());
	if(thisUser.isPresent()) {
		
		result.rejectValue("email", "exists", "email is already in use");
		
	}
	
	if(!user.getPassword().equals((user.getConfirm()))) {
		result.rejectValue("confirm", "Matches", "Passwords must match");
		}
	
	if(result.hasErrors()) {
	
	return null;
		}
	
	String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
	
	user.setPassword(hashed);
	userRepository.save(user);
	
	return user;
}

public User login(Login login, BindingResult result) {
	
	Optional<User> thisUser = userRepository.findByEmail(login.getEmail());
	
	if(thisUser.isEmpty()) {
		result.rejectValue("email", "empty", "Email not found");
		return null;
		
	}
	
	User user = thisUser.get();
		if(!BCrypt.checkpw(login.getPassword(),user.getPassword())) {
		result.rejectValue("password", "Matches", "Invalid Password");
		
		}
	
		if(result.hasErrors()) {
	
			return null;
			}

	
			return user;
		}


}
