<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'AddAdmin.jsp' starting page</title>
<link href="images/ico1.ico" rel="shortcut icon">

		<base target="_self">
		<link rel="stylesheet" type="text/css" href="skin/css/base.css" />
		<link rel="stylesheet" type="text/css" href="skin/css/main.css" />
	</head>
	
	 <script type='text/javascript' src='dwr/interface/admin.js'></script>
     <script type='text/javascript' src='dwr/engine.js'></script>
	
	<script type="text/javascript">
	function checkadd()
	{
		var checkadd=document.getElementById("aname").value;
	    var apwd=document.getElementById("apwd").value;
	    var apwd1=document.getElementById("apwd1").value;
		if(checkadd=="")
		{
			alert("管理员不能为空");
			return false;
		}
		
	
		if(apwd=="")
		{
			alert("密码不能为空");
			return false;
		}
		if(apwd1=="")
		{
			alert("请输入确认密码");
			return false;
		}
			
        if(apwd!=apwd1){
	      alert("两次密码输入不一致");
	      return false;
        }
       
        return true;	
}
function checkAdmin(){
   var aname=document.getElementById("aname").value;
   var submint=document.getElementById("sub");
   admin.loginAdmin(aname,function(isadmin){
      if(isadmin!=null){
          alert("该管理员已存在");
          submint.disabled=true;
      }else{
          submint.disabled=false;
      }
   });
}
</script>
	<body leftmargin="8" topmargin='8'>
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td></td>
			</tr>
			<tr>
				<td height="1" background="skin/images/frame/sp_bg.gif"
					style='padding: 0px'></td>
			</tr>
		</table>

		<table width="98%" align="center" border="0" cellpadding="4"
			cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom: 8px">
			<tr>
				<td colspan="2" background="skin/images/frame/wbg.gif"
					bgcolor="#EEF4EA" class='title'>
					<div style='float: left'>
						<img height="14" src="skin/images/frame/book1.gif" width="20">
						<span>添加管理员 </span>
					</div>
					<div style='float: right; padding-right: 10px;'></div>
				</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td height="30" colspan="2" align="center" valign="bottom">
					<table width="100%" border="0" cellspacing="1" cellpadding="1">
						<tr>
							<td width="15%" height="31" align="center" style="width: 309px"></td>
							<td width="85%" style="width: 626px">
								<div class='icoitem'>
									<form action="admin.do" method="post"
										onsubmit="return checkadd()">
										<table>
											<tr>
												<td align="right">
													管理员名：
												</td>
												<td>
													<input type="text" name="aname" id="aname" onblur="checkAdmin();">
													<input type="hidden" name="method" value="addAdmin">
												</td>
											</tr>
											<tr>
												<td align="right">
													密码：
												</td>
												<td>
													<input type="password" name="apwd" id="apwd">
												</td>
											</tr>
											<tr>
												<td align="right">
													确认密码：
												</td>
												<td>
													<input type="password" name="apwd1" id="apwd1">
												</td>
											</tr>
											<tr>
												<td></td>
												<td>
													<input type="submit" value="确定添加" id="sub">
													&nbsp;
													<input type="reset" value="重置">
												</td>
											</tr>
										</table>
									</form>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>


	</body>
</html>