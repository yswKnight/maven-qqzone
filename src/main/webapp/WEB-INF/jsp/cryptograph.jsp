<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'osculation.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/liu1/fort.css" type="text/css"></link>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/liu1/fort.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/liu1/style.css"
	type="text/css"></link>
		<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/amazeui.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/layer-v3.0.1/layer-v3.0.1/layer/layer.js"></script>
<style>
.top-banner {
	background-color: #333;
}

.nav {
	margin-bottom: 0px;
}

.nav li.current a {
	background-color: #009DFF;
	color: #fff;
	padding: 10px;
}

.nav a {
	margin: 5px;
	color: #333;
	text-decoration: none;
}

select {
	border-radius: 5px;
}
</style>

</head>
<script type="text/javascript">
	$(function() {
		$('body',parent.document).find('.middle_left_1').css("display","block");
		$('body',parent.document).find('.middle_right_big').css("display","block");
		$('body',parent.document).find('.middle_right').css("width","");
		$('body',parent.document).find('.middle_right iframe').css("width","650px");
		$(document)
				.on(
						"click",
						"#insertpwd",
						function() {
							var question1 = $("#s1").val();
							var question2 = $("#s2").val();
							var question3 = $("#s3").val();
							var answer1 = $("#answer1").val();
							var answer2 = $("#answer2").val();
							var answer3 = $("#answer3").val();
							$
									.ajax({
										url : "${pageContext.request.contextPath}/user/setPersonnal.json",
										type : "POST",
										data : {
											"question1" : question1,
											"question2" : question2,
											"question3" : question3,
											"answer1" : answer1,
											"answer2" : answer2,
											"answer3" : answer3
										},
										dataType : "JSON",
										success : function(result) {
											if (result.result == "success") {
												layer.msg('设置成功', {
													icon : 1,
													time : 2000
												});
												setTimeout(
														function() {
															window.location.href = "${pageContext.request.contextPath}/user/toMinePersonnal.htm";
														}, 2500);
											}
										}
									});
						});
	});
</script>
<body>

	<div class="form-wrapper" style="margin-top: 10px; height: 360px;">
		<div class="top">
			<div class="colors"></div>
		</div>
		<div class="nav" style="margin-bottom: 50px;">
			<a style="font-size: 14px; color: #5D7895;">设置密保</a>
			<hr
				style="color: #d9d9d9; width: 615px; margin-left: 5px; margin-top: 5px">
			<!-- 396216 -->

		</div>
		<c:if test="${falg=='yes'}">
			<div style="margin-left: 30px" class="form">

				<div class="form-item">
					问题一:<select id="s1" name="question1"
						style="width: 200px; height: 25px;">
						<c:forEach var="question" items="${questions}" begin="1" end="3">
							<option value="${question.dicid}">${question.dicvalue}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-item">
					<input type="text" name="answer1" id="answer1" required="required"
						placeholder="请输入答案" autocomplete="off">
				</div>

				<div class="form-item">
					问题二:<select id="s2" name="question2"
						style="width: 200px; height: 25px;">
						<c:forEach var="question" items="${questions}" begin="4" end="6">
							<option value="${question.dicid}">${question.dicvalue}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-item">
					<input type="text" name="answer2" id="answer2" required="required"
						placeholder="请输入答案" autocomplete="off">
				</div>


				<div class="form-item">
					问题三:<select id="s3" name="question3"
						style="width: 200px; height: 25px;">
						<c:forEach var="question" items="${questions}" begin="7" end="9">
							<option value="${question.dicid}">${question.dicvalue}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-item">
					<input type="text" name="answer3" id="answer3" required="required"
						placeholder="请输入答案" autocomplete="off">
				</div>
				<div class="button-panel">

					<input style="width: 120px;height: 30px;line-height: 0px;" type="button" id="insertpwd" class=" am-btn am-btn-secondary" title="Sign In"
						value="提交"> <input style="width: 120px;height: 30px;line-height: 0px;" type="reset" id="insertpwd1"
						class=" am-btn am-btn-danger" title="follow the same old disastrous road "
						value="重置">
				</div>
			</div>
		</c:if>
		<c:if test="${falg=='no'}">
			<h3 style="text-align: center;">您已设置密保</h3>
		</c:if>
	</div>
	<div class="footer-banner" style="width: 728px; margin: 200px auto 0"></div>
</body>
</html>
