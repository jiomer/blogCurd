<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="adminHeader.jsp" %>
				<!-- 导入css/js -->
				<script type="text/javascript" charset="utf-8" src="${APP_PATH }/ckeditor/ckeditor.js"></script>
				<section class="blockGroup">
					<h1>撰写日记</h1>
					<form action="writediary" method="post">
					<input type="hidden"  id="diary" name="diary"/>
					<textarea id="diary1" name="diary1">Hello World!</textarea>
					
					<input type="submit" value="发布" onclick="onWritediary();" style="background-color:#0055AA;color: white;font-size: 15px;
            	height:60px;width: 90%;display:inline-block;float: left;margin-left: 55px;" />
            	<script type="text/javascript">
						CKEDITOR.replace("diary1");
						
						function onWritediary(){
							var diaryText = CKEDITOR.instances.diary1.document.getBody().getText(); //取得纯文本
							//alert(diaryText);
							$("#diary").val(diaryText);
						}
					</script>
            	</form>
				</section>
			</div>
<%@include file="../footer.jsp" %>