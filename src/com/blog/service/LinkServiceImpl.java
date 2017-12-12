package com.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.dao.LinkMapper;
import com.blog.model.Link;
@Service
public class LinkServiceImpl implements LinkService{
	@Autowired
	LinkMapper linkMapper;
	
	@Override
	public void addLink(Link link) {
		// TODO Auto-generated method stub
		linkMapper.addLink(link);
	}

	@Override
	public boolean deleteLink(int linkid) {
		// TODO Auto-generated method stub
		return linkMapper.deleteLink(linkid);
	}

	@Override
	public boolean updateLink(Link link) {
		// TODO Auto-generated method stub
		return linkMapper.updateLink(link);
	}

	@Override
	public List<Link> findAll() {
		// TODO Auto-generated method stub
		List<Link> findAllLinks =  linkMapper.findAll();
		return findAllLinks;
	}

	@Override
	public Link findById(int linkid) {
		// TODO Auto-generated method stub
		return linkMapper.findById(linkid);
	}

}
