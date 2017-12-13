package com.blog.model;

public class User {
	private int id;
	private String username;
	private String password;
	private String email;
	private String gravatarImg;
	private int roleid;
	
	public int getRoleid() {
		return roleid;
	}
	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGravatarImg() {
		return gravatarImg;
	}
	public void setGravatarImg(String gravatarImg) {
		this.gravatarImg = gravatarImg;
	}
}
