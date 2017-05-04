<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>添加好友</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/amazeui.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/app.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/address.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/layer-v3.0.1/layer-v3.0.1/layer/layer.js"></script>
<script type="text/javascript">
	$(function() {
		//按条件查询点击事件
		$(document).on("click", "#seachByPersonnal_Mine", function() {
			$("#seachDiv").show();
		});
		//省份选择框值改变
		$(document)
				.on(
						"change",
						"#selectProvinces",
						function() {
							var provinceId = $(this).val();
							
							//如果是省级市，则直接查询区
							if (provinceId == 1 || provinceId == 2
									|| provinceId == 9 || provinceId == 22
									|| provinceId == 32 || provinceId == 33) {
								$("#selectCitys").hide();
								$
										.ajax({
											url : "${pageContext.request.contextPath}/friend/queryCitys.json",
											data : {
												"provinceId" : provinceId
											},
											type : "POST",
											dataType : "JSON",
											success : function(result) {
												var cityId;
												$.each(result.citys, function(
														i, city) {
													cityId = city.cityid;
												});
												$
														.ajax({
															url : "${pageContext.request.contextPath}/friend/queryDistricts.json",
															type : "POST",
															data : {
																"cityId" : provinceId
															},
															dataType : "JSON",
															success : function(
																	result) {
																var strOption = "<option value='0'>--请选择--</option>";
																$
																		.each(
																				result.districts,
																				function(
																						i,
																						district) {
																					strOption += "<option value='"+district.districtid+"'>"
																							+ district.districtname
																							+ "</option>";
																				});
																$(
																		"#selectDistricts")
																		.html(
																				strOption);
																$(
																		"#selectDistricts")
																		.show();
															}
														});
											}
										});
							} else {
								$("#selectDistricts").hide();
								$
										.ajax({
											url : "${pageContext.request.contextPath}/friend/queryCitys.json",
											type : "POST",
											data : {
												"provinceId" : provinceId
											},
											dataType : "JSON",
											success : function(result) {
												var strOption = "<option value='0'>--请选择--</option>";
												$
														.each(
																result.citys,
																function(i,
																		city) {
																	strOption += "<option value='"+city.cityid+"'>"
																			+ city.cityname
																			+ "</option>";
																});
												$("#selectCitys").html(
														strOption);
												$("#selectCitys").show();
											}
										});
							}
						});
		$(document)
				.on(
						"change",
						"#selectCitys",
						function() {
							var cityId = $(this).val();
							$
									.ajax({
										url : "${pageContext.request.contextPath}/friend/queryDistricts.json",
										type : "POST",
										data : {
											"cityId" : cityId
										},
										dataType : "JSON",
										success : function(result) {
											var strOption = "<option value='0'>--请选择--</option>";
											$.each(result.districts,function(i,district) {
																strOption += "<option value='"+district.districtid+"'>"
																		+ district.districtname
																		+ "</option>";
															});
											$("#selectDistricts").html(
													strOption);
											$("#selectDistricts").show();
										}
									});
						});

		$(document)
				.on(
						"click",
						"#queryFriends_button",
						function() {
							$("#seachDiv").hide();
							//输入的账号
							var username = $("#username").val();
							
							if(username =="请输入要添加的用户账号"){
								username = null;
							}

							//区域
							var province = $("#selectProvinces").find(
									"option:selected").text();
							var city = $("#selectCitys")
									.find("option:selected").text();
							var district = $("#selectDistricts").find(
									"option:selected").text();

							//最后选择的地区
							var adress = "";
							if (province != "--请选择--") {
								adress += province;
							}
							if (city != "--请选择--") {
								adress += city;
							}
							if (district != "--请选择--") {
								adress += district;
							}
							//性别
							var sex = $('input:radio:checked').val();
							
							

							//昵称
							var realname = $("#realname").val();
							
							if(realname == "请输入要添加的昵称"){
								realname = null;
							}
							$.ajax({
										url : "${pageContext.request.contextPath}/friends/queryUsersByPersonnal.json",
										type : "POST",
										data : {
											"username" : username,
											"adress" : adress,
											"sex" : sex,
											"realname" : realname
										},
										dataType : "JSON",
										success : function(result) {
											var userStr = "";
											$.each(result.users,function(i,user){
												userStr += "<a href='#' class='user_friend' name='"+user.userid+"'>";
												userStr += "<div style='width: 150px; height: 65px; margin-left: 15px; margin-top: 20px; float: left;'>";
												if(user.img != null){
													userStr += "<img alt='无法加载' src='${pageContext.request.contextPath}/"+user.img+"'  style='width: 50px; height: 50px; float: left; margin-top: 8px; margin-left: 15px;'>";
												}else{
													userStr += "<img alt='无法加载' src='${pageContext.request.contextPath}/imgs/default.jpg'  style='width: 50px; height: 50px; float: left; margin-top: 8px; margin-left: 15px;'>";
												}
												userStr += "<div style='float: left; width: 40px;'>";
												if(user.realname.replace(/[\u0391-\uFFE5]/g,"aa").length<=6){
													userStr += "<p style='font-size: 12px; width:40px; height:8px; color: gray; margin-top: 8px; margin-left: 15px;'>"+user.realname+"</p>";
												}else{
													userStr += "<p style='font-size: 12px; width:40px; height:8px; color: gray; margin-top: 8px; margin-left: 15px;'>"+user.realname.substring(0,6)+"...</p>";
												}
												
												userStr += "<font style='font-size: 12px; color: gray; margin-left: 15px;'>"+(user.sex==1?'男':'女')+"</font>";
												userStr += "</div>";
												userStr += "</div>";
												userStr += "</a>" ;
											});
											
											$("#usersDiv").html(userStr);
											$("#usersDiv").show();
										}
									});

						});
		
		$(document).on("click",".user_friend",function(){
			//用户id
			var userId = $(this).attr("name");
			
			var strDiv = "";
			
			$.ajax({
				url:"${pageContext.request.contextPath}/friend/getUser.json",
				type:"POST",
				data:{"userId":userId},
				dataType:"JSON",
				success:function(result){
					if(result.user.img==null){
						strDiv += "<img style='width: 130px; height: 140px; margin-top: 10px; margin-left: 75px;'alt='无法加载图片' src='${pageContext.request.contextPath}/imgs/default.jpg'>";
					}else{
						strDiv += "<img style='width: 130px; height: 140px; margin-top: 10px; margin-left: 75px;'alt='无法加载图片' src='${pageContext.request.contextPath}/"+result.user.img+"'>";
					}
					strDiv += "<h5 style='text-align: center;'>"+result.user.realname+"</h5>";
					strDiv += "<p style='text-align: center; font-size: 12px; color: gray;'>"+result.user.address+"</p>";
					strDiv += "<input type='hidden' id='friendId' value='"+result.user.userid+"'>";
					strDiv += "<div><font style='font-size: 12px; margin-left: 15px;'>备注：</font><input type='text' name='remarkMsg' id='remarkMsg'></div>";
					strDiv += "<input style='margin-top: 15px; margin-left: 50px; width: 80px; height: 35px;'  type='button' class='am-btn am-btn-secondary'  id='toSubmit'  value='确认'>";
					strDiv += "<input  style= 'margin-top: 15px; margin-left: 20px; width: 80px; height: 35px;' type='button'  class='am-btn am-btn-danger' id='toBack' value='取消'>";
					
					$("#lay-ui-limt").html(strDiv);
					
					layer.open({
						  type: 1,
						  skin: 'layui-layer-molv', //样式类名
						  offset: '150px',
						  title:"添加好友",
						  closeBtn: 1, //不显示关闭按钮
						  shadeClose: true, //开启遮罩关闭
						  content: $("#lay-ui-limt")
						});
				}
			});
		});
		
		//取消按钮
		$(document).on("click","#toBack",function(){
			 layer.closeAll();
		});
		
		//确认按钮
		$(document).on("click","#toSubmit",function(){
			
			var friendId = $("#friendId").val();
			var msg = $("#remarkMsg").val();
			
			$.ajax({
				url:"${pageContext.request.contextPath}/friend/addFriend.json",
				type:"POST",
				data:{"friendId":friendId,"addMsg":msg},
				dataType:"JSON",
				success:function(result){
					if(result.msg == "success"){
						//发送消息成功
						layer.closeAll();
						layer.msg('已发送好友请求,等待对方验证', {
						    time: 2000, //20s后自动关闭
						    skin: 'layer-ext-moon'
						  });
					}
				}
			}); 
		});
		
	});
</script>
<body>
	<div style="margin: 0 auto; width: 600px;">
		<input
			style="margin-top: 25px; width: 450px; height: 50px; font-size: 15px; color: gray;"
			type="text" value="请输入要添加的用户账号" id="username"
			onfocus="if(value=='请输入要添加的用户账号'){value=''}"
			onblur="if(value==''){value='请输入要添加的用户账号'}">
		<button type="button" id="queryFriends_button"
			style="width: 120px; height: 45px; margin-top: 26px; margin-left: 20px;"
			class="am-btn am-btn-secondary">查找</button>
		<hr>
		<a href="#" id="seachByPersonnal_Mine"
			style="color: gray; font-size: 12px;">按条件查询</a>
		<div id="seachDiv"
			style="width: 100%; height: 280px; margin: 0 auto; border: 1px solid #B0E0E6; display: none; margin-top: 30px;">
			<font
				style="font-family: fantasy; display: block; width: 150px; height: 40px; font-size: 15px; color: gray; margin-left: 40px; margin-top: 30px; float: left;">按地区查询
				:</font> <select id="selectProvinces"
				style="width: 100px; margin-top: 30px; float: left;"><option
					value="0">--请选择--</option>
				<c:forEach var="province" items="${provinces}">
					<option value="${province.provinceid}">${province.provincename}</option>
				</c:forEach>
			</select> <select id="selectCitys"
				style="width: 100px; margin-top: 30px; float: left; margin-left: 10px; display: none;">
			</select><select id="selectDistricts"
				style="width: 100px; margin-top: 30px; float: left; margin-left: 10px; display: none;">
			</select>
			<hr style="margin-top: 80px;">
			<font
				style="font-family: fantasy; display: block; width: 150px; height: 40px; font-size: 15px; color: gray; margin-left: 40px; margin-top: 20px; float: left;">按性别查询
				:</font> <input type="radio" class="sexRadio" style="margin-top: 28px;"
				value="1" name="radio"> 男 <input type="radio"
				class="sexRadio" style="margin-top: 28px; margin-left: 40px;"
				value="0" name="radio"> 女 <input type="radio"
				class="sexRadio" style="margin-top: 28px; margin-left: 40px;"
				value="-1" name="radio" checked="checked"> 不限
				<c:forEach var="user" items="${loginlist}">  
				  <p>${user.userid}</p>
				</c:forEach> 
			<hr style="margin-top: 30px;">
			<font
				style="font-family: fantasy; display: block; width: 150px; height: 40px; font-size: 15px; color: gray; margin-left: 40px; margin-top: 20px; float: left;">按昵称查询
				:</font> <input width="300px;" type="text" id="realname"
				style="margin-top: 15px; width: 300px; height: 40px; font-size: 15px; color: gray;"
				name="realname" value="请输入要添加的昵称"
				onfocus="if(value=='请输入要添加的昵称'){value=''}"
				onblur="if(value==''){value='请输入要添加的昵称'}">
		</div>
		<div id="usersDiv" style="width: 100%; height: 400px; border: 1px solid #B0E0E6; margin-top: 20px; display: none;"></div>
	</div>
	
	<div id="lay-ui-limt" style="width: 280px; height: 350px; display: none;">
	</div>
</body>
</html>