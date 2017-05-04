<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>显示我的个人信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
body {
	font-size: 10pt;
	font-family: sans-serif;
	background-size: cover;
}

.tab1 {
	font-size: 10pt;
}

.sub1 {
	background-color: white;
	color: #0066CC;
	cursor: Pointer;
	border: 0;
}
</style>

<link rel="stylesheet" href="css/zyupload-1.0.0.min.css" type="text/css"></link>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js">
	
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/laydate/laydate.js">
	
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zyupload-1.0.0.min.js">
	
</script>
<script type="text/javascript">
	$(function() {
		$('body',parent.document).find('.middle_left_1').css("display","block");
		$('body',parent.document).find('.middle_right_big').css("display","block");
		$('body',parent.document).find('.middle_right').css("width","");
		$('body',parent.document).find('.middle_right iframe').css("width","650px");

	});
</script>
</head>
<body>
	<div style="border: 1px solid #cccccc;">
		<form action="user/fupdateMyMessPre" method="post">
			<table border="0" width="85%" cellpadding="0" cellspacing="0"
				class="tab1" style="margin-left: 10px; margin-top: 10px;">
				<tr>
					<td colspan="2" style="font-size: 16px; color: gray;">基本资料
						<hr style="color: gray; width: 615px">
				</tr>
				<tr height="40px">
					<td>Q&nbsp;&nbsp;&nbsp;Q:</td>
					<td><font color="#336699">${user.username}</font></td>

				</tr>
				<tr height="40px">
					<td width="40%">昵&nbsp;&nbsp;称:</td>
					<td>${user.realname}</td>
				</tr>
				<tr height="40px">
					<td>性&nbsp;&nbsp;别:</td>
					<td><c:if test="${user.sex==0}">女</c:if> <c:if
							test="${user.sex==1}">男</c:if></td>
				</tr>
				<tr height="40px">
					<td>生&nbsp;&nbsp;日:</td>
					<td><fmt:formatDate value="${user.birthday}"
							pattern="yyyy-MM-dd " /></td>
				</tr>
				<tr height="40px">
					<td>邮&nbsp;&nbsp;箱:</td>
					<td>${user.email}</td>
				</tr>
				<tr height="40px">
					<td>详细地址:</td>
					<td><c:if test="${user.address==null }">
							---
							</c:if> <c:if test="${user.address!=null }">
							${user.address}
							</c:if></td>
				</tr>


			</table>

		</form>

	</div>
</body>
</html>
