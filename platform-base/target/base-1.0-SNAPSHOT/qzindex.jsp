<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="true">
 <HEAD><TITLE>租房出租网</TITLE>
<link href="<%=path%>/images/ttlo.png" rel="shortcut icon">

<META http-equiv=Content-Type content="text/html; charset=gbk">
<META http-equiv=Content-Language content=zh-CN>
<META http-equiv=pragma content=no-cache>
<LINK rev=stylesheet href="<%=path%>/files/public.css" type=text/css rel=stylesheet></LINK>
<LINK rev=stylesheet href="<%=path%>/files/rent.css" type=text/css rel=stylesheet></LINK>
<LINK href="<%=path%>/index.jsp" type=image/ico rel=icon></LINK>
<LINK href="<%=path%>/index.jsp" rel="shortcut icon"></LINK>
</HEAD>
<BODY>
<div style="z-index: 1">
<DIV class=header>
<DIV class=top>
<DIV class=loginBar>
<DIV class=loginList>
<LI>您好&nbsp;${users.uname }！欢迎来到找房网！ </LI>
<LI><A title=登录 href="javascript:showlog();">[登录]</A></LI>
<c:if test="${not empty users}">
<LI><A title=退出 href="javascript:logout();">[退出]</A>
<script type="text/javascript">
   function logout(){
      if(confirm("确定退出吗？")){
        window.location="users.do?method=logout&fromto=index";
      }
   }
</script>
</LI>
</c:if>
<LI><A title=免费注册 href="<%=path%>/regUsers.jsp" target=_blank>[免费注册]</A> </LI>
</DIV>
</DIV>
<DIV class=logo><A href="<%=path%>/index.jsp"><IMG height=45 alt=''
src="<%=path%>/images/logo-esf.png" width=140></A></DIV>
</DIV>
<DIV class=header_BottomL></DIV>
<DIV class=header_BottomC>

<DIV class=nav_second>
<UL>
  <LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/index.jsp">租房首页</A> </LI>
  <LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/index.jsp">出 租</A></LI>
  <LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/qzindex.jsp">求 租</A></LI>

  <LI class=nav_second1 style="BACKGROUND: none transparent scroll repeat 0% 0%; WIDTH: 130px"><A 
  href="<%=path%>/usercenter.jsp">个人中心</A> </LI>
</UL>
</DIV>
<DIV class=seach_box>
<FORM id=form1 onSubmit="return chaecksearch()" action="#" method=post>
<DIV class=seach_this>
<DIV class=current_option main="rent">找租房</DIV></DIV>
<INPUT class="txtbox" id="limit_key" maxLength=100 onBlur="isblur();" onFocus="javascript:document.getElementById('limit_key').value='';"
size=56 value='请输入房源特征,地点或小区名...' name="limit_key">
<INPUT type=image alt=搜索 src="<%=path%>/images/seach.gif" align=left name=image> 
<script>
 function isblur(){
    if(document.getElementById('limit_key').value==""){
	   document.getElementById('limit_key').value="请输入房源特征,地点或小区名...";
	}
 }
</script></FORM>
</DIV>
</DIV>
</DIV>
<DIV class=Main>

<DIV class=house_attribute>
<DIV class=house_boxL>
<DIV class=house_boxLL></DIV>
<DIV class=house_boxLC></DIV>
<DIV class=house_boxLR></DIV></DIV>

<DIV class=house_boxC>
<DIV class=house_box1>
<%--<logic:empty name="alist">--%>
	<%--<logic:redirect action="begRent.do?method=selectBeanByPage&showPage=1"></logic:redirect>--%>
<%--</logic:empty>--%>


<DIV class=attribute_title><STRONG>区域:</STRONG></DIV>
<DIV class=attribute><SPAN>全部</SPAN> 
<%--<logic:iterate id="areas" name="alist">--%>
	<%--<A href="<%=path%>/begRent.do?method=selectBeanByPage&aid=${areas.gid }&showPage=1">${areas.area }</A> --%>
	<%--</logic:iterate>--%>
</DIV>
</DIV>

<DIV class=house_box>
<DIV class=attribute_title><STRONG>租金:</STRONG></DIV>
<DIV class=attribute><SPAN>不限</SPAN> 
<A title=500-800元 href="<%=path%>/begRent.do?method=selectBeanByPage&minprice=500&showPage=1">500元以下</A> 
<A title="{$limit_jg2_1}>-800元" href="<%=path%>/begRent.do?method=selectBeanByPage&minprice=500&maxprice=800&showPage=1">500-800元</A> 
<A title="{$limit_jg2_2}>-1200元" href="<%=path%>/begRent.do?method=selectBeanByPage&minprice=800&maxprice=1200&showPage=1">800-1200元</A> 
<A title=1200-1800元 href="<%=path%>/begRent.do?method=selectBeanByPage&minprice=1200&maxprice=1800&showPage=1">1200-1800元</A> 
<A title=1800-2500元 href="<%=path%>/begRent.do?method=selectBeanByPage&minprice=1800&maxprice=2500&showPage=1">1800-2500元</A> 
<A title=3500-5000元 href="<%=path%>/begRent.do?method=selectBeanByPage&minprice=2500&maxprice=3500&showPage=1">2500-3500元</A> 
<A title=5000-100000元 href="<%=path%>/begRent.do?method=selectBeanByPage&minprice=3500&maxprice=5000&showPage=1">3500-5000元</A> 
<A title=5000元 href="<%=path%>/begRent.do?method=selectBeanByPage&maxprice=5000&showPage=1">5000元以上</A> 
</DIV></DIV>

<DIV class=house_box>
<DIV class=attribute_title><STRONG>房型:</STRONG></DIV>
<DIV class=attribute><SPAN>不限</SPAN>
<A title=一室 href="<%=path%>/begRent.do?method=selectBeanByPage&hid=1&showPage=1">一室</A> 
<A title=二室 href="<%=path%>/begRent.do?method=selectBeanByPage&hid=2&showPage=1">二室</A> 
<A title=三室 href="<%=path%>/begRent.do?method=selectBeanByPage&hid=3&showPage=1">三室</A> 
<A title=四室 href="<%=path%>/begRent.do?method=selectBeanByPage&hid=4&showPage=1">四室</A> 
<A title=五室 href="<%=path%>/begRent.do?method=selectBeanByPage&hid=5&showPage=1">五室</A> 
<A title=五室以上 href="<%=path%>/">五室以上</A> 
</DIV></DIV>

<DIV class=rent_filter><LABEL>价格：</LABEL> 
<INPUT class=inputprice id=sml_pay type="text"> - 
<INPUT class=inputprice id=big_pay type="text"> <LABEL>元</LABEL> 
<INPUT onclick=pirceSelect(); type=button value=筛选>&nbsp;&nbsp; 

<script type="text/javascript">
	function pirceSelect()
	{
		var sml_pay=document.getElementById("sml_pay").value;
		var big_pay=document.getElementById("big_pay").value;
		
		window.location="begRent.do?method=selectBeanByPage&showPage=1&minprice="+sml_pay+"&maxprice="+big_pay;
		
	}
	
	function hidselect()
	{
		var hids=document.getElementById("hid").value;
		
		window.location="begRent.do?method=selectBeanByPage&showPage=1&houseid="+hids;
	}
</script>

<SELECT class=yn-long onChange="hidselect();" id="hid"> 

<OPTION value="" >房屋类型</OPTION> 
<%--<logic:iterate id="houses" name="hlist">--%>
<%--<OPTION value="${houses.id }">${houses.type }</OPTION> --%>
<%--</logic:iterate>--%>
</SELECT> 

</DIV></DIV>

<DIV class=house_boxR>
<DIV class=house_boxRL></DIV>
<DIV class=house_boxRC></DIV>
<DIV class=house_boxRR></DIV></DIV></DIV>
<DIV class=left>
<DIV class=search_bar>
<DIV class=search_top>
<UL>
  <LI class=tab_current><SPAN>求租房源信息</SPAN></LI>
</UL>

<DIV class=page-top ><SPAN class=page-info>${showPage}/${allPage }</SPAN> 

</DIV></DIV>
<DIV class=search_bottom>
<DIV class=taxis>&nbsp; 
<SELECT onChange="">
 <OPTION value="" selected>默认排序</OPTION> 
 <OPTION value="">面积从大到小</OPTION> 
 <OPTION value="">面积从小到大</OPTION> 
 <OPTION value="">租金从高到低</OPTION> 
 <OPTION value="">租金从低到高</OPTION> 
 <OPTION value="">发布时间从新到旧</OPTION></SELECT> 
</DIV>
<DIV class=house_total>共有<STRONG>${allCount }</STRONG>套符合条件的房源 </DIV></DIV></DIV>
<DIV class=search_list>
<OL id=list_box>
<!-- -------------------------------------------------------- -->



<%--<logic:iterate id="br" name="brlist">--%>
	<%----%>
<%--<DIV class=rent_info>--%>
<%--<DIV  class=rent_info_dt><A class=list_title href="<%=path%>/begRent.do?method=showInfo&bid=${br.id }" target=_blank>${br.address }</A>  </DIV>--%>
<%--<DIV id=hz_price class=rent_info_ds>${br.minprice } - ${br.maxprice }元/月--%>
<%--</DIV>--%>
<%--<DIV class=rent_info_dd >${br.chamber }室${br.hall }厅${br.toilet }卫  ${br.time }</DIV></DIV>--%>

<%--</logic:iterate>--%>

<!-- -------------------------------------------------------- -->
</OL>
</DIV>
<DIV class=pages_box>
<DIV class=page_con>

<A href="<%=path%>/begRent.do?method=selectBeanByPage&showPage=1">首 页</A>
<%--<logic:notEqual value="1" name="showPage">--%>
<%--<A href="<%=path%>/begRent.do?method=selectBeanByPage&showPage=${showPage-1 }">上一页</A> --%>
<%--</logic:notEqual>--%>
<%--<logic:lessThan value="${allPage}" name="showPage">--%>
<%--<A href="<%=path%>/begRent.do?method=selectBeanByPage&showPage=${showPage+1 }">下一页</A> --%>
<%--</logic:lessThan>--%>
<A href="<%=path%>/begRent.do?method=selectBeanByPage&showPage=${allPage }">尾 页</A>

</DIV></DIV></DIV>
<DIV class=right><!--右侧载入-->
<DIV class=transactions><A href="<%=path%>/usercz.jsp"><IMG 
alt=免费发布房屋出租信息 src="<%=path%>/images/rent_btn.gif"></A> </DIV>
<SCRIPT>
function run_space(url){
  window.open(url, ""); 
}
</SCRIPT>

<DIV class=look_house>
<DIV class=right_title1>
<H5>最近看过的房子</H5></DIV>
<UL>
 <%--<logic:notEmpty name="users">--%>
 <%--<logic:notEmpty name="cookieRoom">--%>
  <%--<logic:iterate id="r" name="cookieRoom" length="10">--%>
   <%--<LI>--%>
    <%--<A title="${r.title }" href="<%=path%>/roomInfo.jsp" target="_blank">--%>
    <%--${r.areaType.area }，${r.chamber }室${r.hall }厅 </A>--<SPAN class=pay_2>${r.pirce }元/月</SPAN>--%>
   <%--</LI> --%>
  <%--</logic:iterate>--%>
 <%--</logic:notEmpty>--%>
 <%--</logic:notEmpty>--%>
 </UL>
</DIV>  
<DIV class=look_house>
<DIV class=right_title1>
<H5>最新发布的租房信息</H5>
</DIV>

<%--<logic:notEmpty name="list">--%>
 <%--<logic:iterate id="troom" name="list" >--%>
    <%--<DIV class=multi_pic>--%>
	  <%--<!-- 没有图片 -->--%>
	  <%--<logic:empty name="troom" property="img">--%>
	    <%--<DIV class=multi_pic_l>--%>
	    <%--<A title="暂无图片" href="<%=path%>/begRent.do?method=showByPage&id=${troom.id }" target=_blank>--%>
	    <%--<img src="<%=path%>/images/no-pic2.gif" height=60 width="80"> </A></DIV>--%>
	  <%--</logic:empty>--%>
	  <%--<!-- 有图片 --> --%>
	  <%--<logic:notEmpty name="troom" property="img">--%>
	  <%--<DIV class=multi_pic_l>--%>
	    <%--<A  title="${troom.title }，${troom.areaType.area }" --%>
	        <%--href="<%=path%>/begRent.do?method=showByPage&id=${troom.id }" target=_blank>--%>
	    <%--<img src="<%=path%>/uploadIMG/${troom.img }" height=60 width="80"></A></DIV>--%>
	  <%--</logic:notEmpty>   --%>
	<%----%>
	<%----%>
	<%--<DIV class=multi_pic_r>--%>
	<%--<A href="<%=path%>/begRent.do?method=showByPage&id=${troom.id }" target=_blank>${troom.title }(${troom.areaType.area })</A>--%>
	<%--<BR>--%>
    <%--${troom.chamber }室${troom.hall }厅${troom.toilet }卫--%>
	<%--${troom.acreage }平米<BR><SPAN class=pay_1>${troom.pirce }</SPAN></DIV></DIV>--%>
 <%--</logic:iterate>--%>
<%--</logic:notEmpty>--%>









</DIV></DIV>
<DIV class=clear></DIV>
<DIV class=footer>
  <DIV style="HEIGHT: 10px"><SPAN></SPAN></DIV>
  <DIV style="PADDING-TOP: 5px; TEXT-ALIGN: center">Copyright 2013 WWW.HLAU.CN 
All Rights Reserved </DIV>
<DIV style="PADDING-TOP: 5px; TEXT-ALIGN: center" align=center><SPAN><A 
href="<%=path%>/http://www.miibeian.gov.cn/">黑ICP备12345678号</A></SPAN></DIV></DIV>

</DIV>
</div>
<div id="mid" style="z-index:211;position: absolute;top: 0px;left:0px;
   background-color:black;width: 100%;height: 200%;display: none;"></div>
   
<div id="log" style="z-index: 222; position: absolute; top:25%; left: 30%;display: none;width: 222px;">
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
         <span onclick="hidlog();" style="cursor: pointer;color:#417eb2; "><img src="<%=path%>/image/del.gif">[关闭]</span>
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
                      <TD><IMG height=9 src="<%=path%>/images/dot_dot01.gif" 
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
                        href="<%=path%>/regUsers.jsp" target="_blank">立即注册</A></TD></TR>
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
                  src="<%=path%>/images/btn_login.gif" border=0 name=imageField> 　 
                  <A onClick="return false;" href="<%=path%>/#"><IMG 
                  onclick="form1.reset();return false;" height=26 
                  src="<%=path%>/images/btn_reset.gif" width=103 border=0></A> </P>
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
</html:html>
