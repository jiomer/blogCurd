<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>about页面</title>
		<link type="image/vnd.microsoft.icon" href="${APP_PATH }/static/img/favicon.png" rel="shortcut icon">
		<link rel="stylesheet" href="${APP_PATH }/static/css/style.css"/>
		<script type="text/javascript" src="${APP_PATH }/static/js/top.min.js"></script>
		<script type="text/javascript" src="${APP_PATH }/static/js/top.js"></script>
		<script type="text/javascript" src="${APP_PATH }/static/js/jquery.1.4.2.min.js"></script>
	</head>
	<body>
		<div class="bodycontent">
			<div id="midd">
				<header class="header"><!--页头 -->
					<div class="logonav">
						<div class="logo">
							<div class="logogravatar">
								<a href="${APP_PATH }" title="SunLife">
									<div class="blogname">Sun<span class="names">Life</span></div>
								</a>
							</div>
						</div>
						<nav id="top-nav" class="winfo">
							<ul>
								<li><a href="${APP_PATH }">首页</a></li>
								<li><a href="${APP_PATH }/selectAllDiary">日记</a></li>
								<li><a href="${APP_PATH }/about.jsp">关于</a></li>
								<li><a href="${APP_PATH }/loginUser">登录</a></li>
								<li><a href="${APP_PATH }/register.jsp">注册</a></li>
							</ul>
						</nav>
					</div>
				</header>
				<div class="clear"></div>
				<section class="blockGroup">
					<h2 class="s_title">about</h2>
					<div class="views">
						<time>发布于:2017-11-05</time>- 1 次检阅
					</div>
					<article class="single">	
						<h3>简介</h3>
						<p>基于spring+springmvc+mybatis+mysql制作的个人博客</p>
						<p>这个个人博客主要功能有写博客文章和日记，浏览博客与日记</p>
						<h3>运用知识点</h3>
						<ul>
							<li>spring mvc</li>
							<li>spring</li>
							<li>mybatis</li>
							<li>css/js</li>
							<li>jquery</li>
						</ul>
						<h3>运行环境</h3>
						<ul>
							<li>Eclipse</li>
							<li>Mysql</li>
							<li>ssm框架所需要的jar包</li>
							<li>ckeditor编辑器</li>
							<li>Tomcat服务器</li>
						</ul>
					</article>
				</section>
			</div>
			<%@include file="footer.jsp" %>