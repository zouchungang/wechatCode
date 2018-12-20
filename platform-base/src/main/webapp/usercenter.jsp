<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.rent.common.Constants" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

	<title>用户中心</title>
	<link href="<%=path%>/images/ttlo.png" rel="shortcut icon">
	<LINK href="<%=path%>/files/public.css" type=text/css rel=stylesheet>
	<LINK href="<%=path%>/files/user.css" type=text/css rel=stylesheet>
	<LINK href="<%=path%>/files/style.css" type=text/css rel=stylesheet>
	<LINK href="<%=path%>/files/page.css" type=text/css rel=stylesheet>

	<%--<%@ include file="/common/title.jsp" %>--%>

	<%--<logic:empty name="users">--%>
		<%--<logic:redirect href="<%=path%>/userLogin.jsp"></logic:redirect>--%>
	<%--</logic:empty>--%>
		<% String name=(String)session.getAttribute(Constants.PLATFORMEMPLOYEEID);
		if(name==null){%>
			<%response.sendRedirect(path+"/userLogin.jsp"); %>
		<%} %>
	<style type="text/css">
		<!--
		#roomInfo {
			font-size: 12px;
			display: none;
		}

		-->
	</style>
	<SCRIPT language=javascript href="<%=path%>/files/Zly.js"></SCRIPT>

	<SCRIPT language=javascript href="<%=path%>/files/ajax.js"></SCRIPT>

	<SCRIPT language=JavaScript href="<%=path%>/files/Validator.js"></SCRIPT>

	<SCRIPT language=javascript href="<%=path%>/files/HouseAdd.js"></SCRIPT>

	<SCRIPT language=javascript href="<%=path%>/files/fajax.js"></SCRIPT>

	<SCRIPT language=javascript href="<%=path%>/files/comm.js"></SCRIPT>
<BODY>

<div style="z-index: 1" id="alldiv">
	<DIV id="header">
		<DIV style="HEIGHT: 40px">
			<DIV style="FLOAT: left; WIDTH: 300px">
				<H1 title=eeju>
					<A href="<%=path%>/index.jsp"><IMG alt="eeju" src="<%=path%>/images/logo-esf.png">
					</A>
				</H1>
			</DIV>
			<DIV style="PADDING-RIGHT: 10px; FLOAT: right; TEXT-ALIGN: right">
				您好,
				<b>${users.uname }</b> [
				<A href="javascript:logout();">退出</A>]
				<SPAN>|</SPAN>
				<A class=home style="MARGIN-TOP: 3px" href="<%=path%>/index.jsp">返回首页</A>
				<script type="text/javascript">
					var path='<%=path%>/front';
					var basePath='<%=basePath%>/front';
					function logout() {
						if (confirm("你确定要退出吗？")) {
							window.location = path+"/bussiness/rUsersEntity/logoutfont";;
						}
					}
				</script>
			</DIV>

			<div>
				<br>
			</div>
			<DIV class=header_BottomC1>
				<DIV class=nav_second>
					<UL>
						<LI class=nav_second1 style="WIDTH: 130px">
							&nbsp;
						</LI>
						<LI class=nav_second1 style="WIDTH: 130px">
							<A href="<%=path%>/index.jsp">租房首页</A>
						</LI>
						<LI class=nav_second1 style="WIDTH: 130px">
							<A href="<%=path%>/index.jsp">出 租</A>
						</LI>
						<LI class=nav_second1 style="WIDTH: 130px">
							<A href="<%=path%>/qzindex.jsp">求 租</A>
						</LI>

						<LI class=nav_second1 style="WIDTH: 130px">
							<A href="<%=path%>/usercenter.jsp">个人中心</A>
						</LI>
					</UL>
				</DIV>
				<div align="left">
					&nbsp;&nbsp;
					<A href="<%=path%>/index.jsp">首页</A> &gt;
					<A href="<%=path%>/usercenter.jsp">用户中心</A> &gt;&gt;
					<font color="#0000FF">个人信息</font>

				</div>
			</DIV>


			<SCRIPT href="<%=path%>/files/jquery-1.3.min.js" type=text/javascript></SCRIPT>

			<SCRIPT language=JavaScript href="<%=path%>/files/ymPrompt.js"></SCRIPT>
			<LINK id=skin href="<%=path%>/files/ymPrompt.css" type=text/css
			      rel=stylesheet>


			<DIV class=content>

				<DIV id="left" align="left"
				     style="border-style: solid; border-width: 1px; border-color: #CCCCCC">
					<H2>
						<STRONG title=用户中心></STRONG>
						<DIV class=adorn1></DIV>
						<DIV class=adorn2></DIV>
					</H2>
					<DL>
						<DT>
							我的账户
						</DT>
						<DD>
							<A class=active href="javascript:void(0)"><SPAN class=ico16>个人信息</SPAN>
							</A>
						</DD>
						<DD>
							<A class=normal href="<%=path%>/userInfo.jsp"><SPAN class=ico2>个人资料</SPAN>
							</A>
						</DD>
					</DL>
					<DL>
						<DT>
							我要找房
						</DT>
						<DD>
							<A class=normal href="<%=path%>/chooseroom.jsp"><SPAN class=ico23>选房单</SPAN>
							</A>
						</DD>
					</DL>
					<DL>
						<DT>
							我要发布房源
						</DT>
						<DD>
							<A class=normal href="<%=path%>/usercz.jsp"><SPAN class=pub>发布出租</SPAN>
							</A>
						</DD>
						<DD>
							<A class=normal href="<%=path%>/userqz.jsp"><SPAN class=pub>发布求租</SPAN>
							</A>
						</DD>
					</DL>
					<DL>
						<DT>
							房源管理
						</DT>
						<DD>
							<A class=normal href="<%=path%>/room.jsp"><SPAN class=ico1>个人房源管理</SPAN>
							</A>
							<br>
							<br>
						</DD>
					</DL>
					<DIV class=adorn_bottom></DIV>
				</DIV>

				<DIV id=right5>
					<DIV class="wrap_line margin1">
						<DIV class=public>
							<DIV class=information_index>
								<DIV class=photo>
									<P>
										<%--<logic:notEmpty name="users" property="image">--%>
										<%--<c:if test="${users.image!='' }">--%>
										<%--<IMG alt="" href="<%=path%>/uploadIMG/${users.image }" width=120--%>
										<%--height=120 />--%>
										<%--</c:if>--%>
										<%--<c:if test="${users.image=='' }">--%>
										<%--<IMG alt="" href="<%=path%>/images/noavatar_middle.gif" width=120--%>
										<%--height=120 />--%>
										<%--</c:if>--%>
										<%--</logic:notEmpty>--%>
										<%--<logic:empty name="users" property="image">--%>
										<%--<IMG alt="" href="<%=path%>/images/noavatar_middle.gif" width=120--%>
										<%--height=120 />--%>
										<%--</logic:empty>--%>

										<% String userLogo=(String)session.getAttribute(Constants.PLATFORMEMPLOYEELOGO);
										if(userLogo!=null){%>
											<IMG alt="" src="<%=path%>/uploadIMG/${users.image }" width=120
											     height=120 />
										<%}else{ %>
											<IMG alt="" src="<%=path%>/images/noavatar_middle.gif" width=120
											     height=120 />
										<%} %>
									</P>
								</DIV>
								<DIV class=info>
									<%--<logic:empty name="isinfo">--%>
									<%--<jsp:forward page="usersInfo.do?method=roomInfo"></jsp:forward>--%>
									<%--</logic:empty>--%>
									<H3 class=margin2>
										<SPAN>欢迎您，${users.uname }</SPAN>
										<A href="<%=path%>/userInfo.jsp">编辑个人资料&gt;&gt;</A>
									</H3>
									<TABLE class=width6>
										<TBODY>
										<TR>
											<TD height=22>
												信息发布: 发布过的出租房源(
												<SPAN class=red><A href="<%=path%>/room.jsp">${lcount }
												</A>
															</SPAN>) 发布过的求租房源(
												<SPAN class=red><A
														href="<%=path%>/begRent.do?method=selBegRent&showPage=1">${bcount
														}</A>
															</SPAN>)
											</TD>
										</TR>
										</TBODY>
									</TABLE>
								</DIV>
							</DIV>
						</DIV>
						<DIV class=wrap_bottom></DIV>
					</DIV>
					<DIV class="wrap_line margin1">
						<DIV class=public_index>
							<DIV class=information_index>
								<H3 class=title>
									我浏览过的房源
								</H3>

								<%--<logic:notEmpty name="cookieRoom">--%>
									<%--<logic:iterate id="room" name="cookieRoom">--%>
										<%--<DIV class=visited>--%>
										<%--<DIV class=visited_Links>--%>
										<%--<DIV class=visited_pic>--%>
										<%--<!-- 没有图片 -->--%>
											<%--<logic:empty name="room" property="img">--%>
											<%--<A title="暂无图片"--%>
											<%--href="<%=path%>/leaseRoom.do?method=getleaseRoom&id=${room.id }"--%>
											<%--target=_blank> <img href="<%=path%>/images/no-pic2.gif"--%>
											<%--width="120" height="90"> </A>--%>
											<%--</logic:empty>--%>
										<%--<!-- 有图片 -->--%>
										<%--<logic:notEmpty name="room" property="img">--%>
										<%--<A title="${room.title }，${room.areaType.area }"--%>
										<%--href="<%=path%>/leaseRoom.do?method=getleaseRoom&id=${room.id }"--%>
										<%--target=_blank> <img href="<%=path%>/uploadIMG/${room.img }"--%>
										<%--width="120" height="90"> </A>--%>
										<%--</logic:notEmpty>--%>
										<%--</DIV>--%>
										<%--<DIV class=visited_title>--%>
										<%--<A title="${room.title }，${room.areaType.area }"--%>
										<%--href="<%=path%>/leaseRoom.do?method=getleaseRoom&id=${room.id }"--%>
										<%--target=_blank>${room.title }</A>--%>
										<%--</DIV>--%>
										<%--<DIV class=visited_add>--%>
										<%--${room.areaType.area }，${room.houseType.type }--%>
										<%--</DIV>--%>
										<%--<DIV class="visited_ red">--%>
										<%--<font color="red">${room.pirce }</font>元/月--%>
										<%--</DIV>--%>
										<%--</DIV>--%>
										<%--<DIV class=clear></DIV>--%>
										<%--</DIV>--%>
									<%--</logic:iterate>--%>
								<%--</logic:notEmpty>--%>


							</DIV>
							<DIV class=clear></DIV>
						</DIV>
						<DIV class=wrap_bottom></DIV>
					</DIV>
					<DIV class=clear></DIV>
					<DIV class=adorn_right1></DIV>
					<DIV class=adorn_right2></DIV>
					<DIV class=adorn_right3></DIV>
					<DIV class=adorn_right4></DIV>
				</DIV>

				<DIV class=clear></DIV>
				<DIV class=footer>
					<DIV style="HEIGHT: 10px">
						<SPAN></SPAN>
					</DIV>
					<DIV id=topic
					     style="BORDER-TOP: rgb(224, 224, 224) 1px solid; PADDING-TOP: 10px; TEXT-ALIGN: center"></DIV>
					<DIV style="PADDING-TOP: 5px; TEXT-ALIGN: center">Copyright 2013 WWW.HLAU.CN All Rights Reserved
					</DIV>
					<DIV style="PADDING-TOP: 5px; TEXT-ALIGN: center" align=center>
								<SPAN><A href="<%=path%>/http://www.miibeian.gov.cn/">黑ICP备12345678号</A>
								</SPAN>
					</DIV>
				</DIV>
</BODY>
</HTML>
