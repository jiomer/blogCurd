<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sunlife后台管理</title>
<link type="image/vnd.microsoft.icon"
	href="${APP_PATH }/static/img/favicon.png" rel="shortcut icon">
<link rel="stylesheet"
	href="${APP_PATH}/static/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${APP_PATH}/static/css/dashboard.css">
<link rel="stylesheet" href="${APP_PATH}/static/css/common.css">
<script src="${APP_PATH}/static/js/jquery.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${APP_PATH}">Sunlife</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${APP_PATH}">首页</a></li>
					<li><a href="${APP_PATH}/getInfoUser?name=<shiro:principal />">个人信息</a></li>
					<li><a href="${APP_PATH}/loginout">退出</a></li>
				</ul>
			</div>
		</div>
	</nav>
<!-- adminHeader end -->	