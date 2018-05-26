<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	document.getElementById("submitBtn").onclick=submitPassword;
};

function submitPassword(){
	var xmlHttp=createXMLHttpRequest();
	var oldPassword=document.getElementById("oldPassword").value;
	var newPassword=document.getElementById("newPassword").value;
	var renewPassword=document.getElementById("renewPassword").value;
	if(newPassword!=renewPassword){
		alert("新密码不一致");
		return false;
	}
	xmlHttp.open("POST","user_updatePassword.do",true);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlHttp.send("oldPassword="+oldPassword+"&newPassword="+newPassword);
	xmlHttp.onreadystatechange=function(){
		if(xmlHttp.readyState==4&&xmlHttp.status==200){
			var result=xmlHttp.responseText;
			if(result=="success"){
				alert("修改成功");
			}else if(result=="oldError"){
				alert("原密码错误");
			}else{
				alert("修改失败");
			}
		}
		}
}

function createXMLHttpRequest(){
	try{
		return new XMLHttpRequest();
	}catch(e){
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				return new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e){
				throw e;
				alert("大哥，您用的是什么浏览器啊！");
			}
		}
	}
}
</script>
</head>
<body>
原密码：<input id="oldPassword" type="password"/>
新密码：<input id="newPassword" type="password"/>
确认密码：<input id="renewPassword" type="password"/>
<input id="submitBtn" type="button" value="确认"/>
</body>
</html>