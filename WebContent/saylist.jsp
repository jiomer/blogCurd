<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>日记</title>
		<link type="image/vnd.microsoft.icon" href="${APP_PATH }/img/favicon.png" rel="shortcut icon">
		<link rel="stylesheet" href="${APP_PATH }/css/style.css"/>
		<script type="text/javascript" src="${APP_PATH }/js/top.min.js"></script>
		<script type="text/javascript" src="${APP_PATH }/js/top.js"></script>
		<script type="text/javascript" src="${APP_PATH }/js/jquery.1.4.2.min.js"></script>
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
								<li><a href="${APP_PATH }/login.jsp">登录</a></li>
								<li><a href="${APP_PATH }/register.jsp">注册</a></li>
							</ul>
						</nav>
					</div>
				</header>
				<div class="clear"></div>
				<section class="blockGroup">
					<div class="list-archive">
							<ul>
							<c:forEach items="${diarys.list}" var="diarys">
								<li class="archive-item">
									<time><c:out value="${diarys.time}"></c:out>:</time><c:out value="${diarys.diary}"></c:out><span class="pid">ID：<c:out value="${diarys.diaryid}"></c:out></span>
								</li>
							</c:forEach>	
							</ul>
					</div>
				</section>
			<nav class="navigator" style="text-align: center;padding-left: 0">
				<c:if test="${diarys.hasPreviousPage}">
					<a href="${APP_PATH }/selectAllDiary?pn=${diarys.pageNum-1}">Previous page</a>
				</c:if>
				<c:if test="${diarys.hasNextPage}">
					<a href="${APP_PATH }/selectAllDiary?pn=${diarys.pageNum+1}">Next page</a>
				</c:if>
			</nav>
<%@include file="footer.jsp" %>