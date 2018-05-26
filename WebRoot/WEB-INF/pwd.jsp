<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>密码修改</title>
<script type="text/javascript" src="<c:url value='/jQuery/jquery-1.5.1.js'/>"></script>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/pwd.css'/>">
<script type="text/javascript">
$(function() {	
	/*
	 * 1. 给注册按钮添加submit()事件，完成表单校验
	 */
	$("#submit").submit(function(){
		$("#msg").text("");
		var bool = true;
		$(".input").each(function() {
			var inputName = $(this).attr("name");
			if(!invokeValidateFunction(inputName)) {
				bool = false;
			}
		});
		return bool;
	});
	
	/*
	 * 3. 输入框推动焦点时进行校验
	 */
	$(".input").blur(function() {
		var inputName = $(this).attr("id");
		invokeValidateFunction(inputName);
	});
});

/*
 * 输入input名称，调用对应的validate方法。
 * 例如input名称为：loginname，那么调用validateLoginname()方法。
 */
function invokeValidateFunction(inputName) {
	inputName = inputName.substring(0, 1).toUpperCase() + inputName.substring(1).toLowerCase();
	var functionName = "validate" + inputName;
	return eval(functionName + "()");	
}

/*
 * 校验密码
 */
function validateLoginpassword() {
	var bool = true;
	$("#loginpassError").css("display", "none");
	var value = $("#loginpassword").val();
	if(!value) {// 非空校验
		$("#loginpassError").css("display", "");
		$("#loginpassError").text("密码不能为空！");
		bool = false;
	} else if(value.length <= 3 || value.length > 20) {//长度校验
		$("#loginpassError").css("display", "");
		$("#loginpassError").text("密码长度必须在3 ~ 20之间！");
		bool = false;
	} else {// 验证原错误是否正确
		$.ajax({
			cache: false,
			async: false,
			type: "POST",
			dataType: "json",
			data: {method: "validateLoginpass" ,loginpass: value},
			url: "/ShaoXingLightTexttile/validateLoginpass",
			success: function(flag) {
				if(!flag) {
					$("#loginpassError").css("display", "");
					$("#loginpassError").text("原密码错误！");
					bool = false;				
				}
			}
		});
	}
	return bool;
}

// 校验新密码
function validateNewpass() {
	var bool = true;
	$("#newpassError").css("display", "none");
	var value = $("#newpass").val();
	if(!value) {// 非空校验
		$("#newpassError").css("display", "");
		$("#newpassError").text("新密码不能为空！");
		bool = false;
	} else if(value.length <=3 || value.length > 20) {//长度校验
		$("#newpassError").css("display", "");
		$("#newpassError").text("新密码长度必须在6 ~ 20之间！");
		bool = false;
	}
	return bool;
}

/*
 * 校验确认密码
 */
function validateReloginpass() {
	var bool = true;
	$("#reloginpassError").css("display", "none");
	var value = $("#reloginpass").val();
	if(!value) {// 非空校验
		$("#reloginpassError").css("display", "");
		$("#reloginpassError").text("确认密码不能为空！");
		bool = false;
	} else if(value != $("#newpass").val()) {//两次输入是否一致
		$("#reloginpassError").css("display", "");
		$("#reloginpassError").text("两次密码输入不一致！");
		bool = false;
	}
	return bool;	
}

/*
 * 校验验证码
 */
function validateVerifycode() {
	var bool = true;
	$("#verifyCodeError").css("display", "none");
	var value = $("#verifyCode").val();
	if(!value) {//非空校验
		$("#verifyCodeError").css("display", "");
		$("#verifyCodeError").text("验证码不能为空！");
		bool = false;
	} else if(value.length != 4) {//长度不为4就是错误的
		$("#verifyCodeError").css("display", "");
		$("#verifyCodeError").text("错误的验证码！");
		bool = false;
	} else {//验证码是否正确
		$.ajax({
			cache: false,
			async: false,
			type: "POST",
			dataType: "json",
			data: {method:"ajaxValidateVerifyCode", verifyCode: value},
			url: "/ShaoXingLightTexttile/ajaxValidateVerifyCode",
			success: function(flag) {
				if(!flag) {
					$("#verifyCodeError").css("display", "");
					$("#verifyCodeError").text("错误的验证码！");
					bool = false;					
				}
			}
		});
	}
	return bool;
}
//换验证码,获取image元素，重新设置src，使用毫秒来添加参数
function _changeIdentifyImage(){
	$("#vCode").attr("src","/ShaoXingLightTexttile/VerifyCodeServlet?a="+new Date().getTime());
}

</script>
</head>
<body>
<div class="div0">
    	<span>修改密码</span>
    </div>

	<div class="div1">
		<form action="updateLoginPassword.action" method="post" target="_top">
			<input type="hidden" name="method" value="updatePassword"/>
		<table>
			<tr>
				<td><label class="error">${msg}</label></td>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td align="right">原密码:</td>
				<td><input class="input" type="password" name="updatePassParams.CPassword" id="loginpassword"/></td>
				<td><label id="loginpassError" class="error"></label></td>
			</tr>
			<tr>
				<td align="right">新密码:</td>
				<td><input class="input" type="password" name="updatePassParams.newPassword" id="newpass"/></td>
				<td><label id="newpassError" class="error"></label></td>
			</tr>
			<tr>
				<td align="right">确认密码:</td>
				<td><input class="input" type="password" name="reloginpass" id="reloginpass"/></td>
				<td><label id="reloginpassError" class="error"></label></td>
			</tr>
			<tr>
				<td align="right"></td>
				<td>
				  <img id="vCode" src="<c:url value='/VerifyCodeServlet'/>" border="1"/>
		    	  <a href="javascript:_changeIdentifyImage()">看不清，换一张</a>
				</td>
			</tr>
			<tr>
				<td align="right">验证码:</td>
				<td>
				  <input class="input" type="text" name="verifyCode" id="verifyCode"/>
				</td>
				<td><label id="verifyCodeError" class="error"></label></td>
			</tr>
			<tr>
				<td align="right"></td>
				<td><input id="submit" type="submit" value="修改密码"/></td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>