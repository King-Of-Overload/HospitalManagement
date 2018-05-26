<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>医生列表</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<style type="text/css">
body {
	text-align: center;
	margin-top: 0px;
}

#menu {
	text-align: center; /* 字体居中  */
}

#menu li {
	list-style: none; /* 将默认的列表符号去掉 */
	padding: 0; /* 将默认的内边距去掉 */
	margin: 0; /* 将默认的外边距去掉 */
    text-decoration: none;
    background: rgba(255, 255, 255, 0.7);
	float: left;
	margin-right: 5px;
	margin-left: 5px; 
}
.inputtext {
	width: 100px;
	height: 18px;
}
.selecttext{
	width: 100px;
	height: 25px;
}
</style>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/table.css" />
</head>
<body>
	<div align="center">
		<h1>
			<font color="red">特约医师</font>
		</h1>
		<form action="<%=basePath%>/frontDoctors!list" method="post">
			<b>医生：</b><input type="text" class="inputtext" name="e_doctorName" value='<s:property value="e_doctorName" />'> 
			<b>科室：</b><select name="e_keshiId" class="selecttext">
			<option value="0">..选择科室..</option>
				<s:iterator value="keshis" var="keshi">
					<s:if test="#keshi.keshiId==e_keshiId">
					<option value='<s:property value="#keshi.keshiId" />' selected>
						<s:property value="#keshi.keshiName" /></option>
					</s:if>
					<s:else>
						<option value='<s:property value="#keshi.keshiId" />'>
						<s:property value="#keshi.keshiName" /></option>
					</s:else>
				</s:iterator>
			</select> 
			<b>疾病：</b>
			<input type="text" class="inputtext" name="e_zhuanchang" value='<s:property value="e_zhuanchang" />'> 
			<input type="submit" value="查询" style="height: 25px;width: 60px;">
		</form>
		<br>
		<table class="table" style="width: 600px;">
			<tr>
				<th>编号</th>
				<th>医生姓名</th>
				<th>从业年限</th>
				<th>科室</th>
				<th>职称</th>
				<th>专长</th>
				<th>详细</th>
			</tr>
			<s:iterator value="doctors" var="doctor">
				<tr>
					<td><s:property value="#doctor.doctorId" /></td>
					<td><s:property value="#doctor.doctorName" /></td>
					<td><s:property value="#doctor.cynx" /></td>
					<td><s:iterator value="keshis" var="keshi">
							<s:if test="[0].keshiId==[1].keshiId">
								<s:property value="[0].keshiName" />
							</s:if>
						</s:iterator></td>
					<td><s:property value="#doctor.zhicheng" /></td>
					<td><s:property value="#doctor.zhuanchang" /></td>
					<td><a
						href='<%=basePath%>/frontDoctors!detailDoctor?e_doctorId=<s:property value="#doctor.doctorId" />'>详情</a></td>
				</tr>
			</s:iterator>
		</table>
	
	<div style="float: right; width: 400px;">
		<ul id="menu">
			<s:if test="totalPage<6">
				<s:iterator var="counter" begin="1" end="totalPage">
					<li>
					<a href="<%=basePath%>/frontDoctors!list?page=${counter}"><font color = "#2259D7"><b>${counter }</b></font></a>
					</li>
				</s:iterator>
			</s:if>
			<s:else>
				<s:if test="page==1">
					<s:iterator var="counter" begin="1" end="4">
						<li>
						<a href="<%=basePath%>/frontDoctors!list?page=${counter}"><font color = "#2259D7"><b>${counter }</b></font></a>
						</li>
					</s:iterator>
					    <li>
				        <a href="<%=basePath%>/frontDoctors!list?page=${totalPage}"><font color = "#2259D7"><b>...${totalPage }</b></font></a>
					    </li>
					    <li>
					    <a href="<%=basePath%>/frontDoctors!list?page=${page+1}"><font color = "#2259D7"><b>下一页</b></font></a>
					    </li>
				</s:if>
				<s:else>
					<s:if test="page-1<3">
						<li>
						<a href="<%=basePath%>/frontDoctors!list?page=${page-1}"><font color = "#2259D7"><b>上一页</b></font></a>
						</li>
						<s:iterator var="counter" begin="1" end="4">
							<li><a
								href="<%=basePath%>/frontDoctors!list?page=${counter}"><font color = "#2259D7"><b>${counter }</b></font></a>
							</li>
						</s:iterator>
						<li>
						<a href="<%=basePath%>/frontDoctors!list?page=${totalPage}"><font color = "#2259D7"><b>...${totalPage }</b></font></a>
						</li>
						<li>
						<a href="<%=basePath%>/frontDoctors!list?page=${page+1}"><font color = "#2259D7"><b>下一页</b></font></a>
						</li>
					</s:if>
					<s:else>
						<s:if test="totalPage-page>=3">
							<li>
							<a href="<%=basePath%>/frontDoctors!list?page=${page-1}"><font color = "#2259D7"><b>上一页</b></font></a>
							</li>
							<li>
							<a href="<%=basePath%>/frontDoctors!list?page=1"><font color = "#2259D7"><b>1...</b></font></a>
							</li>
							<li>
							<a href="<%=basePath%>/frontDoctors!list?page=${page-1}"><font color = "#2259D7"><b>${page-1 }</b></font></a>
							</li>
							<li>
							<a href="<%=basePath%>/frontDoctors!list?page=${page}"><font color = "#2259D7"><b>${page }</b></font></a>
							</li>
							<li>
							<a href="<%=basePath%>/frontDoctors!list?page=${page+1}"><font color = "#2259D7"><b>${page+1 }</b></font></a>
							</li>
							<li>
							<a href="<%=basePath%>/frontDoctors!list?page=${totalPage}"><font color = "#2259D7"><b>...${totalPage }</b></font></a>
							</li>
							<li>
							<a href="<%=basePath%>/frontDoctors!list?page=${page+1}"><font color = "#2259D7"><b>下一页</b></font></a>
							</li>
						</s:if>
						<s:else>
							<s:if test="totalPage-page==0">
								<li><a
									href="<%=basePath%>/frontDoctors!list?page=${page-1}"><font color = "#2259D7"><b>上一页</b></font></a>
									</li>
								<li><a href="<%=basePath%>/frontDoctors!list?page=1"><font color = "#2259D7"><b>1...</b></font></a>
								</li>
								<li><a
									href="<%=basePath%>/frontDoctors!list?page=${totalPage-3}"><font color = "#2259D7"><b>${totalPage-3 }</b></font></a>
								</li>
								<li><a
									href="<%=basePath%>/frontDoctors!list?page=${totalPage-2}"><font color = "#2259D7"><b>${totalPage-2 }</b></font></a>
								</li>
								<li><a
									href="<%=basePath%>/frontDoctors!list?page=${totalPage-1}"><font color = "#2259D7"><b>${totalPage-1 }</b></font></a>
								</li>
								<li><a
									href="<%=basePath%>/frontDoctors!list?page=${totalPage}"><font color = "#2259D7"><b>${totalPage }</b></font></a>
								</li>
							</s:if>
							<s:else>
								<li><a
									href="<%=basePath%>/frontDoctors!list?page=${page-1}"><font color = "#2259D7"><b>上一页</b></font></a>
									</li>
								<li><a href="<%=basePath%>/frontDoctors!list?page=1"><font color = "#2259D7"><b>1...</b></font></a>
								</li>
								<li><a
									href="<%=basePath%>/frontDoctors!list?page=${totalPage-3}"><font color = "#2259D7"><b>${totalPage-3 }</b></font></a>
								</li>
								<li><a
									href="<%=basePath%>/frontDoctors!list?page=${totalPage-2}"><font color = "#2259D7"><b>${totalPage-2 }</b></font></a>
								</li>
								<li><a
									href="<%=basePath%>/frontDoctors!list?page=${totalPage-1}"><font color = "#2259D7"><b>${totalPage-1 }</b></font></a>
								</li>
								<li><a
									href="<%=basePath%>/frontDoctors!list?page=${totalPage}"><font color = "#2259D7"><b>${totalPage }</b></font></a>
								</li>
								<li><a
									href="<%=basePath%>/frontDoctors!list?page=${page+1}"><font color = "#2259D7"><b>下一页</b></font></a>
									</li>
							</s:else>
						</s:else>
					</s:else>
				</s:else>
			</s:else>
		</ul>
	</div></div>
</body>
</html>