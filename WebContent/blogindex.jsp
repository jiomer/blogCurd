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
						<header class="crumbs">New Post 最新文章</header>
						<section id="pageInfo">
						</section>
					</article>
					<aside>
						<section>
							<header class="aside-title">Links</header>
							<ul id="links">
								
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
			</nav>
<%@include file="footer.jsp" %>
<script>
	$(document).ready(function(){
			to_page(1);
			function to_page(pn){
				$.ajax({
					url:"${APP_PATH }/selectAllBlog",
					data:{"pn":pn},
					type:"POST",
					success:function(data){
                    	articleInfo(data);
						navsInfo(data);
						linksInfo(data);
                    }
				})
			}
			//显示文章
			function articleInfo(data){
				$("#pageInfo").empty();
				var articles = data.page.list;
				var html = '';
				$.each(articles,function(i,val){
					html +=
					'<ul>'+
						'<li class="main-item-left"></li>'+
						'<li class="main-item-1"><a href="selectBlogById?id='+val.blogid+'">'+val.blogtitle+'</a></li>'+
						'<li class="main-item-2">发布时间：'+val.time+'<span class="pid">ID：'+val.blogid+'</span></li>'+
						'<li class="main-item-4"><a href="selectBlogById?blogid='+val.blogid+'"><i>阅读全文</i></a></li>'+
						'<div class="clear"></div>'+
						'<li class="main-item-left"></li>'+
					'</ul>';
				});
				$("#pageInfo").append(html);
			}
			//分页
			function navsInfo(data){
				$(".navigator").empty();
				var navInfo = data.page;
				if(navInfo.hasPreviousPage){
					var prePageLi = $("<a></a>").append("Previous page");
					prePageLi.click(function(){
						to_page(navInfo.pageNum-1);
					});
				}
				if(navInfo.hasNextPage){
					var nextPageLi = $("<a></a>").append("Next page");
					nextPageLi.click(function(){
						to_page(navInfo.pageNum+1);
					});
				}
				$(".navigator").append(prePageLi).append(nextPageLi);	
			}
			//友情链接
			function linksInfo(data){
				$("#links").empty();
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
		}
		);
	
</script>