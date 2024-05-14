package com.codingdojo.scratchpost.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.scratchpost.models.Post;

public interface PostRepository extends CrudRepository<Post, Long> {
	
	List<Post> findAll();

}
