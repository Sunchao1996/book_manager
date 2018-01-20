<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>
<html>
<head>
<style type="text/css">
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
<script type="text/javascript" src="${pageContext.request.contextPath }/jQuery/js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="jQuery/jquery.pagination/pagination.css" />
<script type="text/javascript" src="jQuery/jquery.pagination/jquery.pagination.js"></script>
<script type="text/javascript">
//TODO 5在这个页面进行展示，这个页面发出的所有请求都将在book_category_query.jsp这个页面中展示
$(function(){
	//翻页
	$("button").bind("click",function(){
		var pageNo = $(this).val();
		$("#pageNo").attr("value",pageNo);
		$("form").submit();
	}) 
})
</script>
</head>
<body>
<div align="center"  class="bjf">
		<table border="1" cellspacing="0" id="showTable" style="width: 100%">
			<tr>
				<td width="30%">图书类别代码</td>
				<td width="40%">图书类别名称</td>
				<td width="30%">拥有数量</td>
			</tr>
			<c:forEach items="${bookCategoryList }" var="obj" >
				<tr>
					<td>${obj.bookCategoryId }</td>
					<td>${obj.bookCategory }</td>
					<td>${obj.categoryCount }</td>
				</tr>
			</c:forEach>			
		</table>
	<!-- 第一页，上一页，下一页，最后一页 -->
	<button value="1" ${page.pageNo eq 1 ?'disabled':'' } >第一页</button>
	<button value="${page.pageNo - 1 }" ${page.pageNo eq 1 ?'disabled':'' }>上一页</button>
	<button value="${page.pageNo + 1 }" ${(page.pageNo eq page.pageCount)?'disabled':'' }>下一页</button>
	<button value="${page.pageCount }" ${(page.pageNo eq page.pageCount)?'disabled':'' } >最后一页</button>
	${page.pageNo }/${page.pageCount }
	<form action="${pageContext.request.contextPath }/book/bookCategoryList.do" target="">
		<input type="hidden" name="pageNo" value="${page.pageNo }" id="pageNo"/>
		<input type="hidden" name="pageSize" value="${page.pageSize }"/>
	</form>
</div>
</body>
</html>