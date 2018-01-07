package com.blog.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blog.model.Blog;
import com.blog.service.BlogService;
import com.blog.util.Functions;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * @author glj
 * @
 */
@Controller
public class BlogController {
	@Autowired
	BlogService blogService;
		
		/**
		 * 存储博客信息
		 * @param blog
		 * @return
		 */
		@RequestMapping("/admin/writeBlog")
		public String writeBlog(Blog blog,RedirectAttributes attributes){
					String dateString = Functions.getNowTime();
					blog.setTime(dateString);
					this.blogService.writeBlog(blog);
					attributes.addFlashAttribute("msg", "添加文章成功");
					return "redirect:/admin/adminblog";
		}
		/**
		 * 默认显示第一页..
		 * @param pn
		 * @param model
		 * @return
		 */
		@RequestMapping("/page")
		public String index(
				@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,
				Model model
				){
			try {
				PageHelper.startPage(pageNum, 8);
				PageHelper.orderBy("blogid desc");//设置为倒叙
				List<Blog> blogs =blogService.selectAllBlog();
				PageInfo page = new PageInfo(blogs);
				model.addAttribute("pageInfo", page);
				return "blogindex";
			} catch (Exception e) {
				System.out.println(e);
				return null;
			}
		}
		/**
		 * 查找全博客，用于主页显示
		 * @param pageNum
		 * @param model
		 * @return
		 */
		@RequestMapping("/page/{pageNum}")
		public String index2(
				@PathVariable("pageNum") Integer pageNum,
				Model model
				){
			try {
				PageHelper.startPage(pageNum,8);
				PageHelper.orderBy("blogid desc");//设置为倒叙
				List<Blog> blogs =blogService.selectAllBlog();
				PageInfo page = new PageInfo(blogs);
				model.addAttribute("pageInfo", page);
				return "../blogindex";
			} catch (Exception e) {
				System.out.println(e);
				return null;
			}
		}
		
		
		/**
		 * 通过id查找博客，用于显示博客的正文
		 * @param request
		 * @return
		 */
		@RequestMapping("/selectBlogById")
		public String selectBlogById(@RequestParam("id") Integer blogid,Model model){
			try {
				List<Blog> blogs = new ArrayList<Blog>();
				blogs =  this.blogService.selectBlogById(blogid);
				//将查询结果返回
				model.addAttribute("blog", blogs.get(0));
				return "page";
			} catch (Exception e) {
				System.out.println(e);
				return null;
			}
		}
		/**
		 * 同样是查询所有博客信息，用于管理博客
		 * @param pn
		 * @param model
		 * @return
		 */
		@RequestMapping("/admin/adminblog")
		public String adminblog(
				@RequestParam(value="pn",defaultValue="1")Integer pn,
				Model model){
			try {
				PageHelper.startPage(pn, 8);
				PageHelper.orderBy("blogid desc");//设置为倒叙
				List<Blog> blogs = blogService.selectAllBlog();
				PageInfo page1 = new PageInfo(blogs);
				model.addAttribute("blogs", page1);
				return "/admin/adminPageList";
			} catch (Exception e) {
				System.out.println(e);
				return null;
			}
		}
		/**
		 * 删除博客信息
		 * @param request
		 * @return
		 */
		@RequestMapping("/admin/deleteBlogById")
		public String deleteBlogById(RedirectAttributes attributes,
				@RequestParam(value="blogid")Integer blogid
				){
			try {
//				String id = request.getParameter("blogid");
//				int blogid = Integer.parseInt(id);
				//调用删除
				this.blogService.deleteBlogById(blogid);
				attributes.addFlashAttribute("msg", "删除文章成功");
				return "redirect:/admin/adminblog";
			} catch (Exception e) {
				return null;	
			}
		}
		/**
		 * 更新文章
		 * @param blog
		 * @param model
		 * @param request
		 * @return
		 */
		@RequestMapping("/admin/updateBlog")
		public String updateBlog(Blog blog,Model model,
				HttpServletRequest request,
				RedirectAttributes attributes){
			if(blogService.updateBlog(blog)){
				blog = blogService.findById(blog.getBlogid());
				request.setAttribute("blog", blog);
				model.addAttribute("blog", blog);
//				model.addAttribute("msg", "修改成功");
				attributes.addFlashAttribute("msg", "修改文章成功");
				return "redirect:/admin/adminblog";
			}
			attributes.addAttribute("msg", "修改文章出错");
			return "error";
		}
		/**
		 * 更新文章所需要查找id的文章
		 * @param id
		 * @param request
		 * @param model
		 * @return
		 */
		@RequestMapping("/admin/getBlog")
		public String getBlog(@RequestParam("id")int id,HttpServletRequest request,Model model){
			Blog blog = blogService.findById(id);
			request.setAttribute("blog", blog);
			model.addAttribute("blog", blog);
			return "/admin/editBlog";
		}
}
