<%@ page language="java" pageEncoding="utf-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base />
    
    <title>添加区域</title>


<script type="text/javascript">
	function checkarea()
	{
		var checkarea=document.getElementById("area").value;
	
		if(checkarea=="")
		{
			alert("区域不能为空");
			return false;
		}
	
	}
</script>
  </head>
  
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
						<span>添加区域 </span>
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
									<html:form action="/areaType?method=addArea" method="post" onsubmit="return checkarea();">
   		<table>
											<tr>
												<td align="right">
													区域名：
												</td>
												<td>
													<input name="area" type="text">
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
									</html:form>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html:html>
