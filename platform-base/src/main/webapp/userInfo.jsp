<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.rent.common.Constants" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>用户个人资料</title>
		<link href="<%=path%>/images/logo-esf.png" rel="shortcut icon">
		<link href="<%=path%>/common/webuploader/webuploader.css" rel="stylesheet" type="text/css">
		<%--<logic:empty name="users">--%>
			<%--<logic:redirect href="<%=path%>/userLogin.jsp"></logic:redirect>--%>
		<%--</logic:empty>--%>
		<% String name=(String)session.getAttribute(Constants.PLATFORMEMPLOYEEID);
			if(name==null){%>
		<%response.sendRedirect(path+"/userLogin.jsp"); %>
		<%} %>
		<LINK href="<%=path%>/files/public.css" type=text/css rel=stylesheet>
		<LINK href="<%=path%>/files/user.css" type=text/css rel=stylesheet>
		<LINK href="<%=path%>/files/style.css" type=text/css rel=stylesheet>
		<LINK href="<%=path%>/files/page.css" type=text/css rel=stylesheet>

		<SCRIPT language=javascript src="<%=path%>/files/Zly.js"></SCRIPT>

		<SCRIPT language=javascript src="<%=path%>/files/ajax.js"></SCRIPT>

		<SCRIPT language=JavaScript src="<%=path%>/files/Validator.js"></SCRIPT>


		<SCRIPT language=javascript src="<%=path%>/files/HouseAdd.js"></SCRIPT>

		<SCRIPT language=javascript src="<%=path%>/files/fajax.js"></SCRIPT>

		<SCRIPT language=javascript src="<%=path%>/files/comm.js"></SCRIPT>

		<script type="text/javascript">
		function logout() {
			if (confirm("你确定要退出吗？")) {
				window.location = path+"/bussiness/rUsersEntity/logoutfont";
			}
		}
   
  function checkupdate(){
    var email=document.getElementById("email").value;
    var phone=document.getElementById("phone").value;
    var truename=document.getElementById("truename").value;
    var address=document.getElementById("address").value;
    var file=document.getElementById("file").value;
    var remark=document.getElementById("remark").value;
    
    var patrnP=/(^(\d{3,4}-)?\d{7,8})$|(13[0-9]{9})$|(15[0-9]{9})$/; 
    
    if(truename==""|| address==""){
       alert("请认真填写你的资料!");
       return false;
    }
    
    
    if(phone=="")
    {
        alert("联系电话不能为空");
        return false;
    }
    if(!patrnP.exec(phone)){
       alert("联系电话输入格式不正确");
       return false;
    }
       
    var patrnE=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
    if(email!="" && !patrnE.exec(email))
    {
       alert("电子邮箱输入格式不正确");
       return false;
    }
    if(!confirm("是否保存你的资料？")){
       return false;
    } 
    return true ;
  }
 
</script>

	</HEAD>
	<BODY>
		<DIV id="header">
			<DIV style="HEIGHT: 40px">
				<DIV style="FLOAT: left; WIDTH: 300px">
					<H1 title=eeju>
						<A href="<%=path%>/index.jsp"><IMG alt=eeju
								src="<%=path%>/images/logo-esf.png">
						</A>
					</H1>
				</DIV>
				<DIV style="PADDING-RIGHT: 10px; FLOAT: right; TEXT-ALIGN: right">
					您好,
					<b>${users.uname }</b> [
					<A href="javascript:logout();">退出</A>]
					<SPAN>|</SPAN>
					<A class=home style="MARGIN-TOP: 3px" href="<%=path%>/index.jsp">返回首页</A>

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
								<A onClick="window.location='qzindex.jsp';" href="javascript:">求
									租</A>
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
						<font color="#0000FF">个人资料</font>

					</div>
				</DIV>
			</DIV>
		</DIV>
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
						<A class=normal href="<%=path%>/usercenter.jsp"><SPAN class=ico16>个人信息</SPAN>
						</A>
					</DD>
					<DD>
						<A class=active href="<%=path%>/userInfo.jsp"><SPAN class=ico2>个人资料</SPAN>
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
				<UL class=tab>
					<LI class=active>
						用户详细信息
					</LI>
					<LI class=normal>
						<A href=update_pwd.jsp>修改密码</A>
					</LI>
				</UL>
				<DIV class=wrap>
					<DIV class=public>
						<form id="form1" enctype="multipart/form-data">
							<input type="hidden" name="id" id="id" value="${users.id }">
							<DIV class=information>
								<DIV class="info individual">
									<TABLE>
										<TBODY>
											<TR>
												<TH align="right" width="100">
													用户名：
												</TH>
												<TD align="left">
													${users.uname}
													<input type="hidden" value="${users.uname}" name="uname">
											</TR>
											<TR>
												<TH>
													电子邮箱：
												</TH>
												<TD align="left">
													<INPUT name=email id="email" value="${users.email}">
												</TD>
											</TR>
											<TR>
												<TH>
													联系电话：
												</TH>
												<TD align="left">
													<INPUT name="phone" id="phone" value="${users.phone }">
												</TD>
											</TR>
											<TR>
												<TH>
													真实姓名：
												</TH>
												<TD align="left">
													<INPUT name=truename id="truename"
														value="${users.truename }">

												</TD>
											</TR>
											<TR>
												<TH>
													性别：
												</TH>
												<TD class=label align="left">
													<INPUT type=radio value=0 name=sex id="sex">
													保密
													<INPUT type=radio CHECKED value=1 name=sex id="sex1">
													男
													<INPUT type=radio value=2 name=sex id="sex2">
													女
												</TD>
											</TR>
											<TR>
												<TH>
													地 址：
												</TH>
												<TD align="left">
													<INPUT name=address id="address" value="${users.address }"
														size="30">
												</TD>
											</TR>
											<TR>
												<TH>
													头像：
												</TH>
												<td align="left">
													<c:if test="${not empty users.image }">
														<img id="imgView" src="<%=path%>/uploadIMG/${users.image }" style="width: 120px;height: 120px;">
														<br>
													</c:if>
													<%--<INPUT id="file" type="file" name=image--%>
														<%--value="${users.image }">--%>
													<c:if test="${empty  users.image }">
														<img id="imgView" src="<%=path%>/upfile/default.jpg" style="width: 120px;height: 120px;">
													</c:if>
													<div id="picker">上传头像</div>
													<input type="hidden" id="file" name="image" class="form-control" placeholder="头像">
												</TD>
											</TR>
											<TR>
												<TH valign="top">
													备注：
												</TH>
												<TD align="left">
													<textarea rows="5" cols="50" name="remark" id="remark">${users.remark}</textarea>
												</TD>
											</TR>
											<TR>
												<TH></TH>
												<TD align="left">
													<INPUT class=btn id="sub" style="background-color: #CC66FF"
														type=button value=保存修改>
													&nbsp;
													<INPUT class=btn style="background-color: #CC66FF"
														type=submit onclick="reset();return false;"
														value="重        置">
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</DIV>
							</DIV>
						</form>
					</DIV>
					<DIV class=wrap_bottom></DIV>
				</DIV>
			</DIV>
			<DIV class=clear></DIV>
			<DIV class=footer>
				<DIV style="HEIGHT: 10px">
					<SPAN></SPAN>
				</DIV>
				<DIV id=topic
					style="BORDER-TOP: rgb(224, 224, 224) 1px solid; PADDING-TOP: 10px; TEXT-ALIGN: center">
				</DIV>
				<DIV style="PADDING-TOP: 5px; TEXT-ALIGN: center">Copyright  2013 WWW.HLAU.CN  All Rights Reserved</DIV>
				<DIV style="PADDING-TOP: 5px; TEXT-ALIGN: center" align=center>
					<SPAN><A href="<%=path%>/http://www.miibeian.gov.cn/">黑ICP备12345678号</A>
					</SPAN>
				</DIV>
			</DIV>
		</DIV>
	<script type="text/javascript" src="<%=path%>/common/h5/js/jquery.min.js?v=2.1.4"></script>
	<script type="text/javascript" src="<%=path%>/common/webuploader/webuploader.min.js"></script>
	<script>
		var path='<%=path%>/front';
		var basePath='<%=basePath%>/front';

		$(function(){
			initWebuploader();
			initData();
			$("#sub").click(submitForm);
		})

		function initData(){
			var userid=$("#id").val();
			var url=path+"/bussiness/rUsersEntity/"+userid;
			if (userid!=null) {
				$.get(url,function(data){
					console.info(data);
					$("#email").val(data.email);
					$("#phone").val(data.phone);
					$("#truename").val(data.truename);
					if (data.sex=="1"){
						$("#sex1").click();
					}else if(data.sex=="0"){
						$("#sex").click();
					}else if(data.sex=="2"){
						$("#sex2").click();
					}
					$("#address").val(data.address);
					if(data.image!=""){
						$("#image").val("<%=path%>/uploadIMG/"+data.image);
					}else{
						$("#image").val("<%=path%>/upfile/default.jpg");
					}
					$("#remark").val(data.remark);
				})
			}
		}

		function submitForm() {
			var userid=$("#id").val();
			var url=path+"/bussiness/rUsersinfoEntity/addUsersinfo";
			if (checkupdate()) {
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

		function initWebuploader() {
			uploader = WebUploader.create({
				fileNumLimit: 1,//上传数量限制
				fileSizeLimit: 1024 * 1024 * 3,//限制上传所有文件大小
				fileSingleSizeLimit: 1024 * 1024 * 3,//限制上传单个文件大小
				auto: true,
				// swf文件路径
				// swf: BASE_URL + '/js/Uploader.swf',
				// 文件接收服务端。
				server: path+"/bussiness/rUsersinfoEntity/userimg",
				// 选择文件的按钮。可选。
				// 内部根据当前运行是创建，可能是input元素，也可能是flash.
				pick: '#picker',
				// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
				resize: false,
				duplicate: true
			})
			;
			//上传每个文件之前设置额外参数
			uploader.on("uploadStart", function () {
			});
			uploader.on("startUpload", function () {
			});
			uploader.on("uploadSuccess", function (file, response) {
				$("#imgView").attr("src", path + response);
				$("#logo").val(response);
				alert("上传成功");
				uploader.destroy();
				initWebuploader();
			});
			uploader.on("uploadFinished", function () {
				//layer.msg("上传成功")
			});
			/**
			 * 验证文件格式以及文件大小
			 */
			uploader.on("error", function (type) {
				if (type == "Q_TYPE_DENIED") {
					alert("请上传JPG、PNG格式文件");
				} else if (type == "F_EXCEED_SIZE") {
					alert("文件大小不能超过3M");
				}
			});
		}

	</script>
	</BODY>
</HTML>