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
		//给时间的查询文本框加日历插件
			$(".time").datepicker({
				changeMonth: true,
				changeYear: true,
				showButtonPanel: true	
				
			});
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
	});
	
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
	 
	 //查询调用的方法
	function displayData(pageNo){
		$("#checkOrCancelAll").prop("checked",false);
		var pageSize = $("#pageSize").val();
		
		var path = "";
		var borrowStatus = 0;
		path = "${pageContext.request.contextPath}/borrow/queryByPage.do";
		borrowStatus = -1;
		var statusElts = $(":checkbox[name='status']:checked"); 
		if(statusElts.length == 1){
			borrowStatus = statusElts.val();
		}
		
		$.ajax({
			url:path,
			type:"get",
			cache:false,
			data:{
				"pageNo":pageNo+1,
				"pageSize":pageSize,
				"readerId":$("#readerId").val(),
				"borrowStatus":borrowStatus,
				"startBorrowTime":$("#startBorrowTime").val(),
				"endBorrowTime":$("#endBorrowTime").val(),
				"startBackTime":$("#startBackTime").val(),
				"endBackTime":$("#endBackTime").val(),
				"startReturnTime":$("#startReturnTime").val(),
				"endReturnTime":$("#endReturnTime").val(),
				"bookSeat":$("#bookSeat").val()
				
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
						htmlString +='<td>'+(i+1)+'</td>';
						htmlString +='<td>'+n.bookSeat+'</td>';
						htmlString +='<td>'+n.bookISBN+'</td>';		 				
						htmlString +='<td>'+n.bookTitle+'</td>';		 				
						htmlString +='<td>'+n.borrowTime_text+'</td>';		 				
						htmlString +='<td>'+n.backTime_text+'</td>';		 				
						htmlString +='<td>'+now+'</td>';		 				
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
	
	
	
</script>
<table width="100%" border="0" cellspacing="0" class="table_padding">
	<tr>
		<td align="center">
			<table border="0" cellpadding="0" cellspacing="0" class="table_border">
				<tr>
					<td align="center">
					
	
							<table border="0" cellpadding="0" cellspacing="0" class="box_table" id="box_table">
									<tr>
										<td>&nbsp;卡号：<input type="text" id="readerId"/></td>
										<td>
											借书时间：
												<input type="text" size="20" class="time" id="startBorrowTime"/>
												至 
												<input type="text" size="20" class="time" id="endBorrowTime"/> 
										</td>
										<td>
											状态:<input type="checkbox" name="status" value="1">已还<input  value="0" type="checkbox" name="status">未还
										</td>
										<td>
											<a class="button" href="javascript:void(0);" onclick="displayData(0);"><span>查询</span></a>
										</td>
									</tr>
									<tr>
										<td width="20%">&nbsp;类别：
															<select id="bookSeat">
																<option value="">全部</option>
																<c:forEach items="${bookCategoryList }" var="obj">
																	<option value="${obj.bookCategoryId }">${obj.bookCategory }</option>
																</c:forEach>
															</select>
										</td>
										<td>
											应还时间：
												<input type="text" size="20" class="time" id="startBackTime"/>
												至 
												<input type="text" size="20" class="time" id="endBackTime"/> 
										</td>
										<td>
											归还时间：
												<input type="text" size="20" class="time" id="startReturnTime"/>
												至 
												<input type="text" size="20" class="time" id="endReturnTime"/> 
										</td>
									</tr>
							</table>
					</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" class="table_border">
				
				<tr>
					<td height=110>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="center">
									<table border="0" cellpadding="0" cellspacing="0"
										id="box_num_table2" class="box_num_table">
										<thead>
										
											<tr>												
												<td width="7%">序号</td>
												<td width="12%">位置</td>
												<td width="11%">ISBN</td>												
												<td width="11%">标题</td>												
												<td width="11%">借书时间</td>												
												<td width="11%">应还时间</td>												
												<td width="11%">今天时间</td>												
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
                                		<option value="5">每页5条</option>
                                		<option value="6">每页6条</option>
                                		<option value="7">每页7条</option>
                                		<option value="8">每页8条</option>
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
