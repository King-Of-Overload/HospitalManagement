<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr>
<td>患者编号</td>
<td>患者姓名</td>
<td>患者性别</td>
<td>患者病历号</td>
<td>患者年龄</td>
<td colspan="2">操作</td>
</tr>
<s:iterator value="patients" var="p">
<tr>
<td><s:property value="#p.patientId"/></td>
<td><s:property value="#p.patientName"/></td>
<td><s:property value="#p.patientSex"/></td>
<td><s:property value="#p.pathId"/></td>
<td><s:property value="#p.patientAge"/></td>
<td><a href="dignost_dignosting.do?pathId=<s:property value='#p.pathId'/>">病情诊断</a></td>
<td><a href="dignost_updateDignostUI.do?pathId=<s:property value='#p.pathId'/>">修改</a></td>
</tr>
</s:iterator>
</table>
</body>
</html>