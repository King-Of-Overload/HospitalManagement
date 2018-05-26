<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	var xmlHttp=createXMLHttp();
	document.getElementById("depts").onchange=loadDoctors;
	document.getElementById("saveFirst").onclick=submitFormData;
	var radioList=document.getElementsByName("RadioGroup2");
	for(var i=0;i<radioList.length;i++){
		radioList[i].onclick=loadPrice;
	}
};


function submitFormData(){
	var xmlHttp=createXMLHttp();
	var dignostId=document.getElementById("dignostId").innerText;
	var patientName=document.getElementById("patientName").value;
	var sexRadioGroup=document.getElementsByName("RadioGroup1");
	var sex;//性别
	for(var i=0;i<sexRadioGroup.length;i++){
		if(sexRadioGroup[i].checked){
			sex=sexRadioGroup[i].value;
		}
	}
	var patientAge=document.getElementById("patientAge").value;
	var patientAddress=document.getElementById("patientAddress").value;
	var deptName=document.getElementById("depts").value;
	var doctorName=document.getElementById("doctors").value;
	xmlHttp.open("POST","register_operateFirstRegister.do",true);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlHttp.send("dignostId="+dignostId+"&patientName="+patientName+"&sex="+sex+"&patientAge="+patientAge+"&patientAddress="+patientAddress+"&deptName="+deptName+"&doctorName="+doctorName);
	xmlHttp.onreadystatechange=function(){
		if(xmlHttp.readyState==4 && xmlHttp.status==200){
	      var result=xmlHttp.responseText;
			if(result=="registersuccess"){
	         alert("挂号成功");
	           }else{
	         alert("挂号失败");
	}
		}
	};
}

     function loadPrice(){
    	 var registerCharacter=this.value;
    	 var inputPriceEle=document.getElementById("price");
    	 if(registerCharacter=="普通"){
    		 inputPriceEle.setAttribute("value", "7");
    	 }else if(registerCharacter=="急诊"){
    		 inputPriceEle.setAttribute("value", "5");
    	 }else if(registerCharacter=="专家"){
    		 inputPriceEle.setAttribute("value", "20");
    	 }
     }

function loadDoctors(){
	var deptName=this.value;
	var xmlHttp=createXMLHttp();
	xmlHttp.open("POST","register_getDoctors.do",true);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlHttp.send("deptName="+deptName);
	xmlHttp.onreadystatechange=function(){
		if(xmlHttp.readyState==4 && xmlHttp.status==200){
			var json=xmlHttp.responseText;
			console.log(json);
			var doctorJson=JSON.parse(json);
			var doctorSelect=document.getElementById("doctors");//页面中的医生select元素
			removeChildNodes(doctorSelect);//清空内部内容
			var initOption=document.createElement("option");
			var textNode=document.createTextNode("======请选择医生======");
			initOption.appendChild(textNode);
			doctorSelect.appendChild(initOption);
			for(var i=0;i<doctorJson.length;i++){
				var doctor=doctorJson[i];
				var doctorName=null;
				if(window.addEventListener){
					doctorName=doctor.doctorName;
				}else{
					doctorName=doctor.text;
				}
				addDoctorOption(doctorName);
				
			}//结束
		}
	}
}

function addDoctorOption(doctorName){
	var doctorSelect=document.getElementById("doctors");
	var doctorOption=document.createElement("option");
	var textNode=document.createTextNode(doctorName);
	doctorOption.appendChild(textNode);
	doctorOption.setAttribute("value", doctorName.trim());
	doctorSelect.appendChild(doctorOption);
}

function removeChildNodes(element){
	var nodes=element.childNodes;
	while(nodes.length>0){
		element.removeChild(nodes[0]);
	}
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
<table width="455" border="1">
  <tbody>
    <tr>
      <td colspan="2" align="center"><blockquote>
        <p>挂号单</p>
        <p>病历号：<label id="dignostId"><s:property value="dignostId"/></label></p>
      </blockquote></td>
    </tr>
    <tr>
      <td width="127">病人姓名：</td>
      <td width="312"><input type="text" name="patientName" id="patientName"></td>
    </tr>
    <tr>
      <td>性别：</td>
      <td><p>
        <label>
          <input type="radio" name="RadioGroup1" value="男" id="RadioGroup1_0" checked="checked">
          男</label>
<label>
  <input type="radio" name="RadioGroup1" value="女" id="RadioGroup1_1">
          女</label>
        <br>
      </p></td>
    </tr>
    <tr>
      <td>年龄：</td>
      <td><input type="text" name="patientAge" id="patientAge"> 
        岁 </td>
    </tr>
    <tr>
      <td>住宅地址：</td>
      <td><input type="text" name="patientAddress" id="patientAddress"></td>
    </tr>
    <tr>
      <td colspan="2"><label for="select">挂号科室:</label>
        <select name="depts" id="depts">
        <s:iterator value="depts" var="d">
                <option><s:property value="#d.deptName"/></option>
        </s:iterator>

        </select> 
            <label for="select2">    医生:</label>
      <select name="doctors" id="doctors">
      <s:iterator value="initDoctor" var="init">
      <option><s:property value="#init.doctorName"/></option>
      </s:iterator>
      </select>
      </td>
    </tr>
    <tr>
      <td>挂号类别：</td>
      <td><p>
        <label>
          <input type="radio" name="RadioGroup2" value="普通" id="RadioGroup2_0" checked="checked">
          普通</label>
        <label>
          <input type="radio" name="RadioGroup2" value="急诊" id="RadioGroup2_1">
          急诊</label>

        <label>
          <input type="radio" name="RadioGroup2" value="专家" id="RadioGroup2_2">
          专家</label>
        <br>
      </p></td>
    </tr>
  </tbody>
</table>
<table width="455" border="1">
  <tbody>
    <tr>
      <td>价格：</td>
      <td><input type="text" name="price" id="price" value="7"> 
         元</td>
    </tr>
    <tr>
      <td colspan="2" align="center">    <input type="button" name="saveFirst" id="saveFirst" value="提交"></td>
    </tr>
  </tbody>
</table>
</body>
</html>