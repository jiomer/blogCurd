<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminHeader.jsp"%>
<%@ include file="adminLeftSider.jsp"%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<!-- 导入css/js -->
				<script type="text/javascript" charset="utf-8" 
				src="${APP_PATH }/static/ckeditor/ckeditor.js"></script>
				<form action="${APP_PATH}/admin/updateBlog" method="post">
					<div class="table-responsive">
						<h2 class="sub-header">编辑文章</h2>
						<div class="col-md-10">
							<input type="hidden" name="blogid" value="${blog.blogid }"/>
							<input type="text" class="form-control" name="blogtitle" id="title" placeholder="在此输入文章标题" value="${blog.blogtitle}" />
							<textarea id="article" name="article">${blog.article}</textarea>
							<script type="text/javascript">
								CKEDITOR.replace("article");
							</script>
						</div>
						<div class="col-md-2">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">发布选项</h3>
								</div>
								<div class="panel-body">
									<div class="form-group status">
										<p>文章状态</p>
										<label class="radio-inline"> 
											<input type="radio" name="status" value="1" checked=""> 发布
										</label>
										<label class="radio-inline"> 
											<input type="radio" name="status" value="0"> 草稿
										</label> 
									</div>
									<button class="btn btn-primary">提交</button>
									<div class="btn btn-default draft">保存草稿</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		<%@ include file="adminFooter.jsp"%>