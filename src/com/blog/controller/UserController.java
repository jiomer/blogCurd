package com.blog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blog.model.User;
import com.blog.service.UserService;
import com.blog.util.Functions;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	/**
	 * 检测是否已经登录
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/loginUser")
	public String loginForm(RedirectAttributes attributes){
		Subject subject = SecurityUtils.getSubject();
		if(subject.isAuthenticated()==false){
			return "login";
		}
		attributes.addFlashAttribute("msg", "登录成功");
		return "redirect:/success";
	}
	
	
	/**
	 * 用户注册
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/regist")
	public String addUser(User user,Model model){
		System.out.println("用户注册调用"+user.getUsername()+user.getPassword());
		List<User> userList = userService.selectUserByUsernameOfReg(user.getUsername());
		if(userList.size()==0){
			//设置Gravatar图片链接
			String gravatarImg = Functions.getGravatar(user.getEmail());
			//设置激活码code
			String code = Functions.getCode()+Functions.getCode();
			user.setGravatarImg(gravatarImg);
			user.setCode(code);
			user.setState(0);//默认为0,,激活为1
			userService.addUser(user);
			Functions.sendMail(user.getEmail(), code);
			model.addAttribute("msg","注册成功,激活邮件已经发送到您的邮箱请及时激活!");
			return "registSuccess";
		}else{
			model.addAttribute("msg","用户名存在，注册失败");
			return "register";
		}
	}
	/**
	 * 用户账号激活
	 * @param code
	 * @param model
	 * @return
	 */
	@RequestMapping("/activate")
	public String activateUser(@RequestParam("code") String code,
			Model model){
		User user =userService.findByCode(code);
		if(user!=null){
		    user.setState(1);
		    user.setCode(null);
		    if(userService.update(user)){
		    	model.addAttribute("msg","账号激活成功!");
		    	return "registSuccess";
		    }else{
		    	model.addAttribute("msg","账号激活失败!");
		    	return "registSuccess";
		    }
		}else{
			model.addAttribute("msg","账号激活码不存在!");
	    	return "registSuccess";
		}
	}
	
	/**
	 * 验证用户登录
	 * @param username
	 * @param password
	 * @param model
	 * @return
	 */
	@RequestMapping("/login")
	public String login(@PathParam("username") String username,
			@PathParam("password") String password,
			Model model,
			RedirectAttributes attributes){
		System.out.println("用户登录时调用:"+username+"--"+password);
		User user = userService.selectUserByUsername(username);
		if(user.getState()==1){
			Subject subject = SecurityUtils.getSubject();
			if(subject.isAuthenticated()==false){
				UsernamePasswordToken token = new UsernamePasswordToken(username, password);
				try {
					subject.login(token);
					System.out.println("登录成功");
					Session session = subject.getSession();
		            // 输出session
		            System.out.println("sessionId:" + session.getId() + ";sessionHost:" + session.getHost());
		            attributes.addFlashAttribute("msg", "登录成功");
		            
	//	            attributes.addFlashAttribute("username",username);
					return "redirect:/success";
				} catch (AuthenticationException ae) {
					// TODO: handle exception
					ae.printStackTrace();
					model.addAttribute("msg", "用户名或密码错误");
					return "login";
				}
			}else{
				return "/success";
			}
		}else{
			model.addAttribute("msg", "账号未激活");
			model.addAttribute("user",user);
			return "login";
		}
	}
	/**
	 * 获取所有用户列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/getAllUser")
	public String getAllUser(
			@RequestParam(value="pn",defaultValue="1")Integer pn,
			Model model){
		PageHelper.startPage(pn, 5);
		List<User> user = userService.findAll();
		PageInfo pageUser = new PageInfo(user);
		model.addAttribute("userList", pageUser);  
		return "/admin/allUser";
	}
	/**
	 * 编辑用户
	 * @param user
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/updateUser")
	public String updateUser(User user,
			Model model,
			RedirectAttributes attributes){
		String gravatarImg = Functions.getGravatar(user.getEmail());
		user.setGravatarImg(gravatarImg);
		if(userService.update(user)){
//			user = userService.findById(user.getId());
			//request.setAttribute("user", user);
//			model.addAttribute("user", user);
//			model.addAttribute("msg", "修改成功");
			attributes.addFlashAttribute("msg", "修改成功");
			return "redirect:/admin/getAllUser";
		}else {
			model.addAttribute("msg", "修改出错");
			return "error";
		}
	}
	/**
	 * 根据用户名查询单个用户
	 * @param username
	 * @return
	 */
	@RequestMapping("getInfoUser")
	public String getUserInfo(@RequestParam("name") String username,
			HttpServletRequest request,Model model){
		User user = userService.selectUserByUsername(username);
		request.setAttribute("user", user);
		model.addAttribute("user", user);
		return "/admin/infoUser";
	}
	
	/**
	 * 根据id查询单个用户
	 * @param id
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/getUser")
	public String getUser(@RequestParam("id") int id,HttpServletRequest request,Model model){
		User user = userService.findById(id);
		request.setAttribute("user", user);
		model.addAttribute("user", user);
		return "/admin/editUser";
	}
	/**
	 * 根据id删除用户
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/deleteUser")
	public String deleteUser(int id,RedirectAttributes attributes){
		if(userService.delete(id)){
//			model.addAttribute("msg", "删除成功");
			attributes.addFlashAttribute("msg", "删除成功");
			return "redirect:/admin/getAllUser";
//			return "/admin/allUser";
		}else{
			return "error";
		}
	}
	@RequestMapping("/success")
	public String success(Model model){
		return "/admin/adminWelcome";
	}
	@RequestMapping("/unauthorized")
	public String unauthorized(){
		return "unauthorized";
	}
	@RequestMapping("/loginout")
	public String loginout(){
		Subject subject = SecurityUtils.getSubject();
		if(subject.isAuthenticated()){
			subject.logout();
			System.out.println("登出成功");
		}
		return "redirect:login.jsp";
	}
}	
