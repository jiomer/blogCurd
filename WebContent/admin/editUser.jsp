<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminHeader.jsp"%>
<%@ include file="adminLeftSider.jsp"%>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h3 style="text-align: center;padding: 30px 0;">用户信息</h3>
				<p>
					带<span style="color: red">*</span>为必填项,已用<span>*</span>标注,未满18岁请监护人帮忙完成注册！
				</p>
					<form action="${APP_PATH}/admin/updateUser" method="post" >
					  <input type="hidden" name="id" value="${user.id }"/>
					  <div class="form-group">
					    <label for="username">您的登录名(不可更改)<span style="color: red">*</span></label>
					    <input type="text" class="form-control" id="username" name="username" placeholder="username" readonly value="${user.username }">
					  </div>
					  <div class="form-group">
					    <label for="password">登录密码<span style="color: red">*</span></label>
					    <input type="password" class="form-control" id="password" name="password" placeholder="password" value="${user.password}">
					  </div>
					  <div class="form-group">
					    <label for="password">邮箱<span style="color: red">*</span></label>
					    <input type="email" class="form-control" id="email" name="email" placeholder="email" value="${user.email}">
					  </div>
					  <button type="submit" class="btn btn-default" style="margin-left: 500px;">Submit</button>
					</form>
				</div>
<%@ include file="adminFooter.jsp"%>