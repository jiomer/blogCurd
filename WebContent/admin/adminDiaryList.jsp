<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="adminHeader.jsp" %>
				
				<!-- bootstrap表格 -->
				<div class="container">
					<h1>${msg}</h1>
					<div class="row">
						<div class="col-md-22">
							<table class="table table-hover">
							  	<thead>			
									<tr class="danger">
										<th>#</th>
										<th>内容</th>
							      		<th>发布时间</th>
										<th>操作</th>
									</tr>
								</thead>
							<tbody>
								<c:forEach var="diarysInfo" items="${diarys.list}">
								<tr>
									<td>${diarysInfo.diaryid}</td>    
			                        <td>${diarysInfo.diary}</td>  
			                        <td>${diarysInfo.time}</td>  
			                        <td>  
			                        	<shiro:hasRole name="admin">
			                            <!-- <a href="${APP_PATH}/getBlog?id=${diarysInfo.diaryid}">编辑</a> -->  
			                            <a href="${APP_PATH}/admin/deleteDiaryById?diaryid=${diarysInfo.diaryid }">删除</a>  
			                        	</shiro:hasRole>
			                        </td>  
			                    </tr>
								</c:forEach>
							</tbody>
							</table>
						</div>	
					</div>
				<!-- 分页信息 -->
				<div class="row">
					<div class="col-md-6">
						当前<span class="label label-default">${diarys.pageNum }</span>页
						|总<span class="label label-default">${diarys.pages }</span>页
						|总<span class="label label-default">${diarys.total }</span>篇日记.	
					</div>
					<div class="col-md-6">
						<nav aria-label="Page navigation">
						  <ul class="pagination">
						  	<li><a href="${APP_PATH}/admin/admindiary?pn=1">首页</a></li>
						  	<c:if test="${diarys.hasPreviousPage}">
							    <li>
							      <a href="${APP_PATH}/admin/admindiary?pn=${diarys.pageNum-1}" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
						    </c:if>
						    <c:forEach items="${diarys.navigatepageNums}" var="navigatepageNums">
						    	<c:if test="${navigatepageNums==diarys.pageNum }">
						    		<li class="active"><a>${navigatepageNums }</a></li>
						    	</c:if>
						    	<c:if test="${navigatepageNums!=diarys.pageNum }">
						    		<li><a href="${APP_PATH}/admin/admindiary?pn=${navigatepageNums}">${navigatepageNums }</a></li>
						    	</c:if>
						    </c:forEach>
						    <c:if test="${diarys.hasNextPage}">
							    <li>
							      <a href="${APP_PATH}/admin/admindiary?pn=${diarys.pageNum+1}" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
						    </c:if>
						    <li><a href="${APP_PATH}/admin/admindiary?pn=${diarys.pages }">末页</a></li>
						  </ul>
						</nav>			
					</div>					
				</div>
				</div>				
			</div>
<%@include file="../footer.jsp" %>