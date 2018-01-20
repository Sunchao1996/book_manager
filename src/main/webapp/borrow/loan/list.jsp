<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/table.css" rel="stylesheet" type="text/css" />
<link href="dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen" />

<link type="text/css" href="jQuery/ui/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
<link rel="stylesheet" href="jQuery/pagination/pagination.css" />
<script type="text/javascript" src="jQuery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="jQuery/ui/js/jquery-ui-1.8.18.custom.min.js"></script>
<script type="text/javascript" src="jQuery/ui/js/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript" src="jQuery/ui/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="jQuery/pagination/jquery.pagination.js"></script>
<script type="text/javascript" src="js/jsUtil.js"></script>
<script type="text/javascript">
	//页面加载完成之后
	$(function(){
		//二级联动
		$.ajax({
			url:"${pageContext.request.contextPath}/book/showCategory.do",
			type:"get",
			success:function(jsonObject){
				var htmlString = "";
				$.each(jsonObject.bookCategoryList,function(i,n){
					
					htmlString += '<option value="'+n.bookCategoryId+'">'+n.bookCategoryId+'</option>';
				});
				$("#bookCategoryId").append(htmlString);
				$.ajax({
					url:"${pageContext.request.contextPath}/book/getSeatById.do?categoryId="+$("#bookCategoryId").val(),
					type:"get",
					success:function(jsonObject){
						var htmlString = "";
						$.each(jsonObject.bookSeatList,function(i,n){						
							htmlString += '<option value="'+n.bookSeat+'">'+n.bookSeat+'</option>';
						});
						$("#bookSeat").append(htmlString);
					}
				});
			}
		});
		$("#bookCategoryId").bind("change",function(){
			$("#bookSeat").html("");
			$.ajax({
				url:"${pageContext.request.contextPath}/book/getSeatById.do?categoryId="+$(this).val(),
				type:"get",
				success:function(jsonObject){
					var htmlString = "";
					$.each(jsonObject.bookSeatList,function(i,n){						
						htmlString += '<option value="'+n.bookSeat+'">'+n.bookSeat+'</option>';
					});
					$("#bookSeat").append(htmlString);
				}
			});
		});
		
		
		$("#checkOrCancelAll").click(function(){
			$(":checkbox[name='id']").prop("checked",this.checked);				
		});
	});
	var arr = [];
	var number = 1;
	//向表格中添加记录
	function add(){
		$.ajaxSetup({
			async:false
		});
		if(arr.length >= 5){
			$("#message").text("每人每次最多借阅5本");
			return false;
		}
		var falg = false;//是否有为归还图书标记
		
		//查询是否有未还图书
		$.ajax({
			url:"${pageContext.request.contextPath}/back/queryByPage.do",
			type:"get",
			cache:false,
			data:{
				"pageNo":1,
				"pageSize":2,
				"readerId":$("#bookCardId").val(),
				"borrowStatus":0
			},
			beforeSend:function(){
				$("#message").text("正在查询是否有未还图书，请稍后...");
				return true;
			},
			success:function(jsonObject){
				if(jsonObject.total*1>0){					
					$("#message").text("此读者有未还图书，不可借阅");
					falg = true;
				}
			}
		});
		if(falg){
			return false;
		}
		if($.trim($("#bookCardId").val()) == ""){
			$("#message").text("填写卡号...");
		}else{
			var id=$.trim($("#bookCardId").val())+"_"+$("#bookSeat").val();
			
			$.ajax({
				url:"${pageContext.request.contextPath}/book/queryBookBySeat.do?seat="+$("#bookSeat").val(),
				type:"get",
				success:function(jsonObject){
					var bookInfo = jsonObject.bookInfo;
					var htmlString = "";
					id += "_"+bookInfo.bookBarCode;
					htmlString +='<tr class="odd">';
					htmlString +='<td><input type="checkbox" name="id" value="'+id+'" onclick="controlFirstCheckbox();"/></td>';
					htmlString +='<td>'+(number)+'</td>';
					htmlString +='<td>'+$.trim($("#bookCardId").val())+'</td>';
					htmlString +='<td>'+$("#bookSeat").val()+'</td>';
					htmlString +='<td>'+bookInfo.bookBarCode+'</td>';
					htmlString +='<td>'+bookInfo.bookTitle+'</td>';
					htmlString +='</tr>';
					var falg = true;
					for(var i=0;i<arr.length;i++){
						if(id == arr[i]){
							falg = false;
						}
					}
					if(falg){
						$("#userInfoTBody").append(htmlString);
						$("#message").text("添加成功");
						arr.push(id);
					}else{
						$("#message").text("添加失败，同一人不能借阅相同书籍两本或两本以上");
					}
					$.ajaxSetup({
						async:true
					});
				}
			});
			
		}
	}
	
	function controlFirstCheckbox(){
		$("#checkOrCancelAll").prop("checked",$(":checkbox[name='id']").length==$(":checkbox[name='id']:checked").length);			
	}
	//登记
	function register(){
		var checkedElts = $(":checkbox[name='id']:checked");
		if(checkedElts.length==0){
			$("#message").text("请选择至少一条登记记录");
		}else{
			if(confirm("您确定要对选中的记录进行添加吗?")){
				//拼接要删除的角色id 方式2
				var sendData = "ids=";			
				sendData += arr.join("&ids=");
				$.ajax({
					url:"${pageContext.request.contextPath}/loan/register.do",
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
							//window.location.reload();
							$("#userInfoTBody").html("");
							alert("还书时间:"+jsonObject.afterTime);
						}else{
							if(jsonObject.error){
								$("#message").text("读者信息错误");											
							}else{
								$("#message").text("登记失败");														
							}
						}
						$("#checkOrCancelAll").prop("checked",false);
					}
				});
			}
		}
	}
	//移除添加的记录
	function remove(){
		var checkedElts = $(":checkbox[name='id']:checked");
		if(checkedElts.length!=1){
			$("#message").text("请选择至少一条记录");
		}else{
			var falg = false;
			for(var i=0;i<arr.length;i++){
				if(checkedElts.val() == arr[i]){
					falg = true;
					arr.splice(i,1); 
				}
			}
			if(falg){
				checkedElts.parent().parent().remove();
				$("#message").text("移除成功");
				$("#checkOrCancelAll").prop("checked",false);
			}else{
				alert(arr);
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
								<td>&nbsp;图书卡卡号：<input type="text" id="bookCardId"/></td>
								<td>
									<a class="button" href="javascript:void(0);" onclick="add();"><span>增加记录</span></a>
								</td>
							</tr>
							<tr >
								<td>&nbsp;区号：
													<select id="bookCategoryId" name="bookCategoryId">
													</select>
								&nbsp;位置：
													<select id="bookSeat" name="bookSeat">
													</select>
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
									<a class="button" href="javascript:void(0);" onclick="register();"><span>登记</span></a>
								</td>													
								<td width="50px">
									<a class="button" href="javascript:void(0);" onclick="remove();"><span>移除</span></a>
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
												<td width="12%">图书卡卡号</td>
												<td width="11%">图书位置</td>
												<td width="12%">图书条形码</td>
												<td width="11%">图书名称</td>
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
			
		</td>
	</tr>
</table>
