<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>上传照片</title>
<link href="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/css/layui.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/upload/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/upload/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/upload/css/ssi-uploader.css"/>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/layui.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
.container{
	margin-top: -30px;
	margin-left: 5px;
	margin-right: 5px;
}
</style>
</head>
<body>
<input type="hidden" id="userid-session" value="${sessionScope.loginUser.userid}" />
<input type="hidden" id="albumid-session" value="${albumid}" />
<div class="container">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
					<div style="float: left;margin-right: 20px;">
    					<button id="fanhui" class="layui-btn layui-btn-primary" style="float: right;">返回相册</button>  
					</div>
					<div style="float: left;margin-right: 20px;margin-top: 7px;">
    					<label>上传到</label>
      					<select name="album.albumId" style="width: 200px;" id="select-album">
      						
						</select>    
					</div>
					<input type="file" multiple id="ssi-upload" /> 				
				
			</div>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/upload/js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/upload/js/ssi-uploader.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#fanhui").click(function(){
		//location.href = "${pageContext.request.contextPath}/album/myalbum";
		location.href="${pageContext.request.contextPath}/album/gophoto?albumid="+$("#select-album").val();
		return false;
	});
	
	albumBySelect();
	
});

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
			$("#select-album").html(con);
			
			$('#ssi-upload').ssi_uploader({
				url:'${pageContext.request.contextPath}/photo/uploadAndInsertPhoto',
				data: {"albumid":$("#select-album").val()},
				maxFileSize:6,
				allowed:['jpg','gif','txt','png','pdf'],
				onEachUpload: function (fileInfo) {
		            console.log(fileInfo);
		        },
			});
			
		},
		error:function(){
			alert("服务器异常啦~");
		}
	});
}
	
</script>

</body>
</html>
