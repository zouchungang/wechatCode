<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>

		<title>用户注册</title>
	<link href="<%=path%>/images/ttlo.png" rel="shortcut icon">

		<%--<%@ include file="/common/title.jsp" %>--%>
		<%--<link href="${staticCtx }/common/h5/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"--%>
		      <%--rel="stylesheet">--%>

		<LINK href="<%=path%>/files/eeju.css" type=text/css rel=stylesheet>

		<script type="text/javascript" src="<%=path%>/common/h5/js/jquery.min.js?v=2.1.4"></script>
		<script type="text/javascript" src="<%=path%>/common/h5/js/plugins/layer/layer.js"></script>

<script type="text/javascript">

	var path='<%=path%>/front';
	var basePath='<%=basePath%>/front';
	
	$(function () {
		//输入框的值改变时触发
		$("#uname").on("input",function(e){
			//获取input输入的值
			var uname=document.getElementById("uname").value;
			var sub=document.getElementById("sub");

			var url=path+"/bussiness/rUsersEntity/validUser";

			$.get(url,{"uname":uname},function(data){
				console.info(data);
				if(data!=null&&"1"==data){
					// alert("该用户已存在");
					$("#errMsgUName").empty();
					$("#errMsgUName").text("该用户已存在");
					sub.disabled=true;
				}else{
					$("#errMsgUName").empty();
					sub.disabled=false;
				}
			},"JSON")
		});
	});
	
 function checkReg()
 {   
		var uname=document.getElementById("uname").value;
		
		var upwd=document.getElementById("upwd").value;
		
		var qr_pwd=document.getElementById("qr_pwd").value;
		
	    var email=document.getElementById("email").value;
	    
	    var phone=document.getElementById("phone").value;
		if(uname=="")
		{
			$("#errMsgUName").empty();
			$("#errMsgUName").text("用户名不能为空");
			// alert("用户名不能为空");
			return false;
		}else {
			$("#errMsgUName").empty();
		}
		if(uname.length<3 || uname.length>16)
		{
			$("#errMsgUName").empty();
			$("#errMsgUName").text("用户名长度不正确");
			// alert("用户名长度不正确");
			return false;
		}else{
			$("#errMsgUName").empty();
		}
		if(upwd=="")
		{
			// alert("密码不能为空");
			$("#errorMsgUPwd").empty();
			$("#errorMsgUPwd").text("密码不能为空");
			return false;
		}else{
			$("#errorMsgUPwd").empty();
		}
		if(upwd.length<6 || upwd.length>16)
		{
			$("#errorMsgUPwd").empty();
			$("#errorMsgUPwd").text("密码长度不正确");
			// alert("密码长度不正确");
			return false;
		}else{
			$("#errorMsgUPwd").empty();
		}
		
		if(qr_pwd=="")
		{
			// alert("请输入确认密码");
			$("#errorMsgQrPwd").empty();
			$("#errorMsgQrPwd").text("请输入确认密码");
			return false;
		}else{
			$("#errorMsgQrPwd").empty();
		}
	    if(upwd!=qr_pwd)
		{
		
			// alert("密码输入不一致！");
			$("#errorMsgQrPwd").empty();
			$("#errorMsgQrPwd").text("密码输入不一致");
			return false;
		}else{
		    $("#errorMsgQrPwd").empty();
	    }
		
	  var patrnP=/(^(\d{3,4}-)?\d{7,8})$|(13[0-9]{9})$|(15[0-9]{9})$|(1[0-9][0-9]{8})$/;
       if(phone=="")
       {

       $("#errorMsgPhone").empty();
       $("#errorMsgPhone").text("请输入联系电话");
         // alert("请输入联系电话");
         return false;
       }else{
	       $("#errorMsgPhone").empty();
       }
       if(!patrnP.exec(phone)){
	       $("#errorMsgPhone").empty();
	       $("#errorMsgPhone").text("联系电话输入格式不正确");
         // alert("联系电话输入格式不正确");
         return false;
       }else{
	       $("#errorMsgPhone").empty();
       }
       
       var patrnE=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
       if(email!="" && !patrnE.exec(email))
       {
         alert("电子邮箱输入格式不正确");
	       $("#errorMsgEmail").empty();
	       $("#errorMsgEmail").text("电子邮箱输入格式不正确");
         return false;
       }else{
	       $("#errorMsgEmail").empty();
       }
    return true;
  
  }
</script>
</head>

	<BODY leftMargin=0 topMargin=0>
		<DIV align=center>
			<TABLE height=70 cellSpacing=0 cellPadding=0 width="100%"
				background="<%=path%>/images/bg.gif" border=0>
				<TBODY>
					<TR>
						<TD height=70>
							<TABLE height="100%" cellSpacing=0 cellPadding=0 width=750
								align=center border=0>
								<TBODY>
									<TR>
										<TD align=right width=200 rowSpan=2>
											&nbsp;
										</TD>
										<TD align=right height=30>
											<IMG height=12 src="<%=path%>/images/dot_circle.gif" width=12
												align=absMiddle>
											<A href="index.jsp" target=_blank><FONT color=#00ae57>首页</FONT>
											</A>&nbsp;&nbsp;
									<TR>
										<TD class=shadow1 align=middle>
											&nbsp;
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
				<TBODY>
					<TR>
						<TD bgColor=#000000 height=1></TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE cellSpacing=0 cellPadding=0 width=777 bgColor=#ffffff border=0>
				<TBODY>
					<TR>
						<TD height=50></TD>
					</TR>
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
                  src="<%=path%>/images/tab_01.gif" width=10></TD>
                <TD ><IMG style="border:0;" height=8
                  src="<%=path%>/images/tab_02.gif" width=80></TD>
                <TD width=17><IMG height=8 src="<%=path%>/images/tab_03.gif"
                  width=17></TD></TR>
              <TR>
                <TD background="<%=path%>/images/tab_04.gif" height=19>&nbsp;</TD>
                <TD align=middle bgColor=#f4f4f4>
                <DIV align=center><FONT color=#666666><A 
                  href="userLogin.jsp">用户登录</A></FONT></DIV>
                </TD>
                <TD width=17 
              background="<%=path%>/images/tab_06.gif">&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=100>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center 
            border=0>
              <TBODY>
              <TR>
                <TD width=10 height=8><IMG height=8 
                  src="<%=path%>/images/tab_01.gif" width=10></TD>
                <TD width=80 background=><IMG height=8
                  src="<%=path%>/images/tab_02.gif" width=80></TD>
                <TD width=12><IMG height=8 src="<%=path%>/images/tab_03.gif"
                  width=17></TD></TR>
              <TR>
                <TD background="<%=path%>/images/tab_04.gif" height=17>&nbsp;</TD>
                <TD align=middle bgColor=#f4f4f4>
                 <DIV align=center><FONT color=#ff0000>用户注册</FONT></DIV>
                </TD>
                <TD 
            background="<%=path%>/images/tab_06.gif">&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=100>&nbsp; </TD>
          <TD width=100>&nbsp; </TD>
          <TD width=100>&nbsp;</TD>
          <TD width=100>&nbsp;</TD>
          <TD width=100>&nbsp;</TD></TR></TBODY></TABLE>
							<TABLE style="BORDER-LEFT: #bcbcbc 1px solid" cellSpacing=0
								cellPadding=0 width=700 align=center border=0>
								<TBODY>
									<TR>
										<TD width=93 background="<%=path%>/images/img_title2.gif" height=58>
											&nbsp;
										</TD>
										<TD
											style="FONT-WEIGHT: bold; FONT-SIZE: 26px; COLOR: #ff3300; LINE-HEIGHT: 100%; PADDING-TOP: 10px"
											vAlign=center align=left width=395
											background="<%=path%>/images/img_title2.gif">
											用户免费注册
										</TD>
										<TD style="BORDER-RIGHT: #bcbcbc 1px solid" align=right
											width=211 background="<%=path%>/images/img_title2.gif">
											&nbsp;
										</TD>
									</TR>
									<TR>
										<TD colSpan=3>
											<TABLE
												style="BORDER-RIGHT: #bcbcbc 1px solid; BORDER-TOP: #bcbcbc 1px; BORDER-BOTTOM: #bcbcbc 1px solid"
												height=280 cellSpacing=0 cellPadding=0 width="100%"
												align=center bgColor=#f4fff8 border=0>
												<TBODY>
													<TR>
														<TD vAlign=center align=middle>
															<TABLE align=center>
																<TBODY>
																	<TR>
																		<TD></TD>
																	</TR>
																</TBODY>
															</TABLE>

															<FORM name=form1 id="form1" method="post">


																<TABLE cellSpacing=4 cellPadding=0 width=649 border=0>
																	<TBODY>
																		<TR>
																			<TD style="PADDING-LEFT: 25px; FONT-SIZE: 14px"
																				align=left height=31>
																				用户注册(注: 打
																				<FONT color=#ff0000>*</FONT> 必须填写)
																			</TD>
																		</TR>
																		<TR>
																			<TD class=z02 align=middle>
																				<TABLE cellSpacing=3 cellPadding=0 width=599
																					border=0>
																					<TBODY>
																						<TR vAlign=center align=left>
																							<TD width=100 height=30>
																								&nbsp;用 户 名：
																								
																							</TD>
																							<TD>
																							<DIV class=errMsgDiv id=ErrMsg1>
																								<INPUT class=txtinput1 maxLength=16 size=26
																									name=uname id="uname">
																								<FONT class=font_deep>*</FONT>
																								<FONT color=#999999>(3-16位,
																										请不要用空格、全角字母和特殊字符)</FONT>
																							</DIV>
																								<div id="errMsgUName" style="color:red;"></div>
																							</TD>
																						</TR>
																						<TR vAlign=center align=left>
																							<TD width=100 height=30>
																								&nbsp;密 码：
																								
																							</TD>
																							<TD>
																								<DIV>
																								<INPUT class=txtinput1 type=password
																									maxLength=16 size=28 name=upwd id="upwd">
																								<FONT class=font_deep>*</FONT>
																									<FONT color=#999999>(6-16位的数字、字母)</FONT>
																								</DIV>
																								<div id="errorMsgUPwd"  style="color:red;"></div>
																							</TD>
																						</TR>
																						<TR vAlign=center align=left>
																							<TD width=100 height=30>
																								&nbsp;确认密码：
																								
																							</TD>
																							<TD>
																								<DIV>
																								<INPUT class=txtinput1 type=password
																									maxLength=20 size=28 name=qr_pwd id="qr_pwd">
																								<FONT class=font_deep>*</FONT>
																									<FONT color=#999999>(重复输入以上密码)</FONT>
																								</DIV>
																								<div id="errorMsgQrPwd"  style="color:red;"></div>
																							</TD>
																						</TR>
																						<TR vAlign=center align=left>
																							<TD width=100 height=30>
																								&nbsp;电 话：
																							</TD>
																							<TD>
																								<div>
																								<INPUT class=txtinput1 maxLength=15 size=26
																									name=phone id="phone">
																									<FONT class=font_deep>*</FONT>
																									<FONT color=#999999>(移动手机或固定电话)</FONT></div>
																								<div id="errorMsgPhone"  style="color:red;"></div>
																							</TD>
																						</TR>
																						<TR>
																							<TD height=30 width=100>
																								&nbsp;Ｅ－mail：
																							</TD>
																							<TD >
																								<div>
																							<INPUT class=txtinput1 maxLength=50 size=26
																									name=email id="email">
																								&nbsp;</div>
																								<div id="errorMsgEmail" style="color:red;"></div>
																							</TD>
																						</TR>
																						<TR vAlign=center align=left>
																						<TR vAlign=top align=left>
																							<TD colSpan=2 height=35>
																								<TABLE cellSpacing=0 cellPadding=0 width=567
																									border=0>
																									<TBODY>
																										<TR>
																											<TD vAlign=top align=left width=72>
																												&nbsp;
																											</TD>
																											<TD vAlign=center align=left width=495>
																												<DIV align=center></DIV>
																											</TD>
																										</TR>
																										<TR>
																											<TD vAlign=top align=left>
																												&nbsp;
																											</TD>
																											<TD vAlign=center align=left>
																												<DIV align=center>
																													&nbsp;&nbsp;&nbsp;
																												</DIV>
																											</TD>
																										</TR>
																									</TBODY>
																								</TABLE>
																							</TD>
																						</TR>
																					</TBODY>
																				</TABLE>
																				<BR>
																				<INPUT type=button value="确认提交"
																					id="sub">
																					<input type="reset" value="取消">
																			</TD>
																		</TR>
																	</TBODY>
																</TABLE>
															</FORM>
															<TABLE height=14 width=16 align=center>
																<TBODY>
																	<TR>
																		<TD></TD>
																	</TR>
																</TBODY>
															</TABLE>
														</TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
							<P>
								&nbsp;
							</P>
						</TD>
					</TR>
					<TR>
						<TD height=30></TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
		<%--<%@ include file="/common/commonjs.jsp" %>--%>
		<script type="text/javascript" src="<%=path%>/common/h5/js/jquery.min.js?v=2.1.4"></script>
		<script>
			$(function(){
				$("#sub").click(submitForm);
			})

			function submitForm() {
				var url=path+"/bussiness/rUsersEntity";
				if (checkReg()) {
					$.ajax({
						type: "POST",
						url: url,
						dataType: "json",
						data: $('#form1').serialize(),
						success: function (msg) {
							if(msg.code=="200"){
								alert(msg.msg);
								window.location='userLogin.jsp'
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
		</script>
	</BODY>
</HTML>