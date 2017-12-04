<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="adminHeader.jsp" %>
				<div class="container">
				<h3 style="text-align: center;padding: 30px 0;">编辑用户</h3>
				<p>
					带<span>*</span>为必填项,已用<span>*</span>标注,未满18岁请监护人帮忙完成注册！
				</p>
					<form action="updateUser" method="post" >
					  <input type="hidden" name="id" value="${user.id }"/>
					  <div class="form-group">
					    <label for="username">您的登录名<span>*</span></label>
					    <input type="text" class="form-control" id="username" name="username" placeholder="username" value="${user.username }">
					  </div>
					  <div class="form-group">
					    <label for="password">登录密码<span>*</span></label>
					    <input type="password" class="form-control" id="password" name="password" placeholder="password" value="${user.password}">
					  </div>
					  <button type="submit" class="btn btn-default" style="margin-left: 500px;">Submit</button>
					</form>
				</div>
<%@include file="../footer.jsp" %>