package com.codingdojo.scratchpost.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.scratchpost.models.Post;
import com.codingdojo.scratchpost.repositories.PostRepository;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	public List<Post> getAll() {
		return postRepository.findAll();
	}
	
	public Post createPost(Post post, BindingResult result) 
			{
		return postRepository.save(post);
	}
	
	public Post getOnePost(Long id) {
		Optional<Post>exists =postRepository.findById(id);
		
		if(exists.isEmpty()) {
		
			return null;
        }
		return exists.get();
		

	}
	
	public void deletePost(Long id) {
		postRepository.deleteById(id);
	}


}
