<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">

<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/table.css" rel="stylesheet" type="text/css" />
<link href="/dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="/dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen" />

<link type="text/css" href="/jQuery/ui/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
<link rel="stylesheet" href="/jQuery/pagination/pagination.css" />
<script type="text/javascript" src="jQuery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="jQuery/ui/js/jquery-ui-1.8.18.custom.min.js"></script>
<script type="text/javascript" src="jQuery/ui/js/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript" src="jQuery/ui/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="jQuery/pagination/jquery.pagination.js"></script>
<script type="text/javascript" src="js/jsUtil.js"></script>



<script type="text/javascript">
	 //页面加载完成之后
	 $(function(){
		
		displayData(0);
		
		$("#pageNo").keydown(function(event){
			if(event.keyCode==13){
				displayData(this.value-1);
			}
		});
		$("#checkOrCancelAll").click(function(){
			$(":checkbox[name='id']").prop("checked",this.checked);				
		});
	});
	
	function displayData(pageNo){
		$("#checkOrCancelAll").prop("checked",false);
		var pageSize = $("#pageSize").val();
		var lockStatus = 0;
		var checkedElts = $(":checkbox[name='lockStatus']:checked");
		if(checkedElts.length==1){
			lockStatus = checkedElts.val();
		}
		$.ajax({
			
			url:"${pageContext.request.contextPath}/reader/getByPage.do",
			type:"get",
			cache:false,
			data:{
				"pageNo":pageNo+1,
				"pageSize":pageSize,
				"readerName":$("#readerName").val(),			
				"readerTel":$("#readerTel").val(),		
				"readerStatusId":$("#readerStatusId").val(),			
				"bookCardId":$("#bookCardId").val()			
			},
			beforeSend:function(){
				$("#message").text("正在进行分页查询请稍后...");
				return true;
			},
			success:function(jsonObject){
				$("#userInfoTBody").empty();
				//{"total":100,"dataList":[{"id":"","accountNo":"","name":"","createTime":"","expireTime":"","allowIps":"","lockStatusText":""},{},{}]}
				if(jsonObject.total==0){					
					$("#message").text("没有符合条件的记录");
				}else{
					$("#message").text("查询结果如下:");
					var htmlString = "";
					$.each(jsonObject.dataList,function(i,n){						
						htmlString +='<tr class="odd">';
						htmlString +='<td><input type="checkbox" name="id" value="'+n.readerId+'" onclick="controlFirstCheckbox();"/></td>';
						htmlString +='<td>'+(i+1)+'</td>';
						htmlString +='<td>'+n.readerName+'</td>';
						htmlString +='<td>'+n.readerGender+'</td>';		 				
						htmlString +='<td>'+n.readerTel+'</td>';		 				
						htmlString +='<td>'+n.readerCardId+'</td>';		 				
						htmlString +='<td>'+n.readerStatus+'</td>';		 				
						htmlString +='<td>'+n.bookCardId+'</td>';		 				
						htmlString +='<td>'+n.bookCardStatus+'</td>';		 				
						htmlString +='</tr>';
					});
					$("#userInfoTBody").append(htmlString);
				}
				
				//集成jquery的分页插件
				$("#pagination").pagination(jsonObject.total, {//总记录条数
		            callback: displayData,//每次在翻页的时候,都会执行的回调函数 ,而且会给这个回调函数传递一个参数 ,该参数代表页码的索引,比正常的页码小1
		            items_per_page:pageSize, // 每页显示多少条记录
		            current_page:pageNo,//当前页码的索引
		            link_to:"javascript:void(0)",//保留超链接的样式,执行js代码,但是不跳转到任何资源
		            num_display_entries:8,//如果页码过多,默认的链接入口个数
		            next_text:"下一页",
		            prev_text:"上一页",
		            next_show_always:true,//如果没有下一页,是否显示链接
		            prev_show_always:true,//如果没有上一页,是否显示链接
		            num_edge_entries:2,//如果页码过多,用...省略
		            ellipse_text:"..."
		        });
				//显示总记录条数
				$("#total").text(jsonObject.total);
				
				//显示总页数
				var pageCount = jsonObject.total%pageSize==0?jsonObject.total/pageSize:parseInt(jsonObject.total/pageSize)+1;
				$("#pageCount").text(pageCount);
			}
		});
	}

	 function controlFirstCheckbox(){
		$("#checkOrCancelAll").prop("checked",$(":checkbox[name='id']").length==$(":checkbox[name='id']:checked").length);			
	}
	
	function detail(){
		$_.selectSingleCheckbox("${pageContext.request.contextPath}/user/detail.do");
	}
	
	//销户读者
	function del(){
		var checkedElts = $(":checkbox[name='id']:checked");
		if(checkedElts.length==0){
			$("#message").text("请选择要销户的记录");
		}else{
			if(confirm("您确定要对选中的记录进行销户吗?")){
				//拼接要删除的角色id 方式2
				var sendData = "ids=";
				var idArray = [];
				$.each(checkedElts,function(i,n){
					idArray.push(n.value);
				});
				sendData += idArray.join("&ids=");
				$.ajax({
					url:"${pageContext.request.contextPath}/reader/delete.do",
					type:"post",
					data:sendData,
					beforeSend:function(){
						$("#message").text("正在销户,请稍后...");
						return true;
					},
					success:function(jsonObject){
						if(jsonObject.success){
							$("#message").text("销户成功");	
							//重新加载页面 displayData(0);
							window.location.reload();
						}else{
							$("#message").text("销户失败");														
						}
					}
				});
			}
		}
	}
	
	//恢复读者
	function recover(){
		var checkedElts = $(":checkbox[name='id']:checked");
		if(checkedElts.length==0){
			$("#message").text("请选择要恢复的记录");
		}else{
			if(confirm("您确定要对选中的记录进行恢复吗?")){
				//拼接要删除的角色id 方式2
				var sendData = "ids=";
				var idArray = [];
				$.each(checkedElts,function(i,n){
					idArray.push(n.value);
				});
				sendData += idArray.join("&ids=");
				$.ajax({
					url:"${pageContext.request.contextPath}/reader/recover.do",
					type:"post",
					data:sendData,
					beforeSend:function(){
						$("#message").text("正在恢复,请稍后...");
						return true;
					},
					success:function(jsonObject){
						if(jsonObject.success){
							$("#message").text("恢复成功");	
							//重新加载页面 displayData(0);
							window.location.reload();
						}else{
							$("#message").text("恢复失败");														
						}
					}
				});
			}
		}
	}
	//重置密码借阅员
	function repwd(){
		var checkedElts = $(":checkbox[name='id']:checked");
		if(checkedElts.length>1 || checkedElts.length == 0){
			$("#message").text("请选择一个重置密码");
		}else{
			if(confirm("您确定要重置密码吗?")){				
				$.ajax({
					url:"${pageContext.request.contextPath}/reader/repwd.do",
					type:"post",
					data:{"readerId":checkedElts.val()},
					beforeSend:function(){
						$("#message").text("正在重置请稍后...");
						return true;
					},
					success:function(jsonObject){
						if(jsonObject.success){
							$("#message").text("重置成功");	
							//重新加载页面 displayData(0);
							window.location.reload();
						}else{
							$("#message").text("重置失败");														
						}
					}
				});
			}
		}
	}
</script>
<table width="100%" border="0" cellspacing="0" class="table_padding">
	<tr>
		<td align="center">
			<table border="0" cellpadding="0" cellspacing="0" class="table_border">
				<tr>
					<td align="center">
					
						<table border="0" cellpadding="0" cellspacing="0" class="box_table" id="box_table">
							<tr>
								<td width="22%">&nbsp;姓名：<input type="text" id="readerName"/></td>
								<td width="22%">&nbsp;联系电话：<input type="text" id="readerTel"/></td>
								<td width="22%">&nbsp;状态：
													<select id="readerStatusId">
														<option value="-2">全部</option>
														<c:forEach items="${readerStatus }" var="obj">
															<option value="${obj.key }">${obj.value }</option>
														</c:forEach>
													</select>
													</td>
								<td width="22%">&nbsp;图书证编号：<input type="text" id="bookCardId"/></td>
								
								<td>
									<a class="button" href="javascript:void(0);" onclick="displayData(0);"><span>查询</span></a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" class="table_border">
				<tr>
					<td>
						<table style="position : relative;left : 5px; top : 5px;">
							<tr>								
								<td width="50px">
									<a class="button" href="javascript:void(0);" onclick="del();"><span>销户</span></a>
								</td>																
								<td width="50px">
									<a class="button" href="javascript:void(0);" onclick="recover();"><span>恢复</span></a>
								</td>																
								<td width="75px">
									<a class="button" href="javascript:void(0);" onclick="repwd();"><span>重置密码</span></a>
								</td>																
								<td>
									<span id="message" style="color: red;font-size: 12px"></span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height=110>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="center">
									<table border="0" cellpadding="0" cellspacing="0"
										id="box_num_table2" class="box_num_table">
										<thead>
										
											<tr>
												<td width="8%"><input type="checkbox" id="checkOrCancelAll"/></td>
												<td width="7%">序号</td>
												<td width="12%">姓名</td>
												<td width="11%">性别</td>												
												<td width="11%">联系电话</td>												
												<td width="11%">身份证号码</td>												
												<td width="11%">状态</td>												
												<td width="11%">图书证编号</td>												
												<td width="11%">图书证状态</td>												
											</tr>
										</thead>
										<tbody id="userInfoTBody">
										</tbody>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" class="table_border">
                <tr>
                    <td>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0"
                               class="table_padding">
                            <tr>
                                <td class="font_left">数据:<span id="total"></span>条</td>
                                <td class="font_left">第</td>
                                <td class="font_left">
                                    <input type="text" size="2" maxlength="4" id="pageNo"/> /<span id="pageCount"></span>页
                                </td>
                                <td class="font_left">
                                	<select id="pageSize" onchange="displayData(0);">
                                		<option value="2">每页2条</option>
                                		<option value="3">每页3条</option>
                                		<option value="4">每页4条</option>
                                		<option value="5">每页5条</option>
                                	</select>
                                </td>
                                <td class="font_left">
                                	<div id="pagination"></div>
                                </td>
                                <td width="478" class="font_right">
                                    <a href="javascript:void(0);" onclick="displayData(0);">刷新</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
		</td>
	</tr>
</table>
