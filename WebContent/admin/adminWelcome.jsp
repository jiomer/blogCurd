<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="adminHeader.jsp" %>
				<div class="main">
					<h1 style="text-align: center;margin:300px 0;">
						<shiro:hasRole name="admin">
							Welcome to[<shiro:principal />],${msg}
							<span class="label label-info"><a href="${APP_PATH}/loginout">点击登出</a></span>
						</shiro:hasRole>
						<shiro:hasRole name="user">
							Welcome to[<shiro:principal />],${msg}
							<span class="label label-info"><a href="${APP_PATH}/loginout">点击登出</a></span>
						</shiro:hasRole>
					</h1>
				</div>	
<%@include file="../footer.jsp" %>