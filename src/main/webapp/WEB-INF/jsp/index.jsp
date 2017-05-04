<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- @auth 阿坑哥 修改样式-->
<title>QQZone-登录页</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/layer-v3.0.1/layer-v3.0.1/layer/layer.js"></script>
<style type="text/css">
body {
	margin: 0;
	height: 100%;
	width:100%
}

.img-container {
	height: 100%;
	width:100%;
	position: absolute;
}

.img-container .layer {
	width: 990px;
	height: 150px;
	position: absolute;
	left: 0;
	top: 0;
	z-index: 2;
	background: rgba(0, 0, 0, 0);
	background: #000\0;
	filter: alpha(opacity = 0) \0;
	background: #FFF;
	margin-left: 1050px;
	margin-top: 200px;
	border-radius: 5px
}

.loginText {
	web-kit-appearance: none;
	moz-appearance: none;
	font-size: 14px;
	padding-left: 13px;
	width: 272px;
	height: 42px;
	line-height:35px;
	border-radius: 4px;
	border: 1px solid #D6D6D6;
	color: #aaa;
	border-color: gray;
	font-family: Verdana,Tahoma,Arial;
}
</style>

</head>
<script type="text/javascript">
	
	$(function() {
		//得到焦点
		$(".loginText").css("border-color", "#D6D6D6");
		$(document).on("focus", ".loginText", function() {
			$(this).css("border-color", "#A7D2FB");
		});
		//失去焦点
		$(document).on("blur", ".loginText", function() {
			$(this).css("border-color", "#D6D6D6");
		});
		$(document).on("focus", ".loginBtn", function() {
			$(this).css("outline", "none");
			if($("#username").val() == ''){
				$("#username").focus();
			}
		});
		$(document).on("blur", ".loginBtn", function() {
			$(this).css("outline", "inherit");
		});
		//点击登录事件
		loginBtnOnclick();
		
	});
	
	function loginBtnOnclick(){
		$(".loginBtn").click(function (){
			if('' ==$("#username").val()){
				return false;
			}
			if('' ==$("#password").val()){
				return false;
			}else{
				var password = MD5($("#password").val()).toLowerCase();
				var username = $("#username").val();
				var submitdata = 'username='+username+'&'+'password='+password;
				console.log(submitdata);
				save(submitdata);
			}
		});
	}
	
	function save(submitdata){
		$.post("${pageContext.request.contextPath }/loginuser/tologin",submitdata,function(result){
			if(result.status == 'success'){
				window.location = '${pageContext.request.contextPath}/loginuser/tohome';
				//layer.msg('表单保存成功!', {icon: 1});
			}
			if(result.status == 'error'){
				//window.location = '${pageContext.request.contextPath}/error.jsp';
				layer.msg('密码错误'); 
			}
		},'json');
	}
	
</script>
<body>
	<div style="width: 100%; height: 100%;" class="img-container">
		<img id="images" style="width: 100%; height: 100%; top: -426px;"
			src="${pageContext.request.contextPath}/imgs/untitled.png"
			alt="无法加载图片">
		<div class="layer"
			style="width: 422px; height: 320px; background: white;">
			<h3 style="text-align: center; text-indent: 15px; color: #333;font-size: 20px;">账号密码登录</h3>
			<form id="userform" style="height: 76%;">
				<table  style="width: 100%;text-align: center;height: 80%;" >
					<tr style="width: 100%;margin-top: 10px;">
						<td><input class="loginText" type="text" name="username" id="username"
							placeholder="账号"></td>
					</tr>
					<tr style="width: 100%;margin-top: 10px;">
						<td><input class="loginText" type="password" name="password" id="password"
							placeholder="密码"></td>
					</tr>
					<tr style="width: 100%;margin-top: 10px;">
						<td><input class="loginBtn" type="button" tabindex="6"value="登 录"style="height: 40px;line-height: 35px;border: none;font-size: 17px;font-weight: 400;color: #fff;cursor: pointer;background-color: #86ce2f;width: 272px;"></td>
					</tr>
				</table>
				<div style="text-align: right;padding-right: 40px;margin-top: 15px;">
				<a href="${pageContext.request.contextPath }/forget/toForget" style="text-decoration: none;color: #666;">忘记密码</a>
				<a href="${pageContext.request.contextPath }/loginuser/toregist" style="text-decoration: none;color: #666;">注册用户</a>
				</div>
			</form>
		</div>
	</div>
<!-- md5 沙市-->
<script type="text/javascript" src="${pageContext.request.contextPath}/QQfiles/md5.js"></script>
</body>
</html>