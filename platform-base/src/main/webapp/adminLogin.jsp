<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
   
    <title>管理员登录</title>
    
<link href="images/logo-esf.png" rel="shortcut icon">
	<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #016aa9;
	overflow:hidden;
}
.STYLE1 {
	color: #000000;
	font-size: 12px;
}
-->
</style></head>
<script type="text/javascript">
 function checkLogin(){

    var aname=document.getElementById("aname").value; 
    var apwd=document.getElementById("apwd").value; 
  
    if(aname==""){
      alert("登陆名不能为空");
      return false;
    }if(apwd==""){
      alert("密码不能为空");
      return false;
    }
   
    return true;

 }

</script>
<body>
<form action="admin.do" method="post" onsubmit="return checkLogin();">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="962" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="235" background="images/login_03.gif">&nbsp;</td>
      </tr>
      <tr>
        <td height="53">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="394" height="53" background="images/login_05.gif">&nbsp;</td>
            <td width="206" background="images/login_06.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="" height="25"><div align="right"><span class="STYLE1">用户</span></div></td>
                <td width="" height="25"><div align="center">
                  <input type="hidden" name="method" value="adminLogin">
                  <input type="text" name="aname" id="aname" style="width:105px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff">
                </div></td>
                <td width="" height="25">&nbsp;</td>
              </tr>
              <tr>
                <td height="25"><div align="right"><span class="STYLE1">密码</span></div></td>
                <td height="25"><div align="center">
                  <input type="password" name="apwd" id="apwd" style="width:105px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff">
                </div></td>
                <td height="25"><div align="left">
                <input type="image" src="images/dl.gif">
                </div></td>
              </tr>
               
            </table>
            
            </td>
            
            <td width="362" background="images/login_07.gif">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="213" background="images/login_08.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table></form>
</body>
</html>
	
