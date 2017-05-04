<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>表格</title>
<link
	href="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/css/layui.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/layui.js"></script>

<style type="text/css">
.layui-input-block{
	width: 220px;
}
.layui-form-item {
	margin-top: 10px;
}

</style>
<script>
//Demo
layui.use(['form','layer'], function(){
	
  var form = layui.form();
  
//监听提交
  form.on('submit(formDemo)', function(data){
    //layer.msg(JSON.stringify(data.field)+"---"+$("#layui-form-newalbum").serializeArray());
    var data=data.field;
    $.ajax({
		url: "${pageContext.request.contextPath}/album/addalbum",
		type: "POST",
		data: data,
		dataType: "json",
		success:function(result){
			if(result.status=="success"){
				//alert("添加成功");
				//layer.close(layer.index);
				//关闭当前层
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
				
			}else{
				alert("失败");
			}
		},
		error:function(){
			alert("服务器错误~~");
		}
		
	});
    return false;
  });
  
});

$(function(){
	
		//var submitdata=$("#layui-form-newalbum").serializeArray();

	
});
</script>

</head>

<body>
<form class="layui-form" id="layui-form-newalbum" method="post" name="formalbum">
  <div class="layui-form-item">
    <label class="layui-form-label">相册名称</label>
    <div class="layui-input-block">
      <input type="text" name="albumName" required  lay-verify="required" placeholder="请输入相册名称" autocomplete="off" class="layui-input" value="${album.albumName}">
    </div>
  </div>
  <input type="hidden" id="userid-session" name="user.userid" value="${sessionScope.loginUser.userid}" />
  <input type="hidden"  name="albumId" value="${album.albumId}" />
  <input type="hidden"  name="cover" value="${album.cover}" />
  <div class="layui-form-item">
    <label class="layui-form-label">相册权限</label>
    <div class="layui-input-block">
      <select name="dic.dicid" lay-verify="required">
        <option value="21" <c:if test="${album.dic.dicid==21}" >selected</c:if>>所有人可见</option>
        <option value="22" <c:if test="${album.dic.dicid==22}" >selected</c:if>>仅好友可见</option>
        <option value="23" <c:if test="${album.dic.dicid==23}" >selected</c:if>>仅自己可见</option>
      </select>
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">相册描述</label>
    <div class="layui-input-block">
      <textarea name="describe" placeholder="说说这个相册的故事..." class="layui-textarea">${album.describe}</textarea>
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
</body>
</html>