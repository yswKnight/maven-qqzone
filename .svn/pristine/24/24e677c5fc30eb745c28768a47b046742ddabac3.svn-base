<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>QQzone分享生活，留下感动</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <!-- CSS -->
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/supersized.css">
        <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/layer/layer.js"></script>
    <body oncontextmenu="return false" >
    <div id="qw">
    <div id="log"><img src="img/logn4.png" style="margin-top: 100px;"></div>
        <div class="page-container">
            <form action="" method="post"  style="margin-left: 20px;margin-top: 10px;">
            <table style="font-size: 14px;color: black; ">
          		<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
            	<tr><td colspan="2" style="font-size: 20px;text-align: center;">用户登录</td></tr>
            	<tr><td>账号：</td> <td><input type="text" name="usernum" class="username" placeholder="支持QQ账号" autocomplete="off" onkeyup="this.value=this.value.replace(/[^\d]/g,'') " /></td></tr>
            	<tr><td>密码：</td> <td><input type="password" name="password" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" /></td></tr>
            	<tr><td>验证码：</td> <td><input type="text" name="yan" class="yan" placeholder="请输入验证码" oncontextmenu="return false" onpaste="return false" style="width: 120px;height: 42px;"/>
            		 &nbsp; <IMG id="img1" src="number.jsp" border=0 style="height: 22px;"> <A id=LinkButton1 onclick="yzm();" style="font-size: 14px;">看不清？</A></td></tr>
            	<tr><td></td><td><input type="button" value="登录"  id="submit" style="background: #86DC21;" onclick="userlogin();"/></td> </tr>
            </table>
            </form>
            <br><br>
            <table id="aa">
            	<tr><td><a href="login/toregist">开通QQ空间?</a></td><td>▎</td> <td><a href="user/togorget">忘记密码？</a></td><td>▎</td> <td><a href="">意见反馈</a></td></tr>
            </table>
        </div>
        </div>
       
	<div class="connect">
	<table><tr><td  id="cc">
							<p><a href="http://support.qq.com/discuss/46_1.shtml" >反馈建议</a> |</p>
							<p><a href="http://qzone.qzone.qq.com/" >官方空间</a> |</p>
							<p><a href="http://act.qzone.qq.com/" >空间活动</a> |</p>
							<p><a href="http://my.qzone.qq.com/" >空间应用</a> |</p>
							<p><a href="http://user.qzone.qq.com/949589999/main" >腾讯原创馆</a> |</p>
							<p><a href="http://connect.qq.com/" >QQ互联</a> |</p>
							<p><a href="http://connect.qq.com/intro/login/" >QQ登录</a> |</p>
							<p><a href="http://connect.qq.com/intro/share/">社交组件</a> |</p>
							<p><a href="http://wiki.open.qq.com/wiki/%E6%8A%95%E8%AF%89%E6%8C%87%E5%BC%95" >应用侵权投诉</a> |</p>
					</td></tr>
					<tr><td class="copyright_en"><p >Copyright &copy; 2005 - 2015 Tencent.<a target="_blank" href="http://www.tencent.com/en-us/le/copyrightstatement.shtml">All Rights Reserved.</a></p></td></tr>
					<tr><td class="copyright_en"><p >厚朴公司 <a href="http://www.tencent.com/law/mo_law.shtml?/law/copyright.htm" target="_blank">版权所有</a> <a href="http://www.qq.com/culture.shtml" target="_blank">粤网文[2011]0483-070号</a></p></td></tr>
	</table>
           </div>
        <!-- Javascript -->
		
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>

<script>
			$(function(){
			$(".username").blur( function () { 
			var username=$(".username").val()
			if(username==""){
			layer.tips('账号不能为空','.username',{
				tips:3
			});
			}
 } );
 	$(".password").blur( function () { 
			var password=$(".password").val()
			if(password==""){
			layer.tips('密码不能为空','.password',{
				tips:3
			});
			}
 } );
 	$(".yan").blur( function () { 
			var yan=$(".yan").val()
			if(yan==""){
			layer.tips('验证码不能为空','.yan',{
				tips:3
			});
			}
 } );
})
function userlogin(){
		var usernum= $(".username").val();
  		var pass = $(".password").val();
  		var code = $(".yan").val();
  		if(usernum==""||pass==""||code==""){
			layer.tips('请正确填写登录信息', '#submit');
			}else{
			
		$.ajax({
		 url:'login/userlogin',
		 data:{"usernum":usernum,"pass":pass,"code":code},
		 dataType:"json",
		 type:"POST",
		 success:function(data){
		 if(data!=null){top.location="login/tohome";}//登录成功
		 if(data.username==null){top.location="login/tologin";}	//失败 
		 },
		 error:function(){
		 alert('服务器异常');
		  }
		});
	 }
}			
</script>
<script type="text/javascript">
	function yzm(){
		document.getElementById("img1").src="number.jsp?p="+new Date().getTime();
	}
</script>
    </body>

</html>
