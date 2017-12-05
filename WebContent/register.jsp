<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%>  
<!DOCTYPE html>
<html>
	<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <link type="image/vnd.microsoft.icon" href="${APP_PATH }/static/img/favicon.png" rel="shortcut icon">
    <script src="${APP_PATH }/static/js/jquery.1.4.2.min.js"></script>
	<link href="${APP_PATH }/static/css/logo.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div class="wrapper">

    <div class="froyo-frame login-body">
        <div class="admin-face">
            <div class="face-img">
            <img src="${APP_PATH}/static/img/user.png" alt="logo">
        </div>
        </div>
        <h1 class="admin-login-tittle">「从现在开始，为自己的未来努力一把」</h1>
        <div class="admin-login-form">
            <form class="form" action="regist" method="post" autocomplete="off">
                <div class="admin-name"><input name="username" type="text" placeholder="用户名"></div>
                <div class="admin-password"><input name="password" type="password" placeholder="密码"></div>
                <div class="admin-button"><button type="submit" id="login-button">注册</button></div>
            </form>
        </div>
    </div>

</div>

<script type="text/javascript">
    $('#login-button').click(function(event){
        event.preventDefault();
        $('form').fadeOut(500);
        $('.wrapper').addClass('form-success');
        $('.form').submit();
    });
</script>

</body>
</html>