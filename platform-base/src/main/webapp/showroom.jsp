<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<html:base />

	<title>用户房源信息</title>
	<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<SCRIPT src="files/jquery-1.3.min.js" type=text/javascript></SCRIPT>

	<SCRIPT language=JavaScript src="files/ymPrompt.js"></SCRIPT>
	<LINK id=skin href="files/ymPrompt.css" type=text/css>

	<style type="text/css">
<!--
#roomInfo {
	font-size: 12px;
	display: none;
}
-->
</style>

	<!-- DWR -->
	<script type='text/javascript' src='dwr/engine.js'></script>
	<script type='text/javascript' src='dwr/interface/image.js'></script>
	<script type='text/javascript' src='dwr/interface/leaseRoom.js'></script>
	
<script language="javascript">
function selAll()
{
    var boxs=document.getElementsByName("boxs");
    
	for(var i=0;i<boxs.length;i++)
	{
		if(!boxs[i].checked)
		{
			boxs[i].checked=true;
		}
	}
}
function noSelAll()
{
    var boxs=document.getElementsByName("boxs");
    
	for(var i=0;i<boxs.length;i++)
	{
		if(boxs[i].checked)
		{
			boxs[i].checked=false;
		}
	}
}
//单条删除
    function godel(id){
       if(confirm("确定删除该房源吗？")){
      
           window.location="leaseRoom.do?method=delRoom&fromto=admin&id="+id;
       }
    }
//批量删除
  function dels(id){
    var boxs=document.getElementsByName("boxs");
    var check=0;
	for(var i=0;i<boxs.length;i++)
	{
	  if(boxs[i].checked){
		 leaseRoom.delRoom(boxs[i].value);         
      }else
	  {
	       check++;
	  }
    }
    if(check==boxs.length)
    {
       alert("请选择你要删除的行");
    }else
    {
       alert("删除结果: 删除成功");
       window.location="leaseRoom.do?method=showRoomAdmin&showPage=1";
          
    } 
 }
    function showRoomInfo(rid){
      document.getElementById("roomInfo").style.display = "block";
      document.getElementById("sdiv").style.filter="alpha(opacity=10)";
      document.getElementById("sdiv").style.display = "block";
      showImg(rid);
      showRoom(rid);
      
    }
    function hiddRoomInfo(){
       document.getElementById("roomInfo").style.display = "none";
       document.getElementById("sdiv").style.filter="alpha(opacity=100)";
       document.getElementById("sdiv").style.display = "none";
       document.getElementById("xiaoqu_adds").innerHTML="";
    }
    
    function showImg(rid){
      
      image.selImage(rid,function(imageList){
            
           if(imageList.length<=0){ 
              document.getElementById("xiaoqu_adds").innerHTML="<font color=red>暂无图片</font>";
           }
            for(var i=0;i<imageList.length;i++){
               
               var a=i+1;
               var html="图片"+a+"：<img src='uploadIMG/"+imageList[i].image+"' width='220' height='200'>&nbsp;&nbsp;&nbsp;";
               if(a%2==0){
                 html+="<br>";
               }
               $("#xiaoqu_adds").append(html);
              
            }
      });
    }
    function showRoom(rid){
       leaseRoom.getRoom(rid,function(room){
          document.getElementById("title").innerHTML=room.title;
          document.getElementById("area").innerHTML=room.areaType.area;
          document.getElementById("address").innerHTML=room.address;
          document.getElementById("chamber").innerHTML=room.chamber;
          document.getElementById("hall").innerHTML=room.hall;
          document.getElementById("toilet").innerHTML=room.toilet;
          document.getElementById("type").innerHTML=room.houseType.type;
          document.getElementById("acreage").innerHTML=room.acreage;
          document.getElementById("price").innerHTML=room.pirce;
          if(room.esthment==null){
            document.getElementById("esthment").innerHTML="";
          }else{
            document.getElementById("esthment").innerHTML=room.esthment;
          }
         
          document.getElementById("remark").innerHTML=room.remark;
          if(room.users.info!=null&&room.users.info!=""){
            document.getElementById("uname").innerHTML=room.users.truename;
          }else{
            document.getElementById("uname").innerHTML=room.users.uname;
          }
          
          document.getElementById("phone").innerHTML=room.users.phone;
          document.getElementById("email").innerHTML=room.users.email;
       });
    }
     
function isact(id){
	 if(confirm("通过审核？")){
		window.location="leaseRoom.do?method=toExamine&id="+id+"&state=3";
	}
 }
	
function act(id){
	 if(confirm("未通过审核？")){
		window.location="leaseRoom.do?method=toExamine&id="+id+"&state=2";
	}
 }			 
  </script>


</head>

<body>
	<div id="all" style="z-index: 1">

		<!--  快速转换位置按钮  -->
		<table width="98%" border="0" cellpadding="0" cellspacing="1"
			bgcolor="#D1DDAA" align="center">
			<tr>
				<td height="26" background="skin/images/newlinebg3.gif">
					<table width="98%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="center">
								<span class="c">出租房源信息</span>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<!--  内容列表   -->

		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#D1DDAA" align="center" style="margin-top: 8px">
			<tr bgcolor="#E7E7E7">
				<td height="24" colspan="10" background="skin/images/tbg.gif">
					&nbsp;&nbsp;
				</td>
			</tr>
			<tr align="center" bgcolor="#FAFAF1" height="22">
				<td width="4%">
					序号
				</td>
				<td width="4%">
					选择
				</td>
				<td width="22%">
					房源标题
				</td>
				<td width="12%">
					发布时间
				</td>
				<td width="8%">
					发布人
				</td>
				<td width="20%">
					房源地址
				</td>
				<td width="6%">
					审核情况
				</td>
				<td width="8%">
					举报信息
				</td>
				<td width="6%">
					操作
				</td>
			</tr>
			<logic:notEmpty name="rlList">
				<logic:iterate id="room" name="rlList" indexId="i">
					<tr align='center' bgcolor="#FFFFFF"
						onMouseMove="javascript:this.bgColor='#FCFDEE';"
						onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						<td>
							${i+1 }
						</td>
						<td>
							<input name="boxs" type="checkbox" id="boxs" value="${room.id }"
								class="np">
						</td>
						<td align="left">
							${room.title }
						</td>
						<td>
							${room.time }
						</td>
						<td>
							
								<c:if test="${room.users.truename==null }">
              ${room.users.uname}
            </c:if>
								<c:if test="${room.users.truename!='' }">
              ${room.users.truename }
            </c:if>
					

						</td>
						<td align="left">
							${room.address }
						</td>
						<td>
							<logic:equal name="room" property="state" value="1">
								<a href="javascript:isact(${room.id });"><FONT color="green">通过</FONT></a>&nbsp;&nbsp;
								<a href="javascript:act(${room.id });"><FONT color="red">未通过</FONT></a>
							</logic:equal>
							<logic:equal name="room" property="state" value="2">
								<FONT color="green">审核未通过</FONT>
							</logic:equal>
							<logic:equal name="room" property="state" value="3">
								<FONT color="blue">审核通过</FONT>
							</logic:equal>
							<logic:equal name="room" property="state" value="4">
								<FONT color="green">租用中</FONT>
							</logic:equal>

						</td>
						<td>
                            <a href="actTable.do?method=act&id=${room.id }">查看举报信息</a>
						</td>
						<td>
							<a href="javascript:godel(${room.id });">删除</a> |
							<a href="javascript:showRoomInfo(${room.id });">详细</a>
						</td>
					</tr>
				</logic:iterate>
			</logic:notEmpty>



			<tr bgcolor="#FAFAF1">
				<td height="28" colspan="10">
				
					&nbsp;
					<a href="javascript:selAll()" class="coolbg">全选</a>
					<a href="javascript:noSelAll()" class="coolbg">取消</a>
					<a href="javascript:dels();" class="coolbg">&nbsp;批量删除&nbsp;</a>
				</td>
			</tr>
			<tr bgcolor="#EEF4EA">
				<td height="36" colspan="10" align="right">
					共有${allCount }条记录，当前第${showPage }页，共${allPage }页&nbsp;
					<a href="leaseRoom.do?method=showRoomAdmin&showPage=1"
						class="coolbg">首页</a>
					<logic:notEqual name="showPage" value="1">
						<a
							href="leaseRoom.do?method=showRoomAdmin&showPage=${showPage-1 }"
							class="coolbg">上一页</a>
					</logic:notEqual>
					<logic:lessThan name="showPage" value="${allPage}">
						<a
							href="leaseRoom.do?method=showRoomAdmin&showPage=${showPage+1 }"
							class="coolbg">下一页</a>
					</logic:lessThan>
					<a href="leaseRoom.do?method=showRoomAdmin&showPage=${allPage}"
						class="coolbg">尾页</a>
				</td>
			</tr>
		</table>
	</div>
	<div id="sdiv"
		style="z-index: 9; position: absolute; top: 0px; left: 0px; background-color: black; width: 100%; height: 150%; display: none;"></div>


	<!--查看出租房源信息开始-->
	<div id="roomInfo"
		style="z-index: 10; position: absolute; top: 50px; left: 150px; width: 801; background: green; border-style: inset; border-width: 1px;">
		<table bgcolor="#fcfcfc" width="800" border="0" align="left"
			cellpadding="0" cellspacing="0" class="borders1">
			<tr>
				<td width="806" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						bgcolor="#f0f0f0">
						<tr>
							<td align="left" width="50%">
								<font size="5" color="#FF0099">&nbsp;房源信息</font>
							</td>
							<td align="right" style="font-size: 12px; font-weight: bold">
								<span onclick="hiddRoomInfo();" style="cursor: pointer;"><img
										src="image/del.gif">[关闭]</span> &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
							</td>
						</tr>
					</table>


					<table width="96%" border="0"
						style="BORDER-BOTTOM: #f3b47c 2px solid">
						<tr>
							<td width="10%" height="27" align="left"
								style="font-size: 14px; font-weight: bold">
								&nbsp;&nbsp;基本资料
							</td>
						</tr>
					</table>
					<table width="96%" border="0" cellspacing="4" cellpadding="1">
						<tr>
							<td width="50">
								&nbsp;
							</td>
							<td align="left" style="font-size: 12px; font-weight: bold">
								房源标题：
								<span id="title"></span>；&nbsp;所在区域：
								<span id="area"></span>
								<br>
								<br>
								地址：
								<span id="address"></span>
								<br>
								<br>
								户型：
								<span id="chamber"></span>室
								<span id="hall"></span>厅
								<span id="toilet"></span>卫；&nbsp; 房源类别：
								<span id="type"></span>
								<br>
								<br>
								建筑面积：
								<span id="acreage"></span>㎡；&nbsp; 交易价格：
								<span id="price"></span>元/月
								<br>
								<br>
								基础设施：
								<span id="esthment"></span>
								<br>
								<br>
								房源说明：
								<span id="remark"></span>
							</td>
						</tr>

					</table>
					<table width="96%" border="0"
						style="BORDER-BOTTOM: #f3b47c 2px solid">
						<tr>
							<td width="10%" height="27" align="left"
								style="font-size: 14px; font-weight: bold">
								&nbsp;&nbsp;联系方式
							</td>
						</tr>
					</table>
					<table width="96%" border="0" cellspacing="4" cellpadding="1">
						<tr>
							<td width="50">
								&nbsp;
							</td>
							<td align="left" style="font-size: 12px; font-weight: bold">
								联 系 人：
								<span id="uname"></span>&nbsp;
								<br>
								联系电话：
								<span id="phone"></span>
								<br>
								E-mail：
								<span id="email"></span>
							</td>
						</tr>
					</table>
					<table width="96%" border="0"
						style="BORDER-BOTTOM: #f3b47c 2px solid">
						<tr>
							<td width="10%" height="27" align="left"
								style="font-size: 14px; font-weight: bold">
								&nbsp;&nbsp;图片信息
							</td>
						</tr>
					</table>
					<table width="96%" border="0" cellspacing="4" cellpadding="1">
						<tr>
							<td width="50">
								&nbsp;
							</td>
							<td align="left" style="font-size: 12px; font-weight: bold">
								<div id="xiaoqu_adds"></div>
							</td>
						</tr>
					</table>

				</td>
			</tr>
		</table>
	</div>
	<!--查看出租房源信息结束-->
</body>
</html:html>
