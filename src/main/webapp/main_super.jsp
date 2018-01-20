<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书管理</title>

<script src="jQuery/js/jquery-1.8.3.min.js" type="text/javascript"></script>

<link href="dwz/themes/azure/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen" />
<link href="dwz/themes/css/print.css" rel="stylesheet" type="text/css" media="print" />
<link href="dwz/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen" />
<script src="dwz/bin/dwz.min.js" type="text/javascript"></script>
<script src="dwz/js/dwz.regional.zh.js" type="text/javascript"></script>

<link rel="stylesheet" href="jQuery/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="jQuery/ztree/js/jquery.ztree.all-3.5.min.js"></script>

<script type="text/javascript">
	$(function() {
		DWZ.init("dwz/dwz.frag.xml", {
			loginUrl : "login_dialog.html",
			loginTitle : "登录", // 弹出登录对话框
			statusCode : {
				ok : 200,
				error : 300,
				timeout : 301
			}, //【可选】
			pageInfo : {
				pageNum : "pageNum",
				numPerPage : "numPerPage",
				orderField : "orderField",
				orderDirection : "orderDirection"
			}, //【可选】
			keys : {
				statusCode : "statusCode",
				message : "message"
			}, //【可选】
			ui : {
				hideMode : 'offsets'
			}, //【可选】hideMode:navTab组件切换的隐藏方式，支持的值有’display’，’offsets’负数偏移位置的值，默认值为’display’
			debug : false, // 调试模式 【true|false】
			callback : function() {
				initEnv();
				$("#themeList").theme({
					themeBase : "themes"
				}); // themeBase 相对于index页面的主题base路径
			}
		});
	});
</script>
</head>

<body>
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<ul class="nav">
					<li><a href="${pageContext.request.contextPath }/index/index.jsp" target="_top">首页</a></li>
					<li><a href="javascript:void(0)">用户信息：${user.userId }</a></li>
					<li><a href="main/quit.do">安全退出</a></li>
				</ul>
			</div>
		</div>
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse">
						<div></div>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse">
					<h2>图书管理</h2>
					<div>收缩</div>
				</div>
				<div class="accordion" fillSpace="sidebar">
				
					<!-- 图书管理 -->
					<div class="accordionHeader"><h2>&nbsp;&nbsp;图书管理</h2></div>
					<div class="accordionContent">
						<script type="text/javascript">
							var setting = {
									data : {
										simpleData : {
											enable : true
										}
									}
							};
							var zNodes1 =[
							    {id : "11",name:"书架管理",open:true},
								{id : "111",name : "书架初始化",pId : "11",url : "bookManage/bookshelves/book_bookshelves_add.jsp",target : "navTab"},
								{id : "112",name : "增加书架",pId : "11",url : "bookManage/bookshelves/book_bookshelves_extend.jsp",target : "navTab"},
								
								{id : "13",name : "图书管理",open:true},
								{id : "132",name : "添加图书",pId : "13",url:"${pageContext.request.contextPath}/book/insertIndex.do",target : "navTab"},
								{id : "133",name : "图书列表",pId : "13",url:"${pageContext.request.contextPath}/book/index.do",target : "navTab"},
								{id : "136",name : "图书借阅频率查询",pId : "13",url : "${pageContext.request.contextPath}/show/index.do",target:"navTab"},
								{id : "14",name : "图书类别管理",open:true},
								//TODO 1这里发出的请求
								{id : "141",name : "类别查看",pId : "14",url:"${pageContext.request.contextPath}/book/queryBookCategory.do",target : "navTab"},
								{id : "142",name : "添加类别",pId : "14",url:"bookManage/bookCategory/book_category_add.jsp",target : "navTab"},
								
							];
							$(document).ready(function(){
								$.fn.zTree.init($("#treeDemo1"), setting, zNodes1);
							});
						</script>
						<div id="treeDemo1" class="ztree"></div>
					</div>
					
					<!-- 借阅信息管理 -->
					<div class="accordionHeader"><h2>&nbsp;&nbsp;借阅信息管理</h2></div>
					<div class="accordionContent">
						<script type="text/javascript">
							var zNodes2 =[
							    {id : "21",name:"查看借阅信息",open:true},
							    {id : "211",name:"条件查询",pId:"21",url:"${pageContext.request.contextPath}/borrow/index.do",target : "navTab"},
							    {id : "211",name:"指定读者查询",pId:"21",url:"${pageContext.request.contextPath}/back/index.do",target : "navTab"},
							    
							];
							$(document).ready(function(){
								$.fn.zTree.init($("#treeDemo2"), setting, zNodes2);
							});
						</script>
						<div id="treeDemo2" class="ztree"></div>
					</div>
					
					
					<!-- 用户信息管理 -->
					<div class="accordionHeader"><h2>&nbsp;&nbsp;用户信息管理</h2></div>
					<div class="accordionContent">
						<script type="text/javascript">
							var zNodes3 =[
								{id : "31",name : "超级管理员管理",open:true},
								{id : "311",name : "重置管理员密码",pId :"31",url : "${pageContext.request.contextPath}/super/index.do",target:"navTab"},
								{id : "32",name : "图书借阅员管理",open:true},
								{id : "321",name : "添加图书借阅员",pId:"32",url : "${pageContext.request.contextPath}/manager/toinsertIndex.do",target:"navTab"},
								{id : "322",name : "维护图书借阅员",pId:"32",url : "${pageContext.request.contextPath}/manager/index.do",target:"navTab"},
								{id : "33",name : "读者信息管理",open:true},
								{id : "331",name : "添加读者",pId:"33",url : "${pageContext.request.contextPath}/reader/toinsertIndex.do",target:"navTab"},
								{id : "332",name : "维护读者",pId:"33",url : "${pageContext.request.contextPath}/reader/index.do",target:"navTab"}
							];
							$(document).ready(function(){
								$.fn.zTree.init($("#treeDemo3"), setting, zNodes3);
							});
						</script>
						<div id="treeDemo3" class="ztree"></div>
					</div>
					<!-- 图书证管理 -->
					<div class="accordionHeader"><h2>&nbsp;&nbsp;图书证管理</h2></div>
					<div class="accordionContent">
						<script type="text/javascript">
							var zNodes4 =[
								{id : "41",name : "图书证管理",open:true},
								{id : "411",name : "注册图书证",pId : "41",url:"${pageContext.request.contextPath}/book_card/toinsertIndex.do",target:"navTab"},								
								{id : "412",name : "维护图书证",pId : "41",url:"${pageContext.request.contextPath}/book_card/index.do",target:"navTab"}
							];
							$(document).ready(function(){
								$.fn.zTree.init($("#treeDemo4"), setting, zNodes4);
							});
						</script>
						<div id="treeDemo4" class="ztree"></div>
					</div>
					<!-- 密码管理 -->
					<div class="accordionHeader"><h2>&nbsp;&nbsp;密码管理</h2></div>
					<div class="accordionContent">
						<script type="text/javascript">
							var zNodes5 =[
								{id : "51",name : "修改密码",open:true,url : "${pageContext.request.contextPath}/user/tochangepwd.do",target : "navTab"}
							];
							$(document).ready(function(){
								$.fn.zTree.init($("#treeDemo5"), setting, zNodes5);
							});
						</script>
						<div id="treeDemo5" class="ztree"></div>
					</div>
					
					
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent">
						<!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main">
								<a href="javascript:;">
									<span>
										<span class="home_icon">我的主页</span>
									</span>
								</a>
							</li>
						</ul>
					</div>
					<div class="tabsLeft">left</div>
					<!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div>
					<!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div style="display: table; width: 100%; height: 500px;">
						<div id="box" style="display: table-cell; vertical-align: middle; text-align: center;">
							<img src="dwz/themes/default/images/bj.jpg" width="100%" height="100%"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<b>图书管理</b>&nbsp;Copyright &copy; <a href="demo_page2.html" target="dialog">你猜</a>
	</div>
</body>
