<%@ page import="com.rent.common.Constants" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>选房单</title>
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
#roomInfo{
     font-size: 12px;
     display:none;
}
-->
</style>
<SCRIPT language=javascript src="<%=path%>/files/Zly.js"></SCRIPT>

<SCRIPT language=javascript src="<%=path%>/files/ajax.js"></SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/files/Validator.js"></SCRIPT>

<SCRIPT language=javascript src="<%=path%>/files/HouseAdd.js"></SCRIPT>

<SCRIPT language=javascript src="<%=path%>/files/fajax.js"></SCRIPT>

<SCRIPT language=javascript src="<%=path%>/files/comm.js"></SCRIPT>

  <%--<script type='text/javascript' src='dwr/interface/leaseRoom.js'></script>--%>
  
<BODY>

<div style="z-index: 1" id="alldiv">
<DIV id="header">
<DIV style="HEIGHT: 40px">
<DIV style="FLOAT: left; WIDTH: 300px">
<H1 title=eeju><A href="<%=path%>/index.jsp"><IMG alt=eeju 
src="<%=path%>/images/logo-esf.png"></A></H1></DIV>
<DIV style="PADDING-RIGHT: 10px; FLOAT: right; TEXT-ALIGN: right">您好,<b>${users.uname }</b> [<A 
href="javascript:logout();">退出</A>]  <SPAN>|</SPAN> <A class=home
style="MARGIN-TOP: 3px" href="<%=path%>/index.jsp">返回首页</A>
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
  <LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/index.jsp">租房首页</A> </LI>
  <LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/index.jsp">出 租</A></LI>
  <LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/qzindex.jsp">求 租</A></LI>

  <LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/usercenter.jsp">个人中心</A> </LI>
</UL>
</DIV>
<div align="left">&nbsp;&nbsp;
<A href="<%=path%>/index.jsp">首页</A> &gt;
 <A href="<%=path%>/usercenter.jsp">用户中心</a> &gt;&gt;
 <font color="#0000FF">选房单</font> 

</div>
</DIV> 


<SCRIPT src="<%=path%>/files/jquery-1.3.min.js" type=text/javascript></SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/files/ymPrompt.js"></SCRIPT>
<LINK id="skin" href="<%=path%>/files/ymPrompt.css" type=text/css
rel=stylesheet>
<SCRIPT>
//全选
function checkall( o ){
  $('input:[name="checkkey"]').attr('checked',$(o).attr('checked'));
  $('input:[name="check_all"]').attr('checked',$(o).attr('checked'));
}
</SCRIPT>

<DIV class=content>
 
<DIV id="left" align="left" style="border-style:solid;border-width:1px; border-color:#CCCCCC">
<H2><STRONG title=用户中心></STRONG>
<DIV class=adorn1></DIV>
<DIV class=adorn2></DIV></H2>
<DL>
  <DT>我的账户 </DT>
  <DD><A class=normal href="<%=path%>/usercenter.jsp"><SPAN
  class=ico16>个人信息</SPAN></A> </DD>
  <DD><A class=normal href="<%=path%>/userInfo.jsp"><SPAN 
  class=ico2>个人资料</SPAN></A> </DD>
 </DL>
<DL>
  <DT>我要找房 </DT>
  <DD><A class=active href="javascript:"><SPAN
  class=ico23>选房单</SPAN></A> </DD></DL>
<DL>
  <DT>我要发布房源 </DT>
  <DD><A class=normal href="<%=path%>/usercz.jsp"><SPAN 
  class=pub>发布出租</SPAN></A> </DD>
  <DD><A class=normal href="<%=path%>/userqz.jsp"><SPAN 
  class=pub>发布求租</SPAN></A> </DD>
  </DL>
<DL>
  <DT>房源管理 </DT>
  <DD><A class=normal href="<%=path%>/room.jsp"><SPAN 
  class=ico1>个人房源管理</SPAN></A><br><br> </DD>
  </DL>
<DIV class=adorn_bottom></DIV></DIV>
<SCRIPT type=text/javascript src="<%=path%>/files/jquery-1.3.min.js"></SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/files/ymPrompt.js"></SCRIPT>
<LINK id=skin rel=stylesheet type=text/css 
href="<%=path%>/files/ymPrompt.css"><LINK rel=stylesheet type=text/css 
href="<%=path%>/files/style.css"><LINK rel=stylesheet type=text/css 
href="<%=path%>/files/user.css">
<SCRIPT>
//全选
function checkall( o ){
  $('input:[name="checkkey"]').attr('checked',$(o).attr('checked'));
  $('input:[name="check_all"]').attr('checked',$(o).attr('checked'));
}
</SCRIPT>

<DIV id=right5>
<DIV class=right_con>
<UL class=tab><LI class=active>选房单信息
  </LI></UL>
<DIV class=wrap>
<DIV style="FONT: 0px Arial; HEIGHT: 6px" class=clear></DIV>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
  <TBODY>
  <TR>
    <TH width=41 scope=col><LABEL><INPUT onclick=checkall(this) type=checkbox 
      name=check_all> </LABEL></TH>
    <TH class=right_edit colSpan=2 scope=col align=left>&nbsp;&nbsp;<A 
      class=delete href="javascript:delprompt()"></A></TH>
    <TH width=164 scope=col>&nbsp;</TH>
    <TH colSpan=2 scope=col>&nbsp;</TH></TR>
<%--<logic:empty name="islist">--%>
   <%--<jsp:forward page="chooseRoom.do?method=showChooseroom&showPage=1"></jsp:forward>--%>
<%--</logic:empty>--%>
 <%--<logic:notEmpty name="crlist">--%>
   <%--<logic:iterate id="cr" name="crlist">--%>
       <%--<TR name="tr_12840">--%>
	    <%--<TD rowSpan=4 align=middle><LABEL><INPUT value=12840 type=checkbox --%>
	      <%--name=checkkey> </LABEL></TD>--%>
	    <%--<TD rowSpan=4 width=93 align=middle>--%>
	    <%--<A href="<%=path%>/leaseRoom.do?method=getleaseRoom&id=${cr.leaseRoom.id }" target=_blank>--%>
	    	<%----%>
	        <%--<c:if test="${cr.leaseRoom.img==''}">--%>
	    		<%--<img src="<%=path%>/images/no-pic2.gif"/>--%>
	    	<%--</c:if>--%>
	    	<%--<c:if test="${cr.leaseRoom.img!=''}">--%>
	    		<%--<img src="<%=path%>/uploadIMG/${cr.leaseRoom.img }" width="80" height="60"/>--%>
	    	<%--</c:if>--%>
	    <%--</A></TD>--%>
	    <%--<TD class=house_tile width=688>--%>
	    <%--<A href="<%=path%>/leaseRoom.do?method=getleaseRoom&id=${cr.leaseRoom.id }" target=_blank>${cr.leaseRoom.title }</A></TD>--%>
	    <%--<TD rowSpan=4>${cr.leaseRoom.acreage}平米</TD>--%>
	    <%--<TD rowSpan=4 width=173><STRONG class=orange>${cr.leaseRoom.pirce}</STRONG> 元/月 --%>
	   <%----%>
	    <%--</TD>--%>
	    <%--<TD rowSpan=4 width=72 align=middle><A class=delete --%>
	      <%--href="<%=path%>/chooseRoom.do?method=delchooseroom&id=${cr.id }">删除</A></TD></TR>--%>
	         <%----%>
	  <%--<TR name="tr_11824">--%>
	    <%--<TD>${cr.leaseRoom.address}</TD></TR>--%>
	  <%--<TR name="tr_11824">--%>
	    <%--<TD>${cr.leaseRoom.chamber}室${cr.leaseRoom.hall}厅${cr.leaseRoom.toilet}卫，--%>
	   <%--${cr.leaseRoom.time}发布--%>
	    <%--</TD>--%>
	  <%--</TR>--%>
	  <%--<TR name="tr_11824">--%>
	    <%--<TD></TD></TR>--%>
	   <%----%>
   <%--</logic:iterate>--%>
 <%--</logic:notEmpty>--%>
    
    
  <TR>
    <TD colSpan=2 align=middle><A 
    href="javascript:delallprompt()"></A></TD></TR></TBODY></TABLE>
<DIV class=wrap_bottom></DIV></DIV></DIV><!--分页-->
<DIV class=pages_box>
<DIV class=page_con>
<DIV>
共有${chooseRoomForm.allCount }条记录，当前第${chooseRoomForm.showPage }页，共${chooseRoomForm.allPage }页
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<A href="<%=path%>/chooseRoom.do?method=showChooseroom&showPage=1"><font color="#FF8000">首页</font></A>
<%--<logic:notEqual name="chooseRoomForm" property="showPage" value="1">--%>
   <%--<A href="<%=path%>/chooseRoom.do?method=showChooseroom&showPage=${chooseRoomForm.showPage-1 }"><font color="#FF8000">上一页</font></A> --%>
<%--</logic:notEqual>--%>
<%--<logic:lessThan name="chooseRoomForm" property="showPage" value="${chooseRoomForm.allPage}">--%>
   <%--<A href="<%=path%>/chooseRoom.do?method=showChooseroom&showPage=${chooseRoomForm.showPage+1 }"><font color="#FF8000">下一页</font> </A>--%>
<%--</logic:lessThan> --%>
<A href="<%=path%>/chooseRoom.do?method=showChooseroom&showPage=${chooseRoomForm.allPage }"><font color="#FF8000">尾页 </font></A>
</DIV></DIV></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=clear></DIV>
<DIV class=footer>
<DIV style="HEIGHT: 10px"><SPAN></SPAN></DIV>

<DIV style="TEXT-ALIGN: center; PADDING-TOP: 5px">Copyright 2013 WWW.HLAU.CN 
All Rights Reserved </DIV>
<DIV style="TEXT-ALIGN: center; PADDING-TOP: 5px" align=center><SPAN><A 
href="<%=path%>/http://www.miibeian.gov.cn/">黑ICP备12345678号</A></SPAN></DIV></DIV></DIV></BODY>
</html>
