<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="${APP_PATH }/static/js/jquery.1.4.2.min.js"></script>
<title>index.jsp</title>
<script>
window.onload = function(){ //设置当页面加载时执行
window.location ="${APP_PATH }/blogindex.jsp" //确定的话游览器自身跳转
}
</script>
</head>
<body>
<!-- 做跳转使用 -->
</body>

</html>