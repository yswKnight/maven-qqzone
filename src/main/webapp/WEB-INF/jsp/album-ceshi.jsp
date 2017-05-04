


<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>上传照片</title>
<link
	href="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/css/layui.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/layui.js"></script>
<script type="text/javascript">


layui.use(['layer','element'],function() {
	
	var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
	
	$("#upload-btn").click(function(){
		//alert($("#asdasd").val());
		if($("#asdasd").val()==null){
			layer.open({
				  type: 2,
				  title: '创建相册',
				  shadeClose: true,
				  shade: 0.3,
				  area: ['400px', '300px'],
				  offset: '100px',
				  content: '${pageContext.request.contextPath}/album/newalbum', //iframe的url
				  end: function(index){
					  albumBySelect();
				  }
				});   
			return false;
		}
	});
	
	});
	$(function(){
		
		albumBySelect();
		
		$("#fanhui").click(function(){
			location.href = "${pageContext.request.contextPath}/album/myalbum";
			return false;
		});
		
		
	});
	
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
									+ '" width="180px" height="100px" style="block" src="'
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
	
	function albumBySelect(){
		$.ajax({
			url:"${pageContext.request.contextPath}/album/showAlbum",
			type: "POST",
			data: {'userid':$("#userid-session").val()},
			dataType: "json",
			success:function(data){
				var con='';
				$.each(data,function(i,album){
					//alert(i);
					
					if($("#albumid-session").val()==album.albumId){
						con +='<option selected="selected"  value="'+album.albumId+'">'+album.albumName+'</option>';
					}else{
						con +='<option value="'+album.albumId+'">'+album.albumName+'</option>';
					}
					
				});
				$("#asdasd").html(con);
			},
			error:function(){
				alert("服务器异常啦~");
			}
		});
	}
</script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
}

#asdasd {
	width: 200px;
	height: 40px;
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

.album {
	width: 640px;
}

.album-top {
	margin: 10px;
}

.album-conter {
	margin: 10px;
	border: 1px solid #999999;
	width: 620px;
	height: 500px;
	overflow-y:auto;
}

.album-conter #localImag img {
	margin: 10px;
	border: 1px solid #999999;
}

.album-bottom {
	margin: 10px;
}

.album-top-addpic {
	float: left;
}

.album-top-topic {
	float: left;
	padding-top: 2px;
}

.layui-form-item {
	width: 300px;
}

.album-bottom {
}

</style>
</head>
<body>
	<input type="hidden" id="userid-session" value="${sessionScope.loginUser.userid}" />
	<input type="hidden" id="albumid-session" value="<%=request.getSession().getAttribute("albumid") %>" />
	<div class="album">
		<FORM name="userForm1" 
			action="${pageContext.request.contextPath}/photo/uploadAndInsertPhoto"
			enctype="multipart/form-data" method="post"">
			<div class="album-top">

				<!-- 选择上传照片控件 -->
				<div class="album-top-addpic">
					<A class=btn_addPic> <SPAN><EM>+</EM>选择图片</SPAN> <input
						type="file" id="file" name="file" class="filePrew" multiple
						accept="image/*" onchange="javascript:setImagePreview();" />
					</A>
				</div>
				<div class="album-top-topic">
					<div class="layui-form-item">
    					<label class="layui-form-label">上传到</label>
    						<div class="layui-input-block" >
      							<select name="album.albumId" lay-verify="" id="asdasd" >
      								
								</select>    
						    </div>
					</div>
				</div>
				<div>
					<button id="fanhui" class="layui-btn layui-btn-primary" style="float: right;">返回相册</button>
				</div>

			</div>

			<div class="album-conter">
				<!-- 显示上传照片 -->
				<div id="localImag"></div>
			</div>

			<div class="layui-progress layui-progress-big" lay-filter="demo" lay-showPercent="true" style="display: none;">
  				<div class="layui-progress-bar" lay-percent="0%"></div>
			</div>
			<div class="album-bottom">
				<!-- 上传照片 -->
				<div class="album-top-addbtn">
					<button class="layui-btn layui-btn-primary" id="upload-btn">上传图片</button>
				</div>
			</div>
		</FORM>
	</div>
	

</body>
</html>