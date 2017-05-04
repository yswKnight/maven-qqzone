<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我的相册页面</title>
<link
	href="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/css/layui.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/layui.js"></script>

<style type="text/css">

body{
             -moz-user-select:none; /*火狐*/
             -webkit-user-select:none; /*webkit浏览器*/
             -ms-user-select:none; /*IE10*/
             -khtml-user-select:none; /*早期浏览器*/
             user-select:none;
}

.album-all-top {
	margin: 10px;
}
.album-all-top-newalbum{
	float: left;
	margin-right: 10px;
}
.album-all-top-addphoto{
	
}
.album-all-conter {
	margin: 10px;
	border: 1px solid #999999;
	width: 1020px;
	height: 500px;
	overflow-y:auto;
}

.layui-icon {
	cursor:pointer;
	
	
}
.album-icon-delete {
	float: right;
	background: #ffffff;
	width: 20px;
	height: 20px;
	margin: 10px;
	padding-top: 5px;
	padding-left: 5px;
	border:1px solid silver;
}
.mydiv1 #album-update:hover{
	background: #d2d6d7
}
.mydiv1 #album-delete:hover{
	background: #d2d6d7
}

.showalbum-bottom-left {
	display:block;                     /*内联对象需加*/
	width:80px;
	word-break:keep-all;           /* 不换行 */
	white-space:nowrap;          /* 不换行 */
	overflow:hidden;               /* 内容超出宽度时隐藏超出部分的内容 */
	text-overflow:ellipsis;         /* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/
}

</style>

<script type="text/javascript">

	layui.use(['layer','element'],function() {
		
		var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
		
		$("#newAlbum").click(function(){
			layer.open({
				  type: 2,
				  title: '创建相册',
				  shadeClose: true,
				  shade: 0.3,
				  area: ['400px', '350px'],
				  offset: '100px',
				  content: '${pageContext.request.contextPath}/album/newalbum', //iframe的url
				  end: function(index){
					  //location.href = "${pageContext.request.contextPath}/album/myalbum";
					  showAlbum();
				  }
				});   
		});
		
	});
	
	$(function(){
		
		$('body',parent.document).find('.middle_left_1').css("display","none");
		$('body',parent.document).find('.middle_right_big').css("display","none");
		$('body',parent.document).find('.middle_right').css("width","100%").css("margin","auto").css("height","100%");
		$('body',parent.document).find('.middle_right iframe').css("width","100%").css("height","100%");;
		
		showAlbum();
		
		$("#addphoto").click(function(){
			location.href = "${pageContext.request.contextPath}/photo/toaddPhoto?albumid="+$(".showalbum-imgs").find(".showalbum-showphoto").val();
		});
		
	});
	
	
	function deleteAlbum(albumid,index){
		
		$.ajax({
			url: "${pageContext.request.contextPath}/album/deleteAlbum",
			type: "POST",
			data: {"albumid":albumid},
			dataType: "json",
			success:function(result){
				if(result.status=="success"){
					layer.close(index);
					//location.href = "${pageContext.request.contextPath}/album/myalbum";
					showAlbum();
				}else{
					layer.alert('删除未成功！')
				}
			},
			error:function(){
				alert("服务器异常啦~");
			}
		});
		
	}
	
	function showAlbum() {
		//alert($("#userid-session").val());
		//加载相册信息
		$.ajax({
			url:"${pageContext.request.contextPath}/album/showAlbum",
			type: "POST",
			data: {'userid':$("#userid-session").val()},
			dataType: "json",
			success:function(data){
				var con="";
				$.each(data,function(i,album){
					con +='<div class="showalbum" style="border-radius:5px; padding: 5px; width: 120px;height: 150px; float: left;  margin: 10px; border: 1px solid #999999; ">';
					if(album.cover==""){
					con +='<div class="showalbum-imgs" style="width: 120px; height: 120px; cursor:pointer; background-image:url(${pageContext.request.contextPath}/imgs/temp/timg.gif); background-size:120px 120px;">';
					con +='<input type="hidden" class="showalbum-showphoto" value="'+album.albumId+'" /><div class="album-icon-delete" title="编辑或删除" style="display:none;border-radius:5px;" ><i class="layui-icon" >&#xe61a;</i></div>';
					//alert(album.cover);
					//if(album.cover==null){
					//	con +="<img src='${pageContext.request.contextPath}/imgs/temp/timg.gif' style='width: 130px; height: 170px;'/>";
					//}else{
					//	con +="<img src='${pageContext.request.contextPath}/"+album.cover+"' style='width: 130px; height: 170px;'/>";
					//}
					con +='</div>';
					}else{
						con +='<div class="showalbum-imgs" style="width: 120px; height: 120px; cursor:pointer; background-image:url(${pageContext.request.contextPath}/'+album.cover+'); background-size:120px 120px;">';
						con +='<input type="hidden" class="showalbum-showphoto" value="'+album.albumId+'" /><div class="album-icon-delete" title="编辑或删除" style="display:none;border-radius:5px;" ><i class="layui-icon" >&#xe61a;</i></div>';
						con +='</div>';
					}
					con +='<div class="showalbum-bottom" style="width: 120px; height: 30px; border-top: 1px solid #999999;">';
					con +='<div class="showalbum-bottom-left" style="float: left; padding-left: 10px;padding-top: 8px;">'+album.albumName+'</div>';
					/*
					if((album.albumName).length>7){
						con += '...</div>';
					}else{
						con += '</div>';
					}
					*/
					con +='<div class="showalbum-bottom-right" style="float: right; padding-right: 5px; padding-top: 10px;"><i class="layui-icon" title="'+album.dic.dicvalue+'" >&#xe60b;</i></div>';
					con +='</div>';
					con +='</div>';
				});
				$(".album-all-conter").html(con);

				$(".layui-icon").mouseover(function(){
					var e = event || window.event;
					//layer.msg('x:'+e.clientX+'y:'+e.clientY);   
				});
				$(".showalbum-imgs").mouseover(function(){
					//alert($(this).find(".showalbum-showphoto").val());
					var objAlbumid=$(this).find(".showalbum-showphoto").val();
					var objImgs=$(this);
					$(this).find('.album-icon-delete').css("display","block");
					var clickNumber =0;
					$(this).find('.album-icon-delete').click(function(){
						 $(this).find("div").remove();
						 if(clickNumber %2==0){
							$(this).prepend('<div class="mydiv1" style="border-radius:5px;position:absolute;display:none;border:1px solid silver;background:#ffffff;"> <div id="album-update" style="border-bottom:1px solid silver; width: 40px; height: 25px; padding-top: 5px; padding-left: 10px;">编辑</div><div id="album-delete" style=" width: 40px; height: 25px; padding-top: 5px; padding-left: 10px;">删除 </div></div>');
							var objDiv = $(".mydiv1"); 
							$(objDiv).css("display","block"); 
							$(objDiv).css("left", $(this).offset().left - 51); 
							$(objDiv).css("top", $(this).offset().top); 
							$(this).prepend(objDiv);

							//修改
							$("#album-update").click(function(){
								//layer.msg('修改功能待完善中。。。', {icon: 5,offset: '100px'});
								
								layer.open({
									  type: 2,
									  title: '修改相册',
									  shadeClose: true,
									  shade: 0.3,
									  area: ['400px', '350px'],
									  offset: '100px',
									  content: '${pageContext.request.contextPath}/album/goupdateAlbum?id='+objAlbumid, //iframe的url
									  end: function(index){
										  //location.href = "${pageContext.request.contextPath}/album/myalbum";
										  showAlbum();
									  }
									}); 
								
							});
							
							//删除
							$("#album-delete").click(function(){
								$.ajax({
									url: "${pageContext.request.contextPath}/album/predeleteAlbum",
									type: "POST",
									data: {"albumid":objImgs.find(".showalbum-showphoto").val()},
									dataType: "json",
									success:function(result){
										if(result.status=="success1"){
											layer.confirm('你确定删除吗？', {
												btn: ['确定', '取消'] //按钮
												,title: "删除信息"
												,time: 0 //不自动关闭
												,offset: '100px'
												}, function(index){
													layer.close(index);
													layer.confirm('确定同时删除相册内照片？', {
														  time: 0 //不自动关闭
														  ,title: "删除信息"
														  ,btn: ['确定', '取消']
													  	  ,offset: '100px'
														  },function(index){
													  		layer.close(index);
													  		deleteAlbum(objImgs.find(".showalbum-showphoto").val(),index);
														  	layer.msg('删除成功', {icon: 1,offset: '100px'});
													  	  },function(index){
															 layer.close(index);
														  });
												}, function(index){
													layer.close(index);
												});
										}else if(result.status=="success2"){
											layer.confirm('你确定删除吗？', {
												btn: ['确定', '取消'] //按钮
												,title: "删除信息"
												,time: 0 //不自动关闭
												,offset: '100px'
												}, function(index){
													layer.close(index);
													deleteAlbum(objImgs.find(".showalbum-showphoto").val(),index);
													layer.msg('删除成功', {icon: 1,offset: '100px'});
												}, function(index){
													layer.close(index);
												});
										}else{
											layer.alert('服务器异常啦~')
										}
									},
									error:function(){
										alert("服务器异常啦~");
									}
								});
								
							});
							
							
							
						 }else{
							var objDiv = $(".mydiv1"); 
							//$(objDiv).css("display", "none"); 
							$(this).find("div").remove();
						 }
						clickNumber ++;
						return false;
					});
					
					
					
					//鼠标移除
				}).mouseout(function(){
					//alert($(this).find('.album-icon-delete').attr('display'));
					$(this).find('.album-icon-delete').css("display","none");
					//$(this).find('.album-icon-delete').find("div").remove();
					//$("div").remove(".showalbum-imgs .album-icon-delete #mydiv1");
				});
				/*
				$(".album-icon-delete").mouseover(function(){
					var e = event || window.event;
					//layer.msg('x:'+e.clientX+'y:'+e.clientY);
					$(this).find('i').html("&#xe61a;");
					
					var objDiv = $("#mydiv1"); 
					$(objDiv).css("display","block"); 
					$(objDiv).css("left", $(this).offset().left - 38); 
					$(objDiv).css("top", $(this).offset().top + 18); 
					
				}).mouseout(function(){
					$(".album-icon-delete").find('i').html("&#xe619;");
					var objDiv = $("#mydiv1"); 
					$(objDiv).css("display", "none"); 
				});
				*/
				$(".showalbum-imgs").click(function(){
					//alert($(this).find(".showalbum-showphoto").val());
					location.href = "${pageContext.request.contextPath}/album/gophoto?albumid="+$(this).find(".showalbum-showphoto").val();
				});
				
					
			},
			error:function(){
				alert("服务器异常啦~");
			}
		});
		return true;
	}
	
</script>
</head>

<body>
	<input type="hidden" id="userid-session" value="${sessionScope.loginUser.userid}" />
	<div class="album-all">
		<div class="album-all-top">
			<div class="album-all-top-newalbum">
				<button class="layui-btn layui-btn-primary" id="newAlbum">创建相册</button>
			</div>
			<div class="album-all-top-addphoto">
				<button class="layui-btn layui-btn-primary" id="addphoto">上传照片</button>
			</div>
		</div>
		
		<div class="album-all-conter">
			
			
		</div>
		 
				
	
	</div>

</body>

</html>
