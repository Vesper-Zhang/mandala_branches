<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>登录页面</title>
<script  src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
<script  src="<%=basePath%>/static/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	
  	$(document).ready(function() {
  		
	});
  	
  	function toSubmit() {
  		$.ajax({
            type: "POST",
            url:"${ctx}/login/ajaxJudge",
            data:$('#loginForm').serialize(),
            async: false,
            success: function(result) {
            	var json = eval("(" + result + ")"); 
            	if(json.judge == 1) {
            		window.location.href="${ctx}/login/loginSuccess";
            	}else{
            		alert("用户名密码错误！");
            	}
            }
        });
  	}
</script>

</head>
<body>
	<form id="loginForm" method="post" >
	<!-- action="${ctx }/login/judge" -->
		<table>
			<tr>
				<td>用户名:<input type="text" name="userName" id="userName"></td>
			</tr>
			<tr>
				<td>密码:<input type="password" name="password" id="password"></td>
			</tr>
			<tr>
				<td>
				    <!-- <input type="submit" value="登录" style="background-color: pink"> --> 
				    <input type="button" value="登录" onclick="toSubmit()" style="background-color: pink"> 
					<input type="reset" onclick="" value="重置" style="background-color: red">
			    </td>
			</tr>
		</table>
	</form>
</body>
</html>