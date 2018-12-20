<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
    <title>menu</title>
<link href="images/logo-esf.png" rel="shortcut icon">
<link rel="stylesheet" href="skin/css/base.css" type="text/css" />
<link rel="stylesheet" href="skin/css/menu.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script language='javascript'>var curopenItem = '1';</script>
<script language="javascript" type="text/javascript" src="skin/js/frame/menu.js"></script>
<base target="main" />
</head>
<body target="main">
<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
  <tr>
    <td style='padding-left:3px;padding-top:8px' valign="top">
	<!-- Item 1 Strat -->
      <dl class='bitem'>
        <dt><b>管理员管理</b></dt>
        <dd style='display:block' class='sitem' id='items1_1'>
          <ul class='sitemu'>
            <li>
              <div class='items'>
                <div class='fllct'><a href='AddAdmin.jsp' target='main'>添加管理员</a></div>
              </div>
            </li>
            <li><a href='admin.do?method=SelectAdmin' target='main'>查看/编辑管理员</a> </li>
          </ul>
        </dd>
      </dl>
      <!-- Item 1 End -->
    
	  
	  <dl class='bitem'>
        <dt><b>房源管理</b></dt>
        <dd style='display:block' class='sitem' id='items1_1'>
          <ul class='sitemu'>
            <li>
              
                <div class='fllct'><a href='areaType.do?method=selectArea' target='main'>区域管理</a></div>
				
            </li>
            <li><a href='houseType.do?method=selectHouse_type' target='main'>房源类别管理</a> </li>
           
          </ul>
        </dd>
      </dl>
	  
	  <dl class='bitem'>
        <dt><b>房源审核管理</b></dt>
        <dd style='display:block' class='sitem' id='items1_1'>
          <ul class='sitemu'>
            <li>
              <div class='items'>
                <div class='fllct'><a href='leaseRoom.do?method=showRoomAdmin&showPage=1' target='main'>查看/编辑出租房源信息</a></div>
              </div>
            </li>
          </ul>
        </dd>
      </dl>
	  
	  <dl class='bitem'>
        <dt><b>用户管理</b></dt>
        <dd style='display:block' class='sitem' id='items1_1'>
          <ul class='sitemu'>
            <li>
              <div class='items'>
                <div class='fllct'><a href='users.do?method=showUsers&showPage=1' target='main'>查看用户信息</a></div>
              </div>
            </li>
          </ul>
        </dd>
      </dl>
	  
	  </td>
  </tr>
</table>
</body>
</html>