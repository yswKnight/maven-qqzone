<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>QQzone,我的日志</title>
    
	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="js/layer/layer.js"></script>
	<link rel="stylesheet" href="css/mylog.css" type="text/css"></link>
	<script type="text/javascript" src="js/kindeditor-min.js"></script>
	<script type="text/javascript" src="js/lang/zh_CN.js"></script>
	<link rel="stylesheet" href="themes/default/default.css" type="text/css"></link>
	<script type="text/javascript" src="js/emoticons.js"></script>
	<script type="text/javascript" src="js/writer.js"></script>
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/amazeui.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/zui.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/normalize.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/zui.min.css" type="text/css"></link>
	<link rel="stylesheet" href="dist/css/normalize.css" type="text/css"></link>
	<style> 
		
	</style>
	<!--ajax代码-->
</head>
<script type="text/javascript">
	var arr = new Array();
	var arrname = new Array();
	var form = new FormData();
	$(function (){
		$(".ke-content div").eq(0).attr("id","test");
	});
	
//添加日志
$(document).on("click","#tijiao",function(){
	var logTitle=$("#logTitle").val();
	
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
	   		"url":"${pageContext.request.contextPath}/logAct/add",//请求的url
	   		"type":"GET",   // 请求方式
	   		"dataType":"json",	  // 响应回来的数据格式
	   		"data":{"logTitle":logTitle,"logContent":newlogContent},//发送到服务器的数据 
	   		//回调函数，当本次请求成功时调用此方法
	   		"success":function(result){
	   			layer.msg("添加成功");
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
	window.location.href="${pageContext.request.contextPath}/logAct/golog";
});

function setImagePreview() {
	var fileObj = document.getElementById("tofile");
	var con = "";
	$(fileObj.files).each(function(i) {
						con += '<img class="preview'+ '" width="130px" height="100px" style="block" src="'+ window.URL.createObjectURL(fileObj.files[i])+ '" />';
								arr.push(window.URL.createObjectURL(fileObj.files[i]));
								arrname.push(fileObj.files[i].name);
						//火狐下，直接设img属性 
						//imgObjPreview.style.display = 'block';
						//imgObjPreview.style.width = '100px';
						//imgObjPreview.style.height = '40px';
						//imgObjPreview.src = docObj.files[0].getAsDataURL();
						//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
						//imgObjPreview.src = window.URL.createObjectURL(fileObj.files[i]);
						form.append("files",fileObj.files[i]);
	});
	$(".ke-edit-iframe").contents().find(".ke-content").append(con);
	//$("#textarea").append(con);
	return true;
}

</script>
<body>
	<div id="panel-all"> 
		<div class="panel" id="aa">
			<div class="panel-heading">
			 	  <ul>
			 	  <li><a href="${pageContext.request.contextPath}/logAct/golog">我的日志</a></li>
			  	 <!--  <li><a href="javascript:loghome();">我的日志</a></li> -->
			  	  <li><a href="javascript:mylog();">写日志</a></li>
			  	  <!-- <li><a href="javascript:sayqiang();">日志墙</a></li>  -->
				  </ul>
			</div>
		</div>
	</div>
	<div class="box1">
		<div class="boxcenter" id="boxcenter">
			<div class="boxc_t">随便写点吧...</div>
			<input maxlength="15"  class="boxc_a" contenteditable="true" style="text-align: center;width:620px; height:25px;margin-left:4px;margin-bottom: 5px " id="logTitle" type="text"> 
			<!-- <div id="textarea"   style="margin-top:10px;text-indent:18px; overflow-y:scroll;float: left;word-break:break-all;width:625px;height:300px;border:1px solid #C0C0C0"  class="content" contenteditable="true">adssadasdasda</div>  -->  
			<!-- <div id="haha" class="boxc_a" contenteditable="true" title="写个标题吧..." style="text-align: center;"></div><br> -->
			 <div id="textarea">
				<textarea name="content" id="logContent" style="text-indent:20px;height:200px;visibility:hidden;"></textarea>
				<!-- <textarea name="content" style="text-indent:20px;"   rows="10" cols="83" id="logContent"></textarea> -->
			</div> 
			<form enctype="multipart/form-data" method="post" id="myform" action="${pageContext.request.contextPath}/logAct/shangchuan">
			<!-- <div style="float: left"> -->
			<input class="am-btn am-btn-secondary" style='margin-left:4px;margin-top:10px;' type="button" value="直接发表" id="tijiao">
			<input class="am-btn am-btn-danger" style='margin-left:4px;margin-top:10px;' type="button" value="取消" id="quxiao">
			<input class="am-btn am-btn-secondary" style='margin-left:4px;margin-top:10px;' type="button" value="上传图片" id="shangchuan">
			<input style='float:right;display: none;' type="file" id="tofile" name="files"   multiple="multiple"  accept="image/*"  class="filePrew " 
			 onchange="javascript:setImagePreview();" />
			</form>
			<div style="float: left" id="localImag"></div>
			<!-- <input type="button" name="getHtml" value="直接发表" id="getHtml"/><br> -->
			<div class="boxc_u" style="display: none;">${user.userid}</div> 
			  
	    </div>
	   <%--  <div id="log">
	   		<div class="panel">
	      		<div id="show" style="display: none;">
	      			<table style="width: 625px;margin-left: 2px;border: 1px solid white;">
				      	<tr>
					      	<td rowspan="2" width="50px;"><img src="${user.userimg}" style="width:50px;height:50px;" class="Img-circle"></td>
					      	<td><div id="uname">${user.username}</div></td> 
					      	<td></td>
				      	</tr>
				      	<tr>
					      	<td><div id="logdate"></div></td>
					      	<td><div class="pc">来自土豪金版iPhone6</div></td>
				      	</tr>
			      		<tr>
			      			<td colspan="3"><hr style="border-color: #d9d9d9;"></td>
			      		</tr>
				      	<tr>
				      		<td></td>
					      	<td colspan="2"><a href="" id="logtitle"></a></td>
				      	</tr>
				      	<tr>
					      	<td></td>
					      	<td colspan="2"><span id="logtext"></span></td>
				      	</tr>
				      	<tr align="left">
				      		<td colspan="3"><div  style="border-bottom:1px solid #d5d5d5;padding: 5px;"></div></td>
				      	</tr>
				      	<tr height="30px;">
				      		<td></td> 
				      		<td colspan="2">
				      		<div id="log-suan">
				      		<span><img src="img/zan.png">赞(12)</i></span>&nbsp;
				      		<span><img src="img/shoucang.png">收藏(0)</i></span>&nbsp;
				      		<span><img src="img/zhuanzai.png">转发(12)</i></span>
				      		</div></td>
				      	</tr>
	      			</table>
	      		</div>
	      		<div id="nolog" style="margin: auto;display: none;width: 200px;height:40px;font-size: 14px;color: #333333"></div> 
	   		</div>   
	   </div> --%>  
	</div>
	
    <div id="showMyLog"  >
		
    </div>
    <div id="showOne">
		
    </div>
	<script type="text/javascript">
		//预加载
		$(function(){
			//加载菜单
			shouMenu();
			selectlog();
		});
		//隐藏Div(====此代码不能放进js文件中，否则代码无法正常加载===)
		function hideDiv(){
			$(".box1").hide();
			$("#showMyLog").hide();
			$("#showOne").hide();
		}
	</script>  
</body>
</html>
