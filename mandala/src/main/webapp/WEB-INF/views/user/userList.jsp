<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User List</title>
    <!-- <script src="http://apps.bdimg.com/libs/angular.js/1.4.6/angular.min.js"></script> -->
    <!-- IE required polyfills, in this exact order -->
    <script src="${ctxStatic}/angular2/es6-shim.min.js"></script>
    <script src="${ctxStatic}/angular2/system-polyfills.js"></script>
    <script src="${ctxStatic}/angular2/shims_for_IE.js"></script>

    <script src="${ctxStatic}/angular2/angular2-polyfills.js"></script>
    <script src="${ctxStatic}/angular2/system.js"></script>
    <script src="${ctxStatic}/angular2/typescript.js"></script>
    <script src="${ctxStatic}/angular2/Rx.js"></script>
    <script src="${ctxStatic}/angular2/angular2.dev.js"></script>
    
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
    <script>
		var app = angular.module('myApp', []);
		app.controller('customersCtrl', function($scope, $http) {
    		$http.get("<%=basePath%>/user/showUserList")
    		.success(function (response) {$scope.lists = response.userList;});
		});
	</script>
	
	<script type="text/javascript">
	    function toAddUser() {
	    	window.location.href="<%=basePath%>/user/toAddUser";
	    }
	</script>
</head>
<body>
    <h2>用户列表</h2>
    
    <div ng-app="myApp" ng-controller="customersCtrl"> 
		<table>
		    <tr>
		        <th>序号</th>
		        <th>id</th>
		        <th>用户名</th>
		        <th>年龄</th>
		    </tr>
		    <tr ng-repeat="x in lists">
		        <td>{{$index + 1}}</td>
		        <td>{{x.id}}</td>
		        <td>{{ x.userName }}</td>
		        <td>{{ x.age }}</td>
		    </tr>
		</table>
    </div>
    <input type="button" value="新增用户" onclick="toAddUser()">
</body>
</html>