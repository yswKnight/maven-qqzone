<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<base href="<%=basePath%>">

<title>My JSP 'photo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" href="css/photo.css" type="text/css"></link>
<link rel="stylesheet" type="text/css" href="css/webuploader.css" />
<link rel="stylesheet" type="text/css" href="css/style1.css" />

<script type="text/javascript" src="js/jquery-2.1.1.min.js">
</script>
<script type="text/javascript" src="js/layer/layer.js">
</script>
</head>

<script>
	$(function() {
		//我的相册下拉列表失去焦点胡
		$("#albumid").blur(function() {
			albumBlur();
		});
		//加载我的相册
		findAlbum();
	})
	//加载我的相册

	function findAlbum() {

		$.getJSON("${pageContext.request.contextPath}/album/findAlbum",
				function(data) {
					if ("" == data) {
						layer.alert("亲，你还没有相册,先去创建一个吧");
					} else {
						var content = "";
						$.each(data, function(i, album) {

							content += "<option value=" + album.alid + ">";
							content += "" + album.alname + "</option>";
						});
						$("#albumid").html(content);
					}

				});
	}
	//我的相册下拉列表失去焦点胡
	function albumBlur() {
	
	
		$.post("album/uploadimgs", {
			"alid" : $("#albumid").val()
		}, function(data) {
			
		}, "");
	}
</script>
<body>
	<div id="caidan" >
		<br><br><!-- 上传分两个请求，一个请求传图片，一个请求传表单 -->
		<span id="span1"><a href="album/tomyAlbum" id="a1" > 我的相册</a></span>
		<span id="span2">请选择上传的相册:<select id="albumid"></select></span>
	</div>
	<div id="wrapper" >
		<div id="container" >
			<!--头部，相册选择和格式选择-->

			<div id="uploader">
				<div class="queueList">
					<div id="dndArea" class="placeholder">
						<div id="filePicker"></div>
						<p>或将照片拖到这里，单次最多可选300张</p>
					</div>
				</div>
				<div class="statusBar" style="display: none;">
					<div class="progress">
						<span class="text">0%</span> <span class="percentage"></span>
					</div>
					<div class="info"></div>
					<div class="btns">
						<div id="filePicker2"></div>
						<div class="uploadBtn">开始上传</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery.js">
		
	</script>
	<script type="text/javascript" src="js/webuploader.js">
		
	</script>
	<script type="text/javascript" src="js/upload.js">
		
	</script>
</body>
</html>
