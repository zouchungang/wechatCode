<%@ page import="com.rent.common.Constants" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
<head>

	<title>出租房源信息管理</title>
	<link href="<%=path%>/images/ttlo.png" rel="shortcut icon">
	<LINK href="<%=path%>/files/public.css" type=text/css rel=stylesheet>
	<LINK href="<%=path%>/files/user.css" type=text/css rel=stylesheet>
	<LINK href="<%=path%>/files/style.css" type=text/css rel=stylesheet>
	<LINK href="<%=path%>/files/page.css" type=text/css rel=stylesheet>

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
	<SCRIPT language=javascript src="<%=path%>/files/Zly.js"></SCRIPT>

	<SCRIPT language=javascript src="<%=path%>/files/ajax.js"></SCRIPT>

	<SCRIPT language=JavaScript src="<%=path%>/files/Validator.js"></SCRIPT>

	<SCRIPT language=javascript src="<%=path%>/files/HouseAdd.js"></SCRIPT>

	<SCRIPT language=javascript src="<%=path%>/files/fajax.js"></SCRIPT>

	<SCRIPT language=javascript src="<%=path%>/files/comm.js"></SCRIPT>
	<!-- DWR -->
	<%--<script type='text/javascript' src='dwr/engine.js'></script>--%>
	<%--<script type='text/javascript' src='dwr/interface/image.js'></script>--%>
	<%--<script type='text/javascript' src='dwr/interface/leaseRoom.js'></script>--%>

<BODY>

<div style="z-index: 1" id="alldiv">
	<DIV id="header">
		<DIV style="HEIGHT: 40px">
			<DIV style="FLOAT: left; WIDTH: 300px">
				<H1 title=eeju><A href="<%=path%>/index.jsp"><IMG alt=eeju
				                                                  src="<%=path%>/images/logo-esf.png"></A></H1></DIV>
			<DIV style="PADDING-RIGHT: 10px; FLOAT: right; TEXT-ALIGN: right">您好,<b>${users.uname }</b> [<A
					href="javascript:logout();">退出</A>] <SPAN>|</SPAN> <A class=home
			                                                              style="MARGIN-TOP: 3px"
			                                                              href="<%=path%>/index.jsp">返回首页</A>
				<script type="text/javascript">
					var path='<%=path%>/front';
					var basePath='<%=basePath%>/front';
					function logout() {
						if (confirm("你确定要退出吗？")) {
							window.location = path + "/bussiness/rUsersEntity/logoutfont";
						}
					}
				</script>
			</DIV>

			<div><br></div>
			<DIV class=header_BottomC1>
				<DIV class=nav_second>
					<UL>
						<LI class=nav_second1 style="WIDTH: 130px">&nbsp;</LI>
						<LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/index.jsp">租房首页</A></LI>
						<LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/index.jsp">出 租</A></LI>
						<LI class=nav_second1 style="WIDTH: 130px"><A onclick="window.location='qzindex.jsp';"
						                                              href="javascript:">求 租</A></LI>
						<LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/usercenter.jsp">个人中心</A></LI>
					</UL>
				</DIV>
				<div align="left">&nbsp;&nbsp;
					<A href="<%=path%>/index.jsp">首页</A> &gt;
					<A href="<%=path%>/usercenter.jsp">用户中心</A> &gt;&gt;
					<font color="#0000FF">出租房源管理</font>

				</div>
			</DIV>


			<SCRIPT src="<%=path%>/files/jquery-1.3.min.js" type=text/javascript></SCRIPT>

			<SCRIPT language=JavaScript src="<%=path%>/files/ymPrompt.js"></SCRIPT>
			<LINK id=skin href="<%=path%>/files/ymPrompt.css" type=text/css
			      rel=stylesheet>
			<SCRIPT>
				//全选
				function checkall(o) {
					$('input:[name="checkkey"]').attr('checked', $(o).attr('checked'));
					$('input:[name="check_all"]').attr('checked', $(o).attr('checked'));
				}
			</SCRIPT>

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
						<DD><A class=normal href="<%=path%>/userInfo.jsp"><SPAN
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
						<DD><A class=active href="javascript:"><SPAN
								class=ico1>个人房源管理</SPAN></A></DD>
						<br><br>
					</DL>
					<DIV class=adorn_bottom></DIV>
				</DIV>


				<DIV id=right5>
					<UL class="tab">
						<LI class="active">出租信息</LI>
						<LI class=normal><A
								href="<%=path%>/begRent.do?method=selBegRent&showPage=1">求租信息</A></LI>
					</UL>

					<!--
					   ----------------
					   出租信息管理开始
					   ----------------
					 -->
					<script type="text/javascript">
						function godel(id) {
							if (confirm("确定删除该房源吗？")) {
								window.location = "leaseRoom.do?method=delRoom&id=" + id;
							}
						}

						function showRoomInfo(rid) {
							document.getElementById("roomInfo").style.display = "block";
							document.getElementById("sdiv").style.filter = "alpha(opacity=10)";
							document.getElementById("sdiv").style.display = "block";
							showImg(rid);
							showRoom(rid);

						}

						function hiddRoomInfo() {
							document.getElementById("roomInfo").style.display = "none";
							document.getElementById("sdiv").style.filter = "alpha(opacity=100)";
							document.getElementById("sdiv").style.display = "none";
							document.getElementById("xiaoqu_adds").innerHTML = "";
						}

						function showImg(rid) {
							image.selImage(rid, function (imageList) {
								if (imageList.length <= 0) {
									document.getElementById("xiaoqu_adds").innerHTML = "<font color=red>暂无图片</font>";
								}
								for (var i = 0; i < imageList.length; i++) {

									var a = i + 1;
									var html = "图片" + a + "：<img src='uploadIMG/" + imageList[i].image + "' width='220' height='200'>&nbsp;&nbsp;&nbsp;";
									if (a % 2 == 0) {
										html += "<br>";
									}
									$("#xiaoqu_adds").append(html);

								}
							});
						}

						function showRoom(rid) {
							leaseRoom.getRoom(rid, function (room) {
								document.getElementById("title").innerHTML = room.title;
								document.getElementById("area").innerHTML = room.areaType.area;
								document.getElementById("address").innerHTML = room.address;
								document.getElementById("chamber").innerHTML = room.chamber;
								document.getElementById("hall").innerHTML = room.hall;
								document.getElementById("toilet").innerHTML = room.toilet;
								document.getElementById("type").innerHTML = room.houseType.type;
								document.getElementById("acreage").innerHTML = room.acreage;
								document.getElementById("price").innerHTML = room.pirce;
								if (room.esthment == null) {
									document.getElementById("esthment").innerHTML = "";
								} else {
									document.getElementById("esthment").innerHTML = room.esthment;
								}

								document.getElementById("remark").innerHTML = room.remark;
								if (room.users.info != null && room.users.info != "") {
									document.getElementById("uname").innerHTML = room.users.info.truename;
								} else {
									document.getElementById("uname").innerHTML = room.users.uname;
								}

								document.getElementById("phone").innerHTML = room.users.phone;
								document.getElementById("email").innerHTML = room.users.email;
							});
						}
					</script>
					<DIV id="czDIV" class=wrap>
						<DIV class="public_select table">
							<TABLE id=my_goods>
								<TBODY>
								<TR class="">
									<TH class=width1>
										<INPUT class=checkall onclick=checkall(this) type=checkbox name=check_all>
									</TH>
									<TH class=align1 colSpan=2><SPAN class=all><LABEL for=all>全选</LABEL></SPAN>
										<A class=delete href="javascript:delprompt()">删除</A></TH>
									<TH colSpan=5></TH>
								</TR>
								<TR class=gray ectype="table_header">
									<TH width=28 height=33></TH>
									<TH width=40 align="left">序号</TH>
									<TH width="200" inputwidth="90%" align="left">物业地址</TH>
									<TH>房型</TH>
									<TH> 房源状态</TH>
									<TH align="center">时间&nbsp;<span onclick="time(${showPage });"
									                                 style="cursor: pointer;">[<font
											color="black">升序</font>]</span>
										<span style="cursor: pointer;" onclick="timeDESC(${showPage });">[<font
												size="1px" color="black">降序</font> ]</span>
										<script type="text/javascript">
											function time(page) {
												window.location = "leaseRoom.do?method=showRoom&orderBy=time&showPage=" + page;
											}

											function timeDESC(page) {
												window.location = "leaseRoom.do?method=showRoom&showPage=" + page;
											}
										</script>
									</TH>
									<TH>操作</TH>
								</TR>

								<!-- ********************************************************** -->
								<logic:empty name="islist">
									<logic:redirect href="<%=path%>/leaseRoom.do?method=showRoom&showPage=1"/>
								</logic:empty>
								<logic:notEmpty name="rlList">
								<logic:iterate id="room" name="rlList" indexId="i">
								<TR class="line last_line" ectype="table_item" name="tr_1653141"
								    idvalue="1">
									<TD align="left" class=align2>
										<logic:notEqual value="4" name="room" property="state">
											<INPUT class="checkitem" value="${room.id }" type="checkbox"
											       name="checkkey">
										</logic:notEqual>
									</TD>
									<TD align="left"> ${i+1 } </TD>
									<TD align="left">
     <SPAN class=color2
           ectype="editobj">${room.address }</SPAN>
									</TD>
									<TD align="left"><SPAN
											class=color2>${room.chamber }室${room.hall }厅${room.toilet }卫</SPAN></TD>
									<TD align="left" class=align2>
										<logic:equal name="room" property="state" value="1">
											<FONT color="red">等待审核</FONT>
										</logic:equal>
										<logic:equal name="room" property="state" value="2">
											<FONT color="green">审核未通过</FONT>
										</logic:equal>
										<logic:equal name="room" property="state" value="3">
											<FONT color="blue">审核通过</FONT>
										</logic:equal>

									</TD>
									<TD align="center">${room.time }</TD>
									<TD align="right">

										<logic:lessThan value="3" name="room" property="state">
											<A class=edit
											   href="<%=path%>/leaseRoom.do?method=getRoom&id=${room.id }">编辑</A>
										</logic:lessThan>
										<logic:notEqual value="4" name="room" property="state">
											<A class=delete href="javascript:godel(${room.id })">删除 </A>
										</logic:notEqual>
										<A href="javascript:showRoomInfo(${room.id });">
											<img src="<%=path%>/images/sel1.gif" width="12" height="12" border="0">
											查看</A>
									</TD>
								<TR>
									</logic:iterate>
									</logic:notEmpty>
								<tr>
									<TH>
										<INPUT class=checkall onclick=checkall(this) type=checkbox name=check_all>
									</TH>
									<TH colSpan=7>
										<P class=position1><SPAN class=all><LABEL for=all2>全选</LABEL></SPAN> <A
												class=delete href="javascript:delprompt()">删除</A></P>
										<P class=position2></P></TH>
								</TR>
								</TBODY>
							</TABLE>
							<DIV class="pages_box">
								<DIV class="page_con">
									共有${allCount }条记录，当前第${showPage }页，共${allPage }页
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<A href="<%=path%>/leaseRoom.do?method=showRoom&showPage=1"><font
											color="#FF8000">首页</font></A>
									<logic:notEqual name="showPage" value="1">
										<A href="<%=path%>/leaseRoom.do?method=showRoom&showPage=${showPage-1 }"><font
												color="#FF8000">上一页</font></A>
									</logic:notEqual>
									<logic:lessThan name="showPage" value="${allPage}">
										<A href="<%=path%>/leaseRoom.do?method=showRoom&showPage=${showPage+1 }"><font
												color="#FF8000">下一页</font> </A>
									</logic:lessThan>
									<A href="<%=path%>/leaseRoom.do?method=showRoom&showPage=${allPage }"><font
											color="#FF8000">尾页 </font></A>
								</DIV>
							</DIV>
						</DIV>
						<DIV class=wrap_bottom></DIV>
					</DIV>

					<!--
					   ----------------
					   出租信息管理结束
					   ----------------
					 -->


				</DIV>
				<DIV class=clear></DIV>
				<DIV class=footer>
					<br><br><br>
					<DIV style="HEIGHT: 10px"><SPAN></SPAN></DIV>
					<DIV
							style="TEXT-ALIGN: center; BORDER-TOP: rgb(224,224,224) 1px solid; PADDING-TOP: 10px"
							id=topic></DIV>
					<DIV style="TEXT-ALIGN: center; PADDING-TOP: 5px">Copyright 2013 WWW.HLAU.CN
						All Rights Reserved
					</DIV>
					<DIV style="TEXT-ALIGN: center; PADDING-TOP: 5px" align=center><SPAN><A
							href="<%=path%>/http://www.miibeian.gov.cn/">黑ICP备12345678号</A></SPAN></DIV>
				</DIV>
			</div>
		</DIV>
	</div>
</div>
<div id="sdiv" style="z-index: 9;position: absolute;top: 0px;left:0px;
   background-color:black;width: 100%;height: 150%;display: none;"></div>


<!--查看出租房源信息开始-->
<div id="roomInfo" style="z-index: 10; position: absolute; top:50px; left: 220px;background:red;width:806 ">
	<table bgcolor="#fcfcfc" width="800" border="0" align="left" cellpadding="0" cellspacing="0" class="borders1">
		<tr>
			<td width="806" valign="top">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f0f0f0">
					<tr>
						<td align="left" width="50%">
							<font size="5" color="#FF0099">&nbsp;房源信息</font>
						</td>
						<td align="right" style="font-size:12px; font-weight:bold">
							<span onclick="hiddRoomInfo();" style="cursor: pointer;"><img src="<%=path%>/image/del.gif">[关闭]</span>
							&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</table>


				<table width="96%" border="0" style="BORDER-BOTTOM: #f3b47c 2px solid">
					<tr>
						<td width="10%" height="27" align="left" style="font-size:14px; font-weight:bold">&nbsp;&nbsp;基本资料</td>
					</tr>
				</table>
				<table width="96%" border="0" cellspacing="4" cellpadding="1">
					<tr>
						<td width="50">&nbsp;</td>
						<td align="left" style="font-size:12px; font-weight:bold">
							房源标题：<span id="title"></span>；&nbsp;所在区域：<span id="area"></span><br><br>
							地址：<span id="address"></span><br><br>
							户型：<span id="chamber"></span>室
							<span id="hall"></span>厅<span id="toilet"></span>卫；&nbsp;
							房源类别：<span id="type"></span><br><br>
							建筑面积：<span id="acreage"></span>㎡；&nbsp; 交易价格：<span id="price"></span>元/月<br><br>
							基础设施：<span id="esthment"></span><br><br>
							房源说明：<span id="remark"></span>
						</td>
					</tr>

				</table>
				<table width="96%" border="0" style="BORDER-BOTTOM: #f3b47c 2px solid">
					<tr>
						<td width="10%" height="27" align="left" style="font-size:14px; font-weight:bold">&nbsp;&nbsp;联系方式</td>
					</tr>
				</table>
				<table width="96%" border="0" cellspacing="4" cellpadding="1">
					<tr>
						<td width="50">&nbsp;</td>
						<td align="left" style="font-size:12px; font-weight:bold">
							联 系 人：<span id="uname"></span>&nbsp;<br>联系电话：<span id="phone"></span><br>
							E-mail：<span id="email"></span>
						</td>
					</tr>
				</table>
				<table width="96%" border="0" style="BORDER-BOTTOM: #f3b47c 2px solid">
					<tr>
						<td width="10%" height="27" align="left" style="font-size:14px; font-weight:bold">&nbsp;&nbsp;图片信息</td>
					</tr>
				</table>
				<table width="96%" border="0" cellspacing="4" cellpadding="1">
					<tr>
						<td width="50">&nbsp;</td>
						<td align="left" style="font-size:12px; font-weight:bold">
							<div id="xiaoqu_adds"></div>
						</td>
					</tr>
				</table>

			</td>
		</tr>
	</table>
</div>
<!--查看出租房源信息结束-->

</BODY>
</html>
