<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/table.css" rel="stylesheet" type="text/css" />
<link href="dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen" />

<script type="text/javascript" src="jQuery/jquery-1.7.2.min.js"></script>
<link type="text/css" href="jQuery/ui/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
<script type="text/javascript" src="jQuery/ui/js/jquery-ui-1.8.18.custom.min.js"></script>
<script type="text/javascript" src="jQuery/ui/js/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript" src="jQuery/ui/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="jQuery/form/jquery.form.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
<script type="text/javascript">
	//页面加载完成之后
	$(function(){		
		//给按钮注册单击事件
		$("#saveBtn").click(function(){
			//提交表单
			$("#cardForm").submit();
		});
		$("input").bind("focus",function(){
			$("#"+$(this).prop("id")+"_td").empty();
			$(this).val("");
		});
		//给表单绑定相关的回调操作
		$("#cardForm").ajaxForm({
			beforeSubmit:function(){
				notBlank("readerCardId","身份证号");
				if(!isIDno($("#readerCardId").val())){
					$("#readerCardId_td").text("[身份证号]格式错误");
					count ++;
				}
				if(count >　0){
					count = 0;
					return false;
				}
				$("#message").text("请稍后...");
				return true;
			},
			success:function(jsonObject){
				//{"success":true}成功  {"success":false}失败
				if(jsonObject.success){
					$("#message").text("挂失成功");					
				}else{
					$("#message").text("挂失失败,检查身份证号是否正确");										
				}
			}
		});
	});
</script>

<form action="book_card/update.do" method="post" id="cardForm">
<table border="0" cellpadding="0" cellspacing="0" class="table_border">
	<tr>
		<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="table_right">
				<tr>
					<td><font style="font-size: 12px;"><strong>在线挂失图书卡</strong></font>
					</td>
					<td width="25" height="26" align="left"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="0" class="table_right">
				<tr>
					<td align="center">
						<table width="100%" border="0" cellspacing="0"
							class="table_padding">
							<tr>
								<td align="center">
									<table border="0" cellpadding="0" cellspacing="0"
										class="box_table" id="box_table2">
										<thead>
											<tr>
												<td class="box_table_even">身份证号：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="readerCardId" name="readerCardId"/> <span class="star">*</span>
												</span><span id="readerCardId_td"></span></td>
											</tr>											
										</thead>
										<tbody>
										</tbody>
									</table>
								</td>
							</tr>
						</table>

						<table border="0" cellpadding="0" cellspacing="0"
							class="operation">
							<thead>
								<tr>
									<td height="24">&nbsp;</td>
								</tr>
							</thead>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="table_padding">
				<tr>
					<td height="21" align="right">
						<table align="left">
							<tr>
								<td width="50px"><a class="button" href="javascript:void(0);" id="saveBtn"><span>挂失</span></a></td>
								<td width="50px"><a class="button"
									href="javascript:void(window.history.back());"><span>返回</span></a></td>
								<td>
									<span id="message" style="color: red;font-size: 14px"></span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
