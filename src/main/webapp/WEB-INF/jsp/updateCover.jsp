<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"   prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/css/layui.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.showImg-cover {
	margin: 10px;
	border: 1px solid #999999;
	width: 460px;
	height: 535px;
	overflow-y:auto;
}

.showImg-cover-div {
	margin: 5px;
	border: 1px solid #999999;
	width: 100px;
	height: 100px;
	float: left;
	cursor:pointer;
	padding: 1px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
layui.use('layer',function() {
	
	layer = layui.layer;
	
	$(".showImg-cover-div").on("click",function(){
		//alert($(this).find(".input-cover").val());
		//alert($(this).find(".input-albumid").val());
		$.ajax({
			url:'${pageContext.request.contextPath}/album/updateCover',
			type:'POST',
			data:{'albumid':$(this).find(".input-albumid").val(),'cover':$(this).find(".input-cover").val()},
			dataType:'json',
			success:function(result){
				if(result.status=='success'){
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.msg("<span style='color:#000000'>相册封面设置成功！</span>", {icon: 1,offset: '100px'});
					parent.layer.close(index);
				}else{
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.msg("<span style='color:#000000'>相册封面设置失败！</span>", {icon: 1,offset: '100px'});
					parent.layer.close(index);
				}
			},
			error:function(){
				alert("服务器错误~")
			}
		});
	});
});

</script>

</head>
<body>
	<div class="showImg-cover">
	<c:forEach var="photo" items="${photos}">
		<div class="showImg-cover-div">
			<img alt="" style="width: 100px;" src="${pageContext.request.contextPath}/${photo.thumbanil}" />
			<input class="input-cover" type="hidden" value="${photo.thumbanil}" />
			<input class="input-albumid" type="hidden" value="${photo.album.albumId}" />
		</div>
	</c:forEach>
	</div>

</body>
</html>