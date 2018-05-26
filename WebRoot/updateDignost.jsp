<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  window.onload=function(){
	  var submitButton=document.getElementById("dignostButton");
	  submitButton.onclick=sendData;
  };
  
  function sendData(){
	  var xmlHttp=createXMLHttp();
	  var pathId=document.getElementById("pathId").innerHTML;
	  var pathHistory=document.getElementById("pathHistory").value;
	  var pathAllergy=document.getElementById("pathAllergy").value;
	  var pathSymptom=document.getElementById("pathSymptom").value;
	  var pathAnalyse=document.getElementById("pathAnalyse").value;
	  xmlHttp.open("POST","dignost_updateDignost.do",true);
		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xmlHttp.send("pathId="+pathId+"&pathHistory="+pathHistory+"&pathAllergy="+pathAllergy+"&pathSymptom="+pathSymptom+"&pathAnalyse="+pathAnalyse);
		xmlHttp.onreadystatechange=function(){
			if(xmlHttp.readyState==4 && xmlHttp.status==200){
				var result=xmlHttp.responseText;
				if(result=="dignostsuccess"){
					alert("保存成功");
				}else{
					alert("保存失败");
				}
			}};
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
<table width="668" border="1">
  <tbody>
    <tr>
      <td colspan="2" align="center">病情诊断</td>
    </tr>
    <tr>
      <td colspan="2" align="center">病历号:<label id="pathId"><s:property value="dignostPatient.pathId"/></label>病人姓名:<label id="patientName"><s:property value="dignostPatient.patientName"/></label>性别：<label id="patientSex"><s:property value="dignostPatient.patientSex"/></label>年龄:<label id="patientAge"><s:property value="dignostPatient.patientAge"/></label> </td>
    </tr>
    <tr>
      <td >既往史：</td>
      <td><textarea name="textarea" id="pathHistory"><s:property value="existDignost.pathHistory"/></textarea></td>
    </tr>
    <tr>
      <td>过敏史：</td>
      <td><textarea name="textarea2" id="pathAllergy"><s:property value="existDignost.pathAllergy"/></textarea></td>
    </tr>
    <tr>
      <td>病情症状：</td>
      <td><textarea name="textarea3" id="pathSymptom"><s:property value="existDignost.pathSymptom"/></textarea></td>
    </tr>
    <tr>
      <td>病情分析：</td>
      <td><textarea name="textarea4" id="pathAnalyse"><s:property value="existDignost.pathAnalyse"/></textarea></td>
    </tr>
    <tr>
      <td height="50" colspan="2" align="center"><input type="button" name="button" id="dignostButton" value="提交"></td>
    </tr>
  </tbody>
</table>
</body>
</html>