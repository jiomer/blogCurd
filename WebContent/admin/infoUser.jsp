<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminHeader.jsp"%>
<%@ include file="adminLeftSider.jsp"%>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="text-align: center;">
					<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
						<h4 class="sub-header">个人信息</h4>
					</button>
					<div class="collapse" id="collapseExample">
					  <div class="well">
						<img src="${user.gravatarImg}" alt="userImg" class="img-circle">
						<hr />
						<p>您的登陆名：${user.username}</p>
						<p>您的邮箱：${user.email}</p>
					  </div>
					</div>
				</div>
<%@ include file="adminFooter.jsp"%>