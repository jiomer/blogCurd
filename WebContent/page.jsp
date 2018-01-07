<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title><c:out value="${blog.blogtitle}" /></title>
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
					<h2 class="s_title"><c:out value="${blog.blogtitle}" /></h2>
					<div class="views">
						<time>发布于:<c:out value="${blog.time}" /></time>- 
						<c:out value="${blog.blogid}" /> 次检阅
						<shiro:hasRole name="admin">
							<a href="${APP_PATH }/admin/getBlog?id=<c:out value="${blog.blogid}" />">编辑</a>
						</shiro:hasRole>
					</div>
				<article class="single">
	    			<div id="text">
	    				${blog.article}
	    			</div>
				</article>
				</section>
			</div>
<%@include file="footer.jsp" %>