<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<html>
  <head>
    <title>My JSP 'ShowHouse_type.jsp' starting page</title>
<link href="images/logo-esf.png" rel="shortcut icon">
    <link rel="stylesheet" type="text/css" href="skin/css/base.css">
<script language="javascript">
function viewArc(aid){
	if(aid==0) aid = getOneItem();
	window.open("archives.asp?aid="+aid+"&action=viewArchives");
}
function editArc(aid){
	if(aid==0) aid = getOneItem();
	location="archives.asp?aid="+aid+"&action=editArchives";
}
function updateArc(aid){
	var qstr=getCheckboxItem();
	if(aid==0) aid = getOneItem();
	location="archives.asp?aid="+aid+"&action=makeArchives&qstr="+qstr+"";
}
function checkArc(aid){
	var qstr=getCheckboxItem();
	if(aid==0) aid = getOneItem();
	location="archives.asp?aid="+aid+"&action=checkArchives&qstr="+qstr+"";
}
function moveArc(aid){
	var qstr=getCheckboxItem();
	if(aid==0) aid = getOneItem();
	location="archives.asp?aid="+aid+"&action=moveArchives&qstr="+qstr+"";
}
function adArc(aid){
	var qstr=getCheckboxItem();
	if(aid==0) aid = getOneItem();
	location="archives.asp?aid="+aid+"&action=commendArchives&qstr="+qstr+"";
}
function delArc(aid){
	var qstr=getCheckboxItem();
	if(aid==0) aid = getOneItem();
	location="archives.asp?aid="+aid+"&action=delArchives&qstr="+qstr+"";
}


//获得选中其中一个的id

function selAll()
{
	var boxs=document.getElementsByName("boxs");
		 for(var i=0;i<boxs.length;i++)
		  {
		     boxs[i].checked=true;
		  }
	
}
function noSelAll()
{
     var boxs=document.getElementsByName("boxs");
		       for(var i=0;i<boxs.length;i++)
		       {
		          boxs[i].checked=false;
		       }

     
}


function delAdmin(aid)
{
	var del=document.getElementById("del");
	if(confirm("是否要删除.!"))
	{
		window.location="admin.do?method=delAdmin&id="+aid;
	}
}
</script>
</head>
<body leftmargin="8" topmargin="8" background='skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
<tr>
 <td height="26" background="skin/images/newlinebg3.gif">
  
</td>
</tr>
</table>
  

<form name="form2" >

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="10" background="skin/images/tbg.gif">&nbsp;管理员信息&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FAFAF1" height="22">
    <td width="4%">选择</td>
	<td width="6%">序号</td>
	
	<td width="28%">姓名</td>
	<td width="28%">密码</td>
	
	<td width="10%">操作</td>
</tr>
   
<logic:iterate id="admin" name="alist" indexId="i" >
<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
   
	<td><input name="boxs" type="checkbox" id="boxs" value="${admin.aid }"></td>
	<td>${i+1 }</td>
	<td> ${admin.aname }</td>
	<td> ******</td>
	
	
	<td> <a href="#" onclick="delAdmin(${admin.aid });" id="del">删除</a></td>

</tr>
</logic:iterate>


<tr bgcolor="#FAFAF1">
<td height="28" colspan="10">
	&nbsp;
	<a href="javascript:selAll()" class="coolbg">全选</a>
	<a href="javascript:noSelAll()" class="coolbg">取消</a>
	
	
</td>
</tr>
<tr align="right" bgcolor="#EEF4EA">
	<td height="36" colspan="10" align="center"><!--翻页代码 --></td>
</tr>
</table>

</form>

</body>
</html>