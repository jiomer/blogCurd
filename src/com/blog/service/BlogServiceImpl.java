package com.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.dao.BlogMapper;
import com.blog.model.Blog;
@Service
public class BlogServiceImpl implements BlogService{
	@Autowired
	BlogMapper blogMapper;

	@Override
	public void writeBlog(Blog blog) {
		// TODO Auto-generated method stub
		System.out.println(blog.getArticle());
		blogMapper.writeBlog(blog);
	}

	@Override
	public List<Blog> selectAllBlog() {
		// TODO Auto-generated method stub
		List<Blog> blogs = this.blogMapper.selectAllBlog();
		return blogs;
	}

	@Override
	public List<Blog> selectBlogById(int blogid) {
		// TODO Auto-generated method stub
		List<Blog> blogs = this.blogMapper.selectBlogById(blogid);
		return blogs;
	}

	@Override
	public void deleteBlogById(int blogid) {
		// TODO Auto-generated method stub
		blogMapper.deleteBlogById(blogid);
	}

	@Override
	public boolean updateBlog(Blog blog) {
		// TODO Auto-generated method stub
		return blogMapper.updateBlog(blog);
	}

	@Override
	public Blog findById(int blogid) {
		// TODO Auto-generated method stub
		Blog blog = blogMapper.findById(blogid);
		return blog;
	}

}
