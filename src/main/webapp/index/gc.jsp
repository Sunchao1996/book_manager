<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/index/">
<html>
<head>
<meta charset="utf-8">
<title>馆藏介绍</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
}

.clearfix:after {
	content: '.';
	height: 0;
	overflow: hidden;
}

.body {
	width: 1000px;
	margin: 0 auto;
	background: #ddebfc;
}

body {
	width: 1000px;
	margin: 0 auto;
	background: #f0f0f0;
}
/*top*/
#top {
	height: 40px;
}

#top h1 {
	width: 100px;
	height: 100%;
	float: left;
	overflow: hidden;
}

#top img {
	width: 100%;
	height: 100%;
}

#top .sou {
	width: 227px;
	height: 60px;
	float: right;
	margin: 0 20px 0 0;
}

#top .sou input {
	border: 1px solid #e5e5e5;
	background: #f1f1f1;
	float: left;
}

#top .sou .sea {
	width: 181px;
	height: 26px;
	border-right: 0;
	color: #858585;
	outline: 0;
	padding: 0 0 0 14px;
}

#top .sou .rch {
	width: 30px;
	height: 28px;
	border-left: 0;
	background: #f1f1f1 url(images/rea.jpg) no-repeat center;
	outline: 0;
}
/*nav*/
#nav {
	height: 59px;
	width: 973px;
	background: #303030;
	padding: 0 27px 0 0;
	margin: 0 auto;
}

#nav li {
	float: left;
	width: 119px;
	height: 59px;
	text-align: center;
	line-height: 59px;
	font-size: 12px;
	border-right: 1px solid #4b4b4b;
}

#nav li a {
	color: #fff;
}
/*banner*/
#com_banner {
	height: 283px;;
	display: block;
	overflow: hidden;
	position: relative;
}
/*news*/
#news {
	height: 232px;
}

.logina {
	height: 40px;
	line-height: 40px;
	margin-bottom: 10px;
	float: right;
}

.logina a {
	padding: 0 5px;
}

.logina a:first-child {
	padding-right: 15px;
	border-right: 1px solid #333;
}

#news ul li {
	width: 438px;
	height: 25px;
	line-height: 25px;
	padding: 0 0 0 21px;
}

#news li a {
	color: #565656;
	float: left;
}

.xin {
	width: 478px;
	height: 242px;
	padding: 0 0 0 22px;
	float: left;
	font-size: 12px;
	margin: 25px 0 0 0;
}

.xin li {
	background: url(images/libg.jpg) no-repeat left center;
}

#news h2 {
	width: 90px;
	height: 18px;
	font-size: 18px;
	line-height: 18px;
	padding-top: 36px;
	margin-left: 24px;
}

.xin span {
	float: right;
}

.xinw {
	width: 45%;
	height: 232px;
	float: left;
}

.lon {
	width: 45%;
	height: 280px;
	float: right;
	background: #fff6b0;
	padding-left: 24px;
}

.lon h2 {
	margin-bottom: 25px;
}

.wo h2 {
	width: 90px;
	height: 18px;
	font-size: 18px;
	line-height: 18px;
}

.wo p a {
	color: #535353;
	font: 12px/2em "宋体";
}

.ren {
	float: left;
	margin-top: 24px;
}

.ren p a {
	color: #535353;
	font: 12px/2em "宋体";
}

.re {
	width: 229px;
	height: 270px;
	float: left;
	padding-left: 24px;
	background: url(images/flo.jpg) no-repeat right bottom;
}

#wlsc {
	width: 1000px;
	height: 306px;;
	padding-top: 75px;
}

#wlsc div {
	padding-top: 24px;
	margin-left: 25px;
}

#wlsc .ji {
	margin: 0 0 0 24px;
}

#wlsc h2 {
	margin-left: 24px;
}

.ji {
	width: 206px;
	height: 218px;
	float: left;
}

dd a {
	color: #535353;
	font: 12px/2em "黑体";
}

dd {
	margin-top: 18px;
}

.jie {
	width: 206px;
	height: 242px;
	float: left;
}

.hang {
	width: 206px;
	height: 242px;
	float: left;
}

.shi {
	width: 206px;
	height: 242px;
	float: left;
}

#bottom {
	height: 81px;
	background: #fff;
	font-size: 12px;
}

.ss ul li {
	float: left;
	margin: 40px 0 0 10px;
}

#bottom p {
	float: right;
	margin: 40px 0 0 10px;
}

.dia {
	overflow: hidden;
	position: absolute;
	left: 45%;
	bottom: 13%;
}

.diana {
	width: 10px;
	height: 10px;
	margin: 2px 5px;
	border-radius: 50%;
	background: red;
	display: block;
	float: left;
	cursor: pointer;
}
</style>

</head>

<body>
	<div class="body">
		<div id="top">
			<h1>
				<img src="logo.png" alt="" />
			</h1>
			<div class="logina">
				<a href="${pageContext.request.contextPath }/main/tologin.do">登录</a>
				<a href="${pageContext.request.contextPath }/main/reader_no.do">游客</a>
			</div>
		</div>
		<ul id="nav" class="clearfix">
			<li><a href="${pageContext.request.contextPath }/main/index.do" target="_top">首页</a></li>
			<li><a href="#" target="_top">借书流程</a></li>
			<li><a href="lc_card.jsp" target="_top">图书卡流程</a></li>
			<li><a href="gc.jsp" target="_top">馆藏介绍</a></li>
			<li><a href="kgsj.jsp" target="_top">开馆时间</a></li>
			<li class="qd"><a href="xtjs.jsp" target="_top">使用帮助</a></li>
		</ul>
		<center>
			<h1>借书流程</h1>
		</center>
		<div style="padding-left: 50px;">
			廊坊市图书馆目前藏书81万余册，期刊1000余种，报纸150余种，重点藏书包括：《永乐大典》、《大百科全书》、《中国全史》、《四库全书》、《四库全书存目丛书》等。
		</div>
	</div>
</body>
</html>
