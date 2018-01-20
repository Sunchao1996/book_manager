<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="jQuery/jquery-1.7.2.min.js"></script>
<link type="text/css" href="jQuery/ui/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
<script type="text/javascript" src="jQuery/ui/js/jquery-ui-1.8.18.custom.min.js"></script>
<script type="text/javascript" src="jQuery/ui/js/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript" src="jQuery/ui/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="jQuery/form/jquery.form.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
<script type="text/javascript" src="js/jsUtil.js"></script>
<script language="javascript">
	$(function() {
		document.getElementById("userId").focus();
	});
</script>
<style>
.bjf {
	background: url(images/bjf.jpg) repeat-x;
}

.dlf_03 {
	background: url(images/dlf_03.jpg) no-repeat;
	width: 636px;
	height: 283px;
}

.dlk {
	width: 300px;
	height: 150px;
	margin-left: 290px;
	margin-top: 2px;
}

.wenzi {
	font-size: 12px;
	font-family: "宋体";
}

.shurukuang {
	width: 180px;
	height: 20px;
	line-height: 20px;
	font-size: 12px;
	font-family: "宋体";
}

.shurukuang1 {
	width: 50px;
	height: 20px;
	line-height: 20px;
	font-size: 12px;
	font-family: "宋体";
	border: 1px solid #7F9DB9
}

.cuowu {
	width: 300px;
	height: 30px;
	font: "宋体";
	font-size: 12px;
	text-align: center;
	color: #FF4A4A;
	line-height: 30px;
}

.dlk a.test {
	display: block;
	width: 44px;
	height: 26px;
	background-image: url(images/dlf.jpg);
	background-repeat: no-repeat;
}

.dlk a.test:hover {
	background-image: url(images/dlfh.jpg);
}

.dlk a.test1 {
	display: block;
	width: 44px;
	height: 26px;
	background-image: url(images/czf.jpg);
	background-repeat: no-repeat;
}

.dlk a.test1:hover {
	background-image: url(images/czf.jpg);
}

.dlk .dla {
	border: none;
	background: transparent;
}

.ocx_style {
	border: 1px solid #7F9DB9;
	width: 155px;
	height: 20px;
}

.login_gerlyous {
	width: 178px;
	height: 20px;
	background: #FFFFFF;
	border: 1px solid #dddddd;
	color: #000000;
	line-height: 25px;
	padding-left: 0px
}
</style>
<title>图书管理系统</title>
</head>
<script type="text/javascript">
$(function(){
	$("#loginBtn").bind("click",function(){
		var userId = $.trim($("#userId").val());
		var userPassword = $.trim($("#userPassword").val());
		if(userId == "" && userPassword == ""){
			window.location.href="${pageContext.request.contextPath}/main/reader_no.do";
		}else{
			$("#myform").submit();
		}
	});
	$("#myform").ajaxForm({
		submitBefore:function(){
			$("#message").text("正在登陆...");
			return true;
		},
		success:function(jsonObject){
			if(jsonObject.success){
				if(jsonObject.jump=="0"){
					window.location.href="${pageContext.request.contextPath}/main/super.do";
				}else if(jsonObject.jump=="1"){
					window.location.href="${pageContext.request.contextPath}/main/manager.do";
				}else if(jsonObject.jump=="2"){
					window.location.href="${pageContext.request.contextPath}/main/reader.do";
				}
			}else{
				$("#message").text("检查用户名密码是否正确");
			}
		}
	});
});
</script>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
	class="bjf">
<a href="${pageContext.request.contextPath }/main/index.do" target="_top">|首页|</a>
	<form action="main/login.do" id="myform" name="myform" method="post">
		<table style="margin: 0 auto; padding: 0;" id="__01" width="1265"
			height="626" border="0" cellpadding="0" cellspacing="0"
			align="center">
			<tr>
				<td colspan="3" width="1265" height="181"></td>
			</tr>
			<tr>
				<td width="315" height="283"></td>
				<td class="dlf_03">
					<div class="dlk">
						<table width="100%" border="0" cellpadding="2">
						
							<tr>
								<td width="71" align="right" class="wenzi"></td>
								<td colspan="3"><label> <span id="message" style="color: red;font-size: 14px"></span>
								</label></td>
							</tr>
							<tr>
								<td width="71" align="right" class="wenzi">用户名：</td>
								<td colspan="3"><label> <input type="text"
										id="userId" name="userId" tabindex="1" maxlength='20'
										class="ocx_style" />
								</label></td>
							</tr>
							<tr>
								<td align="right" class="wenzi">密&nbsp;码：</td>
								<td colspan="3"><label> <input type="password"
										id="userPassword" name="userPassword" tabindex="1" maxlength='20'
										class="ocx_style" />
								</label></td>
							</tr>
							<tr>
								<td align="right" class="wenzi">角&nbsp;色：</td>
								<td width="59"><input type="radio" name="userCategory" value="0"/><font size="1px">管理员</font></td>
								<td width="65"><input type="radio" name="userCategory" value="1"/><font size="1px">借阅员</font></td>
								<td width="55"><input type="radio" name="userCategory" value="2" checked/><font size="1px">读&nbsp;者</font></td>
								<td width="80">&nbsp;</td>
							</tr>
							<tr>
								<td></td>
								<td style="padding-top: 10px;"><a style="text-decoration: none;" href="javascript:void(0)"
									class="test"> <input type="button" class="dla"
										style="cursor: pointer;height: 27px; width: 45px;" id="loginBtn" name="dd" value="" />
								</a></td>
								<td>&nbsp;</td>
								<td style="padding-top: 10px;"><a href="javascript:void(0)"
									class="test1"> <input type="reset" class="dla" name="dd"
										style="height: 27px; width: 45px;" value="" />
								</a></td>
							</tr>
						</table>
					</div>

				</td>
				<td width="314" height="283"></td>
			</tr>
			<tr>
				<td colspan="3" width="1265" height="162"></td>
			</tr>

		</table>
	</form>
</body>
</html>
