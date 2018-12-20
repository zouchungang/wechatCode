<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.rent.common.Constants" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD><TITLE>租房网</TITLE>
	<link href="<%=path%>/images/ttlo.png" rel="shortcut icon">
	<META http-equiv=Content-Type content="text/html; charset=gbk">
	<META http-equiv=Content-Language content=zh-CN>
	<META http-equiv=pragma content=no-cache>
	<LINK rev=stylesheet href="<%=path%>/files/public.css" type=text/css rel=stylesheet></LINK>
	<LINK rev=stylesheet href="<%=path%>/files/rent.css" type=text/css rel=stylesheet></LINK>
	<script type="text/javascript" src="<%=path%>/${staticCtx }/common/h5/js/plugins/layer/layer.js"></script>
</HEAD>
<BODY>
<div style="z-index: 1">
	<DIV class=header>
		<DIV class=top>
			<DIV class=loginBar>
				<DIV class=loginList>
					<% String name = (String) session.getAttribute(Constants.PLATFORMEMPLOYEEID);
						if (name == null) {%>

					<LI>您好&nbsp;游客！欢迎来到我要找房！</LI>
					<LI><A title=登录 href="<%=path%>/userLogin.jsp">[登录]</A></LI>
					<%} else { %>
					<LI>您好&nbsp;${users.uname }！欢迎来到我要找房！</LI>
					<LI><A title=退出 href="<%=path%>/javascript:logout();">[退出]</A>
						<script type="text/javascript">
							function logout() {
								if (confirm("确定退出吗？")) {
									window.location = "users.do?method=logout&fromto=index";
								}
							}
						</script>
					</LI>
					<%} %>
					<LI><A title=免费注册 href="<%=path%>/regUsers.jsp" target=_blank>[免费注册]</A></LI>
				</DIV>
			</DIV>
			<DIV class=logo><A href="<%=path%>/index.jsp"><IMG height=45 alt=''
			                                                   src="<%=path%>/images/logo-esf.png" width=140></A></DIV>
		</DIV>
		<DIV class=header_BottomL></DIV>
		<DIV class=header_BottomC>
			<DIV class=nav_second>
				<UL>
					<LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/index.jsp">租房首页</A></LI>
					<LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/index.jsp">出 租</A></LI>
					<LI class=nav_second1 style="WIDTH: 130px"><A href="<%=path%>/qzindex.jsp">求 租</A></LI>

					<LI class=nav_second1 style="BACKGROUND: none transparent scroll repeat 0% 0%; WIDTH: 130px"><A
							href="<%=path%>/usercenter.jsp">个人中心</A></LI>
				</UL>
			</DIV>
			<DIV class=seach_box>

				<DIV class=seach_this>
					<DIV class=current_option main="rent">找租房</DIV>
				</DIV>
				<INPUT class="txtbox" id="limit_key" maxLength=100 onBlur="isblur();"
				       onFocus="javascript:document.getElementById('limit_key').value='';"
				       size=56 value='请输入房源特征,地点或小区名...' name="limit_key">
				<INPUT type=image alt=搜索 src="<%=path%>/images/seach.gif" align=left name=image onclick="selGo();">
				<script>
					function isblur() {
						if (document.getElementById('limit_key').value == "") {
							document.getElementById('limit_key').value = "请输入房源特征,地点或小区名...";
						}
					}

					function selGo() {
						var title = document.getElementById("limit_key").value;
						if (title == "请输入房源特征,地点或小区名...") {
							alert("请输入搜索内容");
							return;
						}
						window.location = "leaseRoom.do?method=searchRoomIndex&showPage=1&title=" + title;
					}
				</script>

			</DIV>
		</DIV>
		<DIV class=header_BottomR></DIV>
	</DIV>


	<DIV class=Main>

		<DIV class=house_attribute>
			<DIV class=house_boxL>
				<DIV class=house_boxLL></DIV>
				<DIV class=house_boxLC></DIV>
				<DIV class=house_boxLR></DIV>
			</DIV>

			<DIV class=house_boxC>
				<DIV class=house_box1>
					<DIV class=attribute_title><STRONG>区域:</STRONG></DIV>
					<DIV class=attribute><a
							href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=1"><SPAN>全部</SPAN></a>
						<%--<logic:empty name="alist">--%>
						<%--<jsp:forward page="leaseRoom.do?method=showRoomIndex&showPage=1"></jsp:forward>--%>
						<%--</logic:empty>--%>
						<%--<logic:iterate id="areas" name="alist">--%>
						<%--<A title=${areas.area } --%>
						<%--href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage }--%>
						<%--&areaName=${areas.area }&startPrice=${leaseRoomForm.startPrice }&--%>
						<%--endPrice=${leaseRoomForm.endPrice }&houseType=${leaseRoomForm.houseType }&--%>
						<%--chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">${areas.area }</A> --%>
						<%--</logic:iterate>--%>
					</DIV>
				</DIV>

				<DIV class=house_box>
					<DIV class=attribute_title><STRONG>租金:</STRONG></DIV>
					<DIV class=attribute><a
							href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=1"><SPAN>不限</SPAN></a>
						<A title="500元以下"
						   href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage }&areaName=${leaseRoomForm.areaName }&endPrice=500&houseType=${leaseRoomForm.houseType }&chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">500元以下</A>

						<A title="500-800元" href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage }&
areaName=${leaseRoomForm.areaName }&startPrice=500&endPrice=800&
houseType=${leaseRoomForm.houseType }&
chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">500-800元</A>

						<A title="800-1200元" href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage }&
areaName=${leaseRoomForm.areaName}&startPrice=800&endPrice=1200&
houseType=${leaseRoomForm.houseType }&
chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">800-1200元</A>


						<A title=1200-1800元 href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage }&
areaName=${leaseRoomForm.areaName}&startPrice=1200&endPrice=1800&
houseType=${leaseRoomForm.houseType }&
chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">1200-1800元</A>

						<A title=1800-2500元 href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage }&
areaName=${leaseRoomForm.areaName}&startPrice=1800&endPrice=2500&
houseType=${leaseRoomForm.houseType }&
chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">1800-2500元</A>

						<A title=3500-5000元 href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage }&
areaName=${leaseRoomForm.areaName }&startPrice=2500&endPrice=3500&
houseType=${leaseRoomForm.houseType }&
chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">2500-3500元</A>

						<A title=5000-100000元 href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage }&
areaName=${leaseRoomForm.areaName}&startPrice=3500&endPrice=5000&
houseType=${leaseRoomForm.houseType }&
chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">3500-5000元</A>

						<A title=5000元 href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage }&
areaName=${leaseRoomForm.areaName }&startPrice=5000&
houseType=${leaseRoomForm.houseType }&
chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">5000元以上</A>

					</DIV>
				</DIV>

				<DIV class=house_box>
					<DIV class=attribute_title><STRONG>房型:</STRONG></DIV>
					<DIV class=attribute><a
							href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=1"><SPAN>不限</SPAN></a>
						<A title=一室 href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage }&
areaName=${leaseRoomForm.areaName }&startPrice=${leaseRoomForm.startPrice }&
endPrice=${leaseRoomForm.endPrice }&houseType=${leaseRoomForm.houseType }&
chamber=1&orderBy=${leaseRoomForm.orderBy }"> 一室</A>

						<A title=二室 href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage }&
areaName=${leaseRoomForm.areaName }&startPrice=${leaseRoomForm.startPrice }&
endPrice=${leaseRoomForm.endPrice }&houseType=${leaseRoomForm.houseType }&
chamber=2&orderBy=${leaseRoomForm.orderBy }">二室</A>

						<A title=三室 href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage }&
areaName=${leaseRoomForm.areaName }&startPrice=${leaseRoomForm.startPrice }&
endPrice=${leaseRoomForm.endPrice }&houseType=${leaseRoomForm.houseType }&
chamber=3&orderBy=${leaseRoomForm.orderBy }">三室</A>

						<A title=四室 href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage }&
areaName=${leaseRoomForm.areaName }&startPrice=${leaseRoomForm.startPrice }&
endPrice=${leaseRoomForm.endPrice }&houseType=${leaseRoomForm.houseType }& chamber=4&
orderBy=${leaseRoomForm.orderBy }">四室</A>

						<A title=五室 href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage }&
areaName=${leaseRoomForm.areaName }&startPrice=${leaseRoomForm.startPrice }&
endPrice=${leaseRoomForm.endPrice }&houseType=${leaseRoomForm.houseType }&
chamber=5&orderBy=${leaseRoomForm.orderBy }">五室</A>

						<A title=五室以上 href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage }&
areaName=${leaseRoomForm.areaName }&startPrice=${leaseRoomForm.startPrice }&
endPrice=${leaseRoomForm.endPrice }&houseType=${leaseRoomForm.houseType }&
chamber=6&orderBy=${leaseRoomForm.orderBy }">五室以上</A>
					</DIV>
				</DIV>
				<script type="text/javascript">
					function searchgo() {

						var startPrice = document.getElementsByName("startPrice")[0].value;
						var endPrice = document.getElementsByName("endPrice")[0].value;
						var pre = /^\d+(\.\d+)?$/;

						if (startPrice == "" && endPrice == "") {
							alert("请输入搜索价格");
							return;
						}

						if (!pre.exec(startPrice) && startPrice != "" || !pre.exec(endPrice) && endPrice != "") {
							alert("搜索价格输入不正确");
							return;
						}
						window.location = "leaseRoom.do?method=showRoomIndex&showPage=1&startPrice=" + startPrice + "&endPrice=" + endPrice;
					}

					function order_by() {
						var orderby = document.getElementsByName("orderBy")[0].value;
						window.location = "leaseRoom.do?method=showRoomIndex&showPage=1&orderBy=" + orderby;
					}

					function h_type() {
						var htype = document.getElementsByName("htypeId")[0].value;

						window.location = "leaseRoom.do?method=showRoomIndex&showPage=1&houseType=" + htype;
					}
				</script>

				<DIV class=rent_filter>
					<%--<html:form action="leaseRoom" method="post">--%>
					<%--价格：--%>
					<%--<html:text property="startPrice" size="5" maxlength="10" /> - --%>
					<%--<html:text property="endPrice" size="5" maxlength="10"/>元--%>
					<%--<INPUT onclick="searchgo();" type=button value=筛选>&nbsp;&nbsp; --%>
					<%--<logic:notEmpty name="hlist">--%>
					<%--房屋类型：--%>
					<%--<html:select property="htypeId" onchange="h_type();">--%>
					<%--<html:optionsCollection name="hlist" value="id" label="type"/>--%>
					<%--</html:select>--%>
					<%--</logic:notEmpty>--%>


					<%--<html:select property="orderBy" title="默认时发布时间从新到旧" onchange="order_by();">--%>
					<%--<html:option value="0">默认排序</html:option>--%>
					<%--<html:option value="acreageDESC">面积从大到小</html:option>--%>
					<%--<html:option value="acreage">面积从小到大</html:option>--%>
					<%--<html:option value="priceDESC">租金从高到低</html:option>--%>
					<%--<html:option value="price">租金从低到高</html:option>--%>
					<%--<html:option value="time">发布时间从旧到新</html:option>--%>
					<%--</html:select>--%>

					<%--</html:form>--%>


				</DIV>
			</DIV>

			<DIV class=house_boxR>
				<DIV class=house_boxRL></DIV>
				<DIV class=house_boxRC></DIV>
				<DIV class=house_boxRR></DIV>
			</DIV>
		</DIV>
		<DIV class=left>
			<DIV class=search_bar>
				<DIV class=search_top>
					<UL>
						<LI class=tab_current><SPAN>房源信息</SPAN></LI>
					</UL>

					<DIV class="page_con"><SPAN class=page-info>${showPage }/${allPage }</SPAN>
						<A href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=1
&areaName=${leaseRoomForm.areaName }&startPrice=${leaseRoomForm.startPrice }&
endPrice=${leaseRoomForm.endPrice }&houseType=${leaseRoomForm.houseType }&
chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">首页</A>
						<%--<logic:notEqual value="1" name="showPage">--%>
						<%--<A href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage-1 }--%>
						<%--&areaName=${leaseRoomForm.areaName }&startPrice=${leaseRoomForm.startPrice }&--%>
						<%--endPrice=${leaseRoomForm.endPrice }&houseType=${leaseRoomForm.houseType }&--%>
						<%--chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">上一页</A> --%>
						<%--</logic:notEqual>--%>
						<%--<logic:lessThan value="${allPage}" name="showPage">--%>
						<%--<A href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage+1 }--%>
						<%--&areaName=${leaseRoomForm.areaName }&startPrice=${leaseRoomForm.startPrice }&--%>
						<%--endPrice=${leaseRoomForm.endPrice }&houseType=${leaseRoomForm.houseType }&--%>
						<%--chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">下一页</A> --%>
						<%--</logic:lessThan>--%>
						<A href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${allPage }
&areaName=${leaseRoomForm.areaName }&startPrice=${leaseRoomForm.startPrice }&
endPrice=${leaseRoomForm.endPrice }&houseType=${leaseRoomForm.houseType }&
chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">尾页</A>
					</DIV>
				</DIV>
				<DIV class=search_bottom>
					<DIV class=house_total>共有<STRONG>${allCount }</STRONG>套符合条件的房源</DIV>
				</DIV>
			</DIV>
			<DIV class=search_list>
				<OL id=list_box>

					<%--<logic:notEmpty name="rlList">--%>
					<%--<logic:iterate id="room" name="rlList">--%>
					<%--<LI>--%>
					<%--<DIV class=photo>--%>
					<%--<!-- 没有图片 -->--%>
					<%--<logic:empty name="room" property="img">--%>
					<%--<A title="暂无图片" href="<%=path%>/leaseRoom.do?method=getleaseRoom&id=${room.id }" target=_blank>--%>
					<%--<img src="<%=path%>/images/no-pic2.gif"> </A>--%>
					<%--</logic:empty>--%>
					<%--<!-- 有图片 -->--%>
					<%--<logic:notEmpty name="room" property="img">--%>
					<%--<A title="${room.title }，${room.areaType.area }" href="<%=path%>/leaseRoom.do?method=getleaseRoom&id=${room.id }" target=_blank>--%>
					<%--<img src="<%=path%>/uploadIMG/${room.img }"> </A>--%>
					<%--</logic:notEmpty>--%>
					<%--</DIV>--%>
					<%----%>
					<%--<DIV class=information>--%>
					<%--<H4>--%>
					<%--<A title="" href="<%=path%>/leaseRoom.do?method=getleaseRoom&id=${room.id }" target=_blank>--%>
					<%--${room.title }，${room.areaType.area },${room.houseType.type }--%>
					<%--</A> </H4>--%>
					<%--<P class=link_dark>--%>
					<%--相关设施：${room. esthment}</P>--%>
					<%----%>
					<%--<P>面积：${room.acreage }平米， </P>--%>
					<%--<P class="link_dark">发布时间：${room.time }</P></DIV>--%>
					<%--<DIV class=area><SPAN>${room.chamber }室${room.hall }厅${room.toilet }卫</SPAN> </DIV>--%>
					<%--<DIV class=price><STRONG>${room.pirce }</STRONG> 元/月 </DIV>--%>
					<%--</LI>--%>
					<%--</logic:iterate>--%>
					<%--</logic:notEmpty>--%>


				</OL>
			</DIV>
			<DIV class=pages_box>
				<DIV class="page_con">
					<SPAN>${showPage }/${allPage }</SPAN>
					<A href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=1
&areaName=${leaseRoomForm.areaName }&startPrice=${leaseRoomForm.startPrice }&
endPrice=${leaseRoomForm.endPrice }&houseType=${leaseRoomForm.houseType }&
chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">首页</A>
					<%--<logic:notEqual value="1" name="showPage">--%>
					<%--<A href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage-1 }--%>
					<%--&areaName=${leaseRoomForm.areaName }&startPrice=${leaseRoomForm.startPrice }&--%>
					<%--endPrice=${leaseRoomForm.endPrice }&houseType=${leaseRoomForm.houseType }&--%>
					<%--chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">上一页</A> --%>
					<%--</logic:notEqual>--%>
					<%--<logic:lessThan value="${allPage}" name="showPage">--%>
					<%--<A href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${showPage+1 }--%>
					<%--&areaName=${leaseRoomForm.areaName }&startPrice=${leaseRoomForm.startPrice }&--%>
					<%--endPrice=${leaseRoomForm.endPrice }&houseType=${leaseRoomForm.houseType }&--%>
					<%--chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">下一页</A> --%>
					<%--</logic:lessThan>--%>
					<A href="<%=path%>/leaseRoom.do?method=showRoomIndex&showPage=${allPage }
&areaName=${leaseRoomForm.areaName }&startPrice=${leaseRoomForm.startPrice }&
endPrice=${leaseRoomForm.endPrice }&houseType=${leaseRoomForm.houseType }&
chamber=${leaseRoomForm.chamber }&orderBy=${leaseRoomForm.orderBy }">尾页</A>

					<br>
				</DIV>
			</DIV>
		</DIV>
		<DIV class=right><!--右侧载入-->
			<DIV class=transactions><A href="<%=path%>/usercz.jsp"><IMG
					alt=发布房屋出租信息 src="<%=path%>/images/rent_btn.gif"></A></DIV>

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
					<H5>最新发布的出租房源信息</H5>
				</DIV>

				<%--<logic:notEmpty name="list">--%>
				<%--<logic:iterate id="troom" name="list" length="5">--%>
				<%--<DIV class=multi_pic>--%>
				<%--<!-- 没有图片 -->--%>
				<%--<logic:empty name="troom" property="img">--%>
				<%--<DIV class=multi_pic_l>--%>
				<%--<A title="暂无图片" href="<%=path%>/leaseRoom.do?method=getleaseRoom&id=${troom.id }" target=_blank>--%>
				<%--<img src="<%=path%>/images/no-pic2.gif" height=60 width="80"> </A></DIV>--%>
				<%--</logic:empty>--%>
				<%--<!-- 有图片 --> --%>
				<%--<logic:notEmpty name="troom" property="img">--%>
				<%--<DIV class=multi_pic_l>--%>
				<%--<A  title="${troom.title }，${troom.areaType.area }" --%>
				<%--href="<%=path%>/leaseRoom.do?method=getleaseRoom&id=${troom.id }" target=_blank>--%>
				<%--<img src="<%=path%>/uploadIMG/${troom.img }" height=60 width="80"></A></DIV>--%>
				<%--</logic:notEmpty>   --%>
				<%----%>
				<%----%>
				<%--<DIV class=multi_pic_r>--%>
				<%--<A href="<%=path%>/leaseRoom.do?method=getleaseRoom&id=${troom.id }" target=_blank>${troom.title }(${troom.areaType.area })</A>--%>
				<%--<BR>--%>
				<%--${troom.chamber }室${troom.hall }厅${troom.toilet }卫--%>
				<%--${troom.acreage }平米<BR><SPAN class=pay_1>${troom.pirce }</SPAN></DIV></DIV>--%>
				<%--</logic:iterate>--%>
				<%--</logic:notEmpty>--%>


			</DIV>
		</DIV>
		<DIV class=clear></DIV>
		<DIV class=footer>
			<DIV style="HEIGHT: 10px"><SPAN></SPAN></DIV>
			<DIV style="PADDING-TOP: 5px; TEXT-ALIGN: center">Copyright 2013 WWW.HLAU.CN
				All Rights Reserved
			</DIV>
			<DIV style="PADDING-TOP: 5px; TEXT-ALIGN: center" align=center><SPAN><A
					href="">黑ICP备1234 5678号</A></SPAN></DIV>
		</DIV>
	</DIV>
</div>
</BODY>
</HTML>