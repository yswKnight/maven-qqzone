<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=
	basePath
%>">

<title>修改我的个人信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
.tab1 {
	font-size: 10pt;
}

body {
	font-size: 10pt;
	font-family: sans-serif;
	background-size: cover;
}

.sub1 {
	background-color: #CCCCCC;
	color: #0066CC;
	cursor: Pointer;
}
</style>
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zyupload-1.0.0.min.css" type="text/css"></link>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/amazeui.min.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js">
	
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/address.js">
	
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/laydate/laydate.js">
	
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zyupload-1.0.0.min.js">
	
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer/layer.js">
	
</script>
<SCRIPT LANGUAGE=JavaScript>
	$(function() {
		$('body',parent.document).find('.middle_left_1').css("display","block");
		$('body',parent.document).find('.middle_right_big').css("display","block");
		$('body',parent.document).find('.middle_right').css("width","");
		$('body',parent.document).find('.middle_right iframe').css("width","650px");
	});
	var s = [ "s1", "s2", "s3" ];
	var opt0 = [ "省份", "地级市", "市、县级市、县" ];
	function setup() {
		for (i = 0; i < s.length - 1; i++)
			document.getElementById(s[i]).onchange = new Function("change("
					+ (i + 1) + ")");
		change(0);
}
</SCRIPT>
<script type="text/javascript">
	$(function() {

		//demo02
		$("#city_2").citySelect({
			prov : "北京",
			nodata : "none"
		});

	});
	function validateForm() {
		if ($(".name").val() == "") {
			layer.msg('昵称不能为空!', {
				icon : 2,
				offset : [ '300px', '180px' ]
			});

			return false;
		}
		if ($("#s1").val() == "省份") {
			layer.msg('地址不能为空!', {
				icon : 2,
				offset : [ '300px', '180px' ]
			});
			return false;
		}
		if ($(".email").val() == "省份") {
			layer.msg('邮箱不能为空!', {
				icon : 2,
				offset : [ '300px', '180px' ]
			});
			return false;
		}
	};
</script>
</head>
<body onload="setup()">
	<div style="border: 1px #cccccc solid;">
		<form action="${pageContext.request.contextPath}/personalData/updatePersonalData" method="post"
			style="margin-left: 10px; margin-top: 10px">
			<table border="0" cellpadding="0" cellspacing="0" width="80%"
				class="tab1">
				<tr>
					<td colspan="2" style="font-size: 16px; color: gray;">基本资料
						<hr style="color: gray; width: 615px">
					</td>
				</tr>
				<tr height="40px">
					<td>Q&nbsp;&nbsp;&nbsp;Q:</td>
					<td><font color="#336699" style="margin-left: 50px;">${user.username }
					<input type="hidden" value="${user.username }" name="username">
					</font>
					</td>
				</tr>
				<tr height="40px">
					<td>昵&nbsp;&nbsp;称:</td>
					<td><input type="text" name="realname" class="name"
						style="margin-left: 50px;" value="${user.realname }" /> 
				</tr>
				<tr height="40px">
					<td>性&nbsp;&nbsp;别:</td>
					<td><input type="radio" name="sex" class="sex"
						style="margin-left: 50px;"
						<c:if test="${user.sex==0}">checked="checked"</c:if> value="0" />
						女 <input type="radio" name="sex" class="sex"
						<c:if test="${user.sex==1}">checked="checked"</c:if> value="1" />
						男</td>
				</tr>
				<tr height="40px">
					<td>生&nbsp;&nbsp;日:</td>
					<td><input class="laydate-icon" style="margin-left: 50px;"
						value="<fmt:formatDate value="${user.birthday }"
						pattern="yyyy-MM-dd " />"
						name="date" onclick="laydate()"></td>
				</tr>
				<tr height="40px">
					<td>邮&nbsp;&nbsp;箱:</td>
					<td><input type="text" name="email" class="email"
						style="margin-left: 50px;" value="${user.email }" /> 
				</tr>
				<tr height="40px">
					<td>详细地址:</td>
					<td><select id="s1" name="address" style="margin-left: 50px;">
							<option>省份</option>
					</select> <select id="s2" name="img">
							<option>地级市</option>
					</select> <select id="s3" name="salt">
							<option>市、县级市、县</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr height="40px" align="center">
					<td colspan="2"><input type="submit"
						onclick="return validateForm();" class="sub1 am-btn am-btn-secondary" align="middle"
						value="确定"
						style="width: 70px; height: 30px; font-size: 12px; color: #FFFFFF;" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div style="width: 500px; height: 500px;"></div>
</body>
</html>
