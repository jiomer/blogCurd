package com.blog.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.dao.UserMapper;
import com.blog.model.User;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper; 
	
	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		userMapper.addUser(user);
	}

	@Override
	public User login(String username, String password) {
		// TODO Auto-generated method stub
		return userMapper.findUserByNameAndPwd(username, password);
	}

	@Override
	public boolean update(User user) {
		// TODO Auto-generated method stub
		return userMapper.update(user);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return userMapper.delete(id);
	}

	@Override
	public User findById(int id) {
		// TODO Auto-generated method stub
		User user = userMapper.findById(id);
		return user;
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		List<User> findAllList = userMapper.findAll();
		return findAllList;
	}

	@Override
	public User selectUserByUsername(String userName) {
		// TODO Auto-generated method stub
		return userMapper.selectUserByUsername(userName);
	}

	@Override
	public Set<String> selectRolesByUserName(String userName) {
		// TODO Auto-generated method stub
		return userMapper.selectRolesByUserName(userName);
	}

	@Override
	public Set<String> selectPermissionByUserName(String userName) {
		// TODO Auto-generated method stub
		return userMapper.selectPermissionByUserName(userName);
	}

}
