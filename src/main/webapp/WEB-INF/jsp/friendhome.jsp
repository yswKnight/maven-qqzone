<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>好友管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/address.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
		<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/amazeui.min.css">
<style type="text/css">
body {
	/* mrgin: 0;
	padding: 0; */
}

#main {
	width: 100%;
	font-size: 14px;
}

#tba th{
	text-align: center;
}

#tba td{
	text-align: center; 
	margin-top: 20px;
	padding-top: 10px; 
}

#tba a{
	font-size: 13px;
	text-transform:none;
	text-decoration:none;
	/* color: gray; */
}

#tba a:hover {
	text-decoration: underline;
}

#pcenter {
	height: 40px;
	background-color: #A0D6F7;
}

#pcenter span {
	position: relative;
	left: 10px;
	float: left;
	margin-top: 12px;
}

#pcenter a {
	float: right;
	text-decoration: none;
	font-size: 12px;
	margin-top: 12px;
	margin-right: 5px;
	color: #6F6F6F;
}

#pcenter a:hover {
	color: #f00;
}
/*好友中心导航*/
#friendMenu {
	width: 635px;
	height: 45px;
	position: relative;
	bottom: 10px;
}

#friendMenu li {
	list-style: none;
	float: left;
	position: relative;
	right: 40px;
	top: 14px;
	margin-top: 25px;
	margin-left: 35px;
}

#friendMenu a {
	text-decoration: none;
	padding: 15px 35px;
	color: #808080;
	color: #5D7895;
}

#friendMenu a:hover {
	font-weight: bold;
}
/*好友管理头部*/
#header {
	width: 100%;
	clear: both;
}

#hleft {
	font-size: 14px;
	margin-left: 10px;
}

#dianji {
	border: 1px #fff solid;
	background-color: #AFDEF7;
	height: 25px;
}

#qqnumber {
	border: 1px #A0D6F7 solid;
	height: 25px;
}

.click {
	background-color: #999;
}

#twindow {
	font-size: 14px;
}
/*分页样式*/
#hright p {
	text-align: center;
}

#hright a {
	text-decoration: none;
	color: #000; 
	padding: 4px 20px;
	margin-left: 10px;
}
/*全查询显示的样式*/
#showUser {
	font-size: 14px;
	font-family: "微软雅黑";
	text-align: center;
}

.showInfo {
	border: 1px #fff solid;
	height: 30px;
}
</style>

</head>
<style>
.mytds1 {
	text-align: center;
}
</style>
<script type="text/javascript">

$(function (){
	$('body',parent.document).find('.middle_left_1').css("display","block");
	$('body',parent.document).find('.middle_right_big').css("display","block");
	$('body',parent.document).find('.middle_right').css("width","");
	$('body',parent.document).find('.middle_right iframe').css("width","650px");
	
});
//点击删除
$(document).on("click","#delete",function(){
	$("#tba tr").removeClass("high")
		var b=$(this).siblings().parents("tr").addClass("high");
		var tds = $(".high").find("td");
		//$(".high").remove();
		//var a=tds.eq(0).attr("value");
		var userid=b.attr("id");
		if(window.confirm('您确定要删除吗?')){
			$.ajax({
		   		"url":"${pageContext.request.contextPath}/friend/delete",//请求的url
		   		"type":"GET",   // 请求方式
		   		"dataType":"json",	  // 响应回来的数据格式
		   		"data":{"userid":userid},//发送到服务器的数据 
		   		//回调函数，当本次请求成功时调用此方法
		   		"success":function(result){
		   			$(".high").remove();
		   			layer.msg("删除成功");
		   			
		   				 }
		   		});
			}
});

//点击详细信息
$(document).on("click","#chakan",function(){
	$("#tba tr").removeClass("high")
		var b=$(this).siblings().parents("tr").addClass("high");
		var tds = $(".high").find("td");
		var userid=b.attr("id");
			$.ajax({
		   		"url":"${pageContext.request.contextPath}/user/find",//请求的url
		   		"type":"GET",   // 请求方式
		   		"dataType":"json",	  // 响应回来的数据格式
		   		"data":{"userid":userid},//发送到服务器的数据 
		   		//回调函数，当本次请求成功时调用此方法
		   		"success":function(result){
		   			var content="";
		   			content +="<div>"
		   			content +="<div  style='float:left'>";
		   			content +="<img class='am-img-thumbnail am-circle'  style='width: 130px;height: 130px; margin-top:30px;' alt='无法加载' src='${pageContext.request.contextPath}/"+result.a.img+"'>";
		   			content +="</div>";
		   			content +="<div  style='float:left;margin-left:30px'>";
		   			content +="<font style='display: block;line-height:40px;'>账号:"+result.a.username+"</font>";
		   			content +="<font style='display: block;line-height:40px;'>　昵称:"+result.a.realname+"</font>";
		   			content +="<font style='display: block;line-height:40px;'>　　性别：";
		   			content +=""+(result.a.sex== 1?'男':'女')  +"</font>";
		   			content +="<font style='display: block;line-height:40px;'>　生日：";
		   			content +=""+(result.a.birthday== null?"":result.a.birthday)  +"</font>";
		   			content +="<font style='display: block;line-height:40px;'>地址：";
		   			content +=""+(result.a.address== null?"":result.a.address)  +"</font>";
		   			content +="</div>";
		   			content +="</div>"
		   			$("#haha").html(content);
		   			layer.open({
						  type: 1,
						  area : [ 'auto', 'auto'],
						  skin: 'layui-layer-molv', //样式类名
						  offset: '150px',
						  title:"详细信息",
						  closeBtn: 1, //不显示关闭按钮
						  shade: 0,
						  shadeClose: true, //开启遮罩关闭
						  content: $("#layer-out-mine")
						}); 
		   				 }
		   		});

});
</script>
<body onload="setup()" style="">
	<div id="main">
		<div id="friendMenu">
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/friend/toFriendHome.htm">我的好友</a></li>
				<li><a
					href="${pageContext.request.contextPath}/friend/toAddFriend.htm">添加好友</a></li>
				<li><a
					href="${pageContext.request.contextPath}/friend/myMsg.htm">信息中心</a></li>
			</ul>
		</div>
		<hr>
		<div id="header" style="display: none;">
			<div id="hleft">
				<form action="" method="post">
					<input type="hidden" name="userid" id="userid"
						value="${user.userid}" /> <input type="text" name="qqnumber"
						id="qqnumber" size="17" placeholder="QQ账号 "
						style="border-radius: 10px;"> <select id="sex" name="sex">
						<option>未选择</option>
						<option value="1">男</option>
						<option value="0">女</option>
					</select> <select id="s1"><option>省份</option></select> <select id="s2"
						style="width: 50px"><option>地级市</option></select> <select id="s3"
						style="width: 150px"><option>市、县级市、县</option></select> <input
						type="button" id="dianji" value="查询" style="border-radius: 10px;">

				</form>
			</div>
			<div id="hright"></div>
		</div>
		<div id="content">
			<table id="tba" style="width: 80%;">
				<c:if test="${empty friends}">
					<tr>
						<td colspan="3"><font style="font-size: 13px; color: gray;">暂时没有好友,快去<a
								href="${pageContext.request.contextPath}/friend/toAddFriend.htm"
								style="color: blue; font-size: 12px;">添加</a>吧!
						</font></td>
					</tr>
				</c:if>
				<c:if test="${not empty friends}">
					<tbody style="line-height: 60px;">
							<tr>
								<th width="240px" >头像</th>
								<th width="200px;">昵称</th>
								<th width="180px;">操作</th>
							</tr>
						</tbody>
					<c:forEach var="friend" items="${friends}">
					<tr id="${friend.userid}">
							<td ><img style="width: 60px; height: 60px;" alt="无法加载图片"
								src="${pageContext.request.contextPath}/${friend.img}"></td>
							<td style="width: 200px;" >
								${friend.realname}</td>
							<td style="width: 180px; text-align: center;"><a id="chakan" class="am-btn am-btn-secondary" href="#">详细信息</a><a id="delete" class="am-btn am-btn-danger" style="margin-left: 20px;" href="#">删除</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
<div id="layer-out-mine" style="height: 240px; width: 400px; padding-top: 15px; padding-left: 15px;">
	<table style=" width: 100%"  id="haha" class="table table-hover text-center"  >
  </table>
</div>
		<div id="xiangxi" style="display: none"></div>
	</div>
	<div id="con"></div>
<div >

</div>
</body>
</html>