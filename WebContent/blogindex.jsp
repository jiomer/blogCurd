<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>SunLife</title>
		<link type="image/vnd.microsoft.icon" href="${APP_PATH }/static/img/favicon.png" rel="shortcut icon">
		<link rel="stylesheet" href="${APP_PATH }/static/css/style.css"/>
		<script type="text/javascript" src="${APP_PATH }/static/js/top.min.js"></script>
		<script type="text/javascript" src="${APP_PATH }/static/js/top.js"></script>
		<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.8.0/jquery.js"></script> 
		<script type="text/javascript">
		$(function() {
		    var elm = $('#author');
		    var startPos = $(elm).offset().top;
		    $.event.add(window, "scroll", function() {
		        var p = $(window).scrollTop();
		        $(elm).css('position',((p) > startPos) ? 'fixed' : 'static');
		        $(elm).css('top',((p) > startPos) ? '1em' : '');
		    });
		});
		</script>
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
				<div class="main"><!--文章列表-->
					<article>
						<section>
						<header class="crumbs">New Post 最新文章</header>
						<c:forEach items="${pageInfo.list }" var="blogs">
						<ul>
							<li class="main-item-left"></li>
							<li class="main-item-1"><a href="${APP_PATH }/selectBlogById?id=<c:out value="${blogs.blogid}"/>"><c:out value="${blogs.blogtitle}"/></a></li>
							<li class="main-item-2">发布时间：<c:out value="${blogs.time}"/><span class="pid">ID：<c:out value="${blogs.blogid}"/></span></li>
							<!-- <li class="main-item-3"><c:out value="${blogs.article}"/></li> -->
							<li class="main-item-4"><a href="${APP_PATH }/selectBlogById?id=<c:out value="${blogs.blogid}"/>"><i>阅读全文</i></a></li>
							<div class="clear"></div>	
							<li class="main-item-left"></li>
						</ul>
						</c:forEach>
						</section>
					</article>
					<aside>
						<section>
							<header class="aside-title">Links</header>
							<ul id="links">
							<!-- 
							<c:forEach items="${linkInfo}" var="links">
								<li class="aside-tag"><a href='<c:out value="${links.linkurl}"></c:out>' target="_blank"><c:out value="${links.linkname}"></c:out></a></li>
							</c:forEach>
							 -->
							</ul>
						</section>
						<div class="clear"></div>
						<section id="author">
							<header class="aside-title">Author</header>
							<div class="about-me">
								<div class="profile">
									<div class="info">
										<h1>SunLife<span class="born">Born in：2017-2-28</span></h1>
							            <p>Guoliangjun Design</p>
							            <p>&copy; 2017 记忆角落</p>
									</div>
								</div>
							</div>
						</section>
					</aside>
				</div>
			</div>
			<div class="clear"></div>
			<nav class="navigator">
				<c:if test="${pageInfo.hasPreviousPage}">
					<a href="${APP_PATH }/page/${pageInfo.pageNum-1}">Previous page</a>
				</c:if>
				<c:if test="${pageInfo.hasNextPage}">
					<a href="${APP_PATH }/page/${pageInfo.pageNum+1}">Next page</a>
				</c:if>
			</nav>
<%@include file="footer.jsp" %>
<script>
	$(document).ready(function(){
		getIndexLink();
		function getIndexLink(){
			$.ajax({
				url:"${APP_PATH }/getIndexLink",
				type:"POST",
				success:function(data){
					linksInfo(data);
				}
			});
		}
		function linksInfo(data){
			<!--
			var obj = $.parseJSON(data);
			-->
			var links = data.links;
			var html = "";
			$.each(links,function(i,val){
				html +=
					'<li class="aside-tag">'+
					'<a href="'+val.linkurl+'" target="_blank">'+val.linkname+'</a>'+
					'</li>';
			});
			$("#links").append(html);
		}
	});
</script>