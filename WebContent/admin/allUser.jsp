<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="adminHeader.jsp" %>
				
				<!-- bootstrap表格 -->
				<div class="container">
					<h1>${requestScope.msg}</h1>
					<div class="row">
						<div class="col-md-22">
							<table class="table table-hover">
							  	<thead>			
									<tr>
										<th>id</th>
							      		<th>姓名</th>
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
			                        	<shiro:hasRole name="admin">
			                            <a href="${APP_PATH}/admin/getUser?id=${user.id}">编辑</a>  
			                            <a href="${APP_PATH}/admin/deleteUser?id=${user.id }">删除</a>  
			                        	</shiro:hasRole>
			                        </td>  
			                    </tr>
								</c:forEach>
								</c:if>	
							</tbody>
							</table>
						</div>	
					</div>
									<!-- 分页信息 -->
				<div class="row">
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
				</div>				
			</div>
<%@include file="../footer.jsp" %>