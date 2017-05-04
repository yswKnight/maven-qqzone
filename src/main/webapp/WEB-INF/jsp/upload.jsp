<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/css/layui.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/layui.js"></script>
<script type="text/javascript">
	//显示file里面的图片
	function setImagePreview() {
		var fileObj = document.getElementById("file");
		var con = "";
		$(fileObj.files)
				.each(
						function(i) {
							//alert(i);
							con += '<img class="preview'
									+ i
									+ '" width="100px" height="40px" style="block" src="'
									+ window.URL
											.createObjectURL(fileObj.files[i])
									+ '" />';
							//火狐下，直接设img属性 
							//imgObjPreview.style.display = 'block';
							//imgObjPreview.style.width = '100px';
							//imgObjPreview.style.height = '40px';
							//imgObjPreview.src = docObj.files[0].getAsDataURL();
							//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
							//imgObjPreview.src = window.URL.createObjectURL(fileObj.files[i]);
						});
		$("#localImag").html(con);
		return true;
	}

	layui
			.use(
					'upload',
					function() {

						layui
								.upload({
									url : '${pageContext.request.contextPath}/photo/uploadAndInsertPhoto',
									before : function(input) {
										//返回的参数item，即为当前的input DOM对象
										console.log('文件上传中');
									},
									success : function(res) {
										console.log('上传完毕');
									}
								});

					});
</script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
}

.btn_addPic {
	display: block;
	position: relative;
	width: 140px;
	height: 39px;
	overflow: hidden;
	border: 1px solid #EBEBEB;
	background: none repeat scroll 0 0 #F3F3F3;
	color: #999999;
	cursor: pointer;
	text-align: center;
}

.btn_addPic span {
	display: block;
	line-height: 39px;
}

.btn_addPic em {
	background: url(http://p7.qhimg.com/t014ce592c1a0b2d489.png) 0 0;
	display: inline-block;
	width: 18px;
	height: 18px;
	overflow: hidden;
	margin: 10px 5px 10px 0;
	line-height: 20em;
	vertical-align: middle;
}

.btn_addPic:hover em {
	background-position: -19px 0;
}

.filePrew {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	width: 140px;
	height: 39px;
	font-size: 100px; /* 增大不同浏览器的可点击区域 */
	opacity: 0; /* 实现的关键点 */
	filter: alpha(opacity = 0); /* 兼容IE */
}
</style>
</head>
<body>

	<h1>springMVC包装类上传文件</h1>
	<form name="userForm2"
		action="${pageContext.request.contextPath}/photo/uploadAndInsertPhoto"
		enctype="multipart/form-data" method="post"">
		<div id="newUpload1">
			<input type="file" id="file1" class="layui-upload-file" name="file"
				multiple accept="image/*" onchange="javascript:setImagePreview();" />
		</div>
		<button class="layui-btn">
			<i class="layui-icon">&#xe608;</i> 添加
		</button>
		

	</form>

	<FORM name="userForm1" action="${pageContext.request.contextPath}/photo/uploadAndInsertPhoto" enctype="multipart/form-data" method="post"">
		<A class=btn_addPic > <SPAN><EM>+</EM>添加图片</SPAN>
			<input type="file" id="file" name="file" class="filePrew"
				multiple accept="image/*" onchange="javascript:setImagePreview();" />
		</A>
		<div id="localImag"></div>
		<button class="layui-btn layui-btn-primary"">
			上传图片
		</button>
	</FORM>

</body>
</html>