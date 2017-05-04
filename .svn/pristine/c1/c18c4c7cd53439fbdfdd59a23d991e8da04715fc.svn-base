/*
这是一个有关相仿qq照片中插件
*/			
            var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					resizeType : 1,
					allowPreviewEmoticons : false,
					allowImageUpload : false,
					width:'100%',
					height:"300px",
					items : [
						'image','emoticons',
        'flash', 'media', 'insertfile', 'table', 'hr',  'map', 'code', 'pagebreak',
        'link', 'unlink', '|','source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'cut', 'copy', 'paste',
        'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
        'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', 
        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|',  'about'

						]
				});
				
				
				
				K('input[name=getHtml]').click(function(e) {
					var test=editor.html();
					var title=$(".boxc_a").html();
					$(".boxc_a").empty();
					editor.html("");
					var userid=$(".boxc_u").html();
					if(test==""||title==""){
						layer.msg('随便写点吧！', {
						  	icon: 4,
						  	offset:['250px','250px']
						  	});
					}else{
					K.ajax('logact/ajax', function(data) {
						if(data.logid==2){
							selectlog();
						}
					}, 'POST', {
						text:test,
						title:title,
						userid:userid,
					});
					}
				});
			});

			
		function selectlog(){
			var userid=$(".boxc_u").html();
			$.ajax({
				url:'logact/selectlog',
				data:{"userid":userid},
				dataType:"json",
				type:"POST",
				success:function(data){
				if(data!=null){
				 $("#nolog").hide();
				 $("#show").show();
				 $("#logdate").html(data.logdate);
				 $("#logtitle").html(data.logtitle);
				 $("#logtext").html(data.logtext);
				 }
				if(data.logid==0){
				 $("#show").hide();
				 $("#nolog").show();
				 $("#nolog").html("目前您还没有发表日志！");
				 }
				 },
				error:function(){
				//alert('服务器异常');
		 }
});
}
		//我的日志
		function loghome(){
			hideDiv();
			$("#showMyLog").show();
			myLog();
		}
		//写日志
		function mylog(){
			hideDiv();
			$(".box1").show();
			selectlog();
		}
		
		//显示菜单
		function shouMenu(){
			hideDiv();
			$(".box1").show();
		}
		
		//显示我的日志
		function myLog(pageno){
			hideDiv();
			$("#showMyLog").show();
			$.ajax({
  			   url:'logact/logactAll',
  			   data:{"num":pageno},
		 	   dataType:"json",
		 	   type:"POST",
  			   success:function(data){
  				   var content="";
  				   content += "<table border='0' width='100%' id='listTable'>";
  				   $.each(data.listObject,function(i,log){
  					   content += "<tr>";
  					   content += "<td style='width:40%;' align='left'>"+(log.logtitle).substring(0,10)+"</td>";
  					   content += "<td style='width:35%;' align='right'>"+ log.logdate+"</td>";
  					   content += "<td style='width:25%;' align='right'><section><div class='dropdown'><a id='dLabel' role='button' data-toggle='dropdown' data-target='#' href='/page.html'>操作";
  					   content +="<span class='caret'></span></a><ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1'><li><a href='javascript:delMyLog("+log.logid+");'>删除</a></li>";
  					   content +="<li class='divider'></li><li><a href='javascript:showOneLog("+log.logid+")'>修改/查看</a></li></ul></div></section>";
  					   content +="</td>";
  					   content +="</tr>";
 			   			});	
 			   			content += "</table>";
 			   			content+="<p><font size=2>共"+data.totalPageCount+"页</font>";
 			   			content+="<font size=2>第"+data.pageNow+"页</font>";
 			   			content+="<a href=javascript:myLog("+1+")>首页</a>";
 			   			if(data.pageNow-1>0){
 			   		    content+="<a href=javascript:myLog("+(data.pageNow-1)+")>上一页</a>";
 			   			}
 			   			if(data.pageNow-1<=0){
 			   			  content+="<a href=javascript:myLog("+1+")>上一页</a>";
 			   			}
 			   			if(data.pageNow + 1<data.totalPageCount){
 			   			  	content+="<a   href=javascript:myLog("+(data.pageNow+1)+")>下一页</a>";
 			   			}
 			   			if(data.pageNow + 1>=data.totalPageCount){
 			   			
 			   			  	content+="<a href=javascript:myLog("+data.totalPageCount+")>下一页</a>";
 			   			}
		 			   	content+="<a href=javascript:myLog("+data.totalPageCount+")>尾页</a></p>";
 			   		   	$("#showMyLog").html(content);
				},
		 	   error:function(){
		 			   layer.msg("当前日志为空！",{icon:6});
		 		}	
  			});
		}
		
		//根据标题显示单条日志
		function showOneLog(logid){
			hideDiv();
			$("#showOne").show();
			$.ajax({
				url:"logact/oneLog",
				data:{"logid":logid},
				dataType:"json",
				type:"POST",
				success:function(data){
					var content="";
					$.each(data,function(i,one){
						content +="<div id='ltitle' contenteditable='true'>"+one.logtitle+"</div><br/>";
						content +="<div contenteditable='true' id='logcontent' >"+one.logtext+"</div><br/>";
						content +="<input type='button' value='修改' id='btn' onclick='updateLog("+one.logid+");' /><input type='button' value='返回' id='btn1' onclick='myLog();' />";
					});
					$("#showOne").html(content);
				}
			});
			
		}
		
		//修改日志
		function updateLog(logid){
			var logtitle = $("#ltitle").html().valueOf();
			var logtext = $("#logcontent").html().valueOf();
			 $.ajax({
				url:"logact/updateLog",
				data:{"logid":logid,"logtitle":logtitle,"logtext":logtext},
				dataType:"json",
				type:"POST",
				success:function(data){
					layer.msg("修改成功！",{icon:6});
					myLog();
				}
			});
		}
		
		//根据日志id删除日志
		function delMyLog(logid){
			if(window.confirm('您确定要删除该日志？')){
				$.ajax({
					url:"logact/dellogact",
					data:{"logid":logid},
					dataType:"json",
					type:"POST",
					success:function(data){
						layer.msg("删除成功！",{icon:6});
						myLog();
					}
				});
		 	}
		}