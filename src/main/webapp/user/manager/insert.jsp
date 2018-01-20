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

<script type="text/javascript">
	//页面加载完成之后
	$(function(){		
		//给按钮注册单击事件
		$("#saveBtn").click(function(){
			//提交表单
			$("#muForm").submit();
		});
		//给表单绑定相关的回调操作
		$("#muForm").ajaxForm({
			beforeSubmit:function(){
				notBlank("userId","用户名");
				notBlank("userPassword","密码");
				if(count > 0){
					count = 0;
					return false;
				}
				$("#message").text("正在添加请稍后...");
				return true;
			},
			success:function(jsonObject){
				//{"success":true}成功  {"success":false}失败
				if(jsonObject.success){
					$("#message").text("添加成功");					
				}else{
					$("#message").text("添加失败");										
				}
			}
		});
	});
</script>

<form action="manager/insert.do" method="post" id="muForm">
<table border="0" cellpadding="0" cellspacing="0" class="table_border">
	<tr>
		<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="table_right">
				<tr>
					<td><font style="font-size: 12px;"><strong>新增图书借阅员</strong></font>
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
										<!-- private String userId;
										private String userPassword;
										private Integer userCategory;// '0超级管理员\r\n            1普通借阅员\r\n            2读者', -->
											<tr>
												<td class="box_table_even">用户名：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="userId" name="userId"/> <span class="star">*</span>
												</span><span id="userId_td"></span></td>
											</tr>											
											<tr>
												<td class="box_table_even">密码：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="userPassword" name="userPassword"/> <span class="star">*</span>
												</span><span id="userPassword_td"></span></td>
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
								<td width="50px"><a class="button" href="javascript:void(0);" id="saveBtn"><span>添加</span></a></td>
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
