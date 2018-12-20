<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<html>
  <head>
    
    <title>后台管理信息</title>
<link href="images/logo-esf.png" rel="shortcut icon">
   
<logic:empty name="admin">
     <script type="text/javascript">
     alert("对不起，您尚未登录！");
	 window.location="adminLogin.jsp";
	 
    </script>
</logic:empty>
	<style>
	
.body
{
  scrollbar-base-color:#C0D586;
  scrollbar-arrow-color:#FFFFFF;
  scrollbar-shadow-color:DEEFC6;
}
</style>
</head>
<frameset rows="60,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="top.jsp" name="topFrame" scrolling="no">
  <frameset cols="180,*" name="btFrame" frameborder="NO" border="0" framespacing="0">
    <frame src="menu.jsp" noresize name="menu" scrolling="yes">
    <frame src="right.jsp" noresize name="main" scrolling="yes">
  </frameset>
</frameset>
<noframes>
	<body>您的浏览器不支持框架！</body>
</noframes>
</html>
