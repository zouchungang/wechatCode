<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.rent.common.Constants" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
	<TITLE>修改密码</TITLE>
	<link href="<%=path%>/images/logo-esf.png" rel="shortcut icon">
	<LINK href="<%=path%>/files/public.css" type=text/css rel=stylesheet>
	<LINK href="<%=path%>/files/user.css" type=text/css rel=stylesheet>
	<LINK href="<%=path%>/files/style.css" type=text/css rel=stylesheet>
	<LINK href="<%=path%>/files/page.css" type=text/css rel=stylesheet>

	<% String name=(String)session.getAttribute(Constants.PLATFORMEMPLOYEEID);
		if(name==null){%>
	<%response.sendRedirect(path+"/userLogin.jsp"); %>
	<%} %>


	<SCRIPT language=javascript src="<%=path%>/files/Zly.js"></SCRIPT>

	<SCRIPT language=javascript src="<%=path%>/files/ajax.js"></SCRIPT>

	<SCRIPT language=JavaScript src="<%=path%>/files/Validator.js"></SCRIPT>

	<SCRIPT language=javascript src="<%=path%>/files/HouseAdd.js"></SCRIPT>

	<SCRIPT language=javascript src="<%=path%>/files/fajax.js"></SCRIPT>

	<SCRIPT language=javascript src="<%=path%>/files/comm.js"></SCRIPT>

	<META content="MSHTML 6.00.2900.5945" name=GENERATOR>
</HEAD>
<BODY>
<DIV id="header">
	<DIV style="HEIGHT: 40px">
		<DIV style="FLOAT: left; WIDTH: 300px">
			<H1 title=eeju><A href="<%=path%>/index.jsp"><IMG alt=eeju
			                                        src="<%=path%>/images/logo-esf.png"></A></H1></DIV>
		<DIV style="PADDING-RIGHT: 10px; FLOAT: right; TEXT-ALIGN: right">您好,<b>${users.uname }</b> [<A
				href="<%=path%>/javascript:logout();">退出</A>] <SPAN>|</SPAN> <A class=home
		                                                              style="MARGIN-TOP: 3px" href="<%=path%>/index.jsp">返回首页</A>
		</DIV>

		<div><br></div>
		<DIV class=header_BottomC1>
			<DIV class=nav_second>
				<UL>
					<LI class=nav_second1 style="WIDTH: 130px">&nbsp;</LI>
					<LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/index.jsp">租房首页</A></LI>
					<LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/index.jsp">出 租</A></LI>
					<LI class=nav_second1 style="WIDTH: 130px"><A onClick="window.location='qzindex.jsp';"
					                                              href="<%=path%>/javascript:">求 租</A></LI>
					<LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/usercenter.jsp">个人中心</A></LI>
				</UL>
			</DIV>
			<div align="left">&nbsp;&nbsp;
				<A href="<%=path%>/index.jsp">首页</A> &gt;
				<A href="<%=path%>/usercenter.jsp">用户中心</A> &gt;&gt;
				<font color="#0000FF">修改个人密码</font>

			</div>
		</DIV>
	</DIV>
</DIV>
<DIV class=content>


	<DIV id="left" align="left" style="border-style:solid;border-width:1px; border-color:#CCCCCC">
		<H2><STRONG title=用户中心></STRONG>
			<DIV class=adorn1></DIV>
			<DIV class=adorn2></DIV>
		</H2>
		<DL>
			<DT>我的账户</DT>
			<DD><A class=normal href="<%=path%>/usercenter.jsp"><SPAN
					class=ico16>个人信息</SPAN></A></DD>
			<DD><A class=active href="<%=path%>/userInfo.jsp"><SPAN
					class=ico2>个人资料</SPAN></A></DD>
		</DL>
		<DL>
			<DT>我要找房</DT>

			<DD><A class=normal href="<%=path%>/chooseroom.jsp"><SPAN
					class=ico23>选房单</SPAN></A></DD>
		</DL>
		<DL>
			<DT>我要发布房源</DT>
			<DD><A class=normal href="<%=path%>/usercz.jsp"><SPAN
					class=pub>发布出租</SPAN></A></DD>

			<DD><A class=normal href="<%=path%>/userqz.jsp"><SPAN
					class=pub>发布求租</SPAN></A></DD>

		</DL>
		<DL>
			<DT>房源管理</DT>
			<DD><A class=normal href="<%=path%>/room.jsp"><SPAN
					class=ico1>个人房源管理</SPAN></A><br><br></DD>
		</DL>
		<DIV class=adorn_bottom></DIV>
	</DIV>
	<DIV id=right5>
		<UL class=tab>
			<LI class=normal><A
					href="<%=path%>/userInfo.jsp">用户详细信息</A></LI>
			<LI class=active>修改密码</LI>
		</UL>
		<DIV class=wrap>
			<DIV class=public>
				<form  method="post" id="form1">
					<DIV class=information>
						<DIV class="info individual">
							<TABLE>
								<TBODY>
								<TR>
									<TH width="100">用户名：</TH>
									<TD align="left">${users.uname}

								</TR>
								<TR>
									<TH>原密码：</TH>
									<TD align="left"><INPUT type=password id="upwd" name=upwd></TD>
								</TR>
								<TR>
									<TH>新密码：</TH>
									<TD align="left"><INPUT id=newpwd type=password name=newpwd></TD>
								</TR>
								<TR>
									<TH>确认密码：</TH>
									<TD align="left"><INPUT type=password name=confirm id="confirm"></TD>
								</TR>
								<TR>
									<TH></TH>
									<TD align="left">
										<INPUT class="btn" id="sub" style="background-color:#CC66FF" type=submit value="提 交">
									</TD>
								</TR>
								</TBODY>
							</TABLE>
						</DIV>
					</DIV>
				</form>
			</DIV>
		</DIV>
	</DIV>
	<DIV class=clear></DIV>
</DIV>
<DIV class=footer>
	<DIV style="HEIGHT: 10px"><SPAN></SPAN></DIV>
	<DIV id=topic
	     style="BORDER-TOP: rgb(224,224,224) 1px solid; PADDING-TOP: 10px; TEXT-ALIGN: center">
	</DIV>
	<DIV style="PADDING-TOP: 5px; TEXT-ALIGN: center">Copyright 2013 WWW.HLAU.CN
		All Rights Reserved
	</DIV>
	<DIV style="PADDING-TOP: 5px; TEXT-ALIGN: center" align=center><SPAN><A
			href="<%=path%>/http://www.miibeian.gov.cn/">黑ICP备12345678号</A></SPAN></DIV>
</DIV>
<script type="text/javascript" src="<%=path%>/common/h5/js/jquery.min.js?v=2.1.4"></script>
<script type="text/javascript">
	var path='<%=path%>/front';
	var basePath='<%=basePath%>/front';

	$(function(){
		$("#sub").click(submitForm);
	})

	function logout() {
		if (confirm("你确定要退出吗？")) {
			window.location = path+" / bussiness / rUsersEntity / logoutfont";
		}
	}

	function checkpwd() {

		var upwd = document.getElementById("upwd").value;
		if (upwd == "") {
			alert("请输入原密码");
			return false;
		}
		var newpwd = document.getElementById("newpwd").value;
		if (newpwd == "") {
			alert("请输入新密码");
			return false;
		}
		var confirm = document.getElementById("confirm").value;
		if (confirm == "") {
			alert("请输入确认密码");
			return false;
		}
		if (newpwd != confirm) {
			alert("两次输入密码不一致");
			return false;
		}
		return true;
	}

	function submitForm() {
		var url = path + "/bussiness/rUsersEntity/alterPwd";
		if (checkpwd()) {
			$.ajax({
				type: "POST",
				url: url,
				dataType: "json",
				data: $('#form1').serialize(),
				success: function (msg) {
					if (msg.code == "200") {
						alert(msg);
						// window.location='userLogin.jsp'
						// layer.msg(, {icon: 1});
					} else {
						alert(msg);
						// layer.msg(msg.msg, {icon: 8});
					}
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					// layer.alert(textStatus);
					alert(textStatus);
				}
			});
		}
	}
</script>
</BODY>
</HTML>
