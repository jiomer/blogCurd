<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="adminHeader.jsp" %>
				<!-- 导入css/js -->
				<script type="text/javascript" charset="utf-8" src="${APP_PATH }/static/ckeditor/ckeditor.js"></script>
				<section class="blockGroup">
					<h1>撰写新文章</h1>
					<form action="writeBlog" method="post">
					<p>标题 ：<input type="text" name="blogtitle" style="width: 24%;height:25px;"/></p> 
					<textarea id="article" name="article">Hello World!</textarea>
					<script type="text/javascript">
						CKEDITOR.replace("article");
					</script>
					<input type="submit" value="发布"  style="background-color:#0055AA;color: white;font-size: 15px;
            	height:60px;width: 90%;display:inline-block;float: left;margin-left: 55px;" />
            	</form>
					
				</section>
			</div>
	<%@include file="../footer.jsp" %>