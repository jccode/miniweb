<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>后台管理主页</title>
		<link rel="stylesheet" href="${webRoot}/static/assert/css/bootstrap.min.css">
		<link rel="stylesheet" href="${webRoot}/static/assert/css/bootstrap-responsive.min.css">
		<link rel="stylesheet" href="${webRoot}/static/assert/css/main.css">
		<style type="text/css">
			body {
				padding: 50px 0px 0px;
				/*background-color: #f5f5f5;*/
			}
		</style>
	</head>
	<body>
		<div class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">

					<a href="#" class="brand">管理后台</a>
					<ul class="nav">
						<li><a href="#">关于</a></li>
					</ul>
					<ul class="nav pull-right">
						<li>
							<a href="#">
								<i class="icon-bell"></i> 通知(<span class="red">20</span>)
							</a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<i class="icon-user"></i> 张三
							</a>
							<div class="dropdown-menu" style="">

								<div class="user-info">
									<div class="user-avatar">
										<img src="${webRoot}/static/assert/img/avatar.jpg" alt="" width="96px" height="96px">
									</div>
									<div class="user-text-info">
										<p>
											<b>张三</b> <br>
											<span>zhangshan@gmail.com</span>
										</p>
										<div>
											<input type="button" class="btn" value="查看个人资料">
											<input type="button" id="logout" class="btn pull-right" value="退出登录">
										</div>
									</div>
								</div><!--/ user-info -->

							</div>
						</li>
					</ul>

					<!-- 消息提示 -->
					<div class="alert alert-notify hide" id="alert-notify">
						<a class="close" href="#">&times;</a>
						<p id="alert-content" class="alert-content">
							<strong>Warning!</strong> 新增成功新增成功新增成功新增成功新增成功新增成功新增成功新增成功新增成功新增成功
						</p>
					</div>

				</div>
			</div>
		</div>

		<div class="container-fluid main">
			<div class="row-fluid">
				<div class="span2">
					<div class="sidebar">
						<ul class="nav nav-list">
							<li class="nav-header">系统管理</li>
							<li class="active"><a href="${webRoot}/user?n=0">人员管理</a></li>
							<li class=""><a href="#">菜单管理</a></li>
							<li class=""><a href="${webRoot}/test">测试</a></li>
							<li class="nav-header">订单管理</li>
							<li class=""><a href="todo.html">未处理</a></li>
							<li><a href="history.html">已处理</a></li>
						</ul>
					</div>
				</div>
				<div class="span10">
					<iframe id="mainFrame" src="" frameborder="0" width="100%" height="100%" style="vertical-align: top;"></iframe>
				</div>
			</div>
		</div>

		<script src="${webRoot }/static/assert/seajs/sea.js" data-config="${webRoot }/static/assert/js/config" data-main="${webRoot }/static/assert/js/home"></script>
	</body>
</html>