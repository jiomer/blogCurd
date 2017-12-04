package com.blog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blog.model.User;

public interface UserMapper {
	//添加用户
	public void addUser(User user);
	//用户名和密码查询用户
	public User findUserByNameAndPwd(@Param("username") String username,
				@Param("password") String password);
	//更新用户
    boolean update(User user); 
    //删除用户
    boolean delete(int id);    
    //根据id查询
    User findById(int id);  
    //查询所有用户
    List<User> findAll();  
	
}
