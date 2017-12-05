<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>新增用户</title>
<script src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
<script src="${ctxStatic}/jquery-validation/1.11.1/jquery.validate.css"></script>
<script src="${ctxStatic}/jquery-validation/1.11.1/jquery.validate.min.js"></script>
</head>
<body>

	<h2>新增用户</h2>

	<div>

        <form id="addForm" method="post">
			<p>
				用户名:<br> 
				<input type="text" name="userName" >
			</p>
	
			<p>
				密码:<br> 
				<input type="password" name="password" > 
			</p>
			
			<p>
				年龄:<br> <input type="text" name="age" > 
			</p>
			
			<input class="btn-primary" id="btnSubmit" type="submit" value="保存">
        </form>

	</div>

	<script>
		$("#addForm").validate({
			rules:{
				userName:{
					required:true
				},
				password:{
					required:true
				}
			},
			messages:{
				userName:{
					required:"请填写用户名"
				},
				password:{
					required:"请填写密码"
				}
			},
			submitHandler: function(form){
				$("#btnSubmit").attr("disabled","disabled");
				$.ajax({
		            type: "POST", 
		            url:"${ctx}/user/addUser",
		            data:$('#addForm').serialize(),
		            async: false,
		            success: function(data) {
		            	var result = eval('(' + data + ')');
		            	if(result.flag) {
		            		//跳转到用户列表页面
	                        window.location.href="${ctx}/user/toUserList";
		            	}else{
		            		location.href="/error.jsp";
		            	}
		            	
		            }
		        });
				return false;
			},
			errorContainer: "#messageBox",
			errorPlacement: function(error, element) {
				$("#messageBox").text("输入有误，请先更正。");
				if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
					error.appendTo(element.parent().parent());
				} else {
					error.insertAfter(element);
				}
			}
		});
	
	</script>

</body>
</html>