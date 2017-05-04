<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- @auth 阿坑哥 修改样式-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/QQfiles/index.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/css/layui.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/QQfiles/g.css" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<style>
.box_ {
	position: fixed
}

.cover {
	height: 981px
}

#enterBanner {
	display: block;
	width: 610px;
	height: 165px;
	background:
		url(//3gimg.qq.com/qq_product_operations/temp/enterBannerC.jpg)
		no-repeat center;
	margin-left: 60px;
	margin-top: 0;
	margin-bottom: -5px
}

.haomaTitle {
	position: relative;
	width: 604px;
	height: 80px;
	margin-left: 63px;
	border-bottom: 1px solid #ddd
}

.haomaTitle .haoma-inner {
	position: absolute;
	width: 100%;
	height: 25px;
	line-height: 25px;
	font-family: "微软雅黑";
	font-size: 18px;
	text-indent: 6px;
	border-left: 3px solid #59AfE4;
	margin-top: 50px;
	color: #616161
}

#haomaBox {
	width: 610px;
	height: 260px;
	position: fixed;
	background: #fff;
	left: 50%;
	top: 50%;
	margin-top: -130px;
	margin-left: -305px;
	z-index: 9999;
	background: url(//3gimg.qq.com/qq_product_operations/temp/enterC.jpg)
		no-repeat center;
	z-index: 1028;
	display: none;
	_position: absolute
}

#haomaBtn {
	display: block;
	width: 160px;
	height: 40px;
	background: url(//3gimg.qq.com/qq_product_operations/temp/enterBtn.jpg)
		no-repeat center;
	position: absolute;
	top: 180px;
	left: 365px
}

#haomaBox:hover {
	cursor: pointer
}

#haomaClose {
	display: block;
	width: 15px;
	height: 15px;
	background: url(//3gimg.qq.com/qq_product_operations/temp/closeBtn.png)
		no-repeat center;
	position: absolute;
	left: 590px;
	top: 5px;
	background-size: 100%
}

#to_good_num {
	display: block;
	width: 385px;
	height: 96px;
	background:
		url(//3gimg.qq.com/qq_product_operations/temp/ole_num_enter.png);
	margin-top: 150px;
	margin-left: 170px
}

#old_reg {
	display: block;
	width: 385px;
	height: 96px;
	background:
		url(//3gimg.qq.com/qq_product_operations/temp/good_num_enter.png);
	margin-top: 50px;
	margin-left: 170px
}

.phone_box_land {
	z-index: 5
}

.enterB {
	display: none
}

.cover {
	animation: fadeShow 1s ease-in-out;
	-webkit-animation: fadeShow 1s
}

#up_box .tips1 {
	padding-top: 5px;
	color: grey;
	padding-left: 189px;
	padding-top: 10px;
	line-height: 20px
}

.err_tips {
	background: rgba(0, 0, 0, 0)
		url(//6.url.cn/zc/chs/img/pwd_sprite.png?v=10081) no-repeat scroll 0
		-342px;
	color: #f66;
	padding-left: 16px;
	line-height: 32px;
	margin-top: 10px
}

.clr_006DB0 {
	color: #006DB0
}

.clr_808080 {
	color: grey
}

@
-webkit-keyframes fadeShow { 0%{
	opacity: .05
}
50%{
opacity
:
.05
}
100%{
opacity
:
.3
}
}
@
keyframes fadeShow { 0%{
	opacity: .5
}

50%{
opacity
:
0
}
100%{
opacity
:
.3
}
}
.dept_select {
	border: 0px none;
	-moz-appearance: none;
	background: transparent none repeat scroll 0% 0%;
	width: 100%;
}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="web_notice" id="web_notice">
		<div class="web_notice_text" id="web_notice_text"></div>
	</div>
	<div class="cover" id="cover"></div>
	<div class="bg" id="hbg">
		<div class="container">
			<div class="header" id="hheader">
				<a href="index.html" class="logo" target="_self" title="QQ注册"></a> <a
					onclick="feedBack(716)" class="feedback" target="_blank" title="">意见反馈</a>
				<div id="lang_box">
					<span>简体中文</span>|<a href="javascript:langSwitch('cht');">繁體中文</a>|<a
						href="javascript:langSwitch('en');">English</a>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="mycontent" >
		<div style="background-color: #ECECEC; padding: 35px;">
			<table cellpadding="0" align="center"
				style="width: 850px; margin: 0px auto; text-align: left; position: relative; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; font-size: 14px; font-family: 微软雅黑, 黑体; line-height: 1.5; box-shadow: rgb(153, 153, 153) 0px 0px 5px; border-collapse: collapse; background-position: initial initial; background-repeat: initial initial; background: #fff;">
				<tbody>
					<tr>
						<th valign="middle"
							style="height: 25px; line-height: 25px; padding: 15px 35px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: #91C6FC; background-color: #91C6FC; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px;">
							<font face="微软雅黑" size="5" style="color: rgb(255, 255, 255);">注册成功</font>
						</th>
					</tr>
					<tr>
						<td>
							<div style="padding: 25px 35px 40px; background-color: #fff;">
								<h2 style="margin: 5px 0px;">
									<font color="#333333" style="line-height: 20px;"><font
										style="line-height: 22px;" size="4">您注册的QQ账号为：</font></font>
									<font style="color:#69B946;"> ${username}</font>
								</h2>
								<p>首先感谢您加入腾讯qq, 请您牢记账号密码。</p>
								<p align="right">腾讯 官方团队</p>
								<p align="right" style="margin-top: 10px;"><a href="${pageContext.request.contextPath}/index.jsp">返回登录首页</a></p>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="footer" id="ffooter">
		Copyright <span>©</span> 1998-2016 Tencent All Rights Reserved 腾讯公司
		版权所有
	</div>
</body>
</html>