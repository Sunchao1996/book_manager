<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/jQuery/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jQuery/form/jquery.form.js"></script>
<style type="text/css">
	.show{
		display: none;
	}
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$("#startBtn").bind("click",function(){
		$("#addForm").submit();
		
	});
	$("#addForm").ajaxForm({
		beforeSubmit:function(){
			$("#message").text("正在添加。。。");
			return true;
		},
		success:function(jsonObject){
			if(jsonObject.success){
				$("#message").text("添加成功");				
			}else{
				$("#message").text("添加失败");			
			}
		}
		
	});
	
})
</script>
</head>
<body class="bjf">
<form id="addForm" action="${pageContext.request.contextPath }/book/extendBookshelves.do" method="post" enctype="multipart/form-data">
		<input type="file" name="bookshelves" />
		<input type="button" value="开始" id="startBtn" />
		<span id="message" style="color: red;font-size: 14px"></span>
	</form>
</body>
</html>