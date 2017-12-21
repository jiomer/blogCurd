<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminHeader.jsp"%>
<%@ include file="adminLeftSider.jsp"%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1>${msg}</h1>
				<h2 class="sub-header">所有用户</h2>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>姓名</th>
							<th>权限/分组</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
							<c:if test="${!empty userList}">
								<c:forEach var="user" items="${userList.list}">
								<tr>  
			                        <td>${user.id}</td>  
			                        <td>${user.username}</td>
			                        <td>
			                        	<c:if test="${user.roleid==1}">
			                        		管理员
			                        	</c:if>
			                        	<c:if test="${user.roleid==2}">
			                        		用户
			                        	</c:if>
			                        </td>
			                        <td>
				                        <shiro:hasRole name="admin">
				                        <div class="btn-group">
											<button type="button"
												class="btn btn-sm btn-default dropdown-toggle"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												操作 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu">
												<li><a href="${APP_PATH}/admin/getUser?id=${user.id}">编辑</a></li>
												<li><a href="${APP_PATH}/admin/deleteUser?id=${user.id }">删除</a></li>
											</ul>
										</div>
				                        </shiro:hasRole>
			                        </td>
			                    </tr>
			           </c:forEach>
								</c:if>	               
					</tbody>
				</table>
				<!-- 分页信息 -->
				<div class="col-md-6">
						当前<span class="label label-default">${userList.pageNum }</span>页
						|总<span class="label label-default">${userList.pages }</span>页
						|有<span class="label label-default">${userList.total }</span>位用户.			
				</div>
				<div class="col-md-6">
						<nav aria-label="Page navigation">
						  <ul class="pagination">
						  	<li><a href="${APP_PATH}/admin/getAllUser?pn=1">首页</a></li>
						  	<c:if test="${userList.hasPreviousPage}">
							    <li>
							      <a href="${APP_PATH}/admin/getAllUser?pn=${userList.pageNum-1}" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
						    </c:if>
						    <c:forEach items="${userList.navigatepageNums}" var="navigatepageNums">
						    	<c:if test="${navigatepageNums==userList.pageNum }">
						    		<li class="active"><a>${navigatepageNums }</a></li>
						    	</c:if>
						    	<c:if test="${navigatepageNums!=userList.pageNum }">
						    		<li><a href="${APP_PATH}/admin/getAllUser?pn=${navigatepageNums}">${navigatepageNums }</a></li>
						    	</c:if>
						    </c:forEach>
						    <c:if test="${userList.hasNextPage}">
							    <li>
							      <a href="${APP_PATH}/admin/getAllUser?pn=${userList.pageNum+1}" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
						    </c:if>
						    <li><a href="${APP_PATH}/admin/getAllUser?pn=${userList.pages }">末页</a></li>
						  </ul>
						</nav>			
					</div>			
			</div>
<%@ include file="adminFooter.jsp"%>