<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/index.css" rel="stylesheet" type="text/css"/>
<title>无标题文档</title>
</head>

<body>
<h1 align="center">欢迎来到医院门诊挂号系统</h1>
				  <font color="#FF00FF">挂号员:${sessionScope.sessionUser.uname}欢迎您&nbsp;&nbsp;</font>
 <a href="user_updatePasswordUI.do" target="right">[修改个人密码]</a>&nbsp;&nbsp;
		  <a href="user_quit.do?username=${sessionScope.sessionUser.uname}" target="_parent">[退出系统]</a>


</body>
</html>
