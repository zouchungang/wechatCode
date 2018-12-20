<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
    <title>房源详细信息</title>
<link href="images/logo-esf.png" rel="shortcut icon">
   
    <LINK rev=stylesheet 
href="files/public.css" type=text/css 
rel=stylesheet></LINK><LINK rev=stylesheet 
href="files/rent.css" type=text/css 
rel=stylesheet></LINK>
  <script type='text/javascript' src='dwr/interface/croom.js'></script>
  <script type='text/javascript' src='dwr/engine.js'></script>

</head>
<script type="text/javascript">
   function addchoosroom(id,uid){
      	croom.add(id,uid,function(msg){alert(msg);});
   }
</script>
<script type="text/javascript">
	   function notLogin(){
	      alert("请先登录");
	      showlog();
	   }
</script>
<BODY>
<div style="z-index: 1" id="allDIV">
<DIV class=header>
<DIV class=top>
<DIV class=loginBar>
<DIV class=loginList>
<LI>您好&nbsp;${users.uname }！欢迎来到找房网！ </LI>
<LI><A title=登录 href="javascript:showlog();">[登录]</A></LI>
<logic:notEmpty name="users">
<LI><A title=退出 href="javascript:logout();">[退出]</A>
<script type="text/javascript">
   function logout(){
      if(confirm("确定退出吗？")){
        window.location="users.do?method=logout&fromto=index";
      }
   }
</script>
</LI>
</logic:notEmpty>
<LI><A title=免费注册 href="regUsers.jsp" target=_blank>[免费注册]</A> </LI>
</DIV>
</DIV>
<DIV class=logo><A href="index.jsp"><IMG height=45 alt=''
src="images/logo-esf.png" width=140></A></DIV>
</DIV>
<DIV class=header_BottomL></DIV>
<DIV class=header_BottomC>
<DIV class=nav_second>
<UL>
  <LI class=nav_second1 style="WIDTH: 130px"><A href="index.jsp">租房首页</A> </LI>
  <LI class=nav_second1 style="WIDTH: 130px"><A href="index.jsp">出 租</A></LI>
  <LI class=nav_second1 style="WIDTH: 130px"><A href="qzindex.jsp">求 租</A></LI>

  <LI class=nav_second1 style="BACKGROUND: none transparent scroll repeat 0% 0%; WIDTH: 130px"><A 
  href="usercenter.jsp">个人中心</A> </LI>
</UL>
</DIV>
<DIV class=seach_box>
 
<DIV class=seach_this>
<DIV class=current_option main="rent">找租房</DIV></DIV>
<INPUT class="txtbox" id="limit_key" maxLength=100 onBlur="isblur();" onFocus="javascript:document.getElementById('limit_key').value='';"
size=56 value='请输入房源特征,地点或小区名...' name="limit_key">
<INPUT type=image alt=搜索 src="images/seach.gif" align=left name=image onclick="selGo();"> 
<script>
 function isblur(){
    if(document.getElementById('limit_key').value==""){
	   document.getElementById('limit_key').value="请输入房源特征,地点或小区名...";
	}
 }
 function selGo(){
    var title=document.getElementById("limit_key").value;
    if(title=="请输入房源特征,地点或小区名..."){
       alert("请输入搜索内容");
       return;
    }
    window.location="leaseRoom.do?method=showRoomIndex&showPage=1&title="+title;
 }
</script>
</DIV>
</DIV> 
<DIV class=header_BottomR></DIV>
<SCRIPT src="files/jquery-1.3.min.js" 
type=text/javascript></SCRIPT>
<LINK rev=stylesheet href="files/info_view.css" 
type=text/css rel=stylesheet></LINK><LINK rev=stylesheet 
href="files/public.css" type=text/css 
rel=stylesheet></LINK>

<DIV class=Content>

<DIV class=Secon_Left>
<DIV class=info_box>
<DIV class=info_boxtitle>
<DIV class=info_boxtitleL></DIV>
<DIV class=info_boxtitleC>
<H2>${room.title }</H2></DIV>
<DIV class=info_boxtitleR></DIV></DIV>
<DIV class=info_boxL>
<DIV class=broker_pic>
<c:if test="${room.users.image!=null }">
     <c:if test="${room.users.image=='' }">
        <IMG alt="" src="images/QiTSPRJFM.jpg" width=120 height=120>
     </c:if>
     <c:if test="${room.users.image!='' }">
        <IMG alt="" src="uploadIMG/${room.users.image}" width=120 height=120>
     </c:if>
 </c:if>
 </DIV>
<DIV class=broker_name><br></DIV>
<UL class="broker_links">
  <LI>房主：<STRONG> 
     <c:if test="${room.users!=null }">
            <c:if test="${room.users.truename=='' }">
              ${room.users.uname}
            </c:if>
            <c:if test="${room.users.truename!='' }">
              ${room.users.truename }
            </c:if>
      </c:if>
          
  </STRONG><br></LI>
           
  <LI>联系电话：<STRONG>${room.users.phone }</STRONG> <br></LI>
  <LI>E-mail：<STRONG>${room.users.email }</STRONG> </LI></UL>
</DIV>
<DIV class=info_boxR>
<DIV class=house_number>
 
<P align="right">
<logic:notEmpty name="users">
<IMG src="images/scj.gif"><A href="javascript:addchoosroom(${room.id },${users.uid });">收藏此信息</A>&nbsp; 
</logic:notEmpty>
<logic:empty name="users">
<IMG src="images/scj.gif"><A href="javascript:notLogin();">收藏此信息</A>&nbsp; 
</logic:empty>


</P>

</DIV>
<UL class=house_info2>
  <li>租金：<font size="5" color="red">${room.pirce }</font>  元/月</li>
  <li class=info2_long>发布时间：<I>${room.time }</I></li>
  <LI class=info2_short>所在区域：${room.areaType.area } </LI>
  <LI class=info2_short>房源类别：${room.houseType.type } </LI>
  <LI class=info2_short>房型：${room.chamber }室${room.hall }厅${room.toilet }卫 </LI>
  <LI class=info2_short>建筑面积：${room.acreage }平米 </LI>
  <LI class=info2_long>基础设施： ${room.esthment }</LI>
  <LI class=info2_long>房源地址： ${room.address }
  </LI></UL>
  
  <logic:notEqual value="4" name="room" property="state">
	<DIV class=tel_number>${room.users.phone }</DIV>
	</logic:notEqual>
</DIV></DIV>

<DIV class=summarize>
<P></P><A name=map></A>
<DIV class=map_info>
</DIV>
<DIV class=FloorPlan>
<H3>图片信息：</H3><A name=map_room></A><SPAN><A 
href="#">回到顶部</A></SPAN> 
</DIV>
<logic:notEmpty name="image">
  <logic:iterate id="img" name="image">
  <DIV class=roomin_con>
  <IMG src="uploadIMG/${img.image }"> </DIV>
  </logic:iterate>
</logic:notEmpty> 

</DIV></DIV><!--左部END-->
<DIV class=Secon_right>
<DIV class=useful_box>
<DIV class=useful_boxT></DIV>
<DIV class=useful_boxC>
<UL>
  <LI class=house_list><A href="chooseroom.jsp">我的选房单</A> </LI>
  <LI class=price_wave><A href="usercz.jsp">发布出租房源</A> 
  </LI>
</UL></DIV>
<DIV class=useful_boxB></DIV></DIV>
<DIV class=sale_other>
<DIV class=R_title>
<H4><c:if test="${room.users!=null }">
            <c:if test="${room.users.truename=='' }">
              ${room.users.uname}
            </c:if>
            <c:if test="${room.users.truename!='' }">
              ${room.users.truename }
            </c:if>
      </c:if>的其他房源</H4> </DIV>
<UL class=R_con style="HEIGHT: 210px">
 <logic:notEmpty name="rlist">
   <logic:iterate id="r" name="rlist">
    <LI>
	  <table border="0" width="100%">
	   <tr>
	    <td align="left">
	    <A href="leaseRoom.do?method=getleaseRoom&id=${r.id }" target=_blank>	${r.title }</A></td>
	    <td align="right">
	     ${r.acreage }m<SUP>2</SUP>；
	    <font color="red">${r.pirce }元/月</font> 
	    </td>
	   </tr>
	  </table>
	 </LI>
   </logic:iterate>
 </logic:notEmpty>
  
  
  </UL></DIV></DIV></DIV>
<DIV class=footer>
<DIV style="HEIGHT: 10px"><SPAN></SPAN></DIV>
<DIV id=topic 
style="BORDER-TOP: rgb(224,224,224) 1px solid; PADDING-TOP: 10px; TEXT-ALIGN: center">
  <p>&nbsp;</p>
 
</DIV>
<DIV style="PADDING-TOP: 5px; TEXT-ALIGN: center">Copyright 2013 WWW.HLAU.CN 
All Rights Reserved </DIV>
<DIV style="PADDING-TOP: 5px; TEXT-ALIGN: center" align=center><SPAN><A 
href="http://www.miibeian.gov.cn/">黑ICP备12345678号</A></SPAN></DIV></DIV>
</DIV></div>

<div id="mid" style="z-index:300;position: absolute;top: 0px;left:0px;
   background-color:black;width: 100%;height:200%;display: none;"></div>
 
<div id="log" style="z-index:306; position: absolute; top:25%; left: 30%;display: none;width: 222px;">
<FORM name=form1 onSubmit="return checklogin();"
			action="users.do?method=usersLogin" method=post>  
   <input type="hidden" name="fromto" value="index">
   <TABLE style="BORDER-LEFT: #bcbcbc 1px solid" cellSpacing=0 cellPadding=0 
      width=600 align=center border=0>
        <TBODY>
        <TR>
          <TD width=222 background=images/img_title2.gif  align="left"
          height=58><font color=#417eb2 size="4">&nbsp;&nbsp;<b>用户登录</b></font></TD>
          <TD align="center" width=57  background=images/img_title2.gif>
          </TD>
          <TD style="BORDER-RIGHT: #bcbcbc 1px solid" align=right width=210 
          background=images/img_title2.gif>
         <span onclick="hidlog();" style="cursor: pointer;color:#417eb2; "><img src="image/del.gif">[关闭]</span>
          &nbsp;</TD></TR>
        <TR>
          <TD colSpan=3>
            <TABLE 
            style="BORDER-RIGHT: #bcbcbc 1px solid; BORDER-TOP: #bcbcbc 1px; BORDER-BOTTOM: #bcbcbc 1px solid" 
            cellSpacing=0 cellPadding=0 width="100%" align=center 
            bgColor=#f4fff8 border=0>
              <TBODY>
              <TR>
                <TD><BR>
                  <TABLE cellSpacing=0 cellPadding=4 width=400 align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD><IMG height=9 src="images/dot_dot01.gif" 
                        width=9 align=absMiddle>&nbsp;&nbsp;<FONT 
                        color=#417eb2>请输入您的用户名和密码！</FONT> </TD></TR></TBODY></TABLE>
                  <TABLE cellSpacing=0 cellPadding=4 width=400 align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD colSpan=2 height=10></TD></TR>
                    <TR>
                      <TD align=right width="40%"><FONT 
                        color=#333333>用户名：</FONT></TD>
                      <TD align=left><INPUT class=txtinput1 tabIndex=1 id="uname"
                        name="uname">&nbsp;&nbsp;<A 
                        href="regUsers.jsp" target="_blank">立即注册</A></TD></TR>
                    <TR>
                      <TD colSpan=2 height=5></TD></TR>
                    <TR>
                      <TD align=right><FONT color=#333333>密　码：</FONT></TD>
                      <TD align=left><INPUT class=txtinput1 tabIndex=2 
                        type=password  name="upwd" id="upwd">&nbsp;&nbsp;
                      </TD></TR>
                    <TR>
                      <TD colSpan=2 height=5></TD></TR>
                    <TR>
                      <TD colSpan=2 height=5></TD></TR>
                    <TR>
                      <TD colSpan=2></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD>
                  <P>&nbsp;</P>
                  <P align=center><INPUT type=image width=103 
                  src="images/btn_login.gif" border=0 name=imageField> 　 
                  <A onClick="return false;" href="#"><IMG 
                  onclick="form1.reset();return false;" height=26 
                  src="images/btn_reset.gif" width=103 border=0></A> </P>
                  <P>&nbsp;</P></TD></TR></TBODY></TABLE></TD></TR></TBODY>
                  </TABLE>
      </FORM>
</div>
<script type="text/javascript">
    function showlog(){
      document.getElementById("log").style.display = "block";
      document.getElementById("mid").style.filter="alpha(opacity=10)"; 
      document.getElementById("mid").style.display = "block";
       
    }
    function hidlog(){
       document.getElementById("log").style.display = "none";
       document.getElementById("mid").style.filter="alpha(opacity=100)";
       document.getElementById("mid").style.display = "none";
       
    }
    function checklogin() 
	{
		    var uname=document.getElementById("uname");
		    var upwd=document.getElementById("upwd");
			if (uname.value=="")
			{
				alert("请输入你的用户名!");
				uname.focus();
				return false;
			}
           if (upwd.value=="")
			{
				alert("请输入你的密码?");
				upwd.focus();
				return false;
			}
			return true;
	}
</script>
</BODY>
</html>
