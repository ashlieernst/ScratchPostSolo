package com.codingdojo.scratchpost.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.scratchpost.models.User;



public interface UserRepository extends CrudRepository<User, Long> {
	
	Optional<User>findByEmail(String email);

}
