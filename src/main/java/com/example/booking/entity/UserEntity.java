package com.example.booking.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
@Entity
public class UserEntity {
	@Id
	private String email ;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	private String gender;
	private String location;
	private String name;
	private String password;
	private String userType;
	@Override
	public String toString() {
		return "User [email=" + email + ", name=" + name + ", gender=" + gender + ", location=" + location
				+ ", password=" + password + ", userType=" + userType + "]";
	}
	public UserEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserEntity(String email, String gender, String location, String name, String password, String userType) {
		super();
		this.email = email;
		this.gender = gender;
		this.location = location;
		this.name = name;
		this.password = password;
		this.userType = userType;
	}



}
