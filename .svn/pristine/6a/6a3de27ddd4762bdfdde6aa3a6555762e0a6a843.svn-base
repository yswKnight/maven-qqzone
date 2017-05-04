<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的说说</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mysay.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/zui.css" type="text/css"></link>
<!-- emoji -->
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/underscore-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/editor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/emojis.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/emoticons.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/emoji.css">
<!-- end emoji  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
<style> 
 .fileInputContainer{
        /*height:256px;*/
        background:url(img/phot.png);
        position:relative;
        width: 256px;
    }
    .fileInput{
       /* height:256px;*/
        font-size:12px;
        position:absolute;
        right:0;
        top:0;
        opacity: 0;
        filter:alpha(opacity=0);
        cursor:pointer;
    }
</style>
</head>
<body>
  <div id="all">
  <div id="all_log">
  <ul><li><br><a href="javascript:sayhome();">说说首页</a></li>
  	  <li><br><a href="javascript:sayfa();">发表说说</a></li>
  </ul>
  </div>
  <hr>
  <div class="box">
<!--内容发布区域-->
	<div class="boxcenter">
		<form id="Sayfrom" action="" method="post"  enctype="multipart/form-data" >
			<div class="boxc_t">随便说点什么吧...</div>
			<div>
				<textarea name="saycontent" id="saycontent" 
				 style="margin-left: 15px;
						margin-top: 10px;
						width: 585px;
						height: 80px;
						border: 1px solid #D9D9D9;
						font-size: 16px; 
						resize: none" 
						></textarea>
			</div>
			<div id="emoji"  class="emoji-container">
	        	<img src="${pageContext.request.contextPath}/img/qq.png"   class="emoji-tbtn"  />
	   	    </div>
	        <div id="div1" >
	        <a><img src="${pageContext.request.contextPath}/img/phot.png" id="phot" /></a> 
	        </div>
	        <div class="fileInputContainer">
	    	<input class="fileInput" type="file" name="files"   multiple="multiple"  id="file"  onchange="javascript:setImagePreviews();"  />
		    </div>
		    <input type="submit" class="boxc_b"  style="background-color: #66CCFF; color: #fff;"  value="发布" id="savebtn"/>
	    </form>
	</div>
	<div id="photo"  style="width:200px ; margin-left:2px; border: 0px solid black ;height: 170px; display: none"></div>
<!--时光轴线-->
	<div class="timeline" style="margin: 20px  0px;">
		<div class="nextbox"></div><!-- 显示的 -->
</div>

<div id="sayhome" style="display: none;"></div>
<div id="sayqiang" style="display: none;"></div>
<div  id="uuserid"  style="display: none" >${sessionScope.loginUser.userid }</div>
<div  id="urealname"  style="display: none;">${sessionScope.loginUser.realname }</div>
<div  id="uimg" style="display: none;">${sessionScope.loginUser.img }</div>
</div>
</div>
 </body>
 <script type="text/javascript">
// 表情
$(function(){
	console.log($('#emoji'));
  var em = $('#emoji').emoji({
     insertAfter: function(item){
        $('#area').insertContent('[:'+item.name+':]')
      }
   });
})

 //表情end
 function setImagePreviews(avalue) {
	 $('#photo').show();
		var docObj = document.getElementById("file");
		var dd = document.getElementById("photo");
		dd.innerHTML = "";
		var fileList = docObj.files;
		for (var i = 0; i < fileList.length; i++) {
			dd.innerHTML += "<div style='float:left; margin-left:10px;margin-top:15px' > <img id='img" + i + "' /> </div>";
			var imgObjPreview = document.getElementById("img" + i);
			if (docObj.files && docObj.files[i]) {
				//火狐下，直接设img属性
				imgObjPreview.style.display = 'block';
				//控制缩略图大小
				imgObjPreview.style.width = '188px';
				imgObjPreview.style.height = '150px';
				//imgObjPreview.src = docObj.files[0].getAsDataURL();
				//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
				imgObjPreview.src = window.URL.createObjectURL(docObj.files[i]);
			} else {
				//IE下，使用滤镜
				docObj.select();
				var imgSrc = document.selection.createRange().text;
				alert(imgSrc)
				var localImagId = document.getElementById("img" + i);
				//必须设置初始大小
				localImagId.style.width = "188px";
				localImagId.style.height = "150px";
				//图片异常的捕捉，防止用户修改后缀来伪造图片
				try {
					localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
					localImagId.filters
							.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
				} catch (e) {
					alert("您上传的图片格式不正确，请重新选择!");
					return false;
				}
				imgObjPreview.style.display = 'none';
				document.selection.empty();
			}
		}
		return true;
	}
 
 
 $(document).ready(function(){
	 
		 listSay();
	 	$('body',parent.document).find('.middle_left_1').css("display","block");
		$('body',parent.document).find('.middle_right_big').css("display","block");
		$('body',parent.document).find('.middle_right').css("width","650px");
		$('body',parent.document).find('.middle_right iframe').css("width","650px");
	 
 });
	  /*发布说说*/
	   $("body").on("click","#savebtn", function(){
    	 var sayContent=$("#saycontent").val();
    	//alert(sayContent);
    	 if (sayContent== null|| sayContent == "") {
				alert("内容不能为空~！");
				return false;
			} else {
				$("#Sayfrom").attr("action","${pageContext.request.contextPath }/say/saveSay");
		    	$("#Sayfrom").submit();
			}
     }); 

	  //发布成功后将其输入框清空
	  function reset(){
		  $("#contenter").text("");
	  }
	  /*查看说说*/
	   function listSay(){
		 var userId=$("#uuserid").text();
		 var uimg=$("#uimg").text();
		//alert(uimg);
		 $.post("${pageContext.request.contextPath}/say/listSayForId",{ "userid": userId } ,function(res){
			 var content="";
			 $.each( res.ssay, function(i, say){
				//alert(say.sayid);
				 $.post("${pageContext.request.contextPath}/say/listSayImgForId",{ "sayid": say.sayid } ,function(result){
					 $.each( result.ssayImg, function(i, saay){
		    		content+="<table  border='0'>";
		    		content+="<tr style='display:none'><td><font id='ssayid'>"+say.sayid+"</font></td></tr>"
					content +="<tr><td><img src='${pageContext.request.contextPath}/${sessionScope.loginUser.img}' style='width:50px;height:50px; border-radius:10px;'>&nbsp;&nbsp;&nbsp;<span style='magin-left=20px; font-size:12px;color:#ababab;width:400px;'>"+say.saycreatetime+"</span>&nbsp;&nbsp;<span id='i'>来自QQzone客户端</span></td><td><a  style='cursor:pointer;'><i class='icon-trash' title='删除'   id='delete' sayid="+say.sayid+"></i></a></td></tr>"
					content +="<tr><td s>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 14px;color: #5d7895'>${sessionScope.loginUser.realname }</font>&nbsp;发表了说说:"+"<font style='magin-left:20px; font-size: 20px;'>"+say.saycontent+"</font></td></tr>"
					if(saay.photosrc!=""){
					content+="<tr><td height='150' width='630' >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='${pageContext.request.contextPath}/"+saay.photosrc+"' alt='#' height='200' width='200'></td></tr>"
					}else{
						content+="<tr><td width='630' ></td></tr>"
					}
					content+="</table>";
					 
		    		});
			  $(".nextbox").html(content);
				 });
			 });
		 });
	  } 
	 //删除说说
	 $("body").on("click","#delete", function(){
		 var said=$(this).attr("sayid");
		  layer.confirm('亲，您确定要删除说说吗?', {icon: 3, title:'删除'}, function(index){
			  $.post("${pageContext.request.contextPath}/say/deletesay",{"sayid":said},function(res){
					if(res.result=="success"){
						layer.msg("删除成功！",{icon: 1,time:1000});
						//listSay();
						window.location.href="${pageContext.request.contextPath}/say/tomysay";
					}else{
		    			layer.msg("删除失败！",{icon: 2,time:2000});
		    			listSay();
		    		}
			  },"json");
			  layer.close(index);
			});
     }); 
	  
	   
	  //js时间戳怎么转成日期格式
	   function getLocalTime(nS) {     
		   return new Date(parseInt(nS)).toLocaleString().replace(/:\d{1,1}$/,' ');     
		}   
	 
	


 </script>

</html>