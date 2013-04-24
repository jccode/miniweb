<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>系统管理-人员管理</title>
		<link rel="stylesheet" href="${webRoot}/static/assert/css/bootstrap.min.css">
		<link rel="stylesheet" href="${webRoot}/static/assert/css/main.css">
		<style type="text/css">
			body {
				/*padding: 50px 0px;*/
				/*background-color: #f5f5f5;*/
			}
		</style>
	</head>
	<body>
		<div class="row-fluid container-fixed">
			<div class="span12">
				<div class="querybar">
					<div class="row-fluid">
						<div class="span8">
						</div>
						<div class="span4 btn-right">
							<button type="button" class="btn" id="btn_delete" data-toggle="button">删除</button>
							<button type="button" class="btn" id="btn_edit" data-toggle="button">编辑</button>
							<button type="button" class="btn" id="btn_insert" data-toggle="button">新增</button>
						</div>
					</div>
				</div>
				<div id="groupList" class="common-list group-list">
					<ul>
						<li>
							<div class="list-item">
								<div class="pic">
									<img src="assert/img/t1.jpg" alt="小三">
								</div>
								<div class="btns hide">
									<i class="icon2-edit"></i>
								</div>
								<div class="text">
									<p class="header">小三</p>
									<p class="detail">xiaoshang@163.com</p>
								</div>
							</div>
						</li>
						<li>
							<div class="list-item">
								<div class="pic">
									<img src="assert/img/t2.jpg" alt="小四">
								</div>
								<div class="btns hide">
									<i class="icon2-ok"></i>
								</div>
								<div class="text">
									<p class="header">小四</p>
									<p class="detail">xiaoshi@sina.com</p>
								</div>
							</div>
						</li>
						<li>
							<div class="list-item">
								<div class="pic">
									<img src="assert/img/t5.jpg" alt="小五">
								</div>
								<div class="btns hide">
									<i class="icon2-remove"></i>
								</div>
								<div class="text">
									<p class="header">小五</p>
									<p class="detail">xiaowu@qq.com</p>
								</div>
							</div>
						</li>
						<li>
							<div class="list-item">
								<div class="pic">
									<img src="assert/img/t3.jpg" alt="小一">
								</div>
								<div class="btns hide">
									<i class="icon2-ok"></i>
								</div>
								<div class="text">
									<p class="header">小一</p>
									<p class="detail">xiaoyi@yahoo.com</p>
								</div>
							</div>
						</li>
						<li>
							<div class="list-item">
								<div class="pic">
									<img src="assert/img/t4.jpg" alt="小二">
								</div>
								<div class="btns hide">
									<i class="icon2-ok"></i>
								</div>
								<div class="text">
									<p class="header">小二</p>
									<p class="detail">xiaoer@gmail.com</p>
								</div>
							</div>
						</li>
						<li>
							<div class="list-item">
								<div class="pic">
									<img src="assert/img/avatar.jpg" alt="大三">
								</div>
								<div class="btns hide">
									<i class="icon2-ok"></i>
								</div>
								<div class="text">
									<p class="header">大三</p>
									<p class="detail">dashang@163.com</p>
								</div>
							</div>
						</li>
						<li>
							<div class="list-item">
								<div class="pic">
									<img src="assert/img/qq.png" alt="QQ">
								</div>
								<div class="btns hide">
									<i class="icon2-ok"></i>
								</div>
								<div class="text">
									<p class="header">QQ</p>
									<p class="detail">qq@qq.com</p>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div id="add_panel" class="panel-bottom hide">
					<form action="" class="group-list">
						<div class="pic">
							<div class="img-wapper"><img src=""></div>
							<div class="img-tips hide">点击上传图片</div>
							<input type="file" id="group-upload" name="file" class="hide">
						</div>
						<div class="btns">
							<button class="btn btn-primary btn-large">保存</button>
						</div>
						<div class="text">
							<div class="row-fluid">
								<div class="span5">
									
									<div class="control-group control-group-small">
										<label for="" class="control-label">用户名</label>
										<div class="controls"><input type="text" name="groupName" class="input-block-level"></div>
									</div>

								</div>
								<div class="span2"></div>
								<div class="span5">
									
									<div class="control-group control-group-small">
										<label for="" class="control-label">密码</label>
										<div class="controls"><input type="text" name="groupName" class="input-block-level"></div>
									</div>

								</div>
							</div>

							<div class="control-group control-group-small">
								<label for="" class="control-label">email</label>
								<div class="controls">
									<input type="text" name="detail" class="input-block-level">
								</div>
							</div>

						</div>
					</form>
				</div>
			
			</div>
		</div><!--/ end of container -->

		


		<script type="text/javascript" src="${webRoot}/static/assert/js/jquery-1.8.0.js"></script>
		<script type="text/javascript" src="${webRoot}/static/assert/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${webRoot}/static/assert/js/jquery.bootstrap.extension.js"></script>
		<script type="text/javascript">

			jQuery(function ($) {

				$(".img-wapper").hover(function () {
					$(this).siblings(".img-tips").removeClass("hide");
				}, function () {
					$(this).siblings(".img-tips").addClass("hide");
				});


				$("#btn_insert").toggleButton(insertBtnClick);

				$("#btn_edit").toggleButton(function (checked) {
					showRowEditBtn(checked, "icon2-edit");
				});
				
				$("#btn_delete").toggleButton(function(checked) {
					showRowEditBtn(checked, "icon2-remove");
				});
				
				$(window).bind("resize", resetHeight);
			});


			/**
			 * single toggle button click event
			 * @param  {string}   id       
			 * @param  {Function} callback 
			 */
			function toggle(id, callback) {
				$("#"+id).click(function () {
					var $this = $(this);
					setTimeout(function() {
						var checked = $this.hasClass("active");
						callback(checked);
					}, 0);
				});
			}

			function insertBtnClick (checked) {
				var $addPanel = $("#add_panel"), 
					$groupList = $("#groupList"), 
					winHeight = $(window).height();
				if(checked) {
					$groupList.height(winHeight - 200).addClass("overflow");
					$addPanel.removeClass("hide");
				} else {
					$groupList.height(winHeight).removeClass("overflow");
					$addPanel.addClass("hide");
				}
			}

			function resetHeight () {
				var insertChecked = $("#btn_insert").hasClass("active");
				if(insertChecked) {
					$("#groupList").height($(window).height() - 200);
				}
			}

			function showRowEditBtn(checked, className) {
				console.log(checked);
				var $btns = $("#groupList .btns");
				if(checked) {
					$btns.removeClass("hide").children("i").removeClass().addClass(className);
				} else {
					$btns.addClass("hide");
				}
			}

		</script>
	</body>
</html>