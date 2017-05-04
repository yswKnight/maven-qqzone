<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	
	
	
	
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";




%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=
	
	
	
	
	basePath




%>">

<title>QQzone</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/amazeui.min.css">
<link rel="stylesheet" type="text/css" href="css/menu1.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/chen.css" media="all" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}js/prefixfree.min.js"></script>
<link href="css/index.css" rel="stylesheet">
<!-- 字体淡出 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}js/modernizr.js"></script>
<!-- 字体淡出 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}js/silder.js"></script>
<!-- 字体淡出 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
</head>
<style type="text/css">
#rbbox {
	position: absolute;
	right: 0;
	bottom: 0;
	width: 300px;
	height: 0px;
	overflow: hidden
}

.button {
	display: inline;
	float: right;
	color: gray;
	font-size: 12px;
	cursor: pointer;
	font-size: 12px;
}

#myMsgBox a:hover {
	text-decoration: underline;
}
</style>

</head>

<script type="text/javascript">
	$(function() {

		//检测消息
		var msgSize = 0;

		setInterval(
				function msgRemind() {
					$
							.ajax({
								url : "${pageContext.request.contextPath}/remind/detectionMine.json",
								type : "POST",
								dataType : "JSON",
								success : function(result) {
									if (result.msgs != null) {
										if (result.msgsSize != msgSize) {
											$
													.each(
															result.msgs,
															function(i, msg) {

																var strmsg = "<a href='${pageContext.request.contextPath}/friend/myMsg.htm' target='q' style=' display:block; margin-top:50px; color:gray; font-size:16px;' class='mycss'>用户　"
																		+ msg.user.realname
																		+ "　请求加您为好友</a>";
																$("#myMsgBox")
																		.html(
																				strmsg);

																//弹出提示框
																showBox();
																setTimeout(
																		function() {
																			document
																					.getElementById("rbbox").style.display = "none";
																		}, 8000);
															});
										}
										msgSize = result.msgsSize;
									}
								}
							});
				}, 5000);

		function showBox(o) {
			if (o == undefined)
				o = document.getElementById("rbbox");
			o.style.height = o.clientHeight + 2 + "px";
			if (o.clientHeight < 200)
				setTimeout(function() {
					showBox(o)
				}, 5);

		}

	});
</script>


<body style="background-image: url('img/7201.jpg');">
	<div class="all">
		<div class="page-menu-wrapper">
			<ul class="menu-function clearfix">
				<li><a href="" title=""></a></li>
				<li style="margin-left: 150px;"><a href="login/tohome" title=""><img
						src="img/t1.png">QQ空间</a></li>
				<li><a href="javascript:;" title=""><img src="img/t3.png">我的主页
						<div class="drop-down">
							<table>
								<tr>
									<td><a
										href="${pageContext.request.contextPath}/logAct/zhuye"><img
											src="img/zhu.png"></a></td>
									<td><a href="login/tomysay" target="q"><img
											src="img/say.png"></a></td>
									<td><a
										href="${pageContext.request.contextPath}/logAct/golog"
										target="q"><img src="img/log.png"></a></td>
									<td><a href="album/tomyAlbum" target="q"><img
											src="img/ph.png"></a></td>
									<td><a
										href="${pageContext.request.contextPath}/user/toMinePersonnal.htm"
										target="q"><img src="img/user.png"></a></td>
									<td><a></a></td>
								</tr>
							</table>
						</div> </a></li>
				<li><a href="javascript:;" target="q" title=""><img
						src="img/t2.png">个人中心
						<div class="drop-down">
							<table id="myinfo">
								<tr>
									<td><a
										href="${pageContext.request.contextPath}/user/toMinePersonnal.htm"
										target="q"><font style="color: black;">我的信息</font></a></td>
									<td><a
										href="${pageContext.request.contextPath}/personalData/toPersonalData"
										target="q"><font style="color: black;">修改资料</font></a></td>
									<td><a
										href="${pageContext.request.contextPath}/user/toCrypToGraph.htm"
										target="q"><font style="color: black;">设置密保</font></a></td>
									<td><a
										href="${pageContext.request.contextPath}/personalData/toPersonalPass"
										target="q"><font style="color: black;">修改密码</font></a></td>
									<td><a></a></td>
								</tr>
							</table>
						</div> </a></li>
				<li><a
					href="${pageContext.request.contextPath}/friend/toFriendHome.htm"
					target="q" title=""><img src="img/t6.png">好友中心</a></li>
				<li><a title=""><img src="img/t5.png">应用中心</a></li>
				<li><div id="serach">
						<input type="text" name="" id="" placeholder="账号/昵称">&nbsp;&nbsp;<input
							type="button" value="Search" />
					</div></li>
				<li style="padding-top: 5px;"><a
					href="${pageContext.request.contextPath}/loginuser/exitLogin"
					title=""><img src="img/T.png">退出</a></li>
			</ul>
		</div>
		<div class="middle_top">
			<table border="0">
				<tr>
					<td width="430px;"><a style="font-size: 27px; color: gray;">${sessionScope.loginUser.realname}的空间</a><i
						class="icon icon-yingyang"></i></td>
					<td rowspan="3" width="670px;">
						<div class="banner">
							<ul class="texts">
								<p>带着一缕春光的温暖，携着一份柔情的缱绻。</p>
								<p>静守缘分花开，静待爱情结果！</p>
								<p>阡陌红尘，光阴深处，细数流年的足迹。</p>
								<p>翻阅岁月的画卷，多少遇见已成云烟，多少情缘随风飘散！</p>
								<p>最美四月芳菲天，蝶恋花开醉缠绵，书写一筏相遇的美好诗篇，弹奏一曲美丽的温馨...</p>
							</ul>
						</div>
					</td>
				</tr>
				<tr height="30px;">
					<td><a style="font-size: 15px; color: gray;">留住生活,分享感动</a>
				</tr>
				<tr>
					<td><c:if test="${empty sessionScope.loginUser.img}">
							<div class="portrait">
								<a
									href="${pageContext.request.contextPath}/user/toUpdateImg.htm"
									target="q"><img id="userImg" src="imgs/default.jpg"
									class='am-img-thumbnail am-circle' width="130px;"
									height="140px"> </a>
							</div>
						</c:if> <c:if test="${not empty sessionScope.loginUser.img}">
							<div class="portrait">
								<a
									href="${pageContext.request.contextPath}/user/toUpdateImg.htm"
									target="q"><img id="userImg"
									src="${sessionScope.loginUser.img}"
									class='am-img-thumbnail am-circle' width="130px;"
									height="140px"> </a>
							</div>
						</c:if>
				</tr>
			</table>

		</div>
		<div
			style="border: 0px solid black; width: 750px; height: 25px; font-size: 14px; text-align: left; margin: 0px auto; padding-left: 88px;">
			<a href="${pageContext.request.contextPath}/logAct/zhuye" target="q"
				style="color: gray; margin-left: 5px; font-weight: bold">主页</a> <a
				href="${pageContext.request.contextPath}/activity/toActivityInfo.htm"
				target="q" style="color: gray; margin-left: 15px; font-weight: bold">好友动态</a>
			<a href="${pageContext.request.contextPath}/user/toMinePersonnal.htm"
				target="q" style="color: gray; margin-left: 15px; font-weight: bold">我的资料</a>
			<a href="say/tomysay" target="q"
				style="color: gray; margin-left: 15px; font-weight: bold">我的说说</a> <a
				href="${pageContext.request.contextPath}/album/myalbum" target="q"
				style="color: gray; margin-left: 15px; font-weight: bold">我的相册</a> <a
				href="${pageContext.request.contextPath}/logAct/golog" target="q"
				style="color: gray; margin-left: 15px; font-weight: bold">我的日志</a> <a
				href="${pageContext.request.contextPath}/friend/toFriendHome.htm"
				target="q" style="color: gray; margin-left: 15px; font-weight: bold">好友中心</a>

		</div>
		<div class="middle_left">
			<div class="middle_left_1">
				<ul>
					<li><h2>
							<img src="img/jietu9.jpg">&nbsp;<a
								href="${pageContext.request.contextPath}/activity/toActivityInfo.htm"
								target="q" style="color: gray">好友动态</a>
						</h2></li>
					<li><h2>
							<img src="img/jietu2.jpg">&nbsp;<a href="say/tomysay"
								target="q" style="color: gray">我的说说</a>
						</h2></li>
					<li><h2>
							<img src="img/jietu3.jpg">&nbsp;<a
								href="${pageContext.request.contextPath}/logAct/golog"
								target="q" style="color: gray">我的日志</a>
						</h2></li>
					<li><h2>
							<img src="img/jietu4.jpg">&nbsp;<a
								href="${pageContext.request.contextPath}/album/myalbum"
								target="q" style="color: gray">我的相册</a>
						</h2></li>
					<li><h2>
							<img src="img/jietu5.jpg">&nbsp;<a href="login/tomysay"
								target="q" style="color: gray">特别关心</a>
						</h2></li>
					<li><h2>
							<img src="img/jietu3.jpg">&nbsp;<a href="login/tomylog"
								target="q" style="color: gray">有我相关</a>
						</h2></li>
					<li><h2>
							<img src="img/jietu3.jpg">&nbsp;<a href="photo/tomyphoto"
								target="q" style="color: gray">认证空间</a>
						</h2></li>
					<li><h2>
							<img src="img/jietu3.jpg">&nbsp;<a href="login/tomyshou"
								target="q" style="color: gray">我的收藏</a>
						</h2></li>
				</ul>
			</div>
			<div class="middle_right_big">
				<div class="middle_right_1">
					<ul>
						<li><a href="#" style="text-decoration: none">空间游戏</a></li>
						<li><img src="img/jietu4.jpg">&nbsp;<a href="#">CF回归抽奖</a></li>
						<li><img src="img/333_16.png">&nbsp;<a href="#">礼物</a></li>
						<li><img src="img/1104169356_16.png">&nbsp;<a href="#">龙啸天下</a></li>
						<li><img src="img/100645222_16.png">&nbsp;<a href="#">猜歌王</a></li>
						<li><img src="img/1104919159_16.png">&nbsp;<a href="#">三国最强王者</a></li>
						<li><img src="img/1104692077_16.png">&nbsp;<a href="#">花千骨（正版）</a></li>
						<li><img src="img/1104855721_16.png">&nbsp;<a href="#">全民仙战</a></li>
						<li><img src="img/jietu4.jpg">&nbsp;<a href="#">特价商城</a></li>
						<li><img src="img/jietu4.jpg">&nbsp;<a href="#">每日热卖</a></li>
						<li><img src="img/jietu4.jpg">&nbsp;<a href="#">我的全部应用</a></li>
					</ul>
				</div>
				<div class="middle_right_2">
					<p style="margin-top: 10px; margin-left: 10px; font-size: 14px;">发现生活</p>
					<img src="img/xiaojietu1.png">
					<p style="margin-top: 10px; margin-left: 10px; font-size: 12px;">休闲养成小游戏</p>
				</div>
				<div class="middle_right_2" style="margin-top: 5px;">
					<p style="margin-top: 10px; margin-left: 10px; font-size: 14px;">猜你感兴趣</p>
					<img src="img/xiaojietu2.png">
					<p style="margin-top: 10px; margin-left: 10px; font-size: 12px;">至今没人能通关的游戏</p>
				</div>
			</div>
			<div class="middle_right">
				<iframe id="myIframe"
					src="${pageContext.request.contextPath}/activity/toActivityInfo.htm"
					name="q" frameborder="0" scrolling="no" style="width: 650px;"
					onload="this.height=0;var fdh=(this.Document?this.Document.body.scrollHeight:this.contentDocument.body.offsetHeight);this.height=(fdh>1000?fdh:1000)"></iframe>
			</div>
			<div class="foot">
				<br>
				<ul>
					<li style="color: gray;">空间手机版 | 黄钻贵族 | 官方Qzone | QQ互联 | 认证服务
						| 腾讯博客 | 腾讯客服 | QQ空间服务协议 | Complaint Guidelines |
						粤网文[2011]0483-070号</li>
					<li style="color: gray;">Copyright © 2005 - 2015 Tencent.All
						Rights Reserved.</li>
					<li style="color: gray;">厚博公司 版权所有</li>
				</ul>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function tologin() {
			if (window.confirm('亲，您确定要离开QQ空间吗？')) {
				window.location = "login/tologin";
			}
		}
	</script>

	<div id="rbbox" style="background-color: white;">
		<div style="background: #DDF1FC; width: 100%; height: 25px;">

			<a class="button" onclick="closeBox()"
				style="line-height: 25px; font-size: 14px;">关闭</a>
		</div>


		<div id="myMsgBox" class="myMsgBox"></div>
	</div>



</body>

<script type="text/javascript">
	function closeBox() {
		document.getElementById("rbbox").style.display = "none";
	}
</script>
</html>
