<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>租房网-智慧旅游基础服务</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
</head>
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
                                <img alt="image" class="img-circle" src="${staticUpfileCtx }${companyemployeephoto}"
                                     onerror="imgLaoded(this)" style="width: 90px;height: 90px;"/>
                            </div>
                        </div>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                    <span class="clear">
                                    <span class="text-muted text-center block">${companyemployeename}<b
                                            class="caret"></b></span>
                                    </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a class="J_menuItem" href="${ctx}/company/employee/selfmanagerpwd">修改密码</a>
                            </li>
                            <li><a class="J_menuItem" href="${ctx}/company/employee/selfinfo">个人资料</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="${ctx}/company/logout">安全退出</a>
                            </li>
                        </ul>
                    </div>
                    <div class="logo-element">${companyemployeename}
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
                <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i
                        class="fa fa-bars"></i> </a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li id="w_tooltips" data-original-title="快速了解系统设置" data-placement="left">
                        <div class="text-center link-block">
                            <a class="J_menuItem" href="${ctx}/company/wizard/index">
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
                    <a href="javascript:;" class="active J_menuTab" data-id="${ctx}/company/index_v">首页 <i title="刷新"
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
            <a href="${ctx}/company/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i>
                退出</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${staticCtx}/company/index_v"
                    frameborder="0" data-id="${ctx}/company/index_v" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">技术支持：租房网
                &copy; 2015-2017 <a href="http://www.unionticket.cn/" target="_blank">x@uto2o.com</a>
            </div>
        </div>
    </div>
    <!--右侧部分结束-->
    <!--右侧边栏开始-->
    <div id="right-sidebar">
        <div class="sidebar-container">
            <ul class="nav nav-tabs navs-2">
                <li class="active">
                    <a data-toggle="tab" href="#tab-1">
                        <i class="fa fa-tv"></i> 业务系统
                    </a>
                </li>
                <li class="">
                    <a data-toggle="tab" href="#tab-2">
                        <i class="fa fa-gear"></i> 系统设置
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div id="showBusiness">
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="skin-setttings">
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
    $(function () {
        initMenu();
        showBusiness();
        //$("#w_tooltips").tooltip('show');
    });

    //显示该景区所拥有的业务系统
    function showBusiness() {
        $.ajax({
            type: "post",
            dataType: "json",
            url: "${ctx}/company/info/showBusiness",
            data: {
                _method: "get"
            },
            success: function (data) {
                $("#showBusiness").html("");
                var str = "";
                if (data.whiteIpList2.length > 0) {
                    $.each(data.whiteIpList2, function (i, e) {
                        str += "<div class=\"sidebar-message\"> " +
                            "<div class=\"widget style1 navy-bg text-center\"  id=\"widget_2_" + i + "\">" +
                            "<a style='width: 100%' class=\"btn btn-sm btn-outline btn-rounded\" id=\"btn_2_" + i + "\" onclick=\"fsaleSSO(\'" + e.webSiteUrl + "\')\">" +
                            "<i class=\"fa fa-users fa-3x\"></i>" +
                            "<h3 class=\"font-bold\">分销业务系统" + i + "</h3>" +
                            "<p style='width: 100%;white-space: initial;word-wrap: break-word;word-break: normal;display: block;'>" + e.webSiteUrl + "</p>" +
                            "</a>" +
                            "</div>" +
                            "</div>"
                    });
                }
                if (data.whiteIpList3.length > 0) {
                    $.each(data.whiteIpList3, function (i, e) {
                        str += "<div class=\"sidebar-message\"> " +
                            "<div class=\"widget style1 navy-bg text-center\" id=\"widget_3_" + i + "\">" +
                            "<a style='width: 100%' class=\"btn btn-sm btn-outline btn-rounded\" id=\"btn_3_" + i + "\" onclick=\"wsaleSSO(\'" + e.webSiteUrl + "\')\">" +
                            "<i class=\"fa fa-cart-arrow-down fa-3x\"></i>" +
                            "<h3 class=\"font-bold\">电商业务系统" + i + "</h3>" +
                            "<p style='width: 100%;white-space: initial;word-wrap: break-word;word-break: normal;display: block;'>" + e.webSiteUrl + "</p>" +
                            "</a>" +
                            "</div>" +
                            "</div>"
                    });
                }
                if (data.whiteIpList4.length > 0) {
                    $.each(data.whiteIpList4, function (i, e) {
                        str += "<div class=\"sidebar-message\"> " +
                            "<div class=\"widget style1 navy-bg text-center\" id=\"widget_4_" + i + "\">" +
                            "<a style='width: 100%' class=\"btn btn-sm btn-outline btn-rounded\" id=\"btn_4_" + i + "\" onclick=\"wsaleSSO(\'" + e.webSiteUrl + "\')\">" +
                            "<i class=\"fa fa-laptop fa-3x\"></i>" +
                            "<h3 class=\"font-bold\">窗口业务系统" + i + "</h3>" +
                            "<p style='width: 100%;white-space: initial;word-wrap: break-word;word-break: normal;display: block;'>" + e.webSiteUrl + "</p>" +
                            "</a>" +
                            "</div>" +
                            "</div>"
                    });
                }
                if (data.whiteIpList5.length > 0) {
                    $.each(data.whiteIpList5, function (i, e) {
                        str += "<div class=\"sidebar-message\"> " +
                            "<div class=\"widget style1 navy-bg text-center\" id=\"widget_5_" + i + "\">" +
                            "<a style='width: 100%' class=\"btn btn-sm btn-outline btn-rounded\" id=\"btn_5_" + i + "\" onclick=\"wsaleSSO(\'" + e.webSiteUrl + "\')\">" +
                            "<i class=\"fa fa-laptop fa-3x\"></i>" +
                            "<h3 class=\"font-bold\">窗口售票系统" + i + "</h3>" +
                            "<p style='width: 100%;white-space: initial;word-wrap: break-word;word-break: normal;display: block;'>" + e.webSiteUrl + "</p>" +
                            "</a>" +
                            "</div>" +
                            "</div>"
                    });
                }
                if (data.whiteIpList6.length > 0) {
                    $.each(data.whiteIpList6, function (i, e) {
                        str += "<div class=\"sidebar-message\"> " +
                            "<div class=\"widget style1 navy-bg text-center\" id=\"widget_6_" + i + "\">" +
                            "<a style='width: 100%' class=\"btn btn-sm btn-outline btn-rounded\" id=\"btn_6_" + i + "\" onclick=\"wsaleSSO(\'" + e.webSiteUrl + "\')\">" +
                            "<i class=\"fa fa-laptop fa-3x\"></i>" +
                            "<h3 class=\"font-bold\">旅行社业务系统" + i + "</h3>" +
                            "<p style='width: 100%;white-space: initial;word-wrap: break-word;word-break: normal;display: block;'>" + e.webSiteUrl + "</p>" +
                            "</a>" +
                            "</div>" +
                            "</div>"
                    });
                }
                $("#showBusiness").html(str);
            },
            error: function (jqXHR, textStatus, errorThrown) {
            }
        });
    }

    //如果传入的字符串长度超过25则没25长度换行一次
    function strAddBr(str) {
        var s = '';
        for (var i = 0; i < str.length; i++) {
            s = s + str.charAt(i);
            if (i % 25 == 0 && i != 0 && i != str.length - 1) {
                s = s + '<br>';
            }
        }
        return s;
    }


    function initMenu() {
        $.ajax({
            type: "get",
            dataType: "json",
            async: false,
            url: ctx + "/company/employeeMenu/tree",
            success: function (data) {
                var menulist = "";
                $.each(data.pathRow1, function (j, o) {
                    menulist += "<li><a href=\"#\"><i class=\"fa " + o.iconCss + "\"></i><span class=\"nav-label\">"
                    menulist += o.menuName
                    menulist += "</span><span class=\"fa arrow\"></span></a>"
                    menulist += "<ul class=\"nav nav-second-level\">"
                    $.each(data.pathRow2, function (i, p) {
                        if (p.parentId == o.id) {
                            menulist += "<li><a class=\"J_menuItem\" href=\"" + ctx + p.gotoPageUrl + "\">"
                            menulist += p.menuName + "</a></li>"
                        }
                    });
                    menulist += "</ul>"
                    menulist += "</li>";
                });
                $("#side-menu").append(menulist);
            }
        });
    }

    function wsaleSSO(url) {
        $.ajax({
            type: "get",
            dataType: "json",
            async: false,
            url: ctx + "/company/sso/wsale",
            data: {
                _method: "post",
                url: url
            },
            success: function (data) {
                window.open(url + "/sso/login?tkt=" + data);
            }
        });
    }

    function fsaleSSO(url) {
        $.ajax({
            type: "get",
            dataType: "json",
            async: false,
            url: ctx + "/company/sso/fsale",
            data: {
                _method: "post",
                url: url
            },
            success: function (data) {
                window.open(url + "/sso/login?tkt=" + data);
            }
        });
    }

    function imgLaoded(img) {
        img.src = ctx + "/upfile/default.jpg";
        img.onerror = null; //如果错误图片也不存在就会死循环一直跳，所以要设置成null，也可以不加
    }
</script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/layer/layer.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/hplus.min.js?v=4.1.0"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/contabs.min.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/pace/pace.min.js"></script>
<script type="text/javascript" src="${ctx }/common/js/common.js"></script>
</body>
</html>
