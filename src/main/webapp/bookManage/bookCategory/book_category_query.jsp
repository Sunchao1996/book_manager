<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>

<style type="text/css">
    #bookCategoryList{
        border:0px;
        position: absolute;
        left : 0px;
        top : 0px;
        width: 100%;
        height: 100%;
    }
</style>
<script type="text/javascript">

//TODO 3由这里发送获取数据的请求 
</script>
<iframe src="book/bookCategoryList.do" id="bookCategoryList" name="bookCategoryList"></iframe>