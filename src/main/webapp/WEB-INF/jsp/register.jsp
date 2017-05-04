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

.box_7_ .item{height:39px\9\0;padding-top:1px\9\0;_height:38px;_padding-top:2px}

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
.dept_select{
	border: 0px none;
	-moz-appearance: none;
	background: transparent none repeat scroll 0% 0%;
	width: 100%;
}
</style>

<script type="text/javascript">
	$(function() {
		//form 各种点击事件
		formOnclick();
		//注册点击事件
		subumitBtnOnclick();
	});
	
	function subumitBtnOnclick(){
		$("#submit").click(function(){
			var realname = $("#nick").val();
			var password_again = $("#password_again").val();
			var sex =  1;
			if($("#sex_2").hasClass("checked")){
				sex =  0;
			}
			//console.log("==================2==============");
			if($("#password_again_info").hasClass("ok") && $("#nick_info").hasClass("ok") && $("#pwd_tip1").hasClass("yes") && $("#pwd_tip2").hasClass("yes") && $("#pwd_tip3").hasClass("yes")){
				var date = $(".layui-input").val();
				var password = MD5(password_again);
				var s_province = $("#s_province").val();
				var s_city = $("#s_city").val();
				var s_county = $("#s_county").val();
				var address = s_province+s_city+s_county;
				var submitdata = 'realname='+realname+'&'+'password='+password+'&'+'date='+date+'&'+'sex='+sex+'&address='+address;
				saveuser(submitdata)
			}
		});
	}
	
	function saveuser(submitdata){
		$.post("${pageContext.request.contextPath}/loginuser/save",submitdata,function(result){
			if(result.status == 'success'){
				window.location = '${pageContext.request.contextPath}/loginuser/toOK/'+result.username;
				//layer.msg('表单保存成功!', {icon: 1});
			}
			if(result.status == 'error'){
				//layer.msg('表单保存失败!', {icon: 2}); 
			}
		},'json');
	}
	
	function formOnclick(){
		//sex
		$(document).on("click", "#sex_1", function() {
			$("#sex_1").attr("class","");
			$(this).addClass("checked");
			$(this).attr("name","male");
			$("#sex_2").attr("name","femail");
			$("#sex_2").attr("class","");
		});
		$(document).on("click", "#sex_2", function() {
			$("#sex_2").attr("class","");
			$(this).addClass("checked");
			$(this).attr("name","male");
			$("#sex_1").attr("name","femail");
			$("#sex_1").attr("class","");
		});
		//realname
		$(document).on("focus", "#nick", function() {
			$(this).parent().attr("class","bg_txt bg_focus");
			$("#nick_info").attr("class","tip");
			$("#nick_info").text("请输入昵称");
		});
		
		$(document).on("blur", "#nick", function() {
			if($(this).val().length==0){
				$(this).parent().attr("class","bg_error");
				$("#nick_info").text("昵称不可以为空");
			}
			if($(this).val().length>0){
				$("#nick_info").attr("class","ok")
				$("#nick_info").text("");
			}
		});
		
		$(document).on("keyup", "#nick", function() {
			if($(this).val().length>0){
				$("#nick_info").attr("class","ok");
				$("#nick_info").text("");
			}
			if($(this).val().length==0){
				$("#nick_info").attr("class","tip");
				$("#nick_info").text("请输入昵称");
			}
		});
		
		//password
		$(document).on("focus", "#password", function() {
			$("#pwd_result").attr("class","hide");
			if($(this).val().length==0){
				$(this).parent().attr("class","bg_txt bg_focus");
				$("#pwd_tips").attr("class","pwd_tips");
			}
			if($(this).val().length>0){
				$(this).parent().attr("class","bg_txt bg_focus");
				$("#pwd_tips").attr("class","pwd_tips");
			}
		});
		
		//password
		$(document).on("blur", "#password", function() {
			//console.log();
			if(!$("#pwd_tips div").hasClass("no red")){
				if($(this).val().length>0){
					$("#pwd_tips").attr("class","hide");
					//强
					var strongRegex = new RegExp("^(?=.{8,})((?=.*[A-Z])(?=.*[0-9])(?=.*\\W))|((?=.*[a-z])(?=.*[0-9])(?=.*\\W)).*$", "g");
					//中等
					var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
					//弱
					var enoughRegex = new RegExp("(?=.{6,}).*", "g");
					$("#pwd_result").attr("class","");
					if($(this).val().length<=6){
						$("#password_pic").attr("class","rankLow");
						$("#password_pic").text("弱");
						$("#password_info").text("相同字符密码易被破解，请用多组合的密码");
					}else{
						if(strongRegex.test($(this).val())){
							$("#password_pic").attr("class","rankHigh");
							$("#password_pic").text("强");
							$("#password_info").text("密码强度好，请记牢！");
						}else if(mediumRegex.test($(this).val())){
							$("#password_pic").attr("class","rankMiddle");
							$("#password_pic").text("中等");
							$("#password_info").text("复杂度还行，再加强一下等级？");
						}else{
							$("#password_pic").attr("class","rankLow");
							$("#password_info").text("相同字符密码易被破解，请用多组合的密码");
						}
					}
				}
			}
		});
		
		//password
		$(document).on("keyup", "#password", function() {
			if($(this).val().length==0){
				$("#pwd_tips").attr("class","pwd_tips");
				$("#pwd_tip1").attr("class","no red");
				$("#pwd_tip2").attr("class","no red");
				$("#pwd_tip3").attr("class","no red");
			}
			if($(this).val().length>0){
				$("#pwd_tip1").attr("class","no red");
				$("#pwd_tip2").attr("class","no red");
				if($(this).val().indexOf(" ")!=-1){
					$("#pwd_tip3").attr("class","no red");
				}else{
					$("#pwd_tip3").attr("class","yes");
				}
				
				if($(this).val().length>=6){
					$("#pwd_tip1").attr("class","yes");
					if(isNaN($(this).val())){
						$("#pwd_tip2").attr("class","yes");
						console.log("test1");
						//$("#pwd_tip2").text("class","");
					}
					if(!isNaN($(this).val())){
						$("#pwd_tip2").attr("class","no red");
					}
				}
				
				if($(this).val().length>=9){
					$("#pwd_tip2").attr("class","yes");
				}
				
				if($(this).val().length>=16){
					$("#pwd_tip1").attr("class","yes");
					$("#pwd_tip2").attr("class","yes");
					$("#pwd_tip3").attr("class","yes");
				}
				if($(this).val()!=$("#password_again").val()){
					$("#password_again_info").attr("class","error");
					$("#password_again_info").text("输入密码不一致");
				}
				if($(this).val()==$("#password_again").val()){
					console.log("test3");
					$("#password_again_info").text("");
					$("#password_again_info").attr("class","ok");
				}
			}
		});
		//password_again_info
		$(document).on("focus", "#password_again", function() {
			$("#password_again_info").attr("class","tip");
			if($(this).val().length==0){
				$("#password_again_info").text("请再次输入密码");
			}
			if($(this).val()!=$("#password").val()){
				$("#password_again_info").attr("class","error");
				$("#password_again_info").text("输入密码不一致");
			}
			if($(this).val()==$("#password").val()){
				console.log($(this).val().length+"password_again focus");
				$("#password_again_info").attr("class","ok");
				$("#password_again_info").text("");
			}
		});
		
		$(document).on("keyup", "#password_again", function() {
			if($(this).val().length>0){
				if($(this).val()!=$("#password").val()){
					$("#password_again_info").attr("class","error");
					$("#password_again_info").text("输入密码不一致");
				}
				if($(this).val()==$("#password").val()){
					$("#password_again_info").attr("class","ok");
					$("#password_again_info").text("");
				}
			}
		});
	};
	
</script>
</head>
<body>
	<div class="web_notice" id="web_notice">
		<div class="web_notice_text" id="web_notice_text"></div>
	</div>
	<div class="cover" id="cover"></div>
	<div class="box_">
		<div class="chk_email_code" id="chk_email_code_box">
			<a class="close"
				onclick=""></a>
			<h2>操作提示</h2>
			<div class="div_1">
				<span class="chkError"></span>您短时间内尝试次数过多，请填写验证码或稍后再试
			</div>
			<div class="div_2">
				<span>验证码:</span> <input type="text" name="email_code"
					id="email_code_ipt" maxlength="8" autocomplete="off"><span
					id="email_code_ipt_err">验证码错误</span>
			</div>
			<div class="div_3">
				按下图字符填写，不区分大小写。<br> <img src=""
					onclick=""
					id="email_code_img" alt="验证码" title="请输入验证码"><br> <a
					onclick="">看不清楚？换一个</a><br>
				<input type="button"
					onclick="">
			</div>
		</div>
	</div>
	<div class="haomaBox" id="haomaBox">
		<a class="haomaClose" id="haomaClose" title="关闭"></a> <a id="haomaBtn"
		title="精品靓号免费拿"></a>
	</div>
	<div class="bg" id="hbg">
		<div class="container">
			<div class="header" id="hheader">
				<a href="" class="logo" target="_self" title="QQ注册"></a> <a
					onclick="feedBack(716)" class="feedback" target="_blank" title="">意见反馈</a>
				<div id="lang_box">
					<span>简体中文</span>|<a href="javascript:langSwitch('cht');">繁體中文</a>|<a
						href="javascript:langSwitch('en');">English</a>
				</div>
			</div>
			<div class="content">
				<div class="left" id="lleft">
					<a id="nav_1" class="nav_box cur" href="javascript:void(0);"
						onmouseout=""
						onmouseover=""><span
						class="dt nav_1">QQ帐号</span> <span class="dd">由数字组成，经典通行帐号</span>
					</a><a id="nav_3" class="nav_box" href="javascript:void(0);"
						onmouseout=""
						onmouseover=""><span
						class="dt nav_3">手机帐号</span> <span class="dd">便于登录、保护QQ帐号</span></a> <a
						id="nav_2" class="nav_box" href="javascript:void(0);"
						onmouseout=""
						onmouseover=""><span
						class="dt nav_2">邮箱帐号</span> <span class="dd">用邮箱地址注册，便于记忆</span></a>
					<div class="search">
						<div class="ipt_box">
							<form class="search_form" method="get"
								action=""
								target="_blank" onsubmit="return g.formSubmit()">
								<input type="hidden" name="service" value="1"> <input
									type="hidden" name="from" value="freeqqm"> <input
									type="hidden" name="url"
									value="http%3A%2F%2Fhaoma.qq.com%2Fgno.php"> <input
									name="number" class="txt" autocomplete="off" type="text"
									style="z-index: 0" value="输入要查找的QQ号码"
									onblur="g.searchBlur(this)" onfocus="g.searchFocus(this)"
									id="serch_ipt"> <input class="btn" type="submit"
									value="">
							</form>
							<div class="clear"></div>
						</div>
						<ul>
							<li><a class="item_1" href="javascript:g.openHaoma(1);">生日</a></li>
							<li><a class="item_2" href="javascript:g.openHaoma(2)">爱情</a></li>
							<li><a class="item_3" href="javascript:g.openHaoma(5)">手机</a></li>
							<li><a class="item_4" href="javascript:g.openHaoma(4)">年度</a></li>
						</ul>
					</div>
				</div>
				<div class="right" id="rright">
					<div class="phone" id="phone_quick"></div>
					<div class="enterA" id="enterA">
						<a href="/chs/new.html" id="enterBanner"
							onclick="window.index&amp;&amp;index.reportBanner()"></a>
						<div class="haomaTitle" id="hmtitle">
							<div class="haoma-inner" id="haoma-inner">注册帐号</div>
						</div>
						<form action="" method="post" id="userForm">
							<div id="formArea">
								<div id="email_box" class="hide">
									<div id="email_tips" class="box box_1" style="display: none">
										<div class="item">注册方式</div>
										<div class="ipt_box method_box nobg">
											<a id="email_2" name="new_other_mail"
												tabindex="1">使用非<span class="tahoma">QQ/Foxmail</span>
												邮箱
											</a><a name="new_self_mail" id="email_1" class="checked"
												tabindex="2">注册<span class="tahoma">QQ/Foxmail</span> 邮箱
											</a>
										</div>
										<div class="info">
											<table>
												<tbody>
													<tr>
														<td class="hidden"></td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="clear"></div>
									</div>
									<div class="box box_2">
										<label class="item" for="other_email">邮箱帐号</label>
										<div id="mail_box" class="ipt_box nobg self"
											style="z-index: 99">
											<div class="ipt_other">
												<div id="other_email_bg" class="bg_txt">
													<input id="other_email" type="text" class="new_txt"
														name="other_email" tabindex="3" autocomplete="off"
														maxlength="38">
												</div>
												<ul id="other_email_ul" class="hide"></ul>
											</div>
											<div class="ipt_self">
												<input type="text" name="self_email" id="self_email"
													tabindex="4" autocomplete="off" maxlength="18">
												<div class="outer">
													<div id="selfType" tabindex="5">@qq.com</div>
													<ul id="selfTypeBox" class="hide">
														<li id="selfType0">@qq.com</li>
														<li id="selfType1">@foxmail.com</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="info">
											<table>
												<tbody>
													<tr>
														<td id="email_info" class="hidden"></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="box box_3" style="z-index: 0">
									<label class="item" for="nick">昵称</label>
									<div class="ipt_box nick_ipt_box">
										<div id="nick_bg" class="bg_error">
											<input type="text" class="new_txt" id="nick" name="nick"
												tabindex="6" style="z-index: 0" maxlength="24"
												autocomplete="off">
										</div>
									</div>
									<div class="info" >
										<table>
											<tbody>
												<tr>
													<td id="nick_info" class="error">昵称不可以为空</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="box box_4">
									<label class="item" for="password">密码</label>
									<div class="ipt_box">
										<div id="password_bg" class="bg_txt">
											<input type="password" class="new_txt" id="password"
												name="password" tabindex="7" maxlength="16">
										</div>
									</div>
									<div class="info pwd_info">
										<div class="pwd_tips hide" id="pwd_tips">
											<div class="default" id="pwd_tip1">长度为6-16个字符</div>
											<div class="default" id="pwd_tip3">不能包含空格</div>
											<div class="default" id="pwd_tip2">不能是9位以下纯数字</div>
										</div>
										<table id="pwd_result" class="hide">
											<tbody>
												<tr>
													<td id="password_pic">弱</td>
												</tr>
												<tr>
													<td id="password_info" class="password_info"></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="box box_5">
									<label class="item" for="password_again">确认密码</label>
									<div class="ipt_box">
										<div id="password_again_bg" class="bg_txt">
											<input type="password" class="new_txt" name="pass_again"
												id="password_again" tabindex="8" maxlength="16">
										</div>
									</div>
									<div class="info">
										<table>
											<tbody>
												<tr>
													<td id="password_again_info" class="hidden"></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="box box_6">
									<div class="item">性别</div>
									<div class="ipt_box nobg sex_box">
										<a id="sex_1" name="male"  class="checked" tabindex="9">男</a>
										<a id="sex_2" class="unchecked" name="femail" tabindex="10">女</a>
									</div>
									<div class="info">
										<table>
											<tbody>
												<tr>
													<td id="sex_info" class="hidden"></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="box box_7_">
									<div class="item"><span>生日</span></div>
									<div id="bday_dt" class="ipt_box nopadding nobg"
										style="position: relative; z-index: 18889;">
										<div id="inptu_search_tips" class="paopao"
											style="display: none">
											<span id="inptu_search_tips_wording" class="p_l"></span> <span
												class="p_r"></span>

										</div>
										<div class="layui-inline">
											<input class="layui-input" placeholder="请点击选择日期" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" style="background: 0 0;">
										</div>
										
									</div>
										
										<table>
											<tbody>
												<tr>
													<td id="birthday_info" class="hidden"></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="box box_8">
									<div class="item">所在地</div>
									<div id="area_dt" class="ipt_box nopadding nobg"
										style="z-index: 18888;">
										<div id="country_box">
											<div id="country_value_bg" class="area_value_bg">
												<!--  -->
												<select id="s_province" class="dept_select" style="-webkit-appearance: none;-webkit-tap-highlight-color: #fff;outline: 0;"></select>  
											</div>
										</div>
										<div id="province_box">
											<div id="province_value_bg" class="area_value_bg">
												<select id="s_city" class="dept_select" style="-webkit-appearance: none;-webkit-tap-highlight-color: #fff;outline: 0;"></select> 
											</div>
										</div>
										<div id="city_box">
											<div id="city_value_bg" class="area_value_bg">
												<select id="s_county" name="s_county" class="dept_select"style="-webkit-appearance: none;-webkit-tap-highlight-color: #fff;outline: 0;" ></select> 
											</div>
										</div>
									</div>
									<div class="info">
										<table>
											<tbody>
												<tr>
													<td id="area_info" class="hidden"></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="box box_9 hide" id="code_box">
									<label class="item" for="code">验证码</label>
									<div id="code_area_new" class="hide">
										<div id="capt" class="ipt_box nopadding nobg"></div>
									</div>
									<div id="code_area_img" class="hide">
										<input id="code" class="" type="text" name="code"
											tabindex="18" autocomplete="off" maxlength="8"> <img
											id="code_img"
											style="float: left; cursor: pointer; margin-left: 5px"
											width="130" height="53" src="" title="点击换一张"
											onclick="window.index&amp;&amp;index.changeCode(!0)">
									</div>
									<div class="info">
										<table id="code_tips_tbl" class="" style="height: 49px;">
											<tbody>
												<tr>
													<td id="code_info" class=""><span id="code_info_err"
														class="tips">请先进行安全验证</span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div id="phone_box" class="phone_box_land">
									<div id="sea_phone" class="box box_2 sea_phone">
										<label class="item" for="sea_country_input">地区</label>
										<div class="sea_country_box" id="sea_country_box">
											<div class="sea_area_value_bg">
												<input id="sea_country_input" autocomplete="off"
													class="sea_country_input" tabindex="19">
											</div>
										</div>
									</div>
									<div class="info">
											<table>
												<tbody>
													<tr>
														<td id="phone_info" class="tip"></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div id="sms_box" class="box hide" style="z-index: 0">
										<div class="item"></div>
										<div class="ipt_box verima_ipt_box" id="verima_ipt_box">
											<div id="verima_bg" class="bg_txt">
												<input type="text" class="new_txt" id="verima" name="verima"
													style="z-index: 0" autocomplete="off" maxlength="6"
													tabindex="21">
											</div>
											<label id="verima_label" class="noplinfo hide">系统已将验证码发送到您的手机，请填入验证码</label>
										</div>
										<div class="getverima">
											<div id="getverima"
												style="background-color: #f4f9fd; border-color: #d0dae3"
												title="获取短信验证码">
												<span id="timeLeft"></span> <span id="verimaTip"
													style="color: #444">获取短信验证码</span>
											</div>
										</div>
										<div class="info">
											<table>
												<tbody>
													<tr>
														<td id="verima_info" class="hidden"></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div id="up_box" class="box hide">
										<div class="item"></div>
										<div style="line-height: 22px">
											<p id="up_box_reason">该手机号码今日验证短信下发次数已达到上限</p>
											<p>
												请用您的手机号<span id="up_box_mob" class="clr_006DB0"></span>
											</p>
											<p>
												发送短信<span class="clr_006DB0"> 1 </span>到 <span
													class="clr_006DB0" id="upPort">1069 0700 511</span> 完成验证
											</p>
											<div class="tips1">
												注：<br>1、您仅需支付运营商收取的标准短信资费，无需任何额外费用；<br>2、腾讯公司承诺不会对外泄漏您的手机号码及用于其他任何商业用途。
											</div>
										</div>
									</div>
								</div>
								<div class="box box_11">
									<div class="item"></div>
									<div id="submit_box" class="ipt_box">
										<div id="up_msg_err" class="err_tips hide"></div>
										<div class="submit" style="padding-top: 10px">
											<input type="button" value="立即注册" title="立即注册" tabindex="23"
												id="submit">
										</div>
									</div>
								</div>
								<div class="box box_10" id="qzone_box">
									<div class="item"></div>
									<div class="ipt_box qzone_box nopadding">
										<a class="checked" name="qzone" id="qzone" tabindex="22">同时开通QQ空间</a>
									</div>
								</div>
								<div class="box box_11">
									<div class="item"></div>
									<div class="ipt_box">
										<div class="agree_box">
											<a name="agree" class="a_1 checked" id="agree" tabindex="22">我已阅读并同意相关服务条款和隐私政策</a>
											<div id="x_box" class="x_box">
												<div id="x_switcher" title="点击查看用户协议"></div>
												<p>
													<a id="item_1" href="agreement1_chs.html" target="_blank"
														title="点击查看《QQ号码规则》">《QQ号码规则》</a><br> <a id="item_2"
														href="http://qzone.qq.com/web/tk.html" target="_blank"
														title="点击查看《QQ空间服务协议》" style="display: inline;">《QQ空间服务协议》</a><br>
													<a id="item_3" href="http://www.qq.com/privacy.htm"
														target="_blank" title="点击查看《隐私政策》">《隐私政策》</a><br>
												</p>
											</div>
										</div>
									</div>
									<div class="info"></div>
								</div>
							</div>
						</form>
					</div>
					<div class="enterB" id="enterB">
						<a id="to_good_num" title="参加免费注册靓号活动" href="/chs/new.html"
							onclick="$.report.monitor(&quot;l_enter_b_l_click&quot;)"></a> <a
							id="old_reg" title="注册普通帐号" href="javascript:void(0);"></a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div class="footer" id="ffooter">
		Copyright <span>©</span> 1998-2016 Tencent All Rights Reserved 腾讯公司
		版权所有
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/QQfiles/area.js">
	</script>
	<script type="text/javascript">_init_area();</script>
	<script type="text/javascript">
		var Gid  = document.getElementById ;
		var showArea = function(){
			Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市" + 	
			Gid('s_city').value + " - 县/区" + 
			Gid('s_county').value + "</h3>"
			
		};
	</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui-v1.0.9/layui/layui.js"></script>
<script>
	layui.use('laydate', function(){
	  var laydate = layui.laydate;
	});
</script>
<!-- md5 沙市-->
<script type="text/javascript" src="${pageContext.request.contextPath}/QQfiles/md5.js"></script>
</body>
</html>