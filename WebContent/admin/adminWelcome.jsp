<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminHeader.jsp"%>
<%@ include file="adminLeftSider.jsp"%>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="jumbotron">
					<h1 style="text-align: center；">
						<shiro:hasRole name="admin">
							Welcome to[<shiro:principal />]
						</shiro:hasRole>
						<shiro:hasRole name="user">
							Welcome to[<shiro:principal />]
						</shiro:hasRole>
					</h1>
				</div>
				</div>	
<%@ include file="adminFooter.jsp"%>