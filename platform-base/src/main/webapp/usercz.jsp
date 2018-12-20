<%@ page import="com.rent.common.Constants" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

	<title>发布出租</title>
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
	<%--<script type='text/javascript' src='dwr/interface/leaseRoom.js'></script>--%>


	<script type="text/javascript">
		var path='<%=path%>/front';
		var basePath='<%=basePath%>/front';
		function logout() {
			if (confirm("你确定要退出吗？")) {
				window.location = path+"/bussiness/rUsersEntity/logoutfont";
			}
		}

		function checkAddRoom() {
			var areaId = document.getElementsByName("areaId")[0].value;
			var htypeId = document.getElementsByName("htypeId")[0].value;

			var address = document.getElementById("address").value;
			var title = document.getElementById("title").value;


			var chamber = document.getElementById("chamber").value;
			var hall = document.getElementById("hall").value;
			var toilet = document.getElementById("toilet").value;

			var acreage = document.getElementById("acreage").value;
			var pirce = document.getElementById("pirce").value;
			var a_p = /^\d+(\.\d+)?$/;

			var email = document.getElementById("email").value;

			var phone = document.getElementById("telePhone").value;

			if (areaId == 0) {
				alert("请选择房源所在区域");
				return false;
			}
			if (address == "") {
				alert("请输入房源地址");
				return false;
			}
			if (title == "") {
				alert("请输入房源标题");
				return false;
			}
			if (title.length < 5) {
				alert("房源标题长度不能小于5");
				return false;
			}

			if (chamber == 0 && hall == 0 && toilet == 0) {
				alert("请选择房源的户型");
				return false;
			}
			if (htypeId == 0) {
				alert("请选择房源类别");
				return false;
			}

			if (acreage == "") {
				alert("请输入房源建筑面积");
				return false;
			}
			if (!a_p.exec(acreage)) {
				alert("建筑面积输入不正确");
				return false;
			}

			if (pirce == "") {
				alert("请输入房源交易价格");
				return false;
			}
			if (!a_p.exec(pirce)) {
				alert("交易价格输入不正确");
				return false;
			}


			var patrnP = /(^(\d{3,4}-)?\d{7,8})$|(13[0-9]{9})$|(15[0-9]{9})$/;
			if (phone == "") {
				alert("联系电话不能为空");
				return false;
			}
			if (!patrnP.exec(phone)) {
				alert("联系电话输入格式不正确");
				return false;
			}

			var patrnE = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
			if (email != "" && !patrnE.exec(email)) {
				alert("电子邮箱输入格式不正确");
				return false;
			}

			return true;
		}
	</script>


<BODY>

<div style="z-index: 1" id="alldiv">
	<DIV id="header">
		<DIV style="HEIGHT: 40px">
			<DIV style="FLOAT: left; WIDTH: 300px">
				<H1 title=eeju><A href="<%=path%>/index"><IMG alt=eeju
				                                              src="<%=path%>/images/logo-esf.png"></A></H1></DIV>
			<DIV style="PADDING-RIGHT: 10px; FLOAT: right; TEXT-ALIGN: right">您好,<b>${users.uname }</b> [<A
					href="javascript:logout();">退出</A>] <SPAN>|</SPAN> <A class=home
			                                                                        style="MARGIN-TOP: 3px"
			                                                                        href="<%=path%>/index.jsp">返回首页</A>

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
					<font color="#0000FF">发布出租房源信息</font>

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
						<DD><A class=active href="javascript:"><SPAN
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

				<div id=right1>

					<form method="post" enctype="multipart/form-data" >
						<input type="hidden" name="method" value="addLease">
						<table width="806" border="0" align="left" cellpadding="0" cellspacing="0" class="borders1">
							<tr>
								<td width="806" align="center" valign="top">
									<div class="choose_wt">
										<center><font size="5" color="#FF0099">出租信息登记</font></center>
									</div>
									<div style="height:9px"></div>
									<table width="96%" border="0" cellspacing="0" cellpadding="0"
									       style="BORDER-BOTTOM: #f3b47c 2px solid">
										<tr>
											<td width="10%" height="27" align=center
											    style="font-size:14px; font-weight:bold">基本资料
											</td>
											<td width="90%" align=left style="color:333333">(带<font
													class="font2">*</font>必须填写，其它选项尽量填写)
											</td>
										</tr>
									</table>
									<div style="height:9px"></div>
									<table width="96%" border="0" cellspacing="4" cellpadding="1">
										<tr>
											<td align="right" class="font1"><font class="font2">*</font>所在区域</td>
											<td align="left">


												<logic:empty name="alist">
													<logic:redirect
															href="<%=path%>/leaseRoom.do?method=selArea"></logic:redirect>
												</logic:empty>
												<html:select property="areaId">
													<html:option value="0">请选择</html:option>
													<html:optionsCollection name="alist" value="gid" label="area"/>
												</html:select>
											</td>
										</tr>
										<tr>
											<td align="right" class="font1"><font class="font2">*</font> 地址</td>
											<td align="left"><input name="address" id="address" type="text" size="57"
											                        maxlength="50" class="txtinput1"></td>
										</tr>
										<tr>
											<td align="right" class="font1"><font class="font2">*</font> 房源标题</td>
											<td align="left"><input name="title" id="title" type="text" size="48"
											                        maxlength="20" class="txtinput1">　
												<font class="font3">(5-20字)</font></td>
										</tr>
										<tr>
											<td align="right" class="font1"><font class="font2">*</font> 户型</td>
											<td align="left"><select name="chamber" id="chamber"
											                         style="FONT-SIZE: 12px; WIDTH: 40px">
												<option value="0" selected>0</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
											</select>
												室
												<select name="hall" id="hall" style="FONT-SIZE: 12px; WIDTH: 40px">
													<option value="0" selected>0</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
												</select>
												厅
												<select name="toilet" id="toilet" style="FONT-SIZE: 12px; WIDTH: 40px">
													<option value="0" selected>0</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
												</select>
												卫
											</td>
										</tr>
										<tr>
											<td align="right" class="font1"><font class="font2">*</font>房源类别</td>
											<td align="left">
												<select class="form-control chosen-container chosen-container-single"
												        name="bDictByHid.dictType" id="searchHouseSource">
												</select>
												<%--<html:select property="htypeId">--%>
													<%--<html:option value="0">请选择</html:option>--%>
													<%--<html:optionsCollection name="hlist" value="id" label="type"/>--%>
												<%--</html:select>--%>
											</td>
										</tr>

										<tr>
											<td align="right" class="font1"><font class="font2">*</font> 建筑面积</td>
											<td align="left"><input name="acreage" id="acreage" type="text" size="10"
											                        maxlength="10" class="txtinput1">
												㎡ <font class="font3">(请用半角数字输入,如: <font color="#FF0000">138.75</font>)</font>
											</td>
										</tr>
										<tr>
											<td align="right" class="font1"><font class="font2">*</font> 交易价格</td>
											<td align="left"><input name="pirce" id="pirce" type="text" size="10"
											                        maxlength="10" class="txtinput1" require="true"
											                        datatype="Number2" msg="交易价格未填写或填写不正确">
												元/月 <font class="font3">(请用半角数字输入,如:<font
														color="#FF0000">5000</font>)</font></td>
										</tr>
										<tr>
											<td align="right" class="font1">基础设施</td>
											<td align="left">
												<input name="esthments" id="esthments" type="checkbox" value="水">
												水
												<input name="esthments" id="esthments" type="checkbox" value="电">
												电
												<input name="esthments" id="esthments" type="checkbox" value="煤气/天然气">
												煤气/天然气
												<input name="esthments" id="esthments" type="checkbox" value="有线电视">
												有线电视
												<input name="esthments" id="esthments" type="checkbox" value="电话">
												电话
												<input name="esthments" id="esthments" type="checkbox" value="宽带">
												宽带 <span onclick="selAll();"
												         style="color:#66CC33;cursor: pointer;">[全选]</span>
												<span onclick="resAll();"
												      style="color:#66CC33;cursor: pointer;">[取消]</span>
												<script type="text/javascript">
													function selAll() {
														var boxs = document.getElementsByName("esthments");
														for (var i = 0; i < boxs.length; i++) {
															boxs[i].checked = true;
														}
													}

													function resAll() {
														var boxs = document.getElementsByName("esthments");
														for (var i = 0; i < boxs.length; i++) {
															boxs[i].checked = false;
														}
													}
												</script>
											</td>
										</tr>

										<tr>
											<td align="right" valign="top" class="font1">房源说明</td>
											<td align="left">
												<textarea id="remark" name="remark" rows="15" cols="50"
												          style="width: 530px"></textarea>

											</td>
										</tr>
									</table>
									<div id="bczl">
										<table width="96%" border="0" cellspacing="0" cellpadding="0"
										       style="BBORDER-BOTTOM: #f3b47c 2px solid">
											<tr>
												<td width="10%" height="27" align=center
												    style="font-size:14px; font-weight:bold;BORDER-BOTTOM: #f3b47c 2px solid">
													上传图片
												</td>
												<td width="90%" align="left"
												    style="color:333333;BORDER-BOTTOM: #f3b47c 2px solid">
													（上传图片可以大大提高房屋出租率哦）
												</td>
											</tr>
										</table>
										<table width="96%" border="0" cellspacing="4" cellpadding="1">

										</table>

										<SCRIPT language=javascript src="<%=path%>/files/jquery-1.3.min.js"></SCRIPT>
										<link rel="stylesheet" id='skin' type="text/css"
										      href="<%=path%>/files/ymPrompt.css"/>


										<div id="pic_all">

											<div class="xiaoqu_box"><span class="pic_title">上传图片</span>
												<div id="xiaoqu_msg">(最多可上传5张图片)&nbsp;&nbsp;
												</div>
											</div>
											<div class="uploadss">
												<span id="xq_pic_num" class="clic1" style="display:none"></span>
												<table class="upload_pics">
													<tr>
														<td align="left" valign="top" id="td_xq_pics"
														    style="display:none;">
															<div id="xq_pics"></div>
														</td>
														<td valign="top" id="xq_right_pic">
															<div id="xiaoqu_rm">
																<input type="file" id="up_xiaoqu" name="file[0]">
																<div id="fdiv"></div>
															</div>
															<div style="align:center;width:100%" id="xiaoqu_add_input">
																<input type="button" value="添加上传"
																       onClick="addinput('xiaoqu','5');"/></div>

															<script>
																//添加上传条
																function addinput(name, n) {
																	if ($("input[name='" + name + "[]']:checked").length + $('#' + name + '_rm input').length >= n) {
																		alert('不能再添加上传');
																		return false;
																	}

																	var fname = "file[" + $('#' + name + '_rm input').length + "]";

																	var html = "<br><input type='file'  name='" + fname + "'><div></div>";
																	$('#' + name + '_rm').append(html);
																}
															</script>

														</td>
													</tr>
												</table>
											</div>


											<div class="uploadss">
												<span id="hx_pic_num" style="display:none" class="clic1"></span>
												<table class="upload_pics">

												</table>
											</div>
										</div>

									</div>
									<table width="96%" border="0" cellspacing="0" cellpadding="0"
									       style="BORDER-BOTTOM: #f3b47c 2px solid">
										<tr>
											<td width="10%" height="27" align=center
											    style="font-size:14px; font-weight:bold">联系方式
											</td>
											<td width="90%" align=left>　<font
													style="color:#FF0000">(提示：联系电话和手机至少填写一项)</font></td>
										</tr>
									</table>
									<table width="96%" border="0" cellspacing="4" cellpadding="1">
										<tr>
											<td width="17%" align="right" class="font1"><font class="font2">*</font> 联 系
												人
											</td>
											<td colspan="2" align="left">：
												<c:if test="${users.truename==null }">
													${users.uname}
												</c:if>
												<c:if test="${users.truename!='' }">
													${users.truename }
												</c:if>
											</td>
										</tr>
										<tr>
											<td align="right" class="font1"><font class="font2">*</font> 联系电话：</td>
											<td width="22%" align="left"><input value="${users.phone }" name="telePhone"
											                                    id="telePhone" type="text" size="20"
											                                    class="txtinput1" maxlength="11"/></td>
											<td width="61%" align=left>
												<DIV class=errMsgDiv id=ErrMsg2><font
														color="#999999">(固定电话号或手机号码）</font></DIV>
											</td>
										</tr>
										<tr>
											<td align="right" class="font1">E-mail：</td>
											<td colspan="2" align="left">
												<input name="email" id="email" value="${users.email }" type="text"
												       size="50" class="txtinput1" maxlength="80"></td>
										</tr>
									</table>
									<table width="96%" border="0" cellspacing="4" cellpadding="1">
										<tr>
											<td width="17%" align="right" class="font1">&nbsp;
											</td>
											<td width="83%" align=left>&nbsp;
												<div class=information>
													<DIV class="info individual">
														<INPUT class=btn style="background-color:#CC66FF" type=button id="submitForm"
														       value="确认发布">&nbsp;
														<INPUT class=btn style="background-color:#CC66FF" type="reset"
														       value="重      置">

													</div>
												</div>
											</td>
										</tr>
									</table>

									<br>
									<br>
									<br>
								</td>
							</tr>
							<tr>
								<td width="696" height="24" align="center" valign="middle">&nbsp;</td>
							</tr>
						</table>
					</form>

				</div>
				<div class=clear></div>
				<div class="footer">
					<div style="height:10px"><span></span></div>
					<DIV id=topic
					     style="TEXT-ALIGN: center; padding-top:10px;border-top: 1px solid rgb(224, 224, 224);"></DIV>
					<DIV style="TEXT-ALIGN: center; padding-top:5px">Copyright 2013 WWW.HLAU.CN
						All Rights Reserved
					</DIV>
					<div align="center" style="TEXT-ALIGN: center; padding-top:5px"><span><A
							href="<%=path%>/http://www.miibeian.gov.cn/">黑ICP备12345678号</A></span></div>
				</div>
</body>
<script>
	var path = '<%=path%>/front';
	var basePath = '<%=basePath%>/front';
	$(function () {
		showSelect('searchHouseSource', '', path+'/platform/baseinfo/dict/dictValueByType?type=DT0001', 'value', 'name', '');
	})

	function submitForm() {
		var userid=$("#id").val();
		var url=path+"/bussiness/rUsersinfoEntity/addUsersinfo";
		if (checkAddRoom()) {
			$.ajax({
				type: "POST",
				url: url,
				dataType: "json",
				data: $('#form1').serialize(),
				success: function (msg) {
					if(msg.code=="200"){
						alert(msg.msg);
						// window.location='userLogin.jsp'
						// layer.msg(, {icon: 1});
					}else {
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

	/**
	 * 得到下拉框
	 */
	function showSelect(selectId, selectedvalue, methods, optionValue, optionTest,
	                    defualtOption) {
		$.ajax({
			type: "GET",
			dataType: "json",
			url: encodeURI(methods),
			success: function (data) {
				if (data.length < 1) {
					$("#" + selectId).find("option").remove();
					$("#" + selectId).append("<option value=''>无可选数据</option>");
				} else {
					$("#" + selectId).find("option").remove();
					if (defualtOption != "") {
						$("#" + selectId).append("<option value=''>" + defualtOption + "</option>");
					} else {
						$("#" + selectId).append("<option value=''>请选择</option>");
					}
					$.each(data, function (i, n) {
						var opt = "";
						if (selectedvalue == n[optionValue]) {
							opt = "<option value='" + n[optionValue] + "' selected>"
								+ n[optionTest] + "</option>";
						} else {
							opt = "<option value='" + n[optionValue] + "'>"
								+ n[optionTest], +"</option>";
						}
						$("#" + selectId).append(opt);
					});
				}
			}
		});
	}
</script>
</html>
