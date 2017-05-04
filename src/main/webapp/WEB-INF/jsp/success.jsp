<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<title>头像上传</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		layer.msg("上传头像成功", {
			icon : 1,
			offset : [ '300px', '250px' ],
			time : 1800
		});
		setTimeout(function() {
			var src = $("#imgsrc").val();
			$(window.parent.document).find("#userImg").attr("src",src);
			
			window.location.href = "${pageContext.request.contextPath}/user/toMinePersonnal.htm";
		}, 2000);
	});
</script>
<body>
	<input type="hidden" id="imgsrc" value='${user.img}'>
</body>
</html>
