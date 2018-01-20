<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="js/jsUtil.js"></script>

<script type="text/javascript">

	//页面加载完成之后
	$(function(){
		
		//获得焦点清空文本框并清空提示信息
		$("input").bind("focus",function(){
			$("#"+$(this).prop("id")+"_td").empty();
			$(this).val("");
		});
			
		//给按钮注册单击事件
		$("#saveBtn").click(function(){
			//提交表单
			$("#pwdForm").submit();
		});
		//给表单绑定相关的回调操作
		$("#pwdForm").ajaxForm({
			beforeSubmit:function(){
				
				notBlank("userId","用户名");
				notBlank("userPassword","原始密码");
				notBlank("newPassword","新密码");
				notBlank("renewPassword","确认密码");
				if($.trim($("#newPassword").val()) != $.trim($("#renewPassword").val())){
					$("#renewPassword_td").text("[两次密码输入不一致]");
					count ++;
				}
				if($.trim($("#newPassword").val()).length<6){
					$("#renewPassword").text("[新密码]不能为空");
					count++;
				}
				if(count > 0){
					count = 0;
					return false;
				}
				$("#message").text("请稍后...");
				return true;
			},
			success:function(jsonObject){
				//{"success":true}成功  {"success":false}失败
				if(jsonObject.success){
					$("#message").text("修改成功");					
				}else{
					$("#message").text("检查用户名和密码是否正确");										
				}
			}
		});
	});
</script>

<form action="user/updatePwd.do" method="post" id="pwdForm">
<table border="0" cellpadding="0" cellspacing="0" class="table_border">
	<tr>
		<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="table_right">
				<tr>
					<td><font style="font-size: 12px;"><strong>修改密码(带<span class="star">*</span>为必填项)</strong></font>
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
											<input type="hidden" name="userCategory" value="${user.userCategory }" />
											<tr>
												<td class="box_table_even">用户名：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="userId" name="userId"/> <span class="star">*</span>
												</span><span id="userId_td"></span></td>
											</tr>											
											<tr>
												<td class="box_table_even">原始密码：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="userPassword" name="userPassword"/> <span class="star">*</span>
												</span><span id="userPassword_td"></span></td>
											</tr>											
											<tr>
												<td class="box_table_even">6位新密码：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="newPassword" name="newPassword" maxlength="6"/> <span class="star">*</span>
												</span><span id="newPassword_td"></span></td>
											</tr>											
											<tr>
												<td class="box_table_even">确认新密码：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="renewPassword" name="renewPassword" class="time" maxlength="6"/> <span class="star">*</span>
												</span><span id="renewPassword_td"></span></td>
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
								<td width="50px"><a class="button" href="javascript:void(0);" id="saveBtn"><span>修改</span></a></td>
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
