<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>好友信息中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
 	 <script type="text/javascript" src="js/layer/layer.js"></script>
  	<script type="text/javascript" src="js/layer/extend/layer.ext.js"></script>
  	<style type="text/css">
  		body{mrgin:0;padding:0;}
		#main{width:88%;font-size:14px;}
		/*导航*/
		#infoMenu{width:635px;height: 45px;position:relative;bottom:10px;}
		#infoMenu li{list-style: none;float: left;position:relative;right:40px;top:14px;}
		#infoMenu li a{text-decoration: none;padding:15px 35px;color: #5d7895;}
		#infoMenu a:hover{font-weight: bold;}
		#backFriend{position:relative;top:15px;left:260px;font-size: 12px;text-decoration: none;color:#666;}
		#backFriend:hover{background-color:none;}
		.btn{border:1px #fff solid;height:30px;}
		
  	</style>
  	</head>
  <script>
  	$(function(){
	  		$('body',parent.document).find('.middle_left_1').css("display","block");
			$('body',parent.document).find('.middle_right_big').css("display","block");
			$('body',parent.document).find('.middle_right').css("width","");
			$('body',parent.document).find('.middle_right iframe').css("width","650px");
		
  			$("#dianji1").click(function(){
  			hidediv();
   			$("#shuijiawo").show();
  	 		selectwhoinsertme();
  			});
  			$("#dianji2").click(function(){
	  	 		hidediv();
	  	 		$("#mymsg").show();
	   	  		$("#xinhaoyou	").show();
	  			selectmymsg();
	  			selectnewmsg();
  			});
  	  
  	 		var touserid=$("#touserid").val();
	  	});//function end
  		//div隐藏
  		function hidediv(){
  		  	$("#shuijiawo").hide();
  		  	$("#xinhaoyou").hide();
  		  	$("#mymsg").hide();
  		}
  	 
  		function queren(userid){
  			var huifumsg=$("#huifumsgtext").val();
  			//userid是添加发起者 touserid 是消息接收者
		  	var touserid=$("#touserid").val();
			var msgid=$("#msgid").val();
  			$.ajax({
  			  	url:'friend/chulimsg',
  			   	data:{"touserid":touserid,"msgid":msgid,"msgtext":huifumsg,"userid":userid},
		 	   	dataType:"json",
		 	   	type:"POST",
  			   	success:function(data){
 					 layer.msg("恭喜，操作成功","background-color:#fff;");
 				   	 selectwhoinsertme(); 
				},
		 	   error:function(){
		 			 layer.msg("你们已经是好友了！","background-color:#fff;");
 					 layer.close(index);
		 		}	
  			});//ajaxend
  		}
	  	//查询 谁添加我
	  	function   selectwhoinsertme(){
	  		var touserid=$("#touserid").val();
	 	 	hidediv();
   			$("#shuijiawo").show();
		  	 $.ajax({
		  			   url:'friend/selectwhoinsertme',
		  			   data:{"touserid":touserid},
				 	   dataType:"json",
				 	   type:"POST",
		  			   success:function(data){
		 					var content = "<table border='0' width='100%' style='font-size:13px;'>";
				 			$.each(data,function(i,msg){
 			   			 			content += "<input type='hidden' value="+msg.msgid+" id='msgid'>";
 			   			 			content +="<tr>";
 			   						content += "<td>昵称:</td><td>"+msg.user.username+"</td>";
 			   						content += "<td>性别</td>";
 			   						if(msg.user.sex==1){
 			   							content +="<td colspan='2'>男</td>";
 			   						}else{
 			   							content +="<td  colspan='2'>女</td>";
 			   						}
 			   						content += "<td>他对你说:</td><td>"+msg.msgtext+"</td><td><select  id='huifumsgtext'><option>同意并添加为好友</option><option>同意</option><option>拒绝</option></select></td>";
 			   						content += "<td><input type='button' onclick='queren("+msg.user.userid+");' value='确认' class='btn'/></td></tr>";
				 		  	});
	 			   			content += "</table>";
	 			   		   	$("#shuijiawo").html(content);
							  },
				 	   error:function(){
				 			alert('服务器异常');
				 		}	
		  		});
		  }
	  	 //查询收到消息
	  	function   selectmymsg(userid){
	  	var touserid=$("#touserid").val();
	  	 $.ajax({
	  			   url:'friend/selectmymsg',
	  			   data:{"touserid":touserid},
			 	   dataType:"json",
			 	   type:"POST",
  			   	   success:function(data){
 				   		var content = "<table border='0' width='100%' style='font-size:13px;'>";
 			   			$.each(data,function(i,msg){
 			   			 			content += "<input type='hidden' value="+msg.msgid+" id='msgid'>";
 			   			 			content +="<tr>";
 			   						content += "<td>QQ</td><td>"+msg.user.qqnumber+"</td>";
 			   						content += "<td>性别</td>";
 			   						if(msg.user.sex==1){
 			   							content +="<td colspan='2'>男</td>";
 			   						}else{
 			   							content +="<td  colspan='2'>女</td>";
 			   						}
 			   						content += "<td>收到消息</td><td>你"+msg.msgtext+msg.user.username+"  加为好友</td><td><input type='button' onclick='dodelete2("+msg.msgid+");' value='知道了' class='btn'></td></tr>";
 		  				 });
 			   			content += "</table>";
 			   		   	$("#mymsg").html(content);
					  },
		 	   		  error:function(){
		 			   	alert('服务器异常');
		 			   }	
	  			});
  			}
  			//发送者忽略了
  			function dodelete1(msgid){
			    layer.msg('你确定要忽略这个消息吗？', {
			    time: 0 //不自动关闭
			    ,btn: ['确认', '取消']
			    ,yes: function(index){
	  	  		$.ajax({
	  	  		 		url:'friend/deletemsg1',
	  			   		data:{"msgid":msgid},
			 	   		dataType:"json",
			 	   		type:"POST",
	  	  		  		success:function(data){
	 				 		selectmymsg();
	  				 		selectnewmsg();
						  },
			 	   error:function(){
			 			    selectmymsg();
	  						selectnewmsg();		 
			 			   }
	  	  		});
        		layer.close(index);
    			}
			});
  		}
  		//接受者知道了
  			function dodelete2(msgid){
			    layer.msg('你确定要忽略这个消息吗？', {
			    time: 0 //不自动关闭
			    ,btn: ['确认', '取消']
			    ,yes: function(index){
	  	  		$.ajax({
	  	  		 		url:'friend/deletemsg2',
	  			   		data:{"msgid":msgid},
			 	   		dataType:"json",
			 	   		type:"POST",
	  	  		  		success:function(data){
	 				 		selectmymsg();
	  				 		selectnewmsg();
						  },
			 	   error:function(){
			 			    selectmymsg();
	  						selectnewmsg();		 
			 			   }
	  	  		});
        		layer.close(index);
    			}
			});
  		}
  	 
  	//查询新好友信息 
    function   selectnewmsg(){
  		var touserid=$("#touserid").val();
  	
	  	 $.ajax({
	  			   url:'friend/selectnewmsg',
	  			   data:{"userid":touserid},
			 	   dataType:"json",
			 	   type:"POST",
	  			   success:function(data){
	 					var content = "<table border='0' width='100%' style='font-size:13px;'>";
			 			   			$.each(data,function(i,msg){
			 			   			 			content += "<input type='hidden' value="+msg.msgid+" id='msgid'>";
			 			   						content += "<tr><td rowspan='3' width='100px' height='100px'><img src="+msg.user.userimg+" width='50px' height='50px'></td><td>QQ</td><td>"+msg.user.qqnumber+"</td></tr>";
			 			   						content += "<tr><td>性别</td>";
			 			   						if(msg.user.sex==1){
			 			   							content +="<td colspan='2'>男</td></tr>";
			 			   						}else{
			 			   							content +="<td  colspan='2'>女</td></tr>";
			 			   						}
			 			   						content += "<tr><td>收到消息</td><td>"+msg.user.username+msg.msgtext+"成为你的好友</td><td><input type='button' value='知道了'  onclick='dodelete1("+msg.msgid+");' class='btn'></td></tr>";
			 		  			});
			 			   				content += "</table>";
			 			   		   	 $("#xinhaoyou").html(content);
						  },
			 	   error:function(){
			 			   				alert('服务器异常');
			 			   }	
	  		});
  	}
  </script>
  <body>
	<div id="main">
	  	<div id="infoMenu">
	  		 
	  		<input type="hidden" value="${user.userid}" id="touserid"/>
	  		<ul>
	  			<li><a id="dianji1" >谁要加我</a></li>
					
	  			<li><a id="dianji2" >我的消息</a></li>
	  		</ul>
	  		<a href="friend/tofriendhome" id="backFriend">返回</a>
	  	</div>
	  	<hr>
	  	<div id="shuijiawo">
	   	
	   	</div>
	   	<div id="mymsg">
	   	
	   	</div>
	   	<div id="xinhaoyou">
	   	
	   	
	   	</div>
	 
	 </div>
  </body>
</html>
