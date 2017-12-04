<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="adminHeader.jsp" %>
				<div class="main">
					<h1 style="text-align: center;margin:300px 0;">Welcome to[${requestScope.username}],${requestScope.msg}</h1>
				</div>	
<%@include file="../footer.jsp" %>