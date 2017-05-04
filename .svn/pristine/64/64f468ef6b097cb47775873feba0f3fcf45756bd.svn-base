<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jQuery实现弹性TN3相册代码</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/photo/css/jq22.css"></link>
<link href="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/css/layui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/layui.js"></script>
<style type="text/css">
body {
	background-color: #ffffff;
}
.content-imgs {
	text-align: center;
	vertical-align:middle;
	line-height:400px;
}
</style>
</head>
<body>
<!-- 代码 开始 -->
<div id="content">
    <div class="content-imgs">
		<div class="content-imgs" style="height: 400px;" >
				<button class="layui-btn layui-btn-primary" id="previouspage">
    				<i class="layui-icon">&#xe603;</i>
  				</button>
	    		<img style="height: 400px;width: 500px;" class="show-photo-imgs" src=""/>
	    		<button class="layui-btn layui-btn-primary" id="nextpage">
    				<i class="layui-icon">&#xe602;</i>
  				</button>
		</div>
	</div>
			
    <div>
		<div class="comment-top"
			style=" height: 70px; background-color: #ffffff">
			<div style="width: 60px; height: 60px; margin: 5px; float: left;border: 1px solid #999999;" id="div-userimg" ><img style="height: 60px;width: 60px;" class="show-user-img" src=""/></div>
			<div id="div-p" style="height: 60px; margin: 5px; float: left; ">
				<p id="p-username" style="font-size: 16px; line-height: 40px;">用户昵称</p>
				<p id="p-date" style="font-size: 12px;">照片上传时间</p>
			</div>
		</div>
		<div class="comment" style="background-color: #ffffff">
			<div style="margin-bottom: 20px;">
  				<textarea class="layui-textarea" id="LAY_demo2" style="display: none"></textarea>
			</div>  
			<div class="site-demo-button" style="padding-bottom: 20px;">
				<button class="layui-btn layui-btn-primary" style="float: right; margin-right: 20px;" data-type="content">发表</button>
			</div>
		</div>
	</div>
</div>
<input type="hidden"  id="show-albumid" value="${albumid}" />
<input type="hidden"  id="show-photoid" value="${photoid}" />
<script src="${pageContext.request.contextPath}/js/photo/js/jquery.js"></script>
<script>

function DrawImage(ImgD, FitWidth, FitHeight) {  
	
    var image = new Image(); 
    
    image.src = ImgD.src;  
    
    if (image.width > 0 && image.height > 0) { 
    	
        if (image.width / image.height >= FitWidth / FitHeight) {  
            if (image.width > FitWidth) {  
                ImgD.width = FitWidth;  
                ImgD.height = (image.height * FitWidth) / image.width;  
            } else {  
                ImgD.width = image.width;  
                ImgD.height = image.height;  
            }  
        } else {  
            if (image.height > FitHeight) {  
                ImgD.height = FitHeight;  
                ImgD.width = (image.width * FitHeight) / image.height;  
            } else {  
                ImgD.width = image.width;  
                ImgD.height = image.height;  
            }  
        }  
    }
}

function oneshowimg(){
	
	$.ajax({
		url:"${pageContext.request.contextPath}/photo/getPhotoById",
		type: "POST",
		data: {'photoid':$("#show-photoid").val()},
		dataType: "json",
		success:function(data){

			$(".show-photo-imgs").attr("src","${pageContext.request.contextPath}/"+data.pcontent);
			/*
			$(".show-photo-imgs").each(function () {  
		        DrawImage(this, 500, 400);
		    });
			*/
			$("#p-date").html(getSmpFormatDateByLong(data.pcreatetime, false));
		},
		error:function(){
			alert("服务器异常啦~");
		}
	});
	
	$.ajax({
		url:'${pageContext.request.contextPath}/album/findUserByAlbumid',
		type:'POST',
		data:{'albumid':$("#show-albumid").val()},
		dataType:'json',
		success:function(result){
			$("#p-username").html(result.realname);
			$(".show-user-img").attr("src","${pageContext.request.contextPath}/"+result.img);
		},
		error:function(){
			
		}
	});
}

$(function() {
	
	oneshowimg();
	
	//上一张
	$("#previouspage").click(function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/photo/previousPage",
			type: "POST",
			data: {'photoid':$("#show-photoid").val(),'albumid':$("#show-albumid").val()},
			dataType: "json",
			success:function(data){
				$("#show-photoid").val(data.photoid);
				$(".show-photo-imgs").attr("src","${pageContext.request.contextPath}/"+data.pcontent);
				$("#p-date").html(getSmpFormatDateByLong(data.pcreatetime, false));
			},
			error:function(){
				alert("服务器异常啦~");
			}
		});
	});
	//下一张
	$("#nextpage").click(function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/photo/nextPage",
			type: "POST",
			data: {'photoid':$("#show-photoid").val(),'albumid':$("#show-albumid").val()},
			dataType: "json",
			success:function(data){
				$("#show-photoid").val(data.photoid);
				$(".show-photo-imgs").attr("src","${pageContext.request.contextPath}/"+data.pcontent);
				$("#p-date").html(getSmpFormatDateByLong(data.pcreatetime, false));
			},
			error:function(){
				alert("服务器异常啦~");
			}
		});
	});
	
    
	
});


layui.use('layedit', function(){
	
	  var layedit = layui.layedit
	  ,$ = layui.jquery;
	  
	  //自定义工具栏
	  var index = layedit.build('LAY_demo2', {
	    tool: ['face', 'link', 'unlink', '|', 'left', 'center', 'right']
	    ,height: 100
	  })
	  
	  //构建一个默认的编辑器
	  //var index = layedit.build('LAY_demo2');
	  
	  //编辑器外部操作
	  var active = {
	    content: function(){
	      alert(layedit.getContent(index)); //获取编辑器内容
	    }
	    ,text: function(){
	      alert(layedit.getText(index)); //获取编辑器纯文本内容
	    }
	    ,selection: function(){
	      alert(layedit.getSelection(index));
	    }
	  };
	  
	  $('.layui-btn-primary').on('click', function(){
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	  });
	  
});

Date.prototype.format = function (format) {  
    var o = {  
        "M+": this.getMonth() + 1,  
        "d+": this.getDate(),  
        "h+": this.getHours(),  
        "m+": this.getMinutes(),  
        "s+": this.getSeconds(),  
        "q+": Math.floor((this.getMonth() + 3) / 3),  
        "S": this.getMilliseconds()  
    }  
    if (/(y+)/.test(format)) {  
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));  
    }  
    for (var k in o) {  
        if (new RegExp("(" + k + ")").test(format)) {  
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));  
        }  
    }  
    return format;  
}  
/**   
*转换日期对象为日期字符串   
* @param date 日期对象   
* @param isFull 是否为完整的日期数据,   
*               为true时, 格式如"2000-03-05 01:05:04"   
*               为false时, 格式如 "2000-03-05"   
* @return 符合要求的日期字符串   
*/    
function getSmpFormatDate(date, isFull) {  
    var pattern = "";  
    if (isFull == true || isFull == undefined) {  
        pattern = "yyyy-MM-dd hh:mm:ss";  
    } else {  
        pattern = "yyyy-MM-dd";  
    }  
    return getFormatDate(date, pattern);  
}  
/**   
*转换当前日期对象为日期字符串   
* @param date 日期对象   
* @param isFull 是否为完整的日期数据,   
*               为true时, 格式如"2000-03-05 01:05:04"   
*               为false时, 格式如 "2000-03-05"   
* @return 符合要求的日期字符串   
*/    

function getSmpFormatNowDate(isFull) {  
    return getSmpFormatDate(new Date(), isFull);  
}  
/**   
*转换long值为日期字符串   
* @param l long值   
* @param isFull 是否为完整的日期数据,   
*               为true时, 格式如"2000-03-05 01:05:04"   
*               为false时, 格式如 "2000-03-05"   
* @return 符合要求的日期字符串   
*/    

function getSmpFormatDateByLong(l, isFull) {  
    return getSmpFormatDate(new Date(l), isFull);  
}  
/**   
*转换long值为日期字符串   
* @param l long值   
* @param pattern 格式字符串,例如：yyyy-MM-dd hh:mm:ss   
* @return 符合要求的日期字符串   
*/    

function getFormatDateByLong(l, pattern) {  
    return getFormatDate(new Date(l), pattern);  
}  
/**   
*转换日期对象为日期字符串   
* @param l long值   
* @param pattern 格式字符串,例如：yyyy-MM-dd hh:mm:ss   
* @return 符合要求的日期字符串   
*/    
function getFormatDate(date, pattern) {  
    if (date == undefined) {  
        date = new Date();  
    }  
    if (pattern == undefined) {  
        pattern = "yyyy-MM-dd hh:mm:ss";  
    }  
    return date.format(pattern);  
} 
</script>
<!-- 代码 结束 -->

</body>
</html>
