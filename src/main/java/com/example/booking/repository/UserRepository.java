package com.example.booking.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.booking.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity,String>{

}






