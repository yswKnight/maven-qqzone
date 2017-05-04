<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>消息中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/amazeui.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/address.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
<style type="text/css">
#contenttable th {
	text-align: center;
}

#contenttable td {
	text-align: center;
	height: 90px;
}
</style>

<script type="text/javascript">
	$(function() {
		$(document)
				.on(
						"click",
						".dealMsg",
						function() {
							//每当点击处理按钮时 加一个特定标识
							$(this).addClass("crtdeal");
							var msgId = $(this).parents("tr").attr("msgid");
							$
									.ajax({
										url : "${pageContext.request.contextPath}/friend/getMsg.json",
										type : "POST",
										data : {
											"msgId" : msgId
										},
										dataType : "JSON",
										success : function(result) {
											var contentstr = "<input  type='hidden' value='"+result.msg.msgid+"' id='msgid'><input type='hidden' value='"+result.msg.user.userid+"' id='userId'>";
											contentstr += "<img style='width: 140px; height: 140px; margin-top: 5px; margin-left: 5px; float: left;' alt='无法加载' src='${pageContext.request.contextPath}/"+result.msg.user.img+"' >";
											contentstr += "<div style='width: 90px; height: 140px; float: left; margin-left: 15px;'><h3 style='margin-top: 45px; text-align: center;'>"
													+ result.msg.user.realname
													+ "</h3><font style='font-size: 14px; color: gray;'>"
													+ result.msg.msg
													+ "</font></div>";

											$("#msg").html(contentstr);

											layer.open({
												type : 1,
												skin : 'layui-layer-molv', //样式类名
												offset : '100px',
												title : "好友验证",
												closeBtn : 1, //不显示关闭按钮
												shadeClose : true, //开启遮罩关闭
												content : $("#layer-div-out")
											});

										}
									});

						});
		//取消按钮
		$(document).on("click", "#toComeBack", function() {
			$(".crtdeal").removeClass("crtdeal");
			layer.closeAll();
		});

		//确认按钮
		$(document).on("click", "#toSubmit", function() {
			var result = $("#msgResult").val();
			var msgId = $("#msgid").val();
			var userId = $("#userId").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/friend/dealMas.json",
				data : {
					"result" : result,
					"msgId" : msgId,
					"userId" : userId
				},
				type : "POST",
				dataType : "JSON",
				success : function(result) {
					if (result.rlt == "success") {
						layer.closeAll();
						$(".crtdeal").removeClass("crtdeal");
						layer.msg('处理成功', {
							time : 2000, //2s后自动关闭
							skin : 'layer-ext-moon'
						});
						setTimeout(function() {
							window.location.href = "${pageContext.request.contextPath}/friend/toFriendHome.htm";
						}, 2000);
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<h3 style="color: gray; text-align: center; margin-top: 30px;">信息中心</h3>
	<hr style="margin-top: 10px; margin-bottom: 10px; color: gray;">
	<table id="contenttable" style="width: 85%; margin: 0 auto;">
		<c:if test="${empty mymsgs}">
			<h5 style="margin-left: 40px; color: gray;">暂无消息</h5>
		</c:if>
		<c:if test="${not empty mymsgs}">
			<tr>
				<th>头像</th>
				<th>用户名</th>
				<th>验证消息</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
			<c:forEach var="msg" items="${mymsgs}">
				<tr msgid="${msg.msgid}">
					<c:if test="${empty msg.user.img}">
						<td><img style="width: 80px; height: 80px;" alt="无法加载头像"
						src="${pageContext.request.contextPath}/imgs/default.jpg"></td>
					</c:if>
					<c:if test="${not empty msg.user.img}">
						<td><img style="width: 80px; height: 80px;" alt="无法加载头像"
						src="${pageContext.request.contextPath}/${msg.user.img}"></td>
					</c:if>
					<td>${msg.user.realname}</td>
					<td>${msg.msg}</td>
					<td class="status">${msg.status==1?'待处理':'已处理'}</td>
					<td><c:if test="${msg.status==1}">
							<input type="button" value="处理"
								class="dealMsg am-btn am-btn-secondary am-round">
						</c:if></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	<div id="layer-div-out"
		style="width: 280px; height: 300px; display: none;">
		<div id="msg"
			style="width: 260px; height: 150px; margin-left: 10px; margin-top: 15px; border: 1px solid #B0E0E6;">
		</div>
		<div>
			<select id="msgResult"
				style="margin-left: 30px; width: 120px; margin-top: 20px;">
				<option value="0">同意</option>
				<option value="1">拒绝</option>
				<option value="2">忽略</option>
			</select>
			<div style="margin-top: 30px; margin-left: 30px;">
				<input type="button" value="确认" class="am-btn am-btn-primary"
					style="width: 100px;" id="toSubmit"><input type="button"
					value="取消" class="am-btn am-btn-danger" style="width: 100px;"
					id="toComeBack">
			</div>
		</div>
	</div>
</body>
</html>