<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/table.css" rel="stylesheet" type="text/css" />
<link href="dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen" />

<link rel="stylesheet" href="jQuery/ztree/css/zTreeStyle/zTreeStyle.css" />
<link type="text/css" href="jQuery/ui/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
<script type="text/javascript" src="jQuery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="jQuery/ui/js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="jQuery/ztree/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>

<script type="text/javascript">
	
	
	$(function() {
		//集成jquery多tab页
		$('#tabs').tabs();
	});
</script>

<table border="0" cellpadding="0" cellspacing="0" class="table_border">
    <tr>
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0"
                class="table_right">
                <tr>
                    <td>
                        <font style="font-size: 12px"><strong>用户详细信息</strong></font>
                    </td>
                    <td width="25" height="26" align="right">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr height="50">
		<td>
			<div id="tabs">
				<ul>
					<li style="font-size: 12px;">
						<a href="#tabs-1">图书明细</a>
					</li>
				</ul>
				<div id="tabs-1" style="background: #FFFFFF">
					ISBN：${book.bookISBN }
					<br />
					<br />
					标题：${book.bookTitle }
					<br />
					<br />
					作者：${book.bookAuthor }
					<br />
					<br />
					出版社：${book.bookPress }
					<br />
					<br />
					出版时间：${book.bookPublish_text }
					<br />
					<br />
					所在的位置：<br>
					<c:if test="${empty book.bookSeatList}">
						&nbsp;&nbsp;&nbsp;&nbsp;已下架
					</c:if>
					<c:if test="${!empty book.bookSeatList}">
						<c:forEach items="${book.bookSeatList}" var="obj">
						${fn:substring(obj.bookSeat,0,1) }区,${fn:substring(obj.bookSeat,1,2) }号书架,${fn:substring(obj.bookSeat,2,3) }行,第${fn:substring(obj.bookSeat,3,-1) }本<br>
						</c:forEach>
					</c:if>
						
					<br />
					<br />					
				</div>				
			</div>
		</td>
	</tr>
    
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0"
	class="table_padding">
	<tr>
		<td height="21" align="right">
			<table align="left">
				<tr>
					<td width="50px"><a class="button" href="javascript:void(0)" onclick="window.history.back()"><span>返回</span></a></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
