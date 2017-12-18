package com.blog.dao;

import java.util.List;
import java.util.Set;

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
    //根据code查询user
    User findByCode(String code);
    //查询所有用户
    List<User> findAll();  
    //根据用户名查找用户
    User selectUserByUsername(String userName);
    List<User> selectUserByUsernameOfReg(String userName);
    //根据用户名查找角色
    Set<String> selectRolesByUserName(String userName);
    //根据用户名查找权限
    Set<String> selectPermissionByUserName(String userName);
}
