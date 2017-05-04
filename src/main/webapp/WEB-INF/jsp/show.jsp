<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"   prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mylog.css" type="text/css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/kindeditor-min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lang/zh_CN.js"></script>
		<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/amazeui.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/themes/default/default.css" type="text/css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/emoticons.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/writer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/zui.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/normalize.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/zui.min.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/normalize.css" type="text/css"></link>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
	<style type="text/css">
	a{color:#666
	} 
/* 	a:link {
	 text-decoration: none;
	     color:#000; 
	} */
	#rizhi  a:link{
	 color:#36F; 
	}
	#rizhi  a{
	 color:#36F; 
	}
	a:hover {
	    color:#36F;
/* 	    text-decoration:none; */
	    text-decoration:underline
	    }
	table tr{
	border-bottom: solid 1px #CCC;
	}
	</style>
</head>
<script type="text/javascript">
var arr = new Array();
var arrname = new Array();
var form = new FormData();
$(function (){
	
	$('body',parent.document).find('.middle_left_1').css("display","block");
	$('body',parent.document).find('.middle_right_big').css("display","block");
	$('body',parent.document).find('.middle_right').css("width","");
	$('body',parent.document).find('.middle_right iframe').css("width","650px");
	
	
	$(".ke-content div").eq(0).attr("id","test");
});
	function show(){
		$.ajax({
	   		"url":"${pageContext.request.contextPath}/logAct/show",//请求的url
	   		"type":"GET",   // 请求方式
	   		"dataType":"json",	  // 响应回来的数据格式
	   		//回调函数，当本次请求成功时调用此方法
	   		"success":function(result){
	   			var content = "";
	   			if(result.log=="")
	   				{
	   				content+="<div id='rizhi' style='padding-top: 40px'>"
	   				content +="您还没有日志，快去";
	   				content +="<a href='${pageContext.request.contextPath}/logAct/mylog'>写日志</a>"
	   				content +="吧";
	   				content+="</div>"
	   				$("#s1").html(content);
	   				}else{
	   					
	   					
	   				
	   				 	
	   				 content +="<table  >";
	   				 		content += "<tr>";
							content += "<td style='font-size:15px;margin-left:15px;'  > " +"标题"+ "</td>";
							content += "<td style='font-size:15px;padding-left:80px;'> " +"发布时间"+ "</td>";
							content += "<td style='font-size:15px;padding-left:80px;' > " +"管理"+ "</td>";
							content += "</tr>";
	   				 	//循环方法 
	   				 	 var dd="";
	   				 	$.each(result.log,function(i,LogAct){	  			
							content += "<tr>";
							content += "<td style='margin-left:15px;padding-top:16px;font-size: 15px'  id='biaoti'  value='"+LogAct.logId+"'>";
							content +="<a  href='#'> "+LogAct.logTitle+ "</a>";
							content +="</td>";
							content += "<td id='logTitle'  style='display:none' value='"+LogAct.logTitle+"'> " +LogAct.logTitle+ "</td>";
							content += "<td id='logContent' style='display:none' value='"+LogAct.logContent+"'> " +LogAct.logContent+ "</td>";
							/* content +="<td value='"+LogAct.logcreateTime+"'>";
							content +="<fmt:formatDate value='"+${LogAct.logcreateTime}+"' type='both' />";
							content +="</td>"; */
							content += "<td style='padding-left:80px;padding-top:16px;font-size: 15px' value='"+LogAct.logcreateTime+"'> " +LogAct.logcreateTime+ "</td>";  	
							content +="<td>" 
							content += "<div style='padding-left:80px' class='button-group'>";
							content += "<a  id='update' type='button' class='button border-main am-btn am-btn-secondary' href='#'>";
							content += "<span class='icon-edit'>";
							content += "</span>";
							content += "修改";
							content += "</a>";
							content +="     ";
							content += "<a   id='delete' type='button'  class='button border-red am-btn am-btn-danger' href='#' >";
							content += "<span class='icon-trash'>";
							content += "</span>";
							content += "删除";
							content += "</a>";
							content += "</td>";
							content += "</div>";
							content +="</table>"

						}); 
						
						$("#s1").html(content);
	   				}
	   				 }
	   		});
	}
	show();
//点击标题显示其详细信息
		$(document).on("click","#biaoti",function(){
			$("#s1 tr").removeClass("high")
	   		var b=$(this).siblings().parents("tr").addClass("high");
	   		var tds = $(".high").find("td");
	   		var logId=tds.eq(0).attr("value");
		$.ajax({
	   		"url":"${pageContext.request.contextPath}/logAct/showme",//请求的url
	   		"type":"GET",   // 请求方式
	   		"dataType":"json",	  // 响应回来的数据格式
	   		"data":{"logId":logId},//发送到服务器的数据 
	   		//回调函数，当本次请求成功时调用此方法
	   		"success":function(result){
	   				 	var content = "<div style='text-align:center;margin-top:80px;'>";
	   				 		content += "<p style='font-size:26px; font-family:'微软雅黑';'>"+result.logact.logTitle+"</p>";
							content += "</div>";
							content +="<div style='margin-top:30px;text-align:left;margin-left:20px;margin-right:20px;'>"
							content +="<p style='font-size:15px;line-height:40px;text-indent:20px;letter-spacing:3px;'>"+result.logact.logContent+"</p>";
							content +="</div>"
							//content +="<p style='text-align:left;margin-top:80px;margin-left:20px; font-size:13px;font-weight:bold;'>我的日志评论</p>";
						$("#s1").html(content);
	   				 }
	   		});
		});	
//删除日志
$(document).on("click","#delete",function(){
		$("#s1 tr").removeClass("high")
		var b=$(this).siblings().parents("tr").addClass("high");
		var tds = $(".high").find("td");
		var logId=tds.eq(0).attr("value");
		if(window.confirm('您确定要删除吗?')){
		$.ajax({
	   		"url":"${pageContext.request.contextPath}/logAct/delete",//请求的url
	   		"type":"GET",   // 请求方式
	   		"dataType":"json",	  // 响应回来的数据格式
	   		"data":{"logId":logId},//发送到服务器的数据 
	   		//回调函数，当本次请求成功时调用此方法
	   		"success":function(result){
	   			layer.msg("删除成功");
	   				 	show();
	   				 }
	   		});
		}
		});	
//进入修改界面
$(document).on("click","#update",function(){
	$("#s1 tr").removeClass("high")
	var b=$(this).siblings().parents("tr").addClass("high");
	var tds = $(".high").find("td");
	var logId2=tds.eq(0).attr("value");
	var logTitle2=tds.eq(1).attr("value");
	var logContent2=tds.eq(2).attr("value");
/* 	var content="";
	content+="<div class='box1'>"; 
	content+="<div class='boxcenter' id='boxcenter'>";
	content+="<div class='boxc_t'>随便写点吧...</div>";
	content+="<input maxlength='15'  class='boxc_a' contenteditable='true' style='text-align: center;width:620px; height:25px;margin-left:4px;margin-bottom: 5px ' id='logTitle100' type='text'>"; 
	content+="<div id='textarea'>"; 
	content+="<textarea name='content' id='logContent100' style='height:200px;visibility:hidden;'>";	
	content +"</textarea>";
	content+="</div> ";
	content+="</div>";
	content+="</div> ";*/
	$("#s1").html("<input type='text' id='logId' style='display: none;' value='"+logId2+"'>");
	$(".boxcenter").attr("style","");
	$("#logTitle").val(logTitle2);
	$(".ke-edit-iframe").contents().find(".ke-content").html(logContent2);
	$("#s8").html(content);	
});
//修改日志
$(document).on("click","#tijiao",function(){
	var logTitle=$("#logTitle").val();
	//var logContent=$(".ke-edit-iframe").contents().find(".ke-content").html();
	var logId=$("#logId").val();
	//获得地址
	var url = window.location.origin;
	var filename =  $("#tofile").val().split('\\').pop();
	
	var con = "";
	var newlogContent =  logContent=$(".ke-edit-iframe").contents().find(".ke-content").html();
	
	 $(".ke-edit-iframe").contents().find(".preview").each(function(i) {
		if($(this).attr("class") == "preview") {
			newlogContent=newlogContent.replace($(this).attr("src"),  window.location.origin+'/maven-qqzone/imgs/'+arrname[i]);
		}
	}); 
		if(logTitle == "" || newlogContent=="<br>")	{		
			layer.msg("写点什么吧");
	}else{
		$.ajax({
	   		"url":"${pageContext.request.contextPath}/logAct/update",//请求的url
	   		"type":"GET",   // 请求方式
	   		"dataType":"json",	  // 响应回来的数据格式
	   		"data":{"logId":logId,"logContent":logContent,"logTitle":logTitle},//发送到服务器的数据 
	   		//回调函数，当本次请求成功时调用此方法
	   		"success":function(result){
	   			layer.msg("修改成功");
	   			$(".boxcenter").attr("style","display: none");
	   			var xhr = new XMLHttpRequest();
	   		    xhr.open("post", "${pageContext.request.contextPath}/logAct/shangchuan", true);
	   		    xhr.onload = function () {
	   		    	window.location.href="${pageContext.request.contextPath}/logAct/golog";
	   		    };
	   		    xhr.send(form);
	   				 }
	   		});
		
	}

});
//点击上传
$(document).on("click","#shangchuan",function(){
	$("#tofile").click();
});
//点击取消
$(document).on("click","#quxiao",function(){
	$(".boxcenter").attr("style","display: none");
	show();
});
function setImagePreview() {
	var fileObj = document.getElementById("tofile");
	var con = "";
	$(fileObj.files).each(function(i) {
						con += '<img class="preview'+ '" width="130px" height="100px" style="block" src="'+ window.URL.createObjectURL(fileObj.files[i])+ '" />';
								arr.push(window.URL.createObjectURL(fileObj.files[i]));
								arrname.push(fileObj.files[i].name);
						form.append("files",fileObj.files[i]);
	});
	$(".ke-edit-iframe").contents().find(".ke-content").append(con);
	//$("#textarea").append(con);
	return true;
}
</script>
<!-- style="background-image: url('http://qzs.qzone.qq.com/qzone/space_item/orig/9/81177_bg.jpg');" -->
<body  >
<div id="panel-all"> 
		<div class="panel" id="aa" style="margin: auto;">
			<div class="panel-heading" style="height: 50px;padding-top: 15px;">
			 	  <span><a style="font-size:16px; color:#666666" href="${pageContext.request.contextPath}/logAct/golog">我的日志</a></span>
			  	 <!--  <li><a href="javascript:loghome();">我的日志</a></li> -->
			  	  <a style="font-size:16px;;margin-left: 20px;color:#666666;" href="${pageContext.request.contextPath}/logAct/mylog">写日志</a>
			  	 <!--  <a style="margin-left: 20px;color:#666666 " href="javascript:sayqiang();">日志墙</a>  -->
			</div>
		</div>
	</div>
  <table style=" width: 100%;"  id="s1" class="table table-hover text-center"  >
  </table>
 <div style="padding-top: 20px;" class="box1">
		<div class="boxcenter" id="boxcenter" style="display: none;">
			<div class="boxc_t">随便写点吧...</div>
			<input maxlength="15"  class="boxc_a" contenteditable="true" style="text-align: center;width:620px; height:25px;margin-left:4px;margin-bottom: 5px " id="logTitle" type="text" > 
			 <div id="textarea">
				<textarea name="content" id="logContent" style="text-indent:20px;height:200px;visibility:hidden;"></textarea>
			</div>
			<form enctype="multipart/form-data" method="post" id="myform" action="${pageContext.request.contextPath}/logAct/shangchuan">
			<div style="float: left ;">
			<input class="am-btn am-btn-secondary"  style= float:left;margin-left:4px;margin-top:10px;' type="button" value="直接发表" id="tijiao">
			<input class="am-btn am-btn-danger" style='float:left;margin-left:4px;margin-top:10px;' type="button" value="取消" id="quxiao">
			<input class="am-btn am-btn-secondary" style='margin-left:4px;margin-top:10px;' type="button" value="上传图片" id="shangchuan">
			<input style='float:right;display: none;' type="file" id="tofile" name="files"   multiple="multiple"  accept="image/*"  class="filePrew " 
			 onchange="javascript:setImagePreview();" />
			</div> 
			</form>
	    </div>
</div> 
</body>
</html>