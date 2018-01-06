package com.blog.controller;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blog.model.Link;
import com.blog.service.LinkService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class LinkController {
	@Autowired
	LinkService linkService;
	
	/**
	 * 首页信息页面获取api
	 * @return
	 */
	@RequestMapping(value="/getIndexLink",
			method=RequestMethod.POST,
			produces="application/json;charset=utf-8")
	public @ResponseBody String getIndexLink(){
		Map<String,Object> map = new HashMap<String, Object>();
		List<Link> links =  linkService.findAll();
		map.put("links", links);
		String result = new JSONObject(map).toString();
		return result;
	}
	
	/**
	 * 增加链接
	 * @param link
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/addlink")
	public String addLink(Link link,RedirectAttributes attributes){
		linkService.addLink(link);
		attributes.addFlashAttribute("msg","添加成功");
		return "redirect:/admin/adminlink";
	}
	
	/**
	 * 后台链接显示
	 * @param pn
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/adminlink")
	public String findAllLink(
				@RequestParam(value="pn",defaultValue="1") Integer pn,
				Model model
			){
		try {
			PageHelper.startPage(pn, 8);
			List<Link> links = linkService.findAll();
			PageInfo LinkInfo = new PageInfo(links);
			model.addAttribute("links", LinkInfo);
			return "/admin/adminLinkList";
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
	/**
	 * 删除链接
	 * @param attributes
	 * @param linkid
	 * @return
	 */
	@RequestMapping("/admin/deleteLinkById")
	public String deleteLink(RedirectAttributes attributes,
				@RequestParam("id") Integer linkid
			){
		linkService.deleteLink(linkid);
		attributes.addFlashAttribute("msg", "删除友链成功");
		return "redirect:/admin/adminlink";
	}
	/**
	 * 根据id查询链接
	 * @param linkid
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/getlink")
	public String getLink(@RequestParam("id") Integer linkid,Model model){
		System.out.println(linkid);
		Link link = linkService.findById(linkid);
		model.addAttribute("link", link);
		return "/admin/editLink";
	}
	/**
	 * 更新链接
	 * @param link
	 * @param model
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/admin/updateLink")
	public String updateLink(Link link,Model model,
			RedirectAttributes attributes
			){
		if(linkService.updateLink(link)){
			link = linkService.findById(link.getLinkid());
			model.addAttribute("link",link);
			attributes.addFlashAttribute("msg", "修改成功");
			return "redirect:/admin/adminlink";
		}
		return "error";
	}
}
