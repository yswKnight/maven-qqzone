<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- @auth 阿坑哥 修改样式-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--兼容IE-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/QQfiles/main.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<!--verify code v1-->

<title>重置密码 - QQ安全中心</title>

<style>
.round {
	width: 413px;
	overflow: hidden;
	position: absolute;
}

.round .r_top, .round .r_bottom {
	float: left;
	width: 413px;
	height: 5px;
	overflow: hidden;
}

.round .r_top {
	background-position: 0px -510px;
}

.round .r_bottom {
	background-position: 0px -517px;
}

.round .round_container {
	float: left;
	width: 403px;
	padding: 0 5px;
	margin: 0px;
	overflow: hidden;
	background: url(/v2/images/r_center.png) left top repeat-y;
}

.round .round_container .r_title {
	float: left;
	width: 403px;
	height: 30px;
	line-height: 30px;
	background: #f1f7fc;
	text-indent: 9px;
	font-size: 14px;
	position: relative;
}

.round .round_container .r_title a.close, a.close:hover {
	right: 7px;
	top: 6px;
}

.round .round_container .round_content, .round_content2 {
	float: left;
	width: 385px;
	min-height: 200px;
	_height: 200px;
	padding: 10px 9px;
	background: #fff;
	position: relative;
}

.round .round_container .round_content2 {
	width: 403px;
	padding: 0px;
}

.round .round_container .round_content2 .rc_tabs {
	display: block;
	height: 27px;
	padding-left: 9px;
	background: #f1f7fc;
	border-bottom: 1px solid #d9d9d9;
}

.round .round_container .round_content2 .rc_tabs li {
	float: left;
	margin-right: 5px;
	color: #6e6e6e;
}

.round .round_container .round_content2 .rc_tabs li a {
	float: left;
	line-height: 27px;
	padding: 0 9px;
	color: #6e6e6e;
	text-decoration: none;
}

.round .round_container .round_content2 .rc_tabs .rc_on {
	line-height: 27px;
	color: #333;
	background: #fff;
	border: 1px solid #d9d9d9;
	cursor: default;
	border-bottom: none;
	-webkit-border-top-left-radius: 3px;
	-webkit-border-top-right-radius: 3px;
	-moz-border-radius-topleft: 3px;
	-moz-border-radius-topright: 3px;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
}

.round .round_container .round_content .gm {
	width: 168px;
	height: 222px;
	position: absolute;
	right: 10px;
	top: 15px;
}

.round .round_container .round_content .survey {
	font-size: 14px;
	padding: 5px 0 5px 30px;
}

.round .round_container .round_content .survey li {
	padding: 8px 0 0 0;
	*padding: 5px 0 0 0;
}

.round .round_container .round_content .survey li input {
	width: 15px;
	margin-right: 5px;
}

.round .round_container .round_info, .round_info1, .round_info2 {
	padding: 35px 0 40px 40px;
	overflow: hidden;
}

.round .round_container .round_info h3 {
	padding: 0 10px 3px 55px;
	font-size: 14px;
}

.round .round_container .round_info p {
	padding: 0 10px 5px 55px;
	font-size: 12px;
	line-height: 20px;
}

.round .round_container .round_info ul, .round_info2 ul {
	padding-left: 55px;
}

.round .round_container .round_info2 ul, .round .round_container .round_info2 p
	{
	padding-left: 20px;
}

.round .round_container .round_info li {
	float: left;
	width: 350px;
	padding: 5px 0 5px 0;
	display: block;
	font-size: 14px;
	line-height: 16px;
	*line-height: 18px;
}

.round .round_container .round_info li .remarks {
	float: left;
	width: 230px;
	padding: 5px 30px 0 24px;
	font-size: 12px;
	color: #999;
	display: none;
}

.round .round_container .round_info li .ri_input {
	float: left;
	width: 14px;
	height: 14px;
	margin-right: 10px;
}

.round .round_container .round_info li i {
	margin: 0 8px 0 0;
}

.round .round_container .round_info1 {
	padding: 10px 0 40px 10px;
}

.round .round_container .round_info2 {
	padding: 30px 0 40px 0;
}

.round .round_button {
	float: left;
	width: 383px;
	padding: 8px 10px;
	background: #f9f9f9;
}

.round .round_button a.button, .round .round_button a.button1 {
	float: right;
	margin-left: 15px;
}
/*阴影背景*/
.login, .accounts_list, .accounts_list li a.a1:hover, .accounts_list li a.a2:hover,
	.accounts_list li a.a3:hover, .accounts_list li a.a4:hover,
	.password_list, .accounts_list li a.pw1:hover, .accounts_list li a.pw2:hover,
	.accounts_list li a.pw3:hover, .accounts_list li a.pw4:hover,
	.toolbox_list, .toolbox_list li a.t1:hover, .toolbox_list li a.t2:hover,
	.toolbox_list li a.t3:hover, .toolbox_list li a.t4:hover, .toolbox_list li a.t5:hover,
	a.title_icon:hover, .ue_warn, .r_top, .r_bottom {
	background-image: url(/v2/images/shadow_bg.png);
	_background-image: url(/v2/images/ie6_shadow_bg.png);
}
/* CSS Bg */
a.close, a.close:hover, a.t_close, a.t_close:hover, a.handheld:hover {
	background-image: url(/v2/images/bg.png);
	background-repeat: no-repeat;
	_background-image: url(/v2/images/ie6_bg.png);
	background-repeat: no-repeat;
}

/*关闭*/
a.close {
	width: 17px;
	height: 17px;
	position: absolute;
	background-position: -675px -130px;
}

a.close:hover {
	background-position: -720px -220px;
}
</style>
</head>
<body>
	<div class="round" id="login_alert"
		style="display: none; z-index: 10003; left: 30%; top: 30%;">
		<div class="r_top">
			<input id="yanzhen" value="" type="hidden">
		</div>
		<div class="round_container">
			<div class="r_title">
				用户登录<a class="close" href="javascript:alert_login_close();"></a>
			</div>
			<div class="round_content">
				<iframe
					style="margin: auto; width: 370px; height: 340px; background-color: transparent;"
					allowtransparency="true" name="embed_login_frame"
					id="embed_login_frame" frameborder="0" scrolling="no" src="">
				</iframe>
			</div>
		</div>
		<div class="r_bottom"></div>
	</div>

	<div class="header">
		<div>
			<div class="header_leftblock">
				<a class="leftblock_logo" href="###">
					<div class="logo_pic"></div>
					<div class="logo_text">QQ安全中心</div>
				</a>

				<div class="leftblock_title">
					<h1>
						<a
							href="https://aq.qq.com/v2/uv_aq/html/reset_pwd/pc_reset_pwd_input_account.html">重置密码</a>
					</h1>
				</div>

			</div>
			<div class="header_login">
				<div id="login_info_div" style="display: none;">

					<div class="login_username">
						<a href=""><span id="span_nickname"></span>（<span
							id="span_uin"></span>）</a>
					</div>
					<div class="login_text">
						<a href="javascript:pt_logout.logout(reload_top);">退出</a>
					</div>

				</div>

				<div id="login_div" class="login_text">
					<a href="javascript:alert_login('');">登录</a>
				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<div>
			<div class="section section-subnav">
				<div class="section_subnav">
					<ul class="subnav_process">
						<li class="passed">
							<div>
								<i>1</i>
								<p>填写帐号</p>
							</div> <i></i>
						</li>
						<li class="active">
							<div>
								<i>2</i>
								<p>身份验证</p>
							</div> <i></i>
						</li>
						<li class="active">
							<div>
								<i>3</i>
								<p>设置新密码</p>
							</div> <i></i>
						</li>
						<li class="last active">
							<div>
								<i>4</i>
								<p>完成</p>
							</div> <i></i>
						</li>
					</ul>
				</div>
			</div>

			<div class="section section-main">
				<div class="section_main" id="container">
					<div class="section section-tips">
						<div class="section_tips">
							<i></i> <span id="headtext">经过智能小安的检测，本次操作需要您通过以下方式确认身份</span>
						</div>
					</div>
					<div class="section section-main">
						<div id="uv_aq_common_error" class="main_error" style="padding-top: 0px;">
							<div class="error_pic"></div>
							<p class="error_text">恭喜，您的密码已修改成功。</p>
							<p class="error_tips">
								<!--您长时间未操作，网页或链接已过期，是否返回重试(10002)-->
							</p>
							<a id="uv_aq_common_error_btn"
								class="mod-btn blue large uv_aq_fillinfo_common_error"
								errcode="-2" href="${pageContext.request.contextPath }/index.jsp"><span>确定</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<div class="footer">
		<div>
			<div class="footer_about">
				<p class="about_link">
					<a href="http://www.tencent.com/zh-cn/index.shtml" target="_blank">关于腾讯</a>
					| <a href="http://www.tencent.com/en-us/index.shtml"
						target="_blank">About Tencent</a> | <a
						href="http://www.qq.com/contract.shtml" target="_blank">服务条款</a> |
					<a href="http://hr.tencent.com/">腾讯招聘</a> | <a
						href="http://kf.qq.com/product/aq.html" target="_blank">腾讯客服</a>
				</p>
				<p class="about_copyright">
					<span>Copyright © 1998 - <span id="current_year">2017</span>
						Tencent. All Rights Reserved
					</span> <span>腾讯公司 版权所有</span>
				</p>
			</div>
		</div>
	</div>
</body>
</html>