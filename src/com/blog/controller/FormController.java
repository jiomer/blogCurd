package com.blog.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.model.User;
import com.blog.service.UserService;
import com.blog.util.Functions;
@Controller
public class FormController {
	@Autowired
	UserService userService;
	
	/**
	 * url请求
	 * @param formName
	 * @return
	 */
	@RequestMapping("/{formName}")
	public String loginForm(@PathVariable String formName){
		return formName;
	}
	
	/**
	 * 获取ip的api
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getIp")
	public @ResponseBody String getIp(HttpServletRequest request){
		return Functions.getIpAddr(request);
	}
	
	/**
	 * 重新发送激活邮件api
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/setReEmail",method=RequestMethod.POST)
	public @ResponseBody String setReEmail(@RequestParam("id") int id){
		User user = userService.findById(id);
		Functions.sendMail(user.getEmail(), user.getCode());
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("success", "ture");
		String result = new JSONObject(map).toString();
		return result;
	}
}	
