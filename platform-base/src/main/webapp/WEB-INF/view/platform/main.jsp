<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
</head>
<title>租房网-智慧旅游基础服务</title>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <div class="text-center">
                            <div class="m-b-sm">
                                <img alt="image" class="img-circle" onerror="imgLaoded(this)"
                                     src="${staticUpfileCtx }${platformemployeelogo}"
                                     style="width: 90px;height: 90px;"/>
                            </div>
                        </div>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear">
                               <span class="text-muted text-center block">${platformemployeename}<b class="caret"></b>
                               </span>
                            </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a class="J_menuItem" href="${ctx}/platform/employee/slefmanagerpwd">修改密码</a>
                            </li>
                            <li><a class="J_menuItem" href="${ctx}/platform/employee/slefinfo">个人资料</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="${ctx}/platform/logout">安全退出</a>
                            </li>
                        </ul>
                    </div>
                    <div class="logo-element">${platformemployeename}
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#">
                        <i class="fa fa-bars"></i>
                    </a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i>
                            <span class="label label-warning">${noticeCount}</span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <c:forEach var="item" items="${requestScope.noticeList}">
                                <li class="m-t-xs">
                                    <div class="dropdown-messages-box">
                                        <a href="${ctx}/platform/notice/info?id=${item.id}"
                                           class="J_menuItem pull-left">
                                            <i class="fa fa-comment"></i><strong>通知</strong>
                                        </a>
                                        <div class="media-body">
                                            <small class="pull-left">${item.noticeName}</small>
                                            <br>
                                            <small class="text-muted">发布日期：${item.dataCreateTime}</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                            </c:forEach>
                            <li>
                                <div class="text-center link-block">
                                    <a class="J_menuItem" href="${ctx}/platform/notice/viewList">
                                        <i class="fa fa-envelope"></i> <strong> 查看所有通知</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <div class="text-center link-block">
                            <a class="J_menuItem" href="${ctx}/platform/wizard/index">
                                <i class="fa fa-flag"></i> <strong> 业务设置向导</strong>
                            </a>
                        </div>
                    </li>
                    <li class="dropdown hidden-xs">
                        <a class="right-sidebar-toggle" aria-expanded="false">
                            <i class="fa fa-tasks"></i>设置
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id="${ctx}/platform/index_v">首页 <i title="刷新"
                                                                                                            class="fa fa-refresh"></i></a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
            </button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">操作<span class="caret"></span>
                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                    </li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                    </li>
                </ul>
            </div>
            <a href="${ctx}/web/platform/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx}/platform/index_v"
                    frameborder="0" data-id="${ctx}/platform/index_v" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">技术支持：租房网
                &copy; 2016-2017
                <a href="http://www.unionticket.cn/" target="_blank">x@uto2o.com</a>
            </div>
        </div>
    </div>
    <!--右侧部分结束-->
    <!--右侧边栏开始-->
    <div id="right-sidebar">
        <div class="sidebar-container">
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="skin-setttings">
                        <div class="title">系统设置</div>
                        <div class="setings-item">
                            <span>收起左侧菜单</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox"
                                           id="collapsemenu">
                                    <label class="onoffswitch-label" for="collapsemenu">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>固定顶部</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox"
                                           id="fixednavbar">
                                    <label class="onoffswitch-label" for="fixednavbar">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>固定宽度</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox"
                                           id="boxedlayout">
                                    <label class="onoffswitch-label" for="boxedlayout">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--右侧边栏结束-->
</div>
<script type="text/javascript" src="${staticCtx }/common/h5/js/jquery.min.js?v=2.1.4"></script>
<script type="text/javascript">
    function imgLaoded(img) {
        img.src = staticCtx + "/upfile/default.jpg";
        img.onerror = null; //如果错误图片也不存在就会死循环一直跳，所以要设置成null，也可以不加
    }
</script>
<script type="text/javascript" src="${staticCtx }/common/js/mymenu.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/layer/layer.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/hplus.min.js?v=4.1.0"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/contabs.min.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/pace/pace.min.js"></script>
<script type="text/javascript" src="${staticCtx }/common/js/common.js"></script>
</body>
</html>
