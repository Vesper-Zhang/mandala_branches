<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
<head>  
    <title>用户列表</title>  
    
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		
	  	$(document).ready(function() {
	  		
		});
	  	
	</script>
</head>  
    
<body>  
    用户名： ${user.userName}   <br/>
    <input type="button" onclick="toSubmit();" value="刷新" style="background-color: pink">
</body>  
</html>  