<%@ page import="com.rent.common.Constants" %>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
<HEAD><TITLE>修改求租信息</TITLE>
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

<script type="text/javascript">
   function logout(){
	   var path='<%=path%>/front';
	   var basePath='<%=basePath%>/front';
     if(confirm("你确定要退出吗？")){
        window.location=path+"/bussiness/rUsersEntity/logoutfont";
     }
   }
function checkupdate(){
    var address=document.getElementsByName("address")[0].value;
    
    var chamber=document.getElementsByName("chamber")[0].value;
    var hall=document.getElementsByName("hall")[0].value;
    var toilet=document.getElementsByName("toilet")[0].value;
    
    var minarceage=document.getElementsByName("minarceage")[0].value;
    var maxarceage=document.getElementsByName("maxarceage")[0].value;
    
    var minprice=document.getElementsByName("minprice")[0].value;
    var maxprice=document.getElementsByName("maxprice")[0].value;
    
    var a_p=/^\d+(\.\d+)?$/;
    
    if(address==""){
        alert("请输入房源地址");
        return false;
    }
    if(chamber==0 && hall==0 && toilet==0){
        alert("请选择房源的户型");
        return false;
    }
    
    if(minarceage=="" || maxarceage==""){
        alert("请输入完整的建筑面积");
        return false;
    }
    if(!a_p.exec(minarceage) || !a_p.exec(maxarceage)){
        alert("建筑面积输入不正确");
        return false;
    }
    
    if(minprice=="" || maxprice==""){
        alert("请输入完整的交易价格");
        return false;
    }
    if(!a_p.exec(minprice) || !a_p.exec(maxprice)){
        alert("交易价格输入不正确");
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
<H1 title=eeju><A href="<%=path%>/index.jsp"><IMG alt=eeju 
src="<%=path%>/images/logo-esf.png"></A></H1></DIV>
<DIV style="PADDING-RIGHT: 10px; FLOAT: right; TEXT-ALIGN: right">您好,<b>${users.uname }</b> [<A 
href="javascript:logout();">退出</A>]  <SPAN>|</SPAN> <A class=home
style="MARGIN-TOP: 3px" href="<%=path%>/index.jsp">返回首页</A>

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
<A href="<%=path%>/usercenter.jsp">用户中心</A> &gt;&gt;
 <font color="#0000FF">发布求租信息</font>

</div>
</DIV> 


<SCRIPT src="<%=path%>/files/jquery-1.3.min.js" type=text/javascript></SCRIPT>

<SCRIPT language=JavaScript src="<%=path%>/files/ymPrompt.js"></SCRIPT>
<LINK id=skin href="<%=path%>/files/ymPrompt.css" type=text/css 
rel=stylesheet>
 

<DIV class=content>
 
<DIV id="left" align="left" style="border-style:solid;border-width:1px; border-color:#CCCCCC">
<H2><STRONG title=用户中心></STRONG>
<DIV class=adorn1></DIV>
<DIV class=adorn2></DIV></H2>
<DL>
  <DT>我的账户 </DT>
  <DD><A class=normal href="<%=path%>/usercenter.jsp"><SPAN
  class=ico16>个人信息</SPAN></A> </DD>

  <DD><A class=normal href="<%=path%>/userinfo.jsp"><SPAN 

  class=ico2>个人资料</SPAN></A> </DD>
 </DL>
<DL>
  <DT>我要找房 </DT>
  <DD><A class=normal href="<%=path%>/chooseroom.jsp"><SPAN 
  class=ico23>选房单</SPAN></A> </DD></DL>
<DL>
  <DT>我要发布房源 </DT>
  <DD><A class=normal href="<%=path%>/usercz.jsp"><SPAN 
  class=pub>发布出租</SPAN></A> </DD>

  
  <DD><A class=active href="javascript:"><SPAN

  class=pub>发布求租</SPAN></A> </DD>
  </DL>
<DL>
  <DT>房源管理 </DT>
  <DD><A class=normal href="<%=path%>/room.jsp"><SPAN 
  class=ico1>个人房源管理</SPAN></A><br><br> </DD>
  </DL>
<DIV class=adorn_bottom></DIV></DIV>

<DIV id=right1>
<html:form action="begRent?method=upBegRent&uid=${users.uid}&bid=${bid }" method="post" onsubmit="return checkupdate();">
<TABLE class=borders1 cellSpacing=0 cellPadding=0 width=806 border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=middle width=806>
      <TABLE cellSpacing=2 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD class=font4 vAlign=center align=middle 
        height=40>修改求租信息</TD></TR></TBODY></TABLE><BR>
      <TABLE style="BORDER-BOTTOM: #f3b47c 2px solid" cellSpacing=0 
      cellPadding=0 width="96%" border=0>
        <TBODY>
        <tr>
      <td width="10%" height="27" align=center style="font-size:14px; font-weight:bold">基本资料</td>
      <td width="70%" align=left style="color:333333">(带<font class="font2">*</font>必须填写，其它选项尽量填写)</td>
      <td align="right"><a href="javascript:window.history.back();" title="返回"><img src="<%=path%>/images/back.gif"><font style="font-size:14px; font-weight:bold">返&nbsp;回</font> </a></td>
    </tr></TBODY></TABLE>
      <TABLE cellSpacing=4 cellPadding=1 width="96%" border=0>
        <TBODY>
        <TR>
          <TD class=font1 align=right><FONT class=font2>*</FONT>要求区域</TD>


          <TD align=left>
          <%--<html:select property="aid">--%>
          	<%--<html:optionsCollection name="alist" value="gid" label="area"/>--%>
          <%--</html:select>--%>
     
        
        		</TD></TR>
        <TR>
          <TD class=font1 align=right><FONT class=font2>*</FONT> 要求地段</TD>
          <TD align=left>
          
          <%--<html:text property="address" maxlength="50" size="57"></html:text>--%>
          
         </TD></TR>
        <TR>
          <TD class=font1 align=right><FONT class=font2>*</FONT>类型</TD>
          <TD align=left>
      		<%--<html:select property="hid">--%>
          	<%--<html:optionsCollection name="hlist" value="id" label="type"/>--%>
          <%--</html:select>--%>
         
         </TD></TR>
        <TR>
          <TD class=font1 align=right><FONT class=font2>*</FONT> 户型</TD>
          <TD align=left>
         		<%--<html:select property="chamber">--%>
         		<%--<html:option value="0">0</html:option>--%>
         		<%--<html:option value="1">1</html:option>--%>
         		<%--<html:option value="2">2</html:option>--%>
         		<%--<html:option value="3">3</html:option>--%>
         		<%--<html:option value="4">4</html:option>--%>
         		<%--<html:option value="5">5</html:option>--%>
         		<%--<html:option value="6">6</html:option>--%>
         		<%--<html:option value="7">7</html:option>--%>
         		<%--<html:option value="8">8</html:option>--%>
         		<%--</html:select>室 --%>
             	<%--<html:select property="hall">--%>
             	<%--<html:option value="0">0</html:option>--%>
         		<%--<html:option value="1">1</html:option>--%>
         		<%--<html:option value="2">2</html:option>--%>
         		<%--<html:option value="3">3</html:option>--%>
         		<%--<html:option value="4">4</html:option>--%>
         		<%--<html:option value="5">5</html:option>--%>
         		<%--<html:option value="6">6</html:option>--%>
             	<%--</html:select> 厅--%>
             	<%--<html:select property="toilet">--%>
             	<%--<html:option value="0">0</html:option>--%>
         		<%--<html:option value="1">1</html:option>--%>
         		<%--<html:option value="2">2</html:option>--%>
         		<%--<html:option value="3">3</html:option>--%>
         		<%--<html:option value="4">4</html:option>--%>
             	<%--</html:select> 卫--%>
             	</TD></TR>
    
    
        <TR>
          <TD class=font1 align=right>建筑面积</TD>
          <TD align=left>
          <%--<html:text property="minarceage" maxlength="7" size="5"></html:text> ~ --%>
          	<%--<html:text property="maxarceage" maxlength="7" size="5"></html:text> ㎡</TD></TR>--%>
        <TR>
          <TD class=font1 align=right><FONT class=font2>*</FONT> 交易价格</TD>
          <TD align=left>
          <%--<html:text property="minprice" maxlength="6" size="5"></html:text> ~  --%>
          	<%--<html:text property="maxprice" maxlength="6" size="5"></html:text>元/月</TD></TR>--%>
        <TR>
          <TD class=font1 align=right>基础设施</TD>
          <TD align=left>
          <%--<html:multibox property="esthment" value="水"> </html:multibox>水--%>
          	<%--<html:multibox property="esthment" value="电"> </html:multibox> 电 --%>
           <%--<html:multibox property="esthment" value="煤气/天然气"> </html:multibox> 煤气/天然气--%>
            <%--<html:multibox property="esthment" value="有线电视"> </html:multibox> 有线电视--%>
             <%--<html:multibox property="esthment" value="电话"> </html:multibox>  电话--%>
              <%--<html:multibox property="esthment" value="宽带"> </html:multibox> 宽带--%>
              </TD></TR>
            
          <TR>
          <TD class=font1 align=right>备注</TD>
          <TD align=left>
          <%--<html:textarea property="remark" rows="8" cols="60"></html:textarea>--%>
         <br>
        
          </TD></TR>
           </TBODY></TABLE>
      <TABLE 
      style="FONT-WEIGHT: bold; FONT-SIZE: 14px; BORDER-BOTTOM: #f3b47c 2px solid" 
      cellSpacing=0 cellPadding=0 width="96%" border=0>
        <TBODY>
        <TR>
          <TD align=middle width="10%" height=27>联系方式</TD>
          <TD align=left width="90%">&nbsp;</TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=4 cellPadding=1 width="96%" border=0>
        <TBODY>
        <TR>
          <TD class=font1 align=right width="17%"><FONT class=font2>*</FONT> 联 
            系 人：</TD>
          <TD align=left width="83%">
            <%--<c:if test="${users.truename==null }">--%>
              <%--${users.uname}--%>
            <%--</c:if>--%>
            <%--<c:if test="${userstruename!='' }">--%>
              <%--${users.truename }--%>
            <%--</c:if>     --%>
          </TD></TR>
        <TR>
          <TD class=font1 align=right><FONT class=font2>*</FONT> 联系电话/手机</TD>
          <TD align=left><INPUT class=txtinput1 maxLength=25 size=50 
          name=phone type="text" value="${users.phone }" readonly="readonly"></TD></TR>
        <TR>
          <TD class=font1 align=right>E-mail</TD>
          <TD align=left><INPUT class=txtinput1 maxLength=80 size=50 
            name=email type="text" value="${users.email }" readonly="readonly"></TD></TR>
       </TBODY></TABLE>
       <div class=information>
      <DIV class="info individual">
       <INPUT class=btn style="background-color:#CC66FF" type=submit value="确认修改">&nbsp;
       <INPUT class=btn  style="background-color:#CC66FF" type="reset" value="重      置">
       
      </div></div>
  <BR><BR></TD></TR>
  <TR>
    <TD vAlign=center align=middle width=620 height=24>&nbsp; 
  </TD></TR></TBODY></TABLE></html:form> <!--右侧结束--></DIV>


</DIV></BODY>
</html>
