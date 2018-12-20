<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<html>
  <head>
    <html:base />
    
    <title>用户详细信息</title>

<link rel="stylesheet" type="text/css" href="skin/css/base.css">	 
  </head>
  
  <body>
     <!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
<tr>
 <td height="26" background="skin/images/newlinebg3.gif">
  <table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td align="center" width=""> 
  <span class="c">用户详细信息</span>
 </td>
 <td align="right" width="80"><a href="javascript:window.history.back();" class="coolbg"><img src="images/back.gif">返回</a>&nbsp;</td>

 </tr>
</table>
</td>
</tr>
</table>
  
<!--  内容列表   -->

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="10" background="skin/images/tbg.gif">&nbsp; &nbsp;</td>
</tr>
<tr align="" bgcolor="#FAFAF1" height="22">
	<td align="left" width="20%">用户名：</td>
	<td>${user.uname }</td> 
</tr>

<tr align="" bgcolor="#FAFAF1" height="22">
	<td width="">真实姓名：</td>
	<td width="">${user.truename }</td> 
</tr>
<tr align="" bgcolor="#FAFAF1" height="22">
	<td width="">性别：</td>
	<td width="">
	  <c:if test="${user.sex==0 }">
	   保密
	  </c:if>
	  <c:if test="${user.sex==1 }">
	   男
	  </c:if>
	  <c:if test="${user.sex==2 }">
	   女
	  </c:if>
	</td> 
</tr>
<tr align="" bgcolor="#FAFAF1" height="22">
	<td>联系电话：</td>
	<td width="">${user.phone }</td>
</tr>
<tr align="" bgcolor="#FAFAF1" height="22">
	<td width="">电子邮箱：</td>
	<td width="">${user.email }</td> 
</tr>
<tr align="" bgcolor="#FAFAF1" height="22">
	<td width="">地址：</td>
	<td width="">${user.address }</td> 
</tr>
<tr align="" bgcolor="#FAFAF1">
	<td width="" valign="top">头像：</td>
	<td width="">${users.image }<br>
	<c:if test="${users.image!=''}">
	  <IMG alt="" src="uploadIMG/${users.image }" width=120 height=120>
	</c:if>
	</td> 
</tr>
<tr align="" bgcolor="#FAFAF1" >
	<td width="" valign="top">备注信息：</td>
	<td width=""><textarea rows="5" cols="50" readonly="readonly">${user.remark }</textarea></td> 
</tr>
<tr bgcolor="#FAFAF1">
<td height="28" colspan="10">
	&nbsp;
	 
</td>
</tr>

</table>

  </body>
</html>
