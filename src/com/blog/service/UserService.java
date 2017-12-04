package com.blog.service;

import java.util.List;

import com.blog.model.User;

public interface UserService {
	//增加用户
	public void addUser(User user);
	//用户名和密码查询用户
	public User login(String username,String password);
	  
	//更新用户
    boolean update(User user); 
    //删除用户
    boolean delete(int id);    
    //根据id查询
    User findById(int id);  
    //查询所有用户
    List<User> findAll();  
}
