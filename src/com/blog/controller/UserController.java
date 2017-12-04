package com.blog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blog.model.User;
import com.blog.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	/**
	 * 用户注册
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/regist")
	public String addUser(User user,Model model){
		System.out.println("用户注册调用"+user.getUsername()+user.getPassword());
		userService.addUser(user);
		model.addAttribute("msg","注册成功");
		return "registSuccess";
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
			Model model){
		System.out.println("用户登录时调用:"+username+"--"+password);
		User user = userService.login(username, password);
		if(user!=null){
			model.addAttribute("msg", "登录成功");
			model.addAttribute("username",username);
			return "/admin/adminWelcome";
		}else{
			model.addAttribute("msg", "「账号或者密码错误」");
			return "login";
		}
	}
	/**
	 * 获取所有用户列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/getAllUser")
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
	@RequestMapping("/updateUser")
	public String updateUser(User user,
			Model model,
			RedirectAttributes attributes){
		if(userService.update(user)){
			user = userService.findById(user.getId());
			//request.setAttribute("user", user);
			model.addAttribute("user", user);
//			model.addAttribute("msg", "修改成功");
			attributes.addFlashAttribute("msg", "修改成功");
			return "redirect:getAllUser";
		}else {
			model.addAttribute("msg", "修改出错");
			return "error";
		}
	}
	/**
	 * 根据id查询单个用户
	 * @param id
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/getUser")
	public String getUser(int id,HttpServletRequest request,Model model){
		User user = userService.findById((id));
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
	@RequestMapping("/deleteUser")
	public String deleteUser(int id,RedirectAttributes attributes){
		if(userService.delete(id)){
//			model.addAttribute("msg", "删除成功");
			attributes.addFlashAttribute("msg", "删除成功");
			return "redirect:getAllUser";
//			return "/admin/allUser";
		}else{
			return "error";
		}
	}
}	
