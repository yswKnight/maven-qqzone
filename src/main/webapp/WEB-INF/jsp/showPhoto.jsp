<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"   prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/css/layui.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/upload/css/imgcss/demo.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/upload/css/imgcss/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/upload/css/imgcss/elastislide.css" />
		<noscript>
			<style>
				.es-carousel ul{
					display:block;
				}
			</style>
		</noscript>
		<script id="img-wrapper-tmpl" type="text/x-jquery-tmpl">	
			<div class="rg-image-wrapper">
				{{if itemsCount > 1}}
					<div class="rg-image-nav">
						<a href="#" class="rg-image-nav-prev">Previous Image</a>
						<a href="#" class="rg-image-nav-next">Next Image</a>
					</div>
				{{/if}}
				<div class="rg-image"></div>
				<div class="rg-loading"></div>
				<div class="rg-caption-wrapper">
					<div class="rg-caption" style="display:none;">
						<p></p>
					</div>
				</div>
			</div>
		</script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/layui.js"></script>
<script type="text/javascript">

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

layui.use('flow', function(){
	
	  var flow = layui.flow;
	  
	  //按屏加载图片
	  flow.lazyimg({
	    elem: '#LAY_demo3 img'
	    ,scrollElem: '#LAY_demo3' //一般不用设置，此处只是演示需要。
	  });
	  
});

function showimgs(){
	
	//加载照片信息
	$.ajax({
		url:"${pageContext.request.contextPath}/photo/getphotos",
		type: "POST",
		data: {'albumid':$("#albumid").val()},
		dataType: "json",
		success:function(data){
			var con="";

			$.each(data,function(i,photo){
				
				/*//alert(i);
				con += "<div class='img-open'><img layer-pid='photo"+i+"'";
				con += "layer-src='${pageContext.request.contextPath}/"+photo.pcontent+"'";
				con += "src='${pageContext.request.contextPath}/"+photo.thumbanil+"'";
				con += "alt='"+photo.pname+"' /></div>";
				*/
				con += '<div class="img-open" style="background-image:url(${pageContext.request.contextPath}/'+photo.thumbanil+');" >';
				con += '<input type="hidden" class="photoid-hidden" value="'+photo.photoid+'" /><div class="album-icon-delete" title="编辑或删除" style="display:none;border-radius:5px;" ><i class="layui-icon" >&#xe61a;</i></div>';
				con += '<div class="photos-name">'+photo.pname;
				con += '</div></div>';
			});
			$("#LAY_demo3").html(con);
			
			$(".img-open").mouseover(function(){
				var objphotoid=$(this).find(".photoid-hidden").val();
				var objImgs=$(this);
				$(this).find('.album-icon-delete').css("display","block");
				//$(this).find('.photos-name').css("display","block");
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
							layer.open({
								  type: 2,
								  title: '修改照片',
								  shadeClose: true,
								  shade: 0.3,
								  area: ['400px', '300px'],
								  offset: '100px',
								  content: '${pageContext.request.contextPath}/photo/goupdatephoto?id='+objphotoid, //iframe的url
								  end: function(index){
									  //location.href = "${pageContext.request.contextPath}/album/myalbum";
									  showimgs();
								  }
								}); 
						});
						
						//删除
						$("#album-delete").click(function(){
							layer.confirm('你确定删除吗？', {
								btn: ['确定', '取消'] //按钮
								,title: "删除信息"
								,time: 0 //不自动关闭
								,offset: '100px'
								}, function(index){
									//layer.close(index);
									$.ajax({
										url: "${pageContext.request.contextPath}/photo/deletephoto",
										type: "POST",
										data: {"photoid":objImgs.find(".photoid-hidden").val()},
										dataType: "json",
										success:function(result){
											if(result.status=="success"){
												layer.msg('删除成功', {icon: 1,offset: '100px'});
												layer.close(index);
												showimgs();
											}else{
												layer.alert('服务器异常啦~')
											}
										},
										error:function(){
											alert("服务器异常啦~");
										}
									});
								}, function(index){
									layer.close(index);
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
			}).mouseout(function(){
				$(this).find('.album-icon-delete').css("display","none");
				//$(this).find('.photos-name').css("display","none");
			});
			
			//alert("加载");
			layui.use([ 'layer', 'form' ], function() {
				
				/*
				//调用示例
				layer.photos({
					photos : '#LAY_demo3',
					anim : 5,//0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
					closeBtn : 1,
					//area : [ '600px', '300px' ],
					move: false,
					//offset: ['100px', '20px'],
					offset : '100px',
					//content: '${pageContext.request.contextPath}/album/newalbum', 
				});
				*/
				$(".img-open").click(function(){
					
					var photoid=$(this).find(".photoid-hidden").val();
					var albumid=$("#albumid").val();
					showuserphoto(photoid,albumid);
					showphotodate(photoid);
					
					//显示评论
					showphotoComment(photoid);
					
					$(".input-photoid").each(function(){
				        //alert(this.value);
				        if(this.value==photoid){
				        	//$(this).parent("a").parent("li").parent("ul").find("li").removeAttr("class");
				        	//$(this).parent("a").parent("li").attr("class", "selected");
				        	$(this).parent("a").parent("li").trigger("click");
				        }
				    });
					
					//alert($(".rg-image").find("img").attr("src", "${pageContext.request.contextPath}/imgs/temp/timg.gif"));
					
					var index=layer.open({
						  type: 1,
						  shade: false,
						  shadeClose: true,
						  shade: 0.3,
						  title: false, //不显示标题
						  area: ['1000px', '730px'],
						  offset : '50px',
						  content: $('.show-imgs-comments'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
						  success: function(layero, index){
							  //mouseup鼠标松开时事件
								$(".rg-image-nav-prev").click(function(){
									$(".input-photoid").parent("a").parent("li").parent("ul").find("li").each(function(){
										if($(this).attr("class")=="selected"){
											//alert($(this).find("a input").val());
											showphotodate($(this).find("a input").val());
											showphotoComment($(this).find("a input").val());
										}
										
									});
								});
								$(".rg-image-nav-next").click(function(){
									$(".input-photoid").parent("a").parent("li").parent("ul").find("li").each(function(){
										if($(this).attr("class")=="selected"){
											//alert($(this).find("a input").val());
											showphotodate($(this).find("a input").val());
											showphotoComment($(this).find("a input").val());
										}
										
									});
								});
						}
					});
					layer.style(index, {
						background: '#1F1F1F url(${pageContext.request.contextPath}/upload/css/images/pattern.png) repeat top left',
					}); 
					//layer.iframeAuto(index);
					//alert($(this).find("img").attr("src"));
					/*
					var index = layer.open({
						  type: 2,
						  title: false,
						  shadeClose: true,
						  shade: 0.3, 
						  move: false,
						  offset : '100px',
						  area: ['1000px', '700px'],
						  content:'${pageContext.request.contextPath}/photo/ceshiShow?albumid='+$("#albumid").val()+'&photoid='+$(this).find(".photoid-hidden").val(),//iframe的url
						  end: function(index){
							  //location.href = "${pageContext.request.contextPath}/album/myalbum";
							  showimgs();
						  }
						});  
					*/
					//layer.full(index);
					/*
					//$('#父窗口中的元素ID', parent.document).click();
					var index = layer.open({
						  type: 2,
						  title: false,
						  content: '${pageContext.request.contextPath}/photo/ceshiShow?albumid='+$("#albumid").val()+'&photoid='+$(this).find(".photoid-hidden").val(),
						  area: ['320px', '970px'],
						});
					layer.full(index);
					*/
				});
				/*
				layer.open({
					  type: 2,
					  title: '查看照片',
					  shadeClose: true,
					  shade: 0.3,
					  area: ['630px', '900px'],
					  offset: '100px',
					  content: '${pageContext.request.contextPath}/photo/ceshiShow', //iframe的url
					  end: function(index){
						  //location.href = "${pageContext.request.contextPath}/album/myalbum";
						  showAlbum();
					  }
					});  
				*/
				//alert("layer");
				
			});
		},
		error:function(){
			alert("服务器异常啦~");
		}
	});
}


	$(function() {
		
		showAlbumImgAndName($("#albumid").val());
		
		showimgs();
		
		$("#addphoto").click(function(){
			location.href = "${pageContext.request.contextPath}/photo/toaddPhoto?albumid="+$("#albumid").val();
		});
		
		$("#fanhui").click(function(){
			location.href = "${pageContext.request.contextPath}/album/myalbum";
			return false;
		});
		
		/*
		$(".selected").click(function(){
			alert();
		});
		*/
		
		$("#icon-face").mouseover(function(){
			$(this).html("&#xe650;");
			
		}).mouseout(function(){
			$(this).html("&#xe60c");
			
		});
		
		$(".photo-top-img-div").mouseover(function(){
			$(this).find(".photo-top-img-div1").css("display","block");
		}).mouseout(function(){
			$(this).find(".photo-top-img-div1").css("display","none");
			
		});
		$(".photo-top-img-div").click(function(){
			
			var index=layer.open({
				type: 2, 
				title:'设置相册封面',
				area: ['485px', '600px'],
				offset: '20px',
				content: '${pageContext.request.contextPath}/album/gocover?albumid='+$("#albumid").val(),
				end: function(index){
					showAlbumImgAndName($("#albumid").val());
				}
			});
			
		});
		

		
		$("a").click(function(){
			//alert();
			//alert($(this).find("input").val());
			showphotodate($(this).find("input").val());
			showphotoComment($(this).find("input").val());
		});
		
	});
	
	layui.use([ 'layer' ], function() {
		var layer = layui.layer;
		
	});
	
	//显示相册封面。名称
	function showAlbumImgAndName(albumid){
		$.ajax({
			url:'${pageContext.request.contextPath}/album/getAlbumById',
			type:'POST',
			data:{'albumid':albumid},
			dataType:'json',
			success:function(result){
				$(".photo-top-img").find(".photo-top-img-div").css("background-image","url(${pageContext.request.contextPath}/"+result.cover+")");
				$(".photo-top-name").find("label").html(result.albumName);
			},
			error:function(){
				alert("服务器错误~")
			}
		});
	}
	
	//照片上传时间
	function showphotodate(photoid){
		$.ajax({
			url:"${pageContext.request.contextPath}/photo/getPhotoById",
			type: "POST",
			data: {'photoid':photoid},
			dataType: "json",
			success:function(data){

				$("#p-date").html(getSmpFormatDateByLong(data.pcreatetime, false));
			},
			error:function(){
				alert("服务器异常啦~");
			}
		});
		
	}
	
	//查询该照片的评论回复
	//根据照片查动态
	//根据动态查评论回复
	function showphotoComment(photoid){
		$.ajax({
			url:"${pageContext.request.contextPath}/activity/showPhotoComment",
			type: "POST",
			data: {'photoid':photoid},
			dataType: "json",
			success:function(result){
				//alert(result);
				con ="";
				if(result==""){
					con +='<div style="font-size: 10pt;text-align: center; line-height: 40px;">暂时还没有评论哦！</div>';
				}else{
					$.each(result,function(i,comment){
						//评论
						if(comment.corder == 0){
							con +='<div style="float: left;">';
							findUserByUserid(comment.giveuser.userid);
							con +='<div style="width: 30px; height: 30px; margin: 10px; float: left;border: 1px solid #999999;"><img style="height: 30px;width: 30px;" src="${pageContext.request.contextPath}/'+$("#userimg-ajax").val()+'"/></div>';
							con +='<div class="com-p" style="margin-top:10px; float: left; width: 140px;">';
							con +='<p class="com-p-username" style="font-size: 14px;line-height: 20px;">';
							findUserByUserid(comment.giveuser.userid);
							con +='<a href="#" style="color: #2828ff">'+$("#username-ajax").val()+'</a>：';
							con +=comment.commcontent+'<i class="layui-icon" style="display: none;">&#xe611;</i>';
							con +='</p></div></div>';
							//检索回复
							$.each(result,function(i,com){
								if(comment.commid==com.comcommid){
									findUserByUserid(comment.adoptuser.userid);
									con +='<div style="float: left;"><div style="width: 30px; height: 30px; margin: 10px; float: left;border: 1px solid #999999;"><img style="height: 30px;width: 30px;" src="${pageContext.request.contextPath}/'+$("#userimg-ajax").val()+'"/></div>';
									con +='<div class="com-p" style="margin-top:10px; float: left; width: 140px;">';
									con +='<p class="com-p-username" style="font-size: 14px;line-height: 20px;">';
									
									findUserByUserid(com.adoptuser.userid);
									con +='<a href="#" style="color: #2828ff">'+$("#username-ajax").val()+'</a>回复-';
									
									findUserByUserid(com.giveuser.userid);
									con +='<a href="#" style="color: #2828ff">'+$("#username-ajax").val()+'</a>：'+com.commcontent;
									
									con +='<i class="layui-icon" style="display: none;">&#xe611;';
									con +='</i></p></div></div>';
								} 
							});
						}
					});
				}
				
				$("#show-comment").html(con);
				
				$(".com-p-username").mouseover(function(){
					$(this).find("i").css("display","inline");
					
				}).mouseout(function(){
					$(this).find("i").css("display","none");
					
				});
			},
			error:function(){
				alert("服务器异常啦~");
			}
		});
		
	}
	
	//显示照片用户。头像.
	function showuserphoto(photoid,albumid){
		$.ajax({
			url:'${pageContext.request.contextPath}/album/findUserByAlbumid',
			type:'POST',
			data:{'albumid':albumid},
			dataType:'json',
			success:function(result){
				$("#p-username").html(result.realname);
				$(".show-user-img").attr("src","${pageContext.request.contextPath}/"+result.img);
			},
			error:function(){
				
			}
		});
		
		//加载大照片
		$.ajax({
			url:'${pageContext.request.contextPath}/photo/getPhotoById',
			type:'POST',
			data:{'photoid':photoid},
			dataType:'json',
			success:function(result){
				$(".rg-image").find("img").attr("src", "${pageContext.request.contextPath}/"+result.pcontent);
			},
			error:function(){
				
			}
		});
	}
	
	//根据用户ID查询用户
	function findUserByUserid(userid){
		$.ajax({
			url:"${pageContext.request.contextPath}/user/find",
			type: "POST",
			data: {'userid':userid},
			dataType: "json",
			async: false,
			success:function(data){
				$("#username-ajax").val(data.a.realname);
				$("#userimg-ajax").val(data.a.img);
			},
			error:function(){
				alert("服务器异常啦~");
			}
		});
	}
	
</script>

<style type="text/css">

body{
             -moz-user-select:none; /*火狐*/
             -webkit-user-select:none; /*webkit浏览器*/
             -ms-user-select:none; /*IE10*/
             -khtml-user-select:none; /*早期浏览器*/
             user-select:none;
             background-color: #ffffff; 
}
.photo-top {
	margin-top: -15px;
}

.site-demo-flow {
	margin: 10px;
	border: 1px solid #999999;
	width: 1020px;
	height: 500px;
	overflow-y:auto;
}

.site-demo-flow .img-open{
	margin: 10px;
	border: 1px solid #999999;
	width: 120px;
	height: 120px;
	float: left;
	cursor:pointer;
	border-radius:5px;
	background-size:120px 100px;
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
.photos-name {
	background-color: #ffffff;
	height: 20px;
	text-align: center;
	margin-top: 100px;
	display:block;                     /*内联对象需加*/
	width:120px;
	word-break:keep-all;           /* 不换行 */
	white-space:nowrap;          /* 不换行 */
	overflow:hidden;               /* 内容超出宽度时隐藏超出部分的内容 */
	text-overflow:ellipsis;         /* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/
}
.com-p-username a:hover{
	text-decoration: underline;
}

.photo-top-img-div1 {
	background:rgba(0,0,0,0.5);
	color: #ffffff;
	text-align: center;
	top:60px;
	position:relative;
	display: none;
}

/* 设置滚动条宽度 */
::-webkit-scrollbar{width:2px;}

</style>
</head>
<body>
<div style="color:#000000">
  	 <input type="hidden" id="albumid" value="${albumid}" />
    <br>
    		<div class="photo-top">
    		
    			<div class="photo-top-img" style="float: left;margin: 0px 10px 10px 10px; padding: 2px;border: 1px solid #999999;" >
    				<div class="photo-top-img-div" style="width: 76px;height: 76px;background-size:76px 76px;cursor:pointer;">
    					<div class="photo-top-img-div1">设置封面</div>
    				</div>
    			</div>
				<div class="photo-top-addbtn">
					<div class="photo-top-name" style="font-size: 22pt;margin-top: 10px;">
						<label>相册名称</label>
					</div>
					<div class="photo-top-btn" style="margin-top: 10px;">
						<button id="addphoto" class="layui-btn layui-btn-primary" style="">上传图片</button>
						<button id="fanhui" class="layui-btn layui-btn-primary" style="">返回相册</button>
					</div>
				</div>


			</div>
			
			<div class="site-demo-flow" id="LAY_demo3">
		
			</div>
			
</div>
</body>
<input id="username-ajax" type="hidden" >
<input id="userimg-ajax" type="hidden" >
<div class="show-imgs-comments" style="display:none;margin-top: 10px;">

		<div class="container" style="width: 750px;float: left;">
			<div class="content">
				
				<div id="rg-gallery" class="rg-gallery">
					<div class="rg-thumbs">
						<!-- Elastislide Carousel Thumbnail Viewer -->
						<div class="es-carousel-wrapper">
							<div class="es-nav">
								<span class="es-nav-prev">Previous</span>
								<span class="es-nav-next">Next</span>
							</div>
							<div class="es-carousel" id="es-carousel-show-imgs">
								<ul>
								<c:forEach var="photo" items="${photos}">
									<li><a href="#"><img src="${pageContext.request.contextPath}/${photo.thumbanil}" data-large="${pageContext.request.contextPath}/${photo.pcontent}" alt="${photo.pname}" data-description="${photo.describe}" /><input class="input-photoid" type="hidden" value="${photo.photoid}" /></a></li>
								</c:forEach>
								</ul>
							</div>
						</div>
						<!-- End Elastislide Carousel Thumbnail Viewer -->
					</div><!-- rg-thumbs -->
				</div><!-- rg-gallery -->
				
			</div><!-- content -->
		</div><!-- container -->


		<div id="photo-comment" style="color: #000000;border-radius:10px; float: left; width: 230px;height: 690px; background-color: #ffffff;">
				
				<div class="comment-top"
					style=" height: 70px; background-color: #ffffff">
					<div style="width: 60px; height: 60px; margin: 10px; float: left;border: 1px solid #999999;" id="div-userimg" ><img style="height: 60px;width: 60px;" class="show-user-img" src=""/></div>
					<div id="div-p" style="height: 60px; margin: 10px; float: left; ">
						<p id="p-username" style="font-size: 16px; line-height: 40px;">用户昵称</p>
						<p id="p-date" style="font-size: 12px;">照片上传时间</p>
					</div>
				</div>
				<div class="comment" style="background-color: #ffffff">
					<div style="margin: 10px;">
		  				<textarea class="layui-textarea" id="LAY_demo2"></textarea>
					</div>  
					<div class="site-demo-button" style="padding-bottom: 0px;">
						<i id="icon-face" class="layui-icon" style="font-size: 18pt;margin-left: 10px;">&#xe60c;</i>
						<button class="layui-btn layui-btn-small layui-btn-normal" style="float: right; margin-right: 20px;" data-type="content">发表</button>
					</div>
				</div>
				
				<div id="show-comment" style="margin: 10px;width:220px;height:450px; overflow-y:auto;" >
				
				<!--  
					<div style="float: left;">
					<div style="width: 30px; height: 30px; margin: 10px; float: left;border: 1px solid #999999;"><img style="height: 30px;width: 30px;" src=""/></div>
					<div class="com-p" style="margin-top:10px; float: left; width: 140px;">
						<p class="com-p-username" style="font-size: 14px;line-height: 20px;">
							<a href="#" style="color: #2828ff">张三</a>：
							评论
							<i class="layui-icon" style="display: none;">&#xe611;</i>
						</p> 
					</div>
					</div>
					<div style="float: left;">
					<div style="width: 30px; height: 30px; margin: 10px; float: left;border: 1px solid #999999;"><img style="height: 30px;width: 30px;" src=""/></div>
					<div class="com-p" style="margin-top:10px; float: left; width: 140px;">
						<p class="com-p-username" style="font-size: 14px;line-height: 20px;"><a href="#" style="color: #2828ff">李四</a>：我这是评论呀！我这是评论呀！我这是评论呀！我这是评论呀！我这是评论呀！我这是评论呀！<i class="layui-icon" style="display: none;">&#xe611;</i></p>
					</div>
					</div>
					<div style="float: left;">
					<div style="width: 30px; height: 30px; margin: 10px; float: left;border: 1px solid #999999;"><img style="height: 30px;width: 30px;" src=""/></div>
					<div class="com-p" style="margin-top:10px; float: left; width: 140px;">
						<p class="com-p-username" style="font-size: 14px;line-height: 20px;">
						<a href="#" style="color: #2828ff">Ashy</a>回复-
						<a href="#" style="color: #2828ff">张三</a>：
						我这是回复
						<i class="layui-icon" style="display: none;">&#xe611;
						</i></p>
					</div> 
				 	</div>-->
				</div>
				
		</div>
</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/upload/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/upload/js/jquery.tmpl.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/upload/js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/upload/js/jquery.elastislide.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/upload/js/gallery.js"></script>
</html>