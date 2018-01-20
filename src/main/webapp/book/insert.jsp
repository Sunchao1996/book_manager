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
		//条形码非空验证和全数字,固定长度验证,失去焦点验证
		$("#bookBarCode").bind("keyup",function(){
			validateTextArea("bookBarCode", "bookBarCode_td", 13);
		});
		$("#bookBarCode").bind("blur",function(){
			if(!isNumber($(this).val())){
				$("#bookBarCode_td").text("[条形码]格式不正确");
				count ++;
			}
			if($.trim($(this).val().length)< 13){
				if($.trim($(this).val()) == ""){
					$("#bookBarCode_td").text("[条形码]不能为空");					
				}else{
					$("#bookBarCode_td").text("[条形码]格式不正确");					
				}
				count ++;
			}
		});
		//ISBN码非空验证和全数字,固定长度验证,失去焦点验证
		$("#bookISBN").bind("keyup",function(){
			validateTextArea("bookISBN", "bookISBN_td", 13);
		});
		$("#bookISBN").bind("blur",function(){
			if(!isNumber($(this).val())){
				$("#bookISBN_td").text("[ISBN码]格式不正确");
				count ++;
			}
			if($.trim($(this).val().length)< 13){
				if($.trim($(this).val()) == ""){
					$("#bookISBN_td").text("[ISBN码]不能为空");					
				}else{
					$("#bookISBN_td").text("[ISBN码]格式不正确");					
				}
				count ++;
			}
		});
		//印刷次数只能是数字		
		$("#bookPrintCount").bind("blur",function(){
			if(!isNumber($(this).val())){
				$("#bookPrintCount_td").text("[印刷次数]格式不正确");
				count ++;
			}			
		});
		//获得焦点清空文本框并清空提示信息
		$("input").bind("focus",function(){
			$("#"+$(this).prop("id")+"_td").empty();
			$(this).val("");
		});
		
		
		
		
		//给出版日期文本框加日历插件
		$(".time").datepicker({
			changeMonth: true,
			changeYear: true,
			showButtonPanel: true				
		});
		//给按钮注册单击事件
		$("#saveBtn").click(function(){
			//提交表单
			$("#bookForm").submit();
		});
		//给表单绑定相关的回调操作
		$("#bookForm").ajaxForm({
			beforeSubmit:function(){
				$("#bookBarCode").blur();
				$("#bookISBN").blur();
				$("#bookPrintCount").blur();
				notBlank("bookTitle","标题");
				notBlank("bookAuthor","作者");
				notBlank("bookPress","出版社");
				notBlank("bookPublish","出版时间");
				if(count > 0){
					count = 0;
					return false;
				}
				$("#message").text("正在添加图书请稍后...");
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

<form action="book/insert.do" method="post" id="bookForm">
<table border="0" cellpadding="0" cellspacing="0" class="table_border">
	<tr>
		<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="table_right">
				<tr>
					<td><font style="font-size: 12px;"><strong>添加图书(带<span class="star">*</span>为必填项)</strong></font>
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
												<td class="box_table_even">图书类别：</td>
												<td class="box_table_odd"><span class="in">
													<select	id=bookCategoryId name="bookCategoryId">
														<c:forEach items="${bookCategoryList }" var="obj">
															<option value="${obj.bookCategoryId }">${obj.bookCategory }</option>
														</c:forEach>
													</select> <span class="star">*</span>
												</span><span id="bookCategoryId_td"></span></td>
											</tr>											
																				
											<tr>
												<td class="box_table_even">图书的条形码：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="bookBarCode" name="bookBarCode"/> <span class="star">*</span>
												</span><span id="bookBarCode_td"></span></td>
											</tr>											
											<tr>
												<td class="box_table_even">图书的ISBN码：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="bookISBN" name="bookISBN"/> <span class="star">*</span>
												</span><span id="bookISBN_td"></span></td>
											</tr>
																		
											<tr>
												<td class="box_table_even">图书的标题：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="bookTitle" name="bookTitle"/> <span class="star">*</span>
												</span><span id="bookTitle_td"></span></td>
											</tr>											
											<tr>
												<td class="box_table_even">图书的作者：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="bookAuthor" name="bookAuthor"/> <span class="star">*</span>
												</span><span id="bookAuthor_td"></span></td>
											</tr>											
											<tr>
												<td class="box_table_even">图书的出版社：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="bookPress" name="bookPress"/> <span class="star">*</span>
												</span><span id="bookPress_td"></span></td>
											</tr>											
											<tr>
												<td class="box_table_even">图书的出版时间：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="bookPublish" name="bookPublish" class="time"/> <span class="star">*</span>
												</span><span id="bookPublish_td"></span></td>
											</tr>											
											<tr>
												<td class="box_table_even">图书的印刷次数：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="bookPrintCount" name="bookPrintCount"/> <span class="star">*</span>
												</span><span id="bookPrintCount_td"></span></td>
											</tr>											
											<tr>
												<td class="box_table_even">图书的价格：</td>
												<td class="box_table_odd"><span class="in"> <input
														type="text" id="bookPrice" name="bookPrice"/> <span class="star">*</span>
												</span><span id="bookPrintCount_td"></span></td>
											</tr>											
											<tr>
												<td class="box_table_even">图书的备注：</td>
												<td class="box_table_odd"><span class="in"> <textarea
														cols="10" rows="2" id="bookComment" name="bookComment"></textarea> 
												</span><span id="bookComment_td"></span></td>
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
