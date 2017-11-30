<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增用户</title>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script> -->
<script  src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
<script src="http://apps.bdimg.com/libs/angular.js/1.4.6/angular.min.js"></script>
</head>
<body>

	<h2>新增用户</h2>

	<div ng-app="myApp" ng-controller="validateCtrl" name="myForm" novalidate>

        <form ng-submit="addTodo()">
            <!-- <input type="text" ng-model="todoText"  size="30" placeholder="add new todo here">
            <input class="btn-primary" type="submit" value="add"> -->
        
			<p>
				用户名:<br> 
				<input type="text" name="userName" ng-model="userName" required>
				<!-- <span style="color: red" ng-show="myForm.userName.$dirty && myForm.userName.$invalid"> 
				    <span ng-show="myForm.userName.$error.required">用户名是必须的。</span>
				</span> -->
			</p>
	
			<p>
				密码:<br> 
				<input type="text" name="password" ng-model="password" required> 
				<!-- <span style="color: red" ng-show="myForm.password.$dirty && myForm.password.$invalid"> 
					<span ng-show="myForm.password.$error.required">密码是必须的。</span> 
				</span> -->
			</p>
			
			<p>
				年龄:<br> <input type="text" name="age" ng-model="age" required> 
				<!-- <span style="color: red" ng-show="myForm.age.$dirty && myForm.age.$invalid"> 
					<span ng-show="myForm.age.$error.required">年龄是必须的。</span> 
				</span> -->
			</p>
			
			<input class="btn-primary" type="submit" value="保存">
        </form>

	</div>

	<script>
		var app = angular.module('myApp', []);
		app.controller('validateCtrl', function($scope, $http) {
			
			$scope.formData = {};
			$scope.addTodo = function() {
				var pData = {userName:$scope.userName, password:$scope.password, age:$scope.age};
                $http({
                    method  : 'POST',
                    url     : '${ctx}/user/addUser',
                    params  : pData,
                    //data    : pData, //$.param($scope.formData),  pass in data as strings
                    headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
                })
                    .success(function(data) {
                        console.log(data);
                        if ("1" == data.success) {
                            // if not successful, bind errors to error variables
                            //$scope.errorName = data.errors.name;
                            //$scope.errorSuperhero = data.errors.superheroAlias;
                            //跳转到用户列表页面
                            window.location.href="${ctx}/user/toUserList";
                        } else {
                            // if successful, bind success message to message
                            $scope.message = data.message;
                        }
                    });
            };
		});
	</script>

</body>
</html>