<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>测试页面</title>
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
		<div class="alert hide" id="msg">
		    <div >
		    	<a class="close" href="#">&times;</a>
		    	<div class="content">
		    		<strong>Warning!</strong> Best check yo self, you're not looking too good.
		    	</div>
		    </div>
	    </div>

		<div class="row-fluid container-fixed">
			<div class="span12">
				<p>findUsers: <input type="button" class="btn" id="btn-findUsers" value="findUsers"> </p>
			</div>
		</div>
		
		<script type="text/javascript" src="${webRoot}/static/assert/js/jquery-1.8.0.js"></script>
		<script type="text/javascript" src="${webRoot}/static/assert/js/bootstrap.min.js"></script>
		<script type="text/javascript">

			// ------- Msg Notification ---------
			
			var Msg = (function() {
				
				var id = "msg";

				var $msg = $("#"+id), 
					$msgContent = $(".content", $msg);

				var successClass = "alert-success", 
					errorClass = "alert-error";

				function showMsg(html, className) {
					$msgContent.html(html);
					$msg.addClass(className)
						.removeClass("hide")
						.fadeIn(400)
						.delay(2000)
						.fadeOut(800, function() {
							$(this).removeClass(className).addClass("hide");
						});
				}

				function showMsgFixed(html, className) {
					$msgContent.html(html);
					$msg.addClass(className).removeClass("hide").fadeIn(400);
				}

				return {
					success: function (html, fixed) {
						if(fixed) 
							showMsgFixed(html, successClass);
						else 
							showMsg(html, successClass);
					}, 

					fail: function (html, fixed) {
						if(fixed) 
							showMsgFixed(html, errorClass);
						else 
							showMsg(html, errorClass);
					}
				};

			})();


			// ------- Global Variable -------

			var webRoot = "${webRoot}";


			// ------- document ready -------

			jQuery(function ($) {

				$("#btn-findUsers").click(function () {
					$.getJSON(webRoot + "/user").done(function (json) {
						Msg.success("<strong>Well done!</strong> data: " + JSON.stringify(json));
					})
					.fail(function (xhr) {
						Msg.fail("<strong>Fail!</strong> error: " + xhr.responseText);
					});
				});
				
			});

		</script>
	</body>
</html>