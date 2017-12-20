<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminHeader.jsp"%>
<%@ include file="adminLeftSider.jsp"%>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					<h2 class="sub-header">添加友链</h2>
					<form class="form-horizontal" style="padding-left: 100px;" action="${APP_PATH}/addlink" method="post">
					  <div class="form-group">
					    <label class="col-sm-2 control-label">友链名称</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="linkname" placeholder="linkname">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputPassword" class="col-sm-2 control-label">友链地址</label>
					    <div class="col-sm-6">
					      <input type="url" class="form-control" name="linkurl" placeholder="linkurl">
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-6">
					      <button type="submit" class="btn btn-default">Add in</button>
					    </div>
					  </div>
					</form>
				</div>

<%@ include file="adminFooter.jsp"%>