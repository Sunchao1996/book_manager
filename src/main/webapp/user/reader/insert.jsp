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
			$("#readerForm").submit();
		});
		//给表单绑定相关的回调操作
		$("#readerForm").ajaxForm({
			beforeSubmit:function(){
				notBlank("readerName","读者姓名");
				
				notBlank("readerTel","读者联系电话");
				notBlank("readerCardId","读者身份证号码");
				notBlank("bookCardId","图书证编号");
				if(count > 0){
					count = 0;
					return false;
				}
				//验证手机号
				var tel = checkMobile($("#readerTel").val());
				if(!tel){
					$("#readerTel_td").text("手机号格式不正确");
					return false;
				}
				//验证手机号
				var dNo = isIDno($("#readerCardId").val());
				if(!dNo){
					$("#readerCardId_td").text("身份证号格式不正确");
					return false;
				}
				$("#message").text("正在开通图书卡请稍后...");
				return true;
			},
			success:function(jsonObject){
				//{"success":true}成功  {"success":false}失败
				if(jsonObject.success){
					$("#message").text("添加成功");					
				}else{
					$("#message").text(jsonObject.message);										
				}
			}
		});
	});
</script>

<form action="reader/insert.do" method="post" id="readerForm">
<table border="0" cellpadding="0" cellspacing="0" class="table_border">
	<tr>
		<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="table_right">
				<tr>
					<td><font style="font-size: 12px;"><strong>添加读者</strong></font>
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
												<td class="box_table_even">读者姓名：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="readerName" name="readerName"/> <span class="star">*</span>
												</span><span id="readerName_td"></span></td>
											</tr>											
											<tr>
												<td class="box_table_even">读者性别：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="radio" name="readerGender" value="男" checked />男 
														<input type="radio" name="readerGender" value="女"/>女<span class="star">*</span>
												</span></td>
											</tr>											
											<tr>
												<td class="box_table_even">读者联系电话：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="readerTel" name="readerTel"/> <span class="star">*</span>
												</span><span id="readerTel_td"></span></td>
											</tr>											
											<tr>
												<td class="box_table_even">读者身份证号码：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="readerCardId" name="readerCardId"/> <span class="star">*</span>
												</span><span id="readerCardId_td"></span></td>
											</tr>											
											<tr>
												<td class="box_table_even">图书证编号：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="bookCardId" name="bookCardId"/> <span class="star">*</span>
												</span><span id="bookCardId_td"></span></td>
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
								<td width="50px"><a class="button" href="javascript:void(0);" id="saveBtn"><span>开通图书卡</span></a></td>
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
