<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>登陆</title>
		<link rel="stylesheet" href="${webRoot}/static/assert/css/bootstrap.min.css">
		<link rel="stylesheet" href="${webRoot}/static/assert/css/main.css">
		<style type="text/css">
			body {
				padding: 40px 0px;
				background-color: #f5f5f5;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<form id="loginForm" name="loginForm" action="${webRoot}/login" method="post" class="form-sign" >
				<h2>mini web login</h2>
				<spring:hasBindErrors name="*">
					<div class="alert alert-error">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<form:errors path="*" element="div"></form:errors>
					</div>
				</spring:hasBindErrors>
				<input type="text" name="username" class="input-block-level" placeholder="用户名" >
				<input type="password" name="password" class="input-block-level" placeholder="密码" >
				<div class="form-inline">
					<label class="checkbox pull-right checkbox-remember" >
						<input type="checkbox" name="rememberMe" value="true">记住我
					</label>
					<input type="submit" id="login" class="btn btn-primary btn-large btn-login" value="登&nbsp;录">
				</div>
			</form>
		</div>
		
		<script src="${webRoot }/static/assert/seajs/sea.js" data-config="${webRoot }/static/assert/js/config" data-main="${webRoot }/static/assert/js/login"></script>
	</body>
</html>