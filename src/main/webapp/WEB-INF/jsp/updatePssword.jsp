<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=
	basePath
%>">

<title>修改密码页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

div {
	padding: 0;
}

table {
	text-align: center;
	font-size: 14px;
}

tr {
	height: 40px;
}

input {
	height: 25px;
	border: 1px #eee solid;
}

.pwd {
	width: 200px;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/amazeui.min.css">
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<!-- md5 沙市-->
<script type="text/javascript" src="${pageContext.request.contextPath}/QQfiles/md5.js"></script>

<script type="text/javascript">
	$(function() {
		buttonCheck();
		$('body',parent.document).find('.middle_left_1').css("display","block");
		$('body',parent.document).find('.middle_right_big').css("display","block");
		$('body',parent.document).find('.middle_right').css("width","");
		$('body',parent.document).find('.middle_right iframe').css("width","650px");
	});
	
	function buttonCheck(){
		$("#subminButton").click(function (){
			if(''==$("#oldpwd").val()){
				layer.msg("原密码不能为空");
				return false;
			}
			if(''==$("#newpwd").val()){
				layer.msg("新密码不能为空");
				return false;
			}
			if(''==$("#rpwd").val()){
				layer.msg("确认密码不能为空");
				return false;
			}
			if($("#rpwd").val()!=$("#newpwd").val()){
				layer.msg("请再次确认密码");
				return false;
			}
			var oldpassword = MD5($("#oldpwd").val());
			var newpassword = MD5($("#rpwd").val());
			var submitdata = 'oldpassword='+oldpassword+'&'+'newpassword='+newpassword;
			saveuser(submitdata);
		});
		
	}
	function saveuser(submitdata){
		$.post("${pageContext.request.contextPath}/personalData/updatePersonalPass",submitdata,function(result){
			$("#oldpwd").val('');
			$("#rpwd").val('');
			$("#newpwd").val('');
			if(result.status == 'success'){
				//window.location = '${pageContext.request.contextPath}/loginuser/toOK/'+result.username;
				layer.msg('密码修改成功!', {icon: 1});
				
			}
			if(result.status == 'error'){
				layer.msg('密码修改失败!', {icon: 2}); 
			}
		},'json');
	}
</script>
</head>

<body>
	<form action="" method="post">
		<div
			style="border: 1px solid #cccccc; width: 630px; margin-top: 10px; margin-left: 10px; height: 220px">
			<ul>
				<li style="color: gray; list-style: none; margin-left: -20px">修改密码</li>
			</ul>
			<hr style="color: gray; width: 615px; margin-top: -5px">

			<table cellpadding="0" cellspacing="0" border="0" width="398">

				<tr style="margin-left: -10px">
					<td>原&nbsp;密&nbsp;码:</td>
					<td><input type="password" name="oldpassword" class="pwd"
						id="oldpwd" style="border-color: gray; margin-left: -100px"
						onblur="submitPwd();" /></td>
				</tr>
				<tr>
					<td>新&nbsp;密&nbsp;码:</td>
					<td><input type="password" class="pwd"
						id="newpwd" style="border-color: gray; margin-left: -100px" /></td>
				</tr>
				<tr>
					<td>密码确认:</td>
					<td><input type="password" class="pwd" id="rpwd"
						style="border-color: grey; margin-left: -100px" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input class=" am-btn am-btn-secondary"  type="button" value="提交"
						style="width: 120px;height: 30px;line-height: 0px;" id="subminButton" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="重置"  	class=" am-btn am-btn-danger"style="width: 120px;height: 30px;line-height: 0px;" />
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
