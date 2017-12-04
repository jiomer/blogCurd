package com.blog.dao;

import java.util.List;

import com.blog.model.Blog;


public interface BlogMapper {
	//增加文章
	void writeBlog(Blog blog);
	//查找全部文章
	List<Blog> selectAllBlog();
	//根据id查询
	List<Blog> selectBlogById(int blogid);
	//根据id查询
	Blog findById(int blogid);
	//删除文章
	void deleteBlogById(int blogid);
	//更新文章
	boolean updateBlog(Blog blog);
}
