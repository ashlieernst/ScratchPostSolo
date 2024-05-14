package com.codingdojo.scratchpost.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import com.codingdojo.scratchpost.models.Login;
import com.codingdojo.scratchpost.models.Post;
import com.codingdojo.scratchpost.models.User;
import com.codingdojo.scratchpost.services.PostService;
import com.codingdojo.scratchpost.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {


	@Autowired
	private UserService userService;
	
	@Autowired
	private PostService postService;
	
	@GetMapping("/")
	public String index(Model model,
			@ModelAttribute("registerUser")User user,
			@ModelAttribute("loginUser") Login login
			) {
		return "index.jsp";
		
	}
	
	@GetMapping("/user/new")
	public String newUser(Model model, @ModelAttribute("registerUser")User user ) {
		return "newUser.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("registerUser") User user, 
			BindingResult result, Model model, HttpSession session) {
			
		User thisUser = userService.register(user, result);
		
		if(result.hasErrors()) {
			
			
			model.addAttribute("loginUser", new Login());
			return "newUser.jsp";
		}
		Long userId = thisUser.getId();
		session.setAttribute("userId", userId);
		session.setAttribute("userInfo", thisUser.getUserName());
		return "redirect:/home";
		
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("loginUser") Login login, 
			BindingResult result, Model model, HttpSession session) {
		
		 User thisUser = userService.login(login, result);
		
		if(result.hasErrors()) {
			model.addAttribute("registerUser", new User());
			return "index.jsp";
		}
		Long userId = thisUser.getId();
		session.setAttribute("userId", userId);
		session.setAttribute("userInfo", thisUser.getUserName());
		
		return "redirect:/home";
	}
	
	
	@GetMapping("/home") 
	public String home(Model model, HttpSession session) {
		
		
	
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		
		model.addAttribute("posts", postService.getAll());
		return "home.jsp";
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/posts/new") 
	public String newPost( @ModelAttribute("post") Post post, 
			 Model model, HttpSession session) {
		
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/"; 
		}
		return "newPost.jsp";
	}
	
	@PostMapping("/posts/create")
	public String createPost(@Valid@ModelAttribute("post") Post post, 
			BindingResult result, HttpSession session) {
		
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		
		 User user = userService.getUser(userId);
		
		if (result.hasErrors()) {
            return "newPost.jsp";
        } 
		 post.setUser(user);
            postService.createPost(post, result);
            
		return "redirect:/home";
		
	}
	
	
	@GetMapping("/posts/edit/{id}")
	public String editPost(@PathVariable("id")Long id, Model model, HttpSession session) {
		Post post = postService.getOnePost(id);
		model.addAttribute("post", post);
		
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		
		return "editPost.jsp";
	}
	
	
	@PutMapping("/posts/edit/{id}")
	public String editPost(@PathVariable("id")Long id, @Valid @ModelAttribute("post")Post post,
			BindingResult result,Model model, HttpSession session) {
		
		Long userId = (Long) session.getAttribute("userId");
		if(userId==null) {
			return "redirect:/";
		}
		
		User user =userService.getUser(userId);
		
		
		
		if(result.hasErrors()) {
			return "editPost.jsp";
			
		}
		post.setUser(user);
		postService.createPost(post,result);
		return "redirect:/home";
		
	}
	
	@DeleteMapping("/posts/delete/{id}")
	public String deletePost(@PathVariable("id")Long id,HttpSession session) {
		
		Long userId = (Long) session.getAttribute("userId");
		if(userId==null) {
			return "redirect:/";	
		}
		postService.deletePost(id);
		return "redirect:/home";
	}
}
