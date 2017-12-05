package com.blog.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.blog.model.User;
import com.blog.service.UserService;

public class ShiroRealm extends AuthorizingRealm{
	@Autowired
	UserService userService;
	
	//用户授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		System.out.println("->>>>>>>this is 用户授权");
		
		String username = (String) principals.getPrimaryPrincipal();
		
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		
		try {
			authorizationInfo.setRoles(userService.selectRolesByUserName(username));
			System.out.println("此用户的roles："+userService.selectRolesByUserName(username));
			authorizationInfo.setStringPermissions(userService.selectPermissionByUserName(username));
			System.out.println("此用户的permissions"+userService.selectPermissionByUserName(username));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return authorizationInfo;
	}
	//用户认证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		// TODO Auto-generated method stub
		System.out.println("->>>>>>>this is 用户认证");
		SimpleAuthenticationInfo authenticationInfo = null;
		UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
		String username = usernamePasswordToken.getUsername();
		System.out.println("token的username:"+username);
		User user =  userService.selectUserByUsername(username);
		if(user!=null){
			System.out.println("数据库存在此用户");
			authenticationInfo = new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), this.getName());
			return authenticationInfo;
		}else{
			System.out.println("用户认证未查询到");
			throw new AuthenticationException();
		}
	}

}
