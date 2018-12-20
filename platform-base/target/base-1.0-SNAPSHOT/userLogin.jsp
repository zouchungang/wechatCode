<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
      <%--<%@ include file="/common/title.jsp" %>--%>
      <%--<link href="${basePathFront }/common/h5/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"--%>
            <%--rel="stylesheet">--%>
      <%--<link href="${basePathFront}/common/webuploader/webuploader.css" rel="stylesheet" type="text/css">--%>

		<TITLE>用户登陆</TITLE>
        <link href="images/logo-esf.png" rel="shortcut icon">
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<LINK href="files/eeju.css" type=text/css rel=stylesheet>
		<SCRIPT language=JavaScript src="files/nei_fc.js"></SCRIPT>

		<SCRIPT language=JavaScript>
			var path='<%=path%>/front';
			var basePath='<%=basePath%>/front';
	function checklogin()
		{
		    var uname=document.getElementById("uname");
		    var upwd=document.getElementById("upwd");
			if (uname.value=="")
			{
				alert("请输入你的用户名!");
				uname.focus();
				return false;
			}
           if (upwd.value=="")
			{
				alert("请输入你的密码?");
				upwd.focus();
				return false;
			}
			return true;
		}

</SCRIPT>

</HEAD>
<BODY onload="javascript:document.getElementById('uname').focus()">
<DIV align=center>
<TABLE height=70 cellSpacing=0 cellPadding=0 width="100%" 
background=images/bg.gif border=0>
  <TBODY>
  <TR>
    <TD height=70>
      <TABLE height="100%" cellSpacing=0 cellPadding=0 width=750 align=center 
      border=0>
        <TBODY>
        <TR>
          <TD align=right width=200 rowSpan=2>&nbsp;</TD>
          <TD align=right height=30><IMG height=12 
            src="images/dot_circle.gif" width=12 align=absMiddle> <A 
            href="index.jsp" target=""><FONT 
            color=#00ae57>首页</FONT></A></TD></TR>
        <TR>
          <TD class=shadow1 
  align=middle>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
  
  
  
<FORM name=form1 onSubmit="return checklogin();"
			action="<%=path%>/front/bussiness/rUsersEntity/login" method=post>
  
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD bgColor=#000000 height=1></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=777 bgColor=#ffffff border=0>
  <TBODY>
  <TR>
    <TD height=50></TD></TR>
  <TR>
    <TD vAlign=top>
      <TABLE cellSpacing=0 cellPadding=0 width=700 align=center border=0 
      valign="bottom">
        <TBODY>
        <TR>
          <TD width=100 height=26>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width=10 height=8><IMG height=8 
                  src="images/tab_01.gif" width=10></TD>
                <TD background=images/tab_02.gif><IMG height=8 
                  src="images/tab_02.gif" width=80></TD>
                <TD width=17><IMG height=8 src="images/tab_03.gif" 
                  width=17></TD></TR>
              <TR>
                <TD background=images/tab_04.gif height=19>&nbsp;</TD>
                <TD align=middle bgColor=#f4f4f4><FONT 
                  color=#ff0000>用户登录</FONT></TD>
                <TD width=17 
              background=images/tab_06.gif>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=100>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center 
            border=0>
              <TBODY>
              <TR>
                <TD width=10 height=8><IMG height=8 
                  src="images/tab_01.gif" width=10></TD>
                <TD width=80 background=images/tab_02.gif><IMG height=8 
                  src="images/tab_02.gif" width=80></TD>
                <TD width=12><IMG height=8 src="images/tab_03.gif" 
                  width=17></TD></TR>
              <TR>
                <TD background=images/tab_04.gif height=17>&nbsp;</TD>
                <TD align=middle bgColor=#f4f4f4>
                  <DIV align=center><A 
                  href="regUsers.jsp">用户注册</A></DIV></TD>
                <TD 
            background=images/tab_06.gif>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=100>&nbsp; </TD>
          <TD width=100>&nbsp; </TD>
          <TD width=100>&nbsp;</TD>
          <TD width=100>&nbsp;</TD>
          <TD width=100>&nbsp;</TD></TR></TBODY></TABLE>
      <TABLE style="BORDER-LEFT: #bcbcbc 1px solid" cellSpacing=0 cellPadding=0 
      width=700 align=center border=0>
        <TBODY>
        <TR>
          <TD width=157 background=images/img_title2.gif 
          height=58>&nbsp;</TD>
          <TD align=right width=333 
background=images/img_title2.gif></TD>
          <TD style="BORDER-RIGHT: #bcbcbc 1px solid" align=right width=210 
          background=images/img_title2.gif>&nbsp;</TD></TR>
        <TR>
          <TD colSpan=3>
            <TABLE 
            style="BORDER-RIGHT: #bcbcbc 1px solid; BORDER-TOP: #bcbcbc 1px; BORDER-BOTTOM: #bcbcbc 1px solid" 
            cellSpacing=0 cellPadding=0 width="100%" align=center 
            bgColor=#f4fff8 border=0>
              <TBODY>
              <TR>
                <TD><BR>
                  <TABLE cellSpacing=0 cellPadding=4 width=500 align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD><IMG height=9 src="images/dot_dot01.gif" 
                        width=9 align=absMiddle>&nbsp;&nbsp;<FONT 
                        color=#417eb2>请输入您的用户名和密码！</FONT> </TD></TR></TBODY></TABLE>
                  <TABLE cellSpacing=0 cellPadding=4 width=500 align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD colSpan=2 height=10></TD></TR>
                    <TR>
                      <TD align=right width="40%"><FONT 
                        color=#333333>用户名：</FONT></TD>
                      <TD align=left><INPUT class=txtinput1 tabIndex=1 size=16 id="uname"
                        name="uname">&nbsp;&nbsp;<A 
                        href="regUsers.jsp">立即注册</A></TD></TR>
                    <TR>
                      <TD colSpan=2 height=5></TD></TR>
                    <TR>
                      <TD align=right><FONT color=#333333>密　码：</FONT></TD>
                      <TD align=left><INPUT class=txtinput1 tabIndex=2 
                        type=password size=16 name="upwd" id="upwd">&nbsp;&nbsp;
                      </TD></TR>
                    <TR>
                      <TD colSpan=2 height=5></TD></TR>
                    <TR>
                      <TD colSpan=2 height=5></TD></TR>
                    <TR>
                      <TD colSpan=2></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD>
                  <P>&nbsp;</P>
                  <P align=center><INPUT type=image width=103 
                  src="images/btn_login.gif" border=0 name=imageField> 　 
                  <A onClick="return false;" href="#"><IMG 
                  onclick="form1.reset();return false;" height=26 
                  src="images/btn_reset.gif" width=103 border=0></A> </P>
                  <P>&nbsp;</P></TD></TR></TBODY></TABLE></TD></TR></TBODY>
                  </TABLE>
      <P>&nbsp;</P></TD></TR>
  <TR>
    <TD height=30></TD></TR></TBODY></TABLE></FORM> </DIV></BODY></HTML>

