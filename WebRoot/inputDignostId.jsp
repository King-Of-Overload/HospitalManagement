<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	var submitButton=document.getElementById("submitBtn");
	submitButton.onclick=loadSecondRegisterUI;
};

function loadSecondRegisterUI(){
	var xmlHttp=createXMLHttp();
	var pathId=document.getElementById("pathId").value;
	xmlHttp.open("POST","register_goToSecondRegisterForm.do",true);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlHttp.send("pathId="+pathId);
	xmlHttp.onreadystatechange=function(){
		if(xmlHttp.readyState==4 && xmlHttp.status==200){
			var result=xmlHttp.responseText;
			if(result=="success"){
				location.href="secondRegister.jsp";
			}else{
				alert("病历不存在");
			}
		}
	};
}

function createXMLHttp(){
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
				alert("哥们儿，您用的是什么浏览器啊");
			}
		}
	}
}
</script>
</head>
<body>
请输入患者病历号：<input type="text" name="pathId" id="pathId"/>
<input type="button" value="提交" id="submitBtn"/>
</body>
</html>