<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.rent.common.Constants" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD><TITLE>发布求租信息</TITLE>
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
							window.location = path+"/bussiness/rUsersEntity/logoutfont";
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
						<LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/qzindex.jsp">求 租</A></LI>

						<LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/usercenter.jsp">个人中心</A></LI>
					</UL>
				</DIV>
				<div align="left">&nbsp;&nbsp;
					<A href="<%=path%>/index.jsp">首页</A> &gt;
					<A href="<%=path%>/usercenter.jsp">用户中心</A> &gt;&gt;
					<font color="#0000FF">发布求租信息</font>

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

						<DD><A class=normal href="<%=path%>/userinfo.jsp"><SPAN

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


						<DD><A class=active href="javascript:"><SPAN

								class=pub>发布求租</SPAN></A></DD>
					</DL>
					<DL>
						<DT>房源管理</DT>
						<DD><A class=normal href="<%=path%>/room.jsp"><SPAN
								class=ico1>个人房源管理</SPAN></A> <br><br></DD>
					</DL>
					<DIV class=adorn_bottom></DIV>
				</DIV>
				<SCRIPT>
					var twocount;
					twocount = 0;
					sc = new Array();
					twocount = 0;

					function ChangeDistrict(formname, qy) {
						formname.xqy.length = 0;
						var i;
						if (eval("typeof(GROUP)") == "undefined") {
							formname.xqy.options[0] = new Option('请选择', '');
							for (i = 0; twocount > i; i++) {
								if (sc[i][1] == qy) {
									formname.xqy.options[formname.xqy.length] = new Option(sc[i][0], sc[i][0]);
								}
							}
						}
						else {
							if (GROUP['xqy'] != 0) {
								formname.xqy.options[0] = new Option(GROUP['xqy'], GROUP['xqy']);
								for (i = 0; twocount > i; i++) {
									if (sc[i][1] == qy && sc[i][0] != GROUP['xqy']) {
										formname.xqy.options[formname.xqy.length] = new Option(sc[i][0], sc[i][0]);
									}
								}
							}
							else {
								formname.xqy.options[0] = new Option('请选择', '');
								for (i = 0; twocount > i; i++) {
									if (sc[i][1] == qy) {
										formname.xqy.options[formname.xqy.length] = new Option(sc[i][0], sc[i][0]);
									}
								}
							}
						}
					}

					function ChangeDistrictEd(formname, xqy) {
						var i;
						formname.xqy.selectedIndex = 0;
						for (i = 0; formname.xqy.length > i; i++) {
							if (formname.xqy.options[i].value == xqy) {
								formname.xqy.selectedIndex = i;
							}
						}
					}

					function ischecked() {
						if (document.getElementById("aid").value == "") {
							alert("请选择区域.");
							return false;
						}

						if (document.getElementById("address").value == "") {
							alert("请输入地段.");
							return false;
						}


						if (document.getElementById("hid").value == "") {
							alert("请选择物业内型.");
							return false;
						}


						if (document.getElementById("chamber").value == "" && document.getElementById("hall").value == "" && document.getElementById("toilet").value == "") {
							alert("请选择户型.");
							return false;
						}
						if (document.getElementById("minarceage").value == "") {
							alert("面积不能为空.");
							return false;
						}
						if (document.getElementById("maxarceage").value == "") {
							alert("面积不能为空.");
							return false;
						}
						if (document.getElementById("minprice").value == "") {
							alert("价格不能为空.");
							return false;
						}
						if (document.getElementById("maxprice").value == "") {
							alert("价格不能为空.");
							return false;
						}


						var re = /^\d+(\.\d+)?$/;
						if (!re.exec(document.getElementById("minarceage").value)) {
							alert("面积只能输入数字.");
							return false;
						}
						if (!re.exec(document.getElementById("maxarceage").value)) {
							alert("面积只能输入数字.");
							return false;
						}


						if (!re.exec(document.getElementById("minprice").value)) {
							alert("价格只能输入数字.");
							return false;
						}
						if (!re.exec(document.getElementById("maxprice").value)) {
							alert("价格只能输入数字.");
							return false;
						}

					}


				</SCRIPT>

				<DIV id=right1>
					<FORM id=form2 name=form2 onSubmit="return ischecked()" action=begRent.do?method=addUserqz
					      method=post>
						<TABLE class=borders1 cellSpacing=0 cellPadding=0 width=806 border=0>
							<TBODY>
							<TR>
								<TD vAlign=top align=middle width=806>
									<TABLE cellSpacing=2 cellPadding=0 width="100%" border=0>
										<TBODY>
										<TR>
											<TD class=font4 vAlign=center align=middle
											    height=40>求租信息登记
											</TD>
										</TR>
										</TBODY>
									</TABLE>
									<BR>
									<TABLE style="BORDER-BOTTOM: #f3b47c 2px solid" cellSpacing=0
									       cellPadding=0 width="96%" border=0>
										<TBODY>
										<TR>
											<TD style="FONT-WEIGHT: bold; FONT-SIZE: 14px" align=middle
											    width="10%" height=27>基本资料
											</TD>
											<TD align=left width="90%">(带<FONT
													class=font2>*</FONT>必须填写，其它选项尽量填写)
											</TD>
										</TR>
										</TBODY>
									</TABLE>
									<TABLE cellSpacing=4 cellPadding=1 width="96%" border=0>
										<TBODY>
										<TR>
											<TD class=font1 align=right><FONT class=font2>*</FONT>要求区域</TD>


											<TD align=left>

												<%--<logic:empty name="alist">--%>
												<%--<jsp:forward page="begRent.do?method=selUserqz"></jsp:forward>--%>
												<%--</logic:empty>--%>
												<SELECT class=select1 style="WIDTH: 65px" name=aid>

													<OPTION value="" selected>请选择</OPTION>
													<%--<logic:iterate id="areas" name="alist">--%>
													<%--<OPTION  value=${areas.gid }>${areas.area }</OPTION> --%>
													<%--</logic:iterate>--%>
												</SELECT></TD>
										</TR>
										<TR>
											<TD class=font1 align=right><FONT class=font2>*</FONT> 要求地段</TD>
											<TD align=left><INPUT class=txtinput1 maxLength=50 size=57
											                      name=address></TD>
										</TR>
										<TR>
											<TD class=font1 align=right><FONT class=font2>*</FONT>类型</TD>
											<TD align=left><SELECT class=select1 name=hid>
												<OPTION value="" selected>请选择物业类型</OPTION>
												<%--<logic:iterate id="thouse" name="hlist">--%>
												<%--<OPTION value=${thouse.id }>${thouse.type }</OPTION> --%>
												<%--</logic:iterate>--%>
											</SELECT></TD>
										</TR>
										<TR>
											<TD class=font1 align=right><FONT class=font2>*</FONT> 户型</TD>
											<TD align=left><SELECT style="FONT-SIZE: 12px; WIDTH: 35px"
											                       name=chamber>
												<OPTION value="" selected>-</OPTION>
												<OPTION
														value=0>0
												</OPTION>
												<OPTION value=1>1</OPTION>
												<OPTION
														value=2>2
												</OPTION>
												<OPTION value=3>3</OPTION>
												<OPTION
														value=4>4
												</OPTION>
												<OPTION value=5>5</OPTION>
												<OPTION
														value=6>6
												</OPTION>
												<OPTION value=7>7</OPTION>
												<OPTION
														value=8>8
												</OPTION>
											</SELECT> 室 <SELECT
													style="FONT-SIZE: 12px; WIDTH: 35px" name=hall>
												<OPTION value=""
												        selected>-
												</OPTION>
												<OPTION value=0>0</OPTION>
												<OPTION
														value=1>1
												</OPTION>
												<OPTION value=2>2</OPTION>
												<OPTION
														value=3>3
												</OPTION>
												<OPTION value=4>4</OPTION>
												<OPTION
														value=5>5
												</OPTION>
												<OPTION value=6>6</OPTION>
											</SELECT> 厅 <SELECT
													style="FONT-SIZE: 12px; WIDTH: 35px" name=toilet>
												<OPTION value=""
												        selected>-
												</OPTION>
												<OPTION value=0>0</OPTION>
												<OPTION
														value=1>1
												</OPTION>
												<OPTION value=2>2</OPTION>
												<OPTION
														value=3>3
												</OPTION>
												<OPTION value=4>4</OPTION>
											</SELECT> 卫
											</TD>
										</TR>


										<TR>
											<TD class=font1 align=right>建筑面积</TD>
											<TD align=left><INPUT class=txtinput1 id=min_area maxLength=7 size=5
											                      name=minarceage> ~ <INPUT class=txtinput1 id=max_area
											                                                maxLength=7
											                                                size=5 name=maxarceage> ㎡
											</TD>
										</TR>
										<TR>
											<TD class=font1 align=right><FONT class=font2>*</FONT> 交易价格</TD>
											<TD align=left><INPUT class=txtinput1 id=min_pay maxLength=6 size=5
											                      name=minprice> ~ <INPUT class=txtinput1 id=max_pay3
											                                              maxLength=6
											                                              size=5 name=maxprice> 元/月
											</TD>
										</TR>
										<TR>
											<TD class=font1 align=right>基础设施</TD>
											<TD align=left><INPUT id=sheshi type=checkbox value=水 name=esthment>
												水 <INPUT id=sheshi type=checkbox value=电 name=esthment> 电 <INPUT
														id=sheshi type=checkbox value=煤气/天然气 name=esthment> 煤气/天然气
												<INPUT
														id=sheshi type=checkbox value=有线电视 name=esthment> 有线电视 <INPUT
														id=sheshi type=checkbox value=电话 name=esthment> 电话 <INPUT
														id=sheshi
														type=checkbox value=宽带 name=esthment> 宽带 <A
														style="COLOR: #66cc33"
														onclick="for (var i = 0; i < form2.esthment.length; i++) {&#13;&#10;&#9;&#9;&#9;&#9;&#9;&#9;&#9;form2.esthment[i].checked = true;&#13;&#10;&#9;&#9;&#9;&#9;&#9;&#9;}"
														href="javascript:">[全选]</A> <A style="COLOR: #66cc33"
												                                                onclick="for (var i = 0; i < form2.esthment.length; i++) {&#13;&#10;&#9;&#9;&#9;&#9;&#9;&#9;&#9;form2.esthment[i].checked = false;&#13;&#10;&#9;&#9;&#9;&#9;&#9;&#9;}"
												                                                href="javascript:">[取消]</A>
											</TD>
										</TR>

										<TR>
											<TD class=font1 align=right>备注</TD>
											<TD align=left>
												<textarea rows="8" cols="60" name="remark"></textarea><br>

											</TD>
										</TR>
										</TBODY>
									</TABLE>
									<TABLE
											style="FONT-WEIGHT: bold; FONT-SIZE: 14px; BORDER-BOTTOM: #f3b47c 2px solid"
											cellSpacing=0 cellPadding=0 width="96%" border=0>
										<TBODY>
										<TR>
											<TD align=middle width="10%" height=27>联系方式</TD>
											<TD align=left width="90%">&nbsp;</TD>
										</TR>
										</TBODY>
									</TABLE>
									<TABLE cellSpacing=4 cellPadding=1 width="96%" border=0>
										<TBODY>
										<TR>
											<TD class=font1 align=right width="17%"><FONT class=font2>*</FONT> 联
												系 人：
											</TD>
											<TD align=left width="83%">
												<%--<c:if test="${users.truename=='' }">--%>
													<%--${users.uname}--%>
												<%--</c:if>--%>
												<%--<c:if test="${users.truename!='' }">--%>
													<%--${users.truename }--%>
												<%--</c:if>--%>
											</TD>
										</TR>
										<TR>
											<TD class=font1 align=right><FONT class=font2>*</FONT> 联系电话/手机</TD>
											<TD align=left><INPUT class=txtinput1 maxLength=25 size=50
											                      name=phone type="text" value="${users.phone }"
											                      disabled="disabled"></TD>
										</TR>
										<TR>
											<TD class=font1 align=right>E-mail</TD>
											<TD align=left><INPUT class=txtinput1 maxLength=80 size=50
											                      name=email type="text" value="${users.email }"
											                      disabled="disabled"></TD>
										</TR>
										</TBODY>
									</TABLE>

									<BR>
									<div class=information>
										<DIV class="info individual">
											<INPUT class=btn style="background-color:#CC66FF" type=submit value="确认发布">&nbsp;
											<INPUT class=btn style="background-color:#CC66FF" type="reset"
											       value="重      置">

										</div>
									</div>
									<BR><BR></TD>
							</TR>
							<TR>
								<TD vAlign=center align=middle width=620 height=24>&nbsp;
								</TD>
							</TR>
							</TBODY>
						</TABLE>
					</FORM> <!--右侧结束--></DIV>


			</DIV>
</BODY>
</HTML>
