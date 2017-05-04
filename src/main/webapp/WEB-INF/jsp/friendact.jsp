<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>动态中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/amazeui.min.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>

<style>
body {
	margin: 0;
}

#panel-all {
	width: 100%;
	height: 30px;
	background: #d6d6d6;
	font-size: 14px;
	line-height: 30px;
	font-family: fantasy;
	font-weight: 600;
	color: gray;
}

.panel-heading {
	padding-left: 15px;
}

.actdiv {
	width: 95%;
	margin-left: 15px;
	margin-top: 5px;
	min-height: 250px;
	padding-top: 10px;
	display: none;
}

</style>
</head>
<script type="text/javascript">
	$(function() {

		function loadActivitys(data) {
			$.ajax({
						url : "${pageContext.request.contextPath}/act/queryMineActivity.json",
						data : {
							"pageNo" : data
						},
						type : "GET",
						dataType : "JSON",
						success : function(result) {
							var contentstr = "";
							$.each(
											result.page.result,
											function(i, act) {
												contentstr += "<div style='width: 90%; min-height: 240px; margin-left: 30px;'>";
												contentstr += "<img style='width: 60px; height: 60px; margin-top: 5px; margin-left: 10px; float: left;' alt='无法加载' src='${pageContext.request.contextPath}/"+act.user.img+"'>";
												contentstr += "<div style='float: left; padding-top: 10px; padding-left: 50; width: 300px;'><p style='font-size: 13px; color: gray;'>"
														+ act.user.realname
														+ "</p><p style='font-size: 13px; color: gray;'class='myadoptuserid' adoptuserid ='"+act.user.userid+"' commname= "+act.user.realname+" actid = '"+act.actid+"'>"
														+ act.actcreatetime
														+ "</p></div>";
												
												if (act.say != null) {
													contentstr += "<div style='width: 90%;float: left; padding-left: 30px; font-size: 15px;'>发表了说说:"
															+ act.say.saycontent
															+ "</div>";
													if(act.say.photosrc != ""){
														contentstr += "<img style='width: 100px; height: 100px; margin-top: 5px; margin-left: 10px;' alt='无法加载' src='${pageContext.request.contextPath}/"+act.say.photosrc+"'>";
													}
												}
												if (act.log != null) {
													contentstr += "<div style='width: 90%;float: left; padding-left: 30px; font-size: 15px;'>发表了日志《"
															+ act.log.logTitle
															+ "》</div>";
												}
												if (act.photo != null) {
													contentstr += "<div style='width: 90%;float: left; padding-left: 30px; font-size: 15px;'>上传了照片<img style='width: 60px; height: 60pxalt='无法加载' src='${pageContext.request.contextPath}/"+act.photo.thumbanil+"''></div>";
												}
												
												contentstr += "<div class='editor' style='width:100%;float: left;margin-top:2px;border-top: 1px     dashed  #999; margin-bottom: 10px;'>";
												
												var falg = false;
												$.each(act.listUser,function(i,user){
													if(user.userid == result.loginUserId){
														falg = true;
													}
												});
												if(falg){
													contentstr += "<div style='float:right'><a style='font-size:12px;' actId='"+act.actid+"' praNum='"+act.praise+"' class='backPraise' href='#'>取消赞("+act.praise+")</a><a style='font-size:12px; margin-left:10px;' href='#'>评论</a></div>";
												}else{
													contentstr += "<div style='float:right'><a style='font-size:12px;'  actId='"+act.actid+"' praNum='"+act.praise+"' class='toPraise' href='#'>赞("+act.praise+")</a><a style='font-size:12px; margin-left:10px;' href='#'>评论</a></div>";
												}
												
												
												if(act.comments != ""){
													//如果动态有相关评论
													contentstr += "<div style='width=80%; min-height:30px;' class='addfont'>";
													//检索是否有评论
													$.each(act.comments,function(i,comment){
														//这里是有评论的
														if(comment.corder == 0){
															if(comment.giveuser.userid == result.loginUserId){
																contentstr += "<hr><font style='font-size:15px; color:gray;  display: block; height:35px;'><a href='#'>我</a>&nbsp;评论&nbsp;<a class='praiseAct' realname='"+comment.adoptuser.realname+"' comid='"+comment.commid+"' corder='"+comment.corder+"'  actid='"+act.actid+"' userid='"+comment.adoptuser.userid+"' href='#'>"+comment.adoptuser.realname+"</a>:　"+comment.commcontent+"</font>";
															}
															if(comment.adoptuser.userid == result.loginUserId){
																contentstr += "<hr><font style='focreant-size:15px; color:gray;  display: block; height:35px;'><a class='praiseAct' realname='"+comment.adoptuser.realname+"' comid='"+comment.commid+"' corder='"+comment.corder+"'   actid='"+act.actid+"' userid='"+comment.giveuser.userid+"' href='#'>"+comment.giveuser.realname+"</a>&nbsp;评论&nbsp;<a href='#'>我</a>:　"+comment.commcontent+"</font>";
															}
															if(comment.giveuser.userid != result.loginUserId && comment.adoptuser.userid != result.loginUserId){
																contentstr += "<hr><font style='font-size:15px; color:gray;  display: block; height:35px;'><a class='praiseAct' realname='"+comment.adoptuser.realname+"' comid='"+comment.commid+"' corder='"+comment.corder+"'   actid='"+act.actid+"' userid='"+comment.giveuser.userid+"' href='#'>"+comment.giveuser.realname+"</a>&nbsp;评论&nbsp;<a  class='praiseAct' realname='"+comment.adoptuser.realname+"' comid='"+comment.commid+"' corder='"+comment.corder+"'   actid='"+act.actid+"' userid='"+comment.adoptuser.userid+"' href='#'>"+comment.adoptuser.realname+"</a>:　"+comment.commcontent+"</font>";
															}
															//检索回复
															$.each(act.comments,function(i,com){
																if(comment.commid==com.comcommid){
																	if(com.giveuser.userid == result.loginUserId){
																		contentstr += "<font  style='font-size:15px; color:gray;  display: block; height:35px;'>　　<a href='#'>我</a>&nbsp;回复&nbsp;<a class='praiseAct' realname='"+com.adoptuser.realname+"' comid='"+com.comcommid+"'  corder='"+com.corder+"'   actid='"+act.actid+"' userid='"+com.adoptuser.userid+ "'href='#'>"+com.adoptuser.realname+"</a>:　"+com.commcontent+"</font>";
																	}
																	if(com.adoptuser.userid == result.loginUserId){
																		contentstr += "<font style='font-size:15px; color:gray;  display: block; height:35px;'>　　<a class='praiseAct' realname='"+com.adoptuser.realname+"' comid='"+com.comcommid+"' corder='"+com.corder+"'   actid='"+act.actid+"' userid='"+com.giveuser.userid+"' href='#'>"+com.giveuser.realname+"</a>&nbsp;回复&nbsp;<a href='#'>我</a>:　"+com.commcontent+"</font>";
																	}
																	if(com.giveuser.userid != result.loginUserId && com.adoptuser.userid != result.loginUserId){
																		contentstr += "<font style='font-size:15px; color:gray;  display: block; height:35px;'>　　<a class='praiseAct' realname='"+com.adoptuser.realname+"' comid='"+com.comcommid+"' corder='"+com.corder+"'  actid='"+act.actid+"' userid='"+com.giveuser.userid+"' href='#'>"+com.giveuser.realname+"</a>&nbsp;回复&nbsp;<a  class='praiseAct' realname='"+com.adoptuser.realname+"' comid='"+com.comcommid+"' corder='"+comment.corder+"'  actid='"+act.actid+"' userid='"+com.adoptuser.userid+ "' href='#'>"+com.adoptuser.realname+"</a>:　"+com.commcontent+"</font>";
																	}
																} 
															});
														}
													});
													contentstr += "</div>";
												}else{
													contentstr += "<div style='width=80%; min-height:30px;' class='addfont'></div>"
												}
												contentstr += "<div class='mined' style='width:80%; height:65px; margin-top: 5px;'>";
												contentstr += "<textarea class='textare' style='resize: none;font-size:12px; color:gray; margin-top:5px;' rows='2' cols='65' placeholder='我也说点什么吧...'></textarea><input style='margin-left:10px; margin-top:28px; width:70px;' type='button' value='确认' class='subcomment am-btn am-btn-secondary'>";
												contentstr += "</div></div></div>";
											});

							$("#pageNo").val(result.page.pageNo);
							
							if (result.listSize < 4) {
								if(result.listSize == 0){
									contentstr += "<div style='text-align: center;'><font style='font-size:13px; display: block; width:200px; margin:0 auto;'>暂无动态</font></div>";
								}else{
									contentstr += "<div style='text-align: center;'><font style='font-size:13px; display: block; width:200px; margin:0 auto;'>已加载全部</font></div>";
								}
							} else {
								contentstr += "<div style='text-align: center; width:100%;'><a style='font-size:13px; display: block; width:200px; margin:0 auto;' class='loadMore' href='#'>加载更多</a></div>";
							}

							$("#actdiv").append(contentstr);
							var height = parseInt($("#actdiv").height()) + 100;
							if(height<1000){
								height = 1000;
							}
							$('#myIframe', window.parent.document).css(
									"height", height);
							$("#actdiv").show();
						}
					});
		}
		
		//点击人名直接评论
		$(document).on("click",".praiseAct",function(){
			
			//评论排序
			var corder = $(this).attr("corder");
			//接受评论的id
			var adoptuserid = $(this).attr("userid");
			//动态id
			var actid = $(this).attr("actid");
			//回复的评论id
			var comcommid = $(this).attr("comid");
			//真实姓名
			var realname = $(this).attr("realname");
			
			//设置相关参数
			$("#corder").val(corder);
			$("#adoptuserid").val(adoptuserid);
			$("#actid").val(actid);
			$("#comcommid").val(comcommid);
			$("#realname").val(realname);
			
			$(this).parent("font").addClass("praisecurrent");
			
			$(this).parents(".editor").find(".textare").focus();
			
		});
		
		//确认回复
		$(document).on("click",".subcomment",function(){
			var corder = $("#corder").val();
			var adoptuserid = $("#adoptuserid").val();
			var actid = $("#actid").val();
			var comcommid = $("#comcommid").val();
			
			
			if(comcommid == ''){
				var context =$(this).parents(".editor").find(".textare").val();
				var myadoptuserid = $(this).parent().parent().parent().find(".myadoptuserid").attr("adoptuserid");
				var myactid = $(this).parent().parent().parent().find(".myadoptuserid").attr("actid");
				$(".mined").attr("id","");
				$(this).parent().attr("id","pinglun");
				console.log(context);
				console.log(myadoptuserid);
				console.log(myactid);
				$.ajax({
					url:"${pageContext.request.contextPath}/com/comment",
					data:{"adoptuserid":myadoptuserid,"actid":myactid,"commcontent":context},
					type:"POST",
					dataType:"JSON",
					success:function(result){
						//回复成功
						var myadoptuserid = $("#pinglun").parent().parent().find(".myadoptuserid").attr("adoptuserid");
						var myactid = $("#pinglun").parent().parent().find(".myadoptuserid").attr("actid");
						var commname= $("#pinglun").parent().parent().find(".myadoptuserid").attr("commname");
						$("#pinglun").parent().find(".addfont").append("<hr><font style='font-size:15px; color:gray;  display: block; height:35px;'><a class='praiseAct' comid='' corder='0'   actid='"+myactid+"' userid='"+myadoptuserid+"' href='#'>我</a>&nbsp;评论&nbsp;<a href='#'>"+commname+"</a>:　"+context+"</font>");
						$(".textare").val('');
					}
				});
			}else{
				var commcontent = $(this).parents(".editor").find(".textare").val();
				var realname = $("#realname").val();
				$.ajax({
						url:"${pageContext.request.contextPath}/com/addcomment",
						data:{"corder":corder,"adoptuserid":adoptuserid,"actid":actid,"comcommid":comcommid,"commcontent":commcontent},
						type:"POST",
						dataType:"JSON",
						success:function(result){
							//回复成功
							var contentstr = "<font  style='font-size:15px; color:gray;  display: block; height:35px;'>　　<a href='#'>我</a>&nbsp;回复&nbsp;<a class='praiseAct' comid='"+comcommid+"'  corder='"+corder+"'   actid='"+actid+"' userid='"+adoptuserid+ "'href='#'>"+realname+"</a>:　"+commcontent+"</font><br>";
							$(".praisecurrent").append(contentstr);
							
							//设置高度
							
							var height = parseInt($("#heightfont").val());
							if(height == 0){
								height = parseInt($(".praisecurrent").height());
							}
							height += 20;
							$(".praisecurrent").css("height", height);
							//font
							/* var heightdiv = parseInt($("#divheight").val());
							if(heightdiv == 0){
								heightdiv = parseInt($(".addfont").height());
							}
							heightdiv += 10;
							$(".addfont").css("height", heightdiv); */
							
							$(".praisecurrent").removeClass("praisecurrent");
							$(".textare").val('');
							
							
							var height = parseInt($("#actdiv").height()) + 100;
							if(height<2000){
								height = 2000
							}
							$('#myIframe', window.parent.document).css(
									"height", height);
							
						}
				});
			}
		});
		
		//点赞
		$(document).on("click",".toPraise",function(){
			$(this).addClass("crt");
			$(this).removeClass("toPraise");
			$(this).addClass("backPraise");
			var actId = $(this).attr("actId");
			var praNum = parseInt($(this).attr("praNum")) + 1;
			$.ajax({
				url:"${pageContext.request.contextPath}/act/toPraiseActivity.json",
				data:{"actId":actId},
				type:"POST",
				dataType:"JSON",
				success:function(result){
					if(result.result == "success"){
						$(".crt").text("取消赞("+praNum+")");
						$(".crt").attr("praNum",praNum);
						$(".crt").removeClass("crt");
					}else{
						//服务器错误
					}
				}
			}); 
		});
		
		//取消赞
		$(document).on("click",".backPraise",function(){
			$(this).addClass("crt");
			$(this).removeClass("backPraise");
			$(this).addClass("toPraise");
			var actId = $(this).attr("actId");
			var praNum = parseInt($(this).attr("praNum")) - 1;
			$.ajax({
				url:"${pageContext.request.contextPath}/act/backPraiseActivity.json",
				data:{"actId":actId},
				type:"POST",
				dataType:"JSON",
				success:function(result){
					if(result.result == "success"){
						$(".crt").text("赞("+praNum+")");
						$(".crt").attr("praNum",praNum);
						$(".crt").removeClass("crt");
					}else{
						//服务器错误
					}
				}
			}); 
		});

		//点击加载更多
		$(document).on("click", ".loadMore", function() {
			$(".loadMore").remove();
			var oldPageNo = $("#pageNo").val();
			var pageNo = parseInt(oldPageNo) + 1;
			loadActivitys(pageNo);
		});

		loadActivitys(1);
	});
	
</script>
<body id="actiframe">
	<div id="panel-all">
		<div class="panel" id="aa">
			<input type="hidden" id="pageNo">
			<div class="panel-heading">好友动态</div>
		</div>
	</div>
	<div class="actdiv" id="actdiv"></div>
	<input type="hidden" id="corder">
	<input type="hidden" id="adoptuserid">
	<input type="hidden" id="actid">
	<input type="hidden" id="comcommid">
	<input type="hidden" id="realname">
	<input type="hidden" id="heightfont" value="0">
	<input type="hidden" id="divheight" value="0">
</body>
</html>