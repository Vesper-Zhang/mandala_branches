<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User List</title>
    
    <style>
		table, th , td {
		  border: 1px solid grey;
		  border-collapse: collapse;
		  padding: 5px;
		}
		table tr:nth-child(odd) {
		  background-color: #f1f1f1;
		}
		table tr:nth-child(even) {
		  background-color: #ffffff;
		}
	</style>
	
	<script type="text/javascript">
	    function toAddUser() {
	    	window.location.href="<%=basePath%>/user/toAddUser";
	    }
	</script>
</head>
<body>
    <h2>用户列表</h2>
    
    <div> 
		<table>
		    <tr>
		        <th>序号</th>
		        <th>用户名</th>
		        <th>年龄</th>
		    </tr>
		    <c:forEach items="${userList }" var="user" varStatus="status">
			    <tr>
			        <td>${status.index + 1}</td>
			        <td>${user.userName }</td>
			        <td>${user.age }</td>
			    </tr>
		    </c:forEach>
		</table>
    </div>
    <input type="button" value="新增用户" onclick="toAddUser()">
</body>
</html>