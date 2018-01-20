<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/index/">
<head>
<meta charset="utf-8">
<title>图书卡开通流程指南</title>
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
			<li><a href="lc_borrow.jsp" target="_top">借书流程</a></li>
			<li><a href="#" target="_top">图书卡流程</a></li>
			<li><a href="gc.jsp" target="_top">馆藏介绍</a></li>
			<li><a href="kgsj.jsp" target="_top">开馆时间</a></li>
			<li class="qd"><a href="xtjs.jsp" target="_top">使用帮助</a></li>
		</ul>
		<center>
			<h1>开馆时间</h1>
		
		<table
			style="BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; BORDER-COLLAPSE: collapse; BORDER-TOP: medium none; BORDER-RIGHT: medium none; mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0cm 0cm 0cm 0cm; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext"
			class="MsoNormalTable" cellspacing="0" cellpadding="0" border="1">
			<tbody>
				<tr>
					<td
						style="BORDER-BOTTOM: windowtext 1pt solid; BORDER-LEFT: windowtext 1pt solid; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 0cm; WIDTH: 161.65pt; PADDING-RIGHT: 0cm; BORDER-TOP: windowtext 1pt solid; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-alt: solid windowtext .5pt"
						width="216" valign="top"><p
							style="TEXT-ALIGN: center; LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal" align="center">
							<span
								style="FONT-SIZE: 16pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">开馆部门<span
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p></td>
					<td
						style="BORDER-BOTTOM: windowtext 1pt solid; BORDER-LEFT: #f0f0f0; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 0cm; WIDTH: 146.2pt; PADDING-RIGHT: 0cm; BORDER-TOP: windowtext 1pt solid; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt"
						width="195" valign="top"><p
							style="TEXT-ALIGN: center; LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal" align="center">
							<span
								style="FONT-SIZE: 16pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">开馆日期<span
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p></td>
					<td
						style="BORDER-BOTTOM: windowtext 1pt solid; BORDER-LEFT: #f0f0f0; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 0cm; WIDTH: 159.95pt; PADDING-RIGHT: 0cm; BORDER-TOP: windowtext 1pt solid; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt"
						width="213" valign="top"><p
							style="TEXT-ALIGN: center; LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal" align="center">
							<span
								style="FONT-SIZE: 16pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">开馆时间<span
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p></td>
				</tr>
				<tr style="HEIGHT: 172.05pt">
					<td
						style="BORDER-BOTTOM: windowtext 1pt solid; BORDER-LEFT: windowtext 1pt solid; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 0cm; WIDTH: 161.65pt; PADDING-RIGHT: 0cm; HEIGHT: 172.05pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
						width="216"><p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">第一文学图书借阅厅<span
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">儿童图书借阅厅<span
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">期刊借阅厅<span
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<br>
						</p></td>
					<td
						style="BORDER-BOTTOM: windowtext 1pt solid; BORDER-LEFT: #f0f0f0; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 0cm; WIDTH: 146.2pt; PADDING-RIGHT: 0cm; HEIGHT: 172.05pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
						width="195"><p
							style="TEXT-ALIGN: center; LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal" align="center">
							<span
								style="FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">周二至周日<span
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p></td>
					<td
						style="BORDER-BOTTOM: windowtext 1pt solid; BORDER-LEFT: #f0f0f0; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 0cm; WIDTH: 159.95pt; PADDING-RIGHT: 0cm; HEIGHT: 172.05pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
						width="213"><p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<strong><span
								style="font-family: FangSong_GB2312; font-size: 18px;">夏季(六月至八月):</span></strong>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="COLOR: black; FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312; mso-font-kerning: 0pt"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">上午<span
											lang="EN-US">9:00-12</span>：<span lang="EN-US">00<o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="COLOR: black; FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312; mso-font-kerning: 0pt"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">下午<span
											lang="EN-US">13:</span><span lang="EN-US">00-20:00<o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="font-family: 仿宋_GB2312; color: black; FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312; mso-font-kerning: 0pt"><strong><span
									style="font-family: FangSong_GB2312; font-size: 18px;">冬季(九月至五月):</span></strong></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="COLOR: black; FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312; mso-font-kerning: 0pt"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">上午<span
											lang="EN-US">9:00-12</span>：<span lang="EN-US">00<o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="COLOR: black; FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312; mso-font-kerning: 0pt"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">下午<span
											lang="EN-US">13:</span><span lang="EN-US">00-19:30<o:p></o:p></span></span></span></span></span>
						</p></td>
				</tr>
				<tr style="HEIGHT: 188.25pt">
					<td
						style="BORDER-BOTTOM: windowtext 1pt solid; BORDER-LEFT: windowtext 1pt solid; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 0cm; WIDTH: 161.65pt; PADDING-RIGHT: 0cm; HEIGHT: 188.25pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
						width="216" valign="top"><p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">第二文学图书借阅厅<span
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">第一社科图书借阅厅<span
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">第二社科图书借阅厅<span
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">自科图书借阅厅<span
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">报纸阅览厅<span
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">数字图书阅览厅<span
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p></td>
					<td
						style="BORDER-BOTTOM: windowtext 1pt solid; BORDER-LEFT: #f0f0f0; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 0cm; WIDTH: 146.2pt; PADDING-RIGHT: 0cm; HEIGHT: 188.25pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
						width="195"><p
							style="TEXT-ALIGN: center; LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal" align="center">
							<span
								style="FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">周二至周日<span
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p></td>
					<td
						style="BORDER-BOTTOM: windowtext 1pt solid; BORDER-LEFT: #f0f0f0; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 0cm; WIDTH: 159.95pt; PADDING-RIGHT: 0cm; HEIGHT: 188.25pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
						width="213"><p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="COLOR: black; FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312; mso-font-kerning: 0pt"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">上午<span
											lang="EN-US">9:00-12</span>：<span lang="EN-US">00<o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="COLOR: black; FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312; mso-font-kerning: 0pt"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">下午<span
											lang="EN-US">13:</span><span lang="EN-US">00-18:30<o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="font-family: 仿宋_GB2312; FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"
								lang="EN-US"><o:p>
									<span style="font-family: FangSong_GB2312; font-size: 18px;"><strong>&nbsp;</strong></span>
								</o:p></span>
						</p></td>
				</tr>
				<tr style="HEIGHT: 49.75pt; mso-yfti-lastrow: yes">
					<td
						style="BORDER-BOTTOM: windowtext 1pt solid; BORDER-LEFT: windowtext 1pt solid; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 0cm; WIDTH: 161.65pt; PADDING-RIGHT: 0cm; HEIGHT: 49.75pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
						width="216" valign="top"><p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">总服务台<span
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">基藏书库<span
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span
								style="FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><strong><span
									style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">视障阅览室</span></span></strong></span>
						</p>
						<h6>
							<span style="font-size: 18px;"></span>
							<hr>
							<br>
						</h6>
						<h6>
							<span style="font-size: 18px;">24小时自助图书馆</span>
						</h6>
						<p></p></td>
					<td
						style="BORDER-BOTTOM: windowtext 1pt solid; BORDER-LEFT: #f0f0f0; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 0cm; WIDTH: 146.2pt; PADDING-RIGHT: 0cm; HEIGHT: 49.75pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
						width="195"><p
							style="TEXT-ALIGN: center; LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal" align="center">
							<br>
						</p>
						<p
							style="TEXT-ALIGN: center; LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal" align="center">
							<span
								style="FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">周二至周日</span></span></span></span>
						</p>
						<p
							style="TEXT-ALIGN: center; LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal" align="center">
							<span
								style="FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;"></span></span></span></span>
						</p>
						<hr>
						<div style="text-align: center;">
							<span style="background-color: transparent;"><br></span>
						</div>
						<div style="text-align: center;">
							<span style="background-color: transparent;"><span
								style="font-size: 18px;"><strong>全年</strong></span></span>
						</div>
						<p></p></td>
					<td
						style="BORDER-BOTTOM: windowtext 1pt solid; BORDER-LEFT: #f0f0f0; PADDING-BOTTOM: 0cm; BACKGROUND-COLOR: transparent; PADDING-LEFT: 0cm; WIDTH: 159.95pt; PADDING-RIGHT: 0cm; HEIGHT: 49.75pt; BORDER-TOP: #f0f0f0; BORDER-RIGHT: windowtext 1pt solid; PADDING-TOP: 0cm; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
						width="213"><p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span style="font-size: 14pt;"><span
								style="font-weight: bold;"><span style="font-size: 18px;"><span
										style="font-family: FangSong_GB2312;">上午<span
											lang="EN-US">9:00-12</span>：<span lang="EN-US">00<o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span style="FONT-SIZE: 18px"><span
								style="font-weight: bold;"><span style="FONT-SIZE: 18px"><span
										style="font-family: FangSong_GB2312;"><span
											style="font-family: 仿宋_GB2312; color: black; FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312; mso-font-kerning: 0pt">下午<span
												lang="EN-US">13:</span><span lang="EN-US">00-17:00</span></span><span
											style="font-family: 仿宋_GB2312; FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312"
											lang="EN-US"><o:p></o:p></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span style="FONT-SIZE: 18px"><span
								style="font-weight: bold;"><span style="FONT-SIZE: 18px"><span
										style="font-family: FangSong_GB2312;"><span
											style="font-family: 仿宋_GB2312; color: black; FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312; mso-font-kerning: 0pt"><span
												lang="EN-US"><br></span></span></span></span></span></span>
						</p>
						<p
							style="LINE-HEIGHT: 30pt; MARGIN: 0cm 0cm 0pt; mso-line-height-rule: exactly"
							class="MsoNormal">
							<span style="FONT-SIZE: 18px"><span
								style="font-weight: bold;"><span style="FONT-SIZE: 18px"><span
										style="font-family: FangSong_GB2312;"><span
											style="font-family: 仿宋_GB2312; color: black; FONT-SIZE: 14pt; mso-bidi-font-family: 仿宋_GB2312; mso-hansi-font-family: 仿宋_GB2312; mso-font-kerning: 0pt"><span
												lang="EN-US"></span></span></span></span></span></span>
						</p>
						<div style="text-align: center;">
							<span style="background-color: transparent;"></span>
							<hr>
							<br>
						</div>
						<div style="text-align: center;">
							<span style="background-color: transparent;"><br></span>
						</div>
						<div style="text-align: center;">
							<span style="background-color: transparent;"><span
								style="font-size: 18px;"><strong>全天</strong></span></span>
						</div>
						<div style="text-align: center;">
							<br>
						</div>
						<br>
					<p></p></td>
				</tr>
			</tbody>
		</table>
		</center>
	</div>

</body>
