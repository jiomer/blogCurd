<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<!-- adminLefeSide start -->	
<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="${APP_PATH}/success">仪表盘</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="${APP_PATH}/admin/adminblog/">所有文章</a></li>
					<li><a href="${APP_PATH}/admin/writeblog.jsp">写文章</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="${APP_PATH }/admin/admindiary">所有日记</a></li>
					<li><a href="${APP_PATH }/admin/writediary.jsp">写日记</a></li>
				</ul>
				<shiro:hasRole name="admin">
				<ul class="nav nav-sidebar">
					<li><a href="${APP_PATH }/admin/getAllUser">管理用户</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="${APP_PATH }/admin/adminlink">管理链接</a></li>
				</ul>
				</shiro:hasRole>
			</div>	
<!-- adminLefeSide end -->			