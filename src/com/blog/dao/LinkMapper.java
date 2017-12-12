package com.blog.dao;

import java.util.List;

import com.blog.model.Link;

public interface LinkMapper {
	//增加友情链接
	void addLink(Link link);
	//删除友情链接
	boolean deleteLink(int linkid);
	//修改友情链接
	boolean updateLink(Link link);
	//查找所有友情链接
	List<Link> findAll();
	//根据id查询link
	Link findById(int linkid);
}
