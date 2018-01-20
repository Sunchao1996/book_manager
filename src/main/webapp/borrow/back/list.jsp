<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<base
	href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">

<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/table.css" rel="stylesheet" type="text/css" />
<link href="/dwz/themes/default/style.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="/dwz/themes/css/core.css" rel="stylesheet" type="text/css"
	media="screen" />

<link type="text/css"
	href="/jQuery/ui/css/ui-lightness/jquery-ui-1.8.18.custom.css"
	rel="stylesheet" />
<link rel="stylesheet" href="/jQuery/pagination/pagination.css" />
<script type="text/javascript" src="jQuery/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="jQuery/ui/js/jquery-ui-1.8.18.custom.min.js"></script>
<script type="text/javascript"
	src="jQuery/ui/js/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript"
	src="jQuery/ui/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript"
	src="jQuery/pagination/jquery.pagination.js"></script>
<script type="text/javascript" src="js/jsUtil.js"></script>



<script type="text/javascript">
	 //页面加载完成之后
	 $(function(){	
		 //页面加载完成对复选框进行清空
		$("#checkOrCancelAll").prop("checked",false);
		$("#pageNo").keydown(function(event){
			if(event.keyCode==13){
				displayData(this.value-1);
			}
		});
		$("#checkOrCancelAll").click(function(){
			$(":checkbox[name='id']").prop("checked",this.checked);				
		});
		displayData(0);
	});
	/**
	*比较时间
	*/
	 function duibi(a, b) {
	    var arr = a.split("-");
	    var starttime = new Date(arr[0], arr[1], arr[2]);
	    var starttimes = starttime.getTime();

	    var arrs = b.split("-");
	    var lktime = new Date(arrs[0], arrs[1], arrs[2]);
	    var lktimes = lktime.getTime();

	    if (starttimes >= lktimes) {
	        alert('已超过规定还书时间');
	        return true;
	    }
	    else{
	        return false;
	    }

	}
	 // 给日期类对象添加日期差方法，返回日期与diff参数日期的时间差，单位为天
	Date.prototype.diff = function(date){
	  return (this.getTime() - date.getTime())/(24 * 60 * 60 * 1000);
	}
	 /**
	  * 
	  * 获取当前时间
	  */
	 function p(s) {
	     return s < 10 ? '0' + s: s;
	 }

	 var myDate = new Date();
	 //获取当前年
	 var year=myDate.getFullYear();
	 //获取当前月
	 var month=myDate.getMonth()+1;
	 //获取当前日
	 var date=myDate.getDate(); 

	 var now=year+'-'+p(month)+"-"+p(date);
	function displayData(pageNo){
		$("#checkOrCancelAll").prop("checked",false);
		var pageSize = $("#pageSize").val();
		//如果不填卡号,点击不执行操作
		if($.trim($("#readerId").val()) == ""){
			return false;
		}
		var path = "";
		var borrowStatus = 0;
		//根据用户类型发送不同的用户请求
		if("${sessionScope.user.userCategory}" == 0 ){
			//管理员发送的请求
			path = "${pageContext.request.contextPath}/back/queryByPageByA.do";
			borrowStatus = -1;
			var statusElts = $(":checkbox[name='status']:checked"); 
			if(statusElts.length == 1){
				borrowStatus = statusElts.val();
			}
		}else{
			path = "${pageContext.request.contextPath}/back/queryByPage.do";
			
		}
		$.ajax({
			
			url:path,
			type:"get",
			cache:false,
			data:{
				"pageNo":pageNo+1,
				"pageSize":pageSize,
				"readerId":$("#readerId").val(),
				"borrowStatus":borrowStatus
			},
			beforeSend:function(){
				$("#message").text("正在查询请稍后...");
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

					$.each(jsonObject.borrowList,function(i,n){						
						htmlString +='<tr class="odd">';
						if("${user.userCategory}" == 1){
							htmlString +='<td><input type="checkbox" name="id" value="'+n.borrowId+'" onclick="controlFirstCheckbox();"/></td>';
						}
						htmlString +='<td>'+(i+1)+'</td>';
						htmlString +='<td>'+n.bookSeat+'</td>';
						htmlString +='<td>'+n.bookISBN+'</td>';		 				
						htmlString +='<td>'+n.bookTitle+'</td>';		 				
						htmlString +='<td>'+n.borrowTime_text+'</td>';		 				
						htmlString +='<td>'+n.backTime_text+'</td>';		 				
						htmlString +='<td>'+now+'</td>';
						if(duibi(now,n.backTime_text)){
							var backTime = new Date(n.backTime_text);
							htmlString +='<td>'+(((new Date().diff(backTime))*0.1).toFixed(1))+'</td>';							
						}else{
							htmlString +='<td>'+0+'</td>';
						}
						htmlString +='<td>'+(n.bookPrice*2)+'</td>';
						
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
	//归还图书
	function back(){
		var checkedElts = $(":checkbox[name='id']:checked");
		if(checkedElts.length==0){
			$("#message").text("请选择要归还的记录");
		}else{
			if(confirm("您确定要对选中的图书归还吗?")){
				//拼接要删除的角色id 方式2
				var sendData = "ids=";
				var idArray = [];
				$.each(checkedElts,function(i,n){
					idArray.push(n.value);
				});
				sendData += idArray.join("&ids=");
				$.ajax({
					url:"${pageContext.request.contextPath}/back/back.do",
					type:"post",
					data:sendData,
					beforeSend:function(){
						$("#message").text("请稍后...");
						return true;
					},
					success:function(jsonObject){
						if(jsonObject.success){
							$("#message").text("归还成功");	
							//重新加载页面 displayData(0);
							window.location.reload();
						}else{
							$("#message").text("归还失败");														
						}
					}
				});
			}
		}
	}
	//丢失图书
	function lose(){
		var checkedElts = $(":checkbox[name='id']:checked");
		if(checkedElts.length==0){
			$("#message").text("请选择要登记丢失的记录");
		}else{
			if(confirm("是否已经缴清罚款?")){
				//拼接要删除的角色id 方式2
				var sendData = "ids=";
				var idArray = [];
				$.each(checkedElts,function(i,n){
					idArray.push(n.value);
				});
				sendData += idArray.join("&ids=");
				$.ajax({
					url:"${pageContext.request.contextPath}/back/lose.do",
					type:"post",
					data:sendData,
					beforeSend:function(){
						$("#message").text("请稍后...");
						return true;
					},
					success:function(jsonObject){
						if(jsonObject.success){
							$("#message").text("登记成功");	
							//重新加载页面 displayData(0);
							window.location.reload();
						}else{
							$("#message").text("登记失败");														
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
			<table border="0" cellpadding="0" cellspacing="0"
				class="table_border">
				<tr>
					<td align="center"><c:if test="${user.userCategory != 2 }">
							<table border="0" cellpadding="0" cellspacing="0"
								class="box_table" id="box_table">
								<tr>
									<td>&nbsp;卡号：<input type="text" id="readerId" /></td>
									<!-- 管理员显示的按钮 -->
									<c:if test="${user.userCategory == 0 }">
										<td>状态:<input type="checkbox" name="status" value="1">已还<input
											value="0" type="checkbox" name="status">未还
										</td>
									</c:if>
									<td><a class="button" href="javascript:void(0);"
										onclick="displayData(0);"><span>查询</span></a></td>
								</tr>
							</table>
						</c:if> <c:if test="${user.userCategory == 2 }">
							<tr>
								<input type="hidden" id="readerId" value="${user.userId }" />

							</tr>
						</c:if></td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0"
				class="table_border">
				<tr>
					<td>
						<table style="position: relative; left: 5px; top: 5px;">
							<c:if test="${user.userCategory == 1 }">
								<tr>
									<td width="75px"><a class="button"
										href="javascript:void(0);" onclick="back();"><span>归还</span></a>
									</td>
									<td width="75px"><a class="button"
										href="javascript:void(0);" onclick="lose();"><span>丢失</span></a>
									</td>
									<td><span id="message" style="color: red; font-size: 12px"></span>
									</td>
								</tr>
							</c:if>
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
												<c:if test="${user.userCategory == 1 }">
													<td width="8%"><input type="checkbox"
														id="checkOrCancelAll" /></td>
												</c:if>
												<td width="7%">序号</td>
												<td width="12%">位置</td>
												<td width="11%">ISBN</td>
												<td width="11%">标题</td>
												<td width="11%">借书时间</td>
												<td width="11%">应还时间</td>
												<td width="11%">今天时间</td>
												<td width="11%">逾期罚款</td>
												<td width="11%">丢失罚款</td>
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
			<table border="0" cellpadding="0" cellspacing="0"
				class="table_border">
				<tr>
					<td>
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							class="table_padding">
							<tr>
								<td class="font_left">数据:<span id="total"></span>条
								</td>
								<td class="font_left">第</td>
								<td class="font_left"><input type="text" size="2"
									maxlength="4" id="pageNo" /> /<span id="pageCount"></span>页</td>
								<td class="font_left"><select id="pageSize"
									onchange="displayData(0);">
										<option value="5">每页5条</option>
										<option value="6">每页6条</option>
										<option value="7">每页7条</option>
										<option value="8">每页8条</option>
								</select></td>
								<td class="font_left">
									<div id="pagination"></div>
								</td>
								<td width="478" class="font_right"><a
									href="javascript:void(0);" onclick="displayData(0);">刷新</a></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
