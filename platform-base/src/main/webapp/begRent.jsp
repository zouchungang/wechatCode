<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html:html lang="true">
  <head>
     
    <title>求租房源信息管理</title>
<link href="images/logo-esf.png" rel="shortcut icon">
<LINK href="files/public.css" type=text/css rel=stylesheet>
<LINK href="files/user.css" type=text/css rel=stylesheet>
<LINK href="files/style.css" type=text/css rel=stylesheet>
<LINK href="files/page.css" type=text/css rel=stylesheet>

<logic:empty name="users">
   <logic:redirect href="userLogin.jsp"></logic:redirect>
</logic:empty>
<style type="text/css">
<!--
#roomInfo{
     font-size: 12px;
     display:none;
}
-->
</style>
<SCRIPT language=javascript src="files/Zly.js"></SCRIPT>

<SCRIPT language=javascript src="files/ajax.js"></SCRIPT>

<SCRIPT language=JavaScript src="files/Validator.js"></SCRIPT>

<SCRIPT language=javascript src="files/HouseAdd.js"></SCRIPT>

<SCRIPT language=javascript src="files/fajax.js"></SCRIPT>

<SCRIPT language=javascript src="files/comm.js"></SCRIPT>
<!-- DWR -->
  <script type='text/javascript' src='dwr/engine.js'></script>
  <script type='text/javascript' src='dwr/interface/image.js'></script>
  <script type='text/javascript' src='dwr/interface/leaseRoom.js'></script>
  
<BODY>

<div style="z-index: 1" id="alldiv">
<DIV id="header">
<DIV style="HEIGHT: 40px">
<DIV style="FLOAT: left; WIDTH: 300px">
<H1 title=eeju><A href="index.jsp"><IMG alt=eeju 
src="images/logo-esf.png"></A></H1></DIV>
<DIV style="PADDING-RIGHT: 10px; FLOAT: right; TEXT-ALIGN: right">您好,<b>${users.uname }</b> [<A 
href="javascript:logout();">退出</A>]  <SPAN>|</SPAN> <A class=home 
style="MARGIN-TOP: 3px" href="index.jsp">返回首页</A>
<script type="text/javascript">
   function logout(){
     if(confirm("你确定要退出吗？")){
        window.location="path+"/bussiness/rUsersEntity/logoutfont";";
     }
   }
</script>
</DIV>

<div><br></div>
<DIV class=header_BottomC1>
<DIV class=nav_second>
<UL>
  <LI class=nav_second1 style="WIDTH: 130px">&nbsp;</LI>
  <LI class=nav_second1 style="WIDTH: 130px"><A href="index.jsp">租房首页</A> </LI>
  <LI class=nav_second1 style="WIDTH: 130px"><A href="index.jsp">出 租</A></LI>
  <LI class=nav_second1 style="WIDTH: 130px"><A href="qzindex.jsp">求 租</A></LI>

  <LI class=nav_second1 style="WIDTH: 130px"><A href="usercenter.jsp">个人中心</A> </LI>
</UL>
</DIV>
<div align="left">&nbsp;&nbsp;
<A href="index.jsp">首页</A> &gt;
 <A href="usercenter.jsp">用户中心</A> &gt;&gt;
 <font color="#0000FF">求租房源信息管理</font> 

</div>
</DIV> 


<SCRIPT src="files/jquery-1.3.min.js" type=text/javascript></SCRIPT>

<SCRIPT language=JavaScript src="files/ymPrompt.js"></SCRIPT>
<LINK id=skin href="files/ymPrompt.css" type=text/css 
rel=stylesheet>
<SCRIPT>
//全选
function checkall( o ){
  $('input:[name="checkkey"]').attr('checked',$(o).attr('checked'));
  $('input:[name="check_all"]').attr('checked',$(o).attr('checked'));
}
</SCRIPT>

<DIV class=content>
 
<DIV id="left" align="left" style="height:412px;border-style:solid;border-width:1px; border-color:#CCCCCC">
<H2><STRONG title=用户中心></STRONG>
<DIV class=adorn1></DIV>
<DIV class=adorn2></DIV></H2>
<DL>
  <DT>我的账户 </DT>
  <DD><A class=normal href="usercenter.jsp"><SPAN
  class=ico16>个人信息</SPAN></A> </DD>
  <DD><A class=normal href="userInfo.jsp"><SPAN 
  class=ico2>个人资料</SPAN></A> </DD>
 </DL>
<DL>
  <DT>我要找房 </DT>
  <DD><A class=normal href="chooseroom.jsp"><SPAN 
  class=ico23>选房单</SPAN></A> </DD></DL>
<DL>
  <DT>我要发布房源 </DT>
  <DD><A class=normal href="usercz.jsp"><SPAN 
  class=pub>发布出租</SPAN></A> </DD>
  <DD><A class=normal href="userqz.jsp"><SPAN 
  class=pub>发布求租</SPAN></A> </DD>
  </DL>
<DL>
  <DT>房源管理 </DT>
  <DD><A class=active href="javascript:"><SPAN 
  class=ico1>个人房源管理</SPAN></A> </DD>
  </DL>
<DIV class=adorn_bottom></DIV></DIV>

<DIV id=right5>
<UL class=tab>
  <LI class=normal><A 
  href="room.jsp">出租信息</A> </LI>
  <LI class="active">求租信息</LI>
  </UL>
  
<!--  
   ----------------
   求租信息管理开始
   ----------------
 --> 
<DIV id="czDIV" class=wrap>
<DIV class="public_select table">
<TABLE id=my_goods>
  <TBODY>
  <TR class=line_bold>
    <TH class=width1><INPUT class=checkall onclick=checkall(this) 
      type=checkbox name=check_all></TH>
    <TH class=align1 colSpan=2><SPAN class=all><LABEL 
      for=all>全选</LABEL></SPAN> <A class=delete 
      href="javascript:delprompt()">删除</A> </TH>
    <TH colSpan=5></TH></TR>
  <TR class=gray ectype="table_header">
    <TH width=28 height=33></TH>
    <TH width=40 align="left">序号</TH>
    <TH  inputwidth="90%" align="left">物业地址</TH>
    <TH class=cursor_pointer title=排序 width=72 column="cate_id"><SPAN 
      ectype="order_by">房型</SPAN></TH>
    <TH class=cursor_pointer title=排序 width=86 inputwidth="55px" 
    checker="check_required" column="brand" coltype="editable"><SPAN 
      ectype="order_by">面积</SPAN></TH>
    <TH class=cursor_pointer title=排序 width=92 inputwidth="50px" 
    checker="check_pint" column="stock" coltype="editable"><SPAN 
      ectype="order_by">时间</SPAN></TH>
    <TH width=150>操作</TH></TR>
    <logic:iterate id="br" name="brlist" indexId="i">
  <TR class="line last_line" ectype="table_item" name="tr_1653141"
    idvalue="1"><TD  align="left" class=align2><INPUT class=checkitem value=1653141 
      type=checkbox name=checkkey></TD>
    <TD align="left">${i+1 }</TD>
    <TD align="left">
     <SPAN class=color2 
    ectype="editobj">${br.address }</SPAN>
     </TD>
    <TD  align="left"><SPAN class=color2>${br.chamber }室${br.hall }厅${br.toilet }卫</SPAN></TD>
    <TD align="left" class=align2><SPAN class=color2 ectype="editobj">
	<FONT color=blue>${br.minarceage }~${br.maxarceage } ㎡</FONT></SPAN></TD>
    <TD align="left" class=align2>${br.time }</TD>
    <TD>
      <DIV>
    
      <A class=edit href="begRent.do?method=userqzUp&beg=${br.id }&uid=${users.uid }">编辑</A> 
      <A class=delete href="#" onclick="delthis(${br.id })">删除 </A></DIV></TD>
 </TR>
	  </logic:iterate>
</TBODY></TABLE>
<script type="text/javascript">
	function delthis(id)
	{
		if(confirm("是否要删除"))
		{
			window.location="begRent.do?method=delBegRent&del="+id;
		}
	}
</script>
<DIV class=pages_box>
<DIV class=page_con>
共有${allCount }条记录，当前第${showPage }页，共${allPage }页
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<A href="begRent.do?method=selBegRent&showPage=1"><font color="#FF8000">首页</font></A>
<logic:notEqual name="showPage" value="1">
<A href="begRent.do?method=selBegRent&showPage=${showPage-1 }"><font color="#FF8000">上一页</font></A>
</logic:notEqual>
<logic:lessThan  name="showPage" value="${allPage}">
<A href="begRent.do?method=selBegRent&showPage=${showPage+1 }"><font color="#FF8000">下一页</font></A>	
</logic:lessThan>
<A href="begRent.do?method=selBegRent&showPage=${allPage }"><font color="#FF8000">尾页</font></A>	
</DIV></DIV></DIV>
<DIV class=wrap_bottom></DIV></DIV>

<!--
   ----------------
   求租信息管理结束
   ----------------
 -->


<DIV class=adorn_right4></DIV></DIV></DIV>
<DIV class=clear></DIV>
<DIV class=footer>
<br><br><br>
  <DIV style="HEIGHT: 10px"><SPAN></SPAN></DIV>
  <DIV 
style="TEXT-ALIGN: center; BORDER-TOP: rgb(224,224,224) 1px solid; PADDING-TOP: 10px" 
id=topic></DIV>
  <DIV style="TEXT-ALIGN: center; PADDING-TOP: 5px">Copyright 2013 WWW.HLAU.CN 
    All Rights Reserved </DIV>
  <DIV style="TEXT-ALIGN: center; PADDING-TOP: 5px" align=center><SPAN><A 
href="http://www.miibeian.gov.cn/">黑ICP备12345678号</A></SPAN></DIV>
</DIV>
</BODY>
</html:html>
