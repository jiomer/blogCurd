<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminHeader.jsp"%>
<%@ include file="adminLeftSider.jsp"%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1>${msg}</h1>
				<h2 class="sub-header">所有文章</h2>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>标题</th>
							<th>发布时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="blogsInfo" items="${blogs.list}">
						<tr>
							<td>${blogsInfo.blogid}</td>
							<td>${blogsInfo.blogtitle}</td>
							<td>${blogsInfo.time}</td>
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
										<li><a href="${APP_PATH}/admin/getBlog?id=${blogsInfo.blogid}">编辑</a></li>
										<li><a href="${APP_PATH}/admin/deleteBlogById?blogid=${blogsInfo.blogid }">删除</a></li>
									</ul>
								</div>
								</shiro:hasRole>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 分页信息 -->
				<div class="col-md-6">
						当前<span class="label label-default">${blogs.pageNum }</span>页
						|总<span class="label label-default">${blogs.pages }</span>页
						|总<span class="label label-default">${blogs.total }</span>篇文章.	
				</div>
				<div class="col-md-6">
						<nav aria-label="Page navigation">
						  <ul class="pagination">
						  	<li><a href="${APP_PATH}/admin/adminblog?pn=1">首页</a></li>
						  	<c:if test="${blogs.hasPreviousPage}">
							    <li>
							      <a href="${APP_PATH}/admin/adminblog?pn=${blogs.pageNum-1}" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
						    </c:if>
						    <c:forEach items="${blogs.navigatepageNums}" var="navigatepageNums">
						    	<c:if test="${navigatepageNums==blogs.pageNum }">
						    		<li class="active"><a>${navigatepageNums }</a></li>
						    	</c:if>
						    	<c:if test="${navigatepageNums!=blogs.pageNum }">
						    		<li><a href="${APP_PATH}/admin/adminblog?pn=${navigatepageNums}">${navigatepageNums }</a></li>
						    	</c:if>
						    </c:forEach>
						    <c:if test="${blogs.hasNextPage}">
							    <li>
							      <a href="${APP_PATH}/admin/adminblog?pn=${blogs.pageNum+1}" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
						    </c:if>
						    <li><a href="${APP_PATH}/admin/adminblog?pn=${blogs.pages }">末页</a></li>
						  </ul>
						</nav>			
					</div>	
			</div>
<%@ include file="adminFooter.jsp"%>