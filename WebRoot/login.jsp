<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>管理员登录 </title>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style/alogin.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
  window.onload=function(){
	  var xmlHttp=createXMLHttpRequest();
	  var accept=document.getElementById("login");
		accept.onclick=function(){
			var username=document.getElementById("userName");
			var password=document.getElementById("userPwd");
			var office=document.getElementById("office");
			xmlHttp.open("POST","user_login.do",true);
			xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xmlHttp.send("username="+username.value+"&password="+password.value+"&office="+office.value);
			xmlHttp.onreadystatechange=function(){
				if(xmlHttp.readyState==4&&xmlHttp.status==200){
					if(xmlHttp.responseText=="success"){
						alert("恭喜，登录成功");
						if(office.value=='挂号员'){
							location.href="main.jsp";
						}else if(office.value=='医生'){
							location.href="doctormain.jsp";
						}
					}else{
						alert("登录失败,请检查用户名、密码与身份");
					}
				}
			};
		};
  };

  
  
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
  
	function resetValue(){
		document.getElementById("userName").value="";
		document.getElementById("userPwd").value="";
	}
	
	
	
</script>
<body>
<form id="form" action="login" method="post">
    <div class="Main">
        <ul>
            <li class="top"></li>
            <li class="top2"></li>
            <li class="topA"></li>
            <li class="topB"><span>
                <img src="images/login/logo.png" alt="" style="" />
            </span></li>
            <li class="topC"></li>
            <li class="topD">
                <ul class="login">
                    <li><span class="left">用户名:</span> <span style="left">
                        <input type="text" value="" name="" id="userName"/>  
                     
                    </span></li>
                    <li><span class="left">密&nbsp;&nbsp;&nbsp;码:</span> <span style="left">
                       <input type="password" value="" name="" id="userPwd"/>  
                    </span></li>
                         <li>
                         <select style="margin-left: 58px;" id="office">
                         <option selected="selected">医生</option>
                         <option id="2">挂号员</option>
                         <option>药房人员</option>
                        <option>管理员</option>
                         </select>
                    </li>
                </ul>
            </li>
            <li class="topE"></li>
            <li class="middle_A"></li>
            <li class="middle_B"></li>
            <li class="middle_C">
            <span style="margin:15px"><input type="button" value="登录" id="login"/></span>
            <span style="margin:10px"><input type="button" value="重置" onclick="resetValue()"/></span>
            </li>
            <li class="middle_D"></li>
            <li class="bottom_A"></li>
            <li class="bottom_B">
            </li>
        </ul>
    </div>
    </form>
</body>
</html>