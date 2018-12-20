<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>业务设置向导</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="${staticCtx }/common/h5/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/animate.min.css" rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/style.min862f.css?v=4.1.0" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="row">
    <div class="col-sm-12">
        <div class="wrapper wrapper-content">
            <div class="row animated fadeInRight">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="text-center float-e-margins p-md">
                            <span>业务分类：</span>
                            <a href="#" onclick="platformShow();" class="btn btn-xs btn-primary">基础平台平台用户登录</a>
                        </div>
                        <div class="" id="ibox-content">
                            <%--<div id="vertical-timeline" class="vertical-container light-timeline">
                                <div class="vertical-timeline-block">
                                    <div class="vertical-timeline-icon blue-bg">
                                        <i class="fa fa-file-text"></i>
                                    </div>--%>
                            <div id="vertical-timeline" class="vertical-container light-timeline center-orientation"
                                 style="display: none">
                                <div class="vertical-timeline-block">
                                    <div class="vertical-timeline-icon blue-bg">
                                        <i class="fa fa-file-text"></i>
                                    </div>
                                    <div class="vertical-timeline-content">
                                        <h2>1.运行企业信息维护 <i class="fa fa-angle-double-right"></i> 业务系统菜单管理</h2>
                                        <p>
                                            <span style="display:block;padding-left:20px">
                                            &emsp;&emsp;各个业务系统（基础平台景区系统、窗口、分销、电商、旅行社、年卡等）功能菜单及路径管理。<br>
                                            &emsp;&emsp;业务系统权限管理及各个业务系统权限管理需使用业务系统菜单信息，拥有相应的菜单权限方可进行相应的功能模块管理操作。
                                            </span>
                                        </p>
                                        <%--<a href="#" class="btn btn-sm btn-primary"> 更多信息</a>--%>
                                        <%--<span class="vertical-date">--%>
                                        <%--今天 <br>--%>
                                        <%--<small>2月3日</small>--%>
                                        <%--</span>--%>
                                    </div>
                                </div>

                                <div class="vertical-timeline-block">
                                    <div class="vertical-timeline-icon blue-bg">
                                        <i class="fa fa-file-text"></i>
                                    </div>

                                    <div class="vertical-timeline-content">
                                        <h2>2.运营企业信息维护 <i class="fa fa-angle-double-right"></i> 业务系统权限管理</h2>
                                        <p>
                                            <span style="display:block;padding-left:20px">
                                            &emsp;&emsp;各个业务系统相应权限的分组管理，可设置多个权限分组，并在分组内设置各个业务系统（基础平台景区系统、窗口、分销、电商、旅行社、年卡等）的菜单权限各个业务系统相应权限的分组管理，可设置多个权限分组，并在分组内设置各个业务系统（基础平台景区系统、窗口、分销、电商、旅行社、年卡等）的菜单权限。<br>
                                            &emsp;&emsp;此处设置的业务系统菜单权限为分配给各个业务系统的原始权限，各个业务系统可根据拥有的原始权限基础上分配给下属员工。
                                            </span>
                                        </p>
                                    </div>
                                </div>

                                <div class="vertical-timeline-block">
                                    <div class="vertical-timeline-icon blue-bg">
                                        <i class="fa fa-file-text"></i>
                                    </div>

                                    <div class="vertical-timeline-content">
                                        <h2>3.运营企业信息维护 <i class="fa fa-angle-double-right"></i> 运营企业信息维护</h2>
                                        <p>
                                            <span style="display:block;padding-left:20px">
                                            &emsp;&emsp;设置基础平台服务的运营企业信息（可服务多个企业）及企业下属的景区基本信息。<br>
                                            &emsp;&emsp;景区基础信息中包含自动生成的景区代码、appID和appKey为系统标识性信息，系统会默认为景区创建一个系统管理员（“admin@景区代码”默认密码“000000”）。<br>
                                            &emsp;&emsp;创建企业下属景区信息后可使用景区系统管理员账户登录到基础平台景区登录模块进行景区基本信息维护。
                                            </span>
                                        </p>
                                    </div>
                                </div>

                                <div class="vertical-timeline-block">
                                    <div class="vertical-timeline-icon blue-bg">
                                        <i class="fa fa-file-text"></i>
                                    </div>

                                    <div class="vertical-timeline-content">
                                        <h2>4.运营企业信息维护 <i class="fa fa-angle-double-right"></i> 业务系统服务管理</h2>
                                        <p>
                                            <span style="display:block;padding-left:20px">
                                            &emsp;&emsp;设置基础平台提供服务的各个景区相应业务系统的基本信息，主要包含景区相应业务系统的类型（窗口、分销、电商、旅行社、年卡等）、IP地址、域名、端口等信息。<br>
                                            &emsp;&emsp;系统会自动为业务系统服务生成一个系统标识码作为系统服务的唯一标识。<br>
                                            &emsp;&emsp;部署基础平台提供服务的各个业务系统时需配置相应的标识码等参数，基础平台只为在此处添加过服务管理信息的业务系统提供数据服务。<br>
                                            &emsp;&emsp;为分销业务系统添加系统服务时需录入分销系统管理账户及密码（用于分销平台后台登录管理），可基于业务系统服务进行景区授权，授权给分销平台的景区可作为供应商角色登录到授权的分销平台进行管理和签约分销商。
                                            </span>
                                        </p>
                                    </div>
                                </div>

                                <div class="vertical-timeline-block">
                                    <div class="vertical-timeline-icon blue-bg">
                                        <i class="fa fa-file-text"></i>
                                    </div>

                                    <div class="vertical-timeline-content">
                                        <h2>5.系统管理 <i class="fa fa-angle-double-right"></i> 菜单管理</h2>
                                        <p>
                                            <span style="display:block;padding-left:20px">
                                            &emsp;&emsp;基础平台平台用户登录中的各个功能菜单和地址信息的管理。<br>
                                            &emsp;&emsp;添加平台员工信息时需对员工授权相应的功能菜单，员工方有相应菜单的操作权限。
                                            </span>
                                        </p>
                                    </div>
                                </div>
                                <div class="vertical-timeline-block">
                                    <div class="vertical-timeline-icon blue-bg">
                                        <i class="fa fa-file-text"></i>
                                    </div>

                                    <div class="vertical-timeline-content">
                                        <h2>6.系统管理 <i class="fa fa-angle-double-right"></i> 部门管理</h2>
                                        <p>
                                            <span style="display:block;padding-left:20px">
                                            &emsp;&emsp;对于基础平台各个部门的管理操作。<br>
                                            &emsp;&emsp;添加平台员工信息时需选择相应的所属部门。
                                            </span>
                                        </p>
                                    </div>
                                </div>
                                <div class="vertical-timeline-block">
                                    <div class="vertical-timeline-icon blue-bg">
                                        <i class="fa fa-file-text"></i>
                                    </div>

                                    <div class="vertical-timeline-content">
                                        <h2>7.系统管理 <i class="fa fa-angle-double-right"></i> 员工管理</h2>
                                        <p>
                                            <span style="display:block;padding-left:20px">
                                            &emsp;&emsp;基础平台员工信息的管理操作，包含员工的基本信息和菜单授权。初始员工默认密码为“000000”。<br>
                                            &emsp;&emsp;员工信息添加成功并授权相应的功能菜单后即可通过员工账户或手机号进行基础平台平台登录并进行相应的功能操作。
                                            </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${staticCtx }/common/h5/js/jquery.min.js?v=2.1.4"></script>
<script src="${staticCtx }/common/h5/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${staticCtx }/common/h5/js/content.min.js?v=1.0.0"></script>
<script>
    $("#vertical-timeline").show();
</script>
</body>
</html>
