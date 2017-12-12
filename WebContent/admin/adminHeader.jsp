<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>所有用户</title>
		<link type="image/vnd.microsoft.icon" href="${APP_PATH }/static/img/favicon.png" rel="shortcut icon">
		<link rel="stylesheet" href="${APP_PATH }/static/css/style.css"/>
		<script type="text/javascript" src="${APP_PATH }/static/js/top.min.js"></script>
		<script type="text/javascript" src="${APP_PATH }/static/js/top.js"></script>
		<script type="text/javascript" src="${APP_PATH }/static/js/jquery.1.4.2.min.js"></script>
		<!-- Bootstrap文件 -->
		<link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css" >
		<script type="text/javascript" src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
		<!-- 
		<script type="text/javascript">  
		    function del(id){  
		        $.get("${APP_PATH}/deleteUser?id=" + id,function(data){  
		            if("success" == data.result){  
		                alert("删除成功");  
		                window.location.reload();  
		            }else{  
		                alert("删除失败");  
		            }  
		        });  
		    }  
		</script> 
		 -->
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
								<li><a href="${APP_PATH }/success">首页</a></li>
								<li><a href="${APP_PATH }/admin/writeblog.jsp">写文章</a></li>
								<li><a href="${APP_PATH }/admin/adminblog">管理文章</a></li>
								<li><a href="${APP_PATH }/admin/writediary.jsp">写日记</a></li>
								<shiro:hasPermission name="admin:*">
								<li><a href="${APP_PATH }/admin/admindiary">管理日记</a></li>
								<li><a href="${APP_PATH }/admin/getAllUser">管理用户</a></li>
								<li><a href="${APP_PATH }/admin/adminlink">管理链接</a></li>
								</shiro:hasPermission>
								<li><a href="${APP_PATH }/loginout">登出</a></li>
							</ul>
						</nav>
					</div>
				</header>
				<div class="clear"></div>