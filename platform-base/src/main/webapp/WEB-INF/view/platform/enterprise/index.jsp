<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${staticCtx }/common/h5/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <style type="text/css">
        .modal-backdrop {
            z-index: 0 !important;
            display: none;
        }

        .modal-open {
            overflow: auto !important;
        }
    </style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>企业信息</h5>
                    <div class="ibox-tools">
                        <button class="btn btn-xs btn-primary" type="button" onclick="add()"><i
                                class="fa fa-plus-square"></i>
                        </button>
                        <button class="btn btn-xs btn-primary" type="button" onclick="editor()"><i
                                class="fa fa-file-text"></i>
                        </button>
                        <button class="btn btn-xs btn-primary" type="button" onclick="dele()"><i
                                class="fa fa-minus-square"></i>
                        </button>
                        <button class="btn btn-xs btn-primary" type="button" onclick="loadOneMenu()">
                            <i class="fa fa-refresh" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="file-manager">
                        <div class="input-group">
                            <input placeholder="请输入企业名称" id="findEnterpriseName" name="name"
                                   class="input-sm form-control"
                                   type="text"> <span
                                class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary"
                                                onclick="loadOneMenu()"> 搜索
                                        </button> </span>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <ul class="folder-list m-b-md" id="leftOneMenu" aria-expanded="true"
                            style="padding: 0;line-height: 20px">
                        </ul>
                        <div class="hr-line-dashed"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-10">
            <div class="example">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>查询条件</h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                        隐藏
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <div class="row form-horizontal">
                                    <div class="col-sm-9">
                                        <label class="col-sm-2 control-label">景区代码</label>
                                        <div class="col-sm-3">
                                            <input type="text" placeholder="请输入景区代码进行查询"
                                                   class="form-control" id="findCompanyCode">
                                        </div>
                                        <label class="col-sm-2 control-label">景区名称</label>
                                        <div class="col-sm-3">
                                            <input type="text" placeholder="请输入景区名称进行查询"
                                                   class="form-control" id="findCompanyName">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <p>
                                            <button class="btn  btn-primary"
                                                    type="submit" onclick="findSelect()"><strong>查询</strong>
                                            </button>
                                            <button class="btn  btn-white"
                                                    onclick="clearSelect()"><strong>清空查询条件</strong>
                                            </button>
                                        </p>
                                    </div>
                                    <div class="col-sm-9">
                                        <label class="col-sm-2 control-label">联系人姓名</label>
                                        <div class="col-sm-3">
                                            <input type="text" placeholder="请输入联系人姓名进行查询"
                                                   class="form-control" id="findLinkInfo">
                                        </div>
                                        <label class="col-sm-2 control-label">电话号码</label>
                                        <div class="col-sm-3">
                                            <input type="text" placeholder="请输入电话号码进行查询"
                                                   class="form-control" id="findMobile">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ibox-content">
                <div id="tableToolbar" role="group">
                    <button type="button" class="btn btn-primary btn-xm" onclick="addCompany()">
                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>添加
                    </button>
                    <button type="button" class="btn btn-primary btn-xm" onclick="editorCompany()">
                        <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>修改
                    </button>
                    <button type="button" style="display: none;" class="btn btn-primary btn-xm" onclick="deleCompany()">
                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
                    </button>
                    <button type="button" class="btn  btn-xm btn-primary" onclick="formatPWD()">
                        <i class="glyphicon glyphicon-retweet" aria-hidden="true"></i>重置景区管理员密码
                    </button>
                    <button type="button" class="btn  btn-xm btn-primary" onclick="companyInfoTxt()">
                        <i class="glyphicon glyphicon-retweet" aria-hidden="true"></i>导出景区配置信息
                    </button>
                </div>
                <table id="table1" data-mobile-responsive="true">
                </table>
            </div>
        </div>
    </div>
</div>
<div id="editer_form_div" style="display: none;">
    <form class="form-horizontal" id="noticForm">
        <input type="hidden" name="_method" id="_method">
        <input type="hidden" name="id" id="id">
        <input type="hidden" id="token" name="token">
        <div class="col-md-12">
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">企业名称(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="enterpriseName" name="name" class="form-control"
                           placeholder="企业名称">
                </div>
                <label class="col-sm-2 control-label">企业地址(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="enterpriseAdress" name="address" class="form-control"
                           placeholder="企业地址">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">联系人姓名(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="linkManName" name="linkManName" class="form-control"
                           placeholder="联系人姓名">
                </div>
                <label class="col-sm-2 control-label">手机号码(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="mobile" name="mobile" class="form-control"
                           placeholder="手机号码">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">企业电话：</label>
                <div class="col-sm-3">
                    <input type="text" id="enterpriseTel" name="tel" class="form-control"
                           placeholder="电话格式：0000-0000000">
                </div>
                <label class="col-sm-2 control-label">企业网站：</label>
                <div class="col-sm-3">
                    <input type="text" id="enterpriseWebUrl" name="webUrl" class="form-control"
                           placeholder="网站格式:http://www.baidu.com">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">企业邮箱：</label>
                <div class="col-sm-3">
                    <input type="text" id="enterpriseEmail" name="email" class="form-control"
                           placeholder="邮箱格式xxx@xxx.xxx">
                </div>

                <label class="col-sm-2 control-label">企业传真：</label>
                <div class="col-sm-3">
                    <input type="text" id="enterpriseFax" name="fax" class="form-control"
                           placeholder="传真格式：0000-0000000">
                </div>

            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">企业介绍：</label>
                <div class="col-sm-3">
                    <input type="text" id="simpleInfo" name="simpleInfo" class="form-control"
                           placeholder="企业介绍">
                </div>

                <label class="col-sm-2 control-label">开户银行：</label>
                <div class="col-sm-3">
                    <input type="text" id="bankName" name="bankName" class="form-control"
                           placeholder="开户银行">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">银行账号：</label>
                <div class="col-sm-3">
                    <input id="bankAccount" name="bankAccount" class="form-control"
                           onkeyup='this.value=this.value.replace(/\D/gi,"")' placeholder="银行账号:只能输入数字">
                </div>
                <label class="col-sm-2 control-label">银行账号名称：</label>
                <div class="col-sm-3">
                    <input type="text" id="bankAccountName" name="bankAccountName" class="form-control"
                           placeholder="银行账号名称">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">备注：</label>
                <div class="col-sm-6">
                    <input type="text" id="memo" name="memo" class="form-control"
                           placeholder="备注">
                </div>

            </div>
            <div class="hr-line-dashed"></div>
        </div>
    </form>
</div>
<div id="editer_form_div_company" style="display: none;">
    <ul>
        <li>初始化景区管理员 <span style="color: red">用户名:admin@+企业编码   初始密码:000000</span></li>
    </ul>
    <form class="form-horizontal" id="noticForm_company">
        <input type="hidden" name="_method" id="_method_company">
        <input type="hidden" name="id" id="id_company">
        <input type="hidden" name="enterprise.id" id="id_enterprise">
        <input type="hidden" id="token_company" name="token">
        <input type="hidden" id="pwd" name="pwd">
        <input type="hidden" id="appKey" name="appKey">
        <div class="col-md-12">
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">景区代码：</label>
                <div class="col-sm-3">
                    <input readOnly="readOnly" id="companyCode" name="companyCode" class="form-control"
                           placeholder="景区代码" aria-required="true">
                    <span class="help-block m-b-none text-navy">系统自动分配，不可修改</span>
                </div>
                <label class="col-sm-2 control-label">appId：</label>
                <div class="col-sm-3">
                    <input readOnly="readOnly" id="appId" name="appId" class="form-control"
                           placeholder="appId">
                    <span class="help-block m-b-none text-navy">系统自动分配，不可修改</span>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">景区名称(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="companyName" name="companyName" class="form-control"
                           placeholder="景区名称" required>
                </div>
                <label class="col-sm-2 control-label">通道最大数量(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="channelMaxNum" name="channelMaxNum" class="form-control"
                           placeholder="通道数量">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">手机号码(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="mobileCompany" name="mobile" class="form-control"
                           placeholder="电话">
                </div>
                <label class="col-sm-2 control-label">联系人(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="linkInfo" name="linkInfo" class="form-control"
                           placeholder="联系人">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">地址(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="addressCompany" name="address" class="form-control"
                           placeholder="地址">
                </div>
                <label class="col-sm-2 control-label">选择权限组：</label>
                <div class="col-sm-3">
                    <select data-placeholder="选择权限组..." id="companyGroup" name="companyGroup"
                            class="chosen-select form-control" multiple="multiple" tabindex="2">
                    </select>
                    <span class="help-block m-b-none text-navy">多项（Ctrl+鼠标点击）</span>
                </div>

            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">排序(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="dataSort" name="dataSort" class="form-control"
                           placeholder="排序">
                </div>
                <label class="col-sm-2 control-label" for="useFlag1">状态(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <div class="radio radio-info radio-inline">
                        <input id="useFlag1" value="1" name="useFlag" checked="checked" type="radio">
                        <label for="useFlag1">启用</label>
                    </div>
                    <div class="radio radio-info radio-inline">
                        <input id="useFlag2" value="0" name="useFlag" type="radio">
                        <label for="useFlag2">禁用</label>
                    </div>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">email：</label>
                <div class="col-sm-3">
                    <input type="text" id="emailComapny" name="email" class="form-control"
                           placeholder="email">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">简介：</label>
                <div class="col-sm-9">
                    <input type="hidden" id="memoComapny" name="memo">
                    <div id="summernote" class="summernote"></div>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
        </div>

    </form>
</div>
<div id="show_auth_div" style="display: none;">
    <div class="col-md-12">
        <div class="hr-line-dashed"></div>
        <div class="panel panel-primary">
            <div class="panel-heading text-center">
                企业权限一览
            </div>
        </div>
        <div class="col-md-12" id="pathData1_id">
        </div>
    </div>
    <div class="col-md-12">
        <div class="hr-line-dashed"></div>
        <div class="panel panel-primary">
            <div class="panel-heading text-center">
                分销权限一览
            </div>
        </div>
        <div class="col-md-12" id="pathData2_id">
        </div>
    </div>
    <div class="col-md-12">
        <div class="hr-line-dashed"></div>
        <div class="panel panel-primary">
            <div class="panel-heading text-center">
                电商权限一览
            </div>
        </div>
        <div class="col-md-12" id="pathData3_id">
        </div>
    </div>
    <div class="col-md-12">
        <div class="hr-line-dashed"></div>
        <div class="panel panel-primary">
            <div class="panel-heading text-center">
                窗口权限一览
            </div>
        </div>
        <div class="col-md-12" id="pathData4_id">
        </div>
    </div>
    <div class="col-md-12">
        <div class="hr-line-dashed"></div>
        <div class="panel panel-primary">
            <div class="panel-heading text-center">
                售检权限一览
            </div>
        </div>
        <div class="col-md-12" id="pathData5_id">
        </div>
    </div>
    <div class="col-md-12">
        <div class="hr-line-dashed"></div>
        <div class="panel panel-primary">
            <div class="panel-heading text-center">
                旅行社权限一览
            </div>
        </div>
        <div class="col-md-12" id="pathData6_id">
        </div>
    </div>
</div>
<%@ include file="/common/commonjs.jsp" %>
<script src="${ctx }/common/js/common.js"></script>
<script src="${staticCtx }/common/h5/js/plugins/layer/laydate/laydate.js"></script>
<script src="${staticCtx }/common/h5/js/plugins/summernote/summernote.min.js"></script>
<script src="${staticCtx }/common/h5/js/plugins/summernote/summernote-zh-CN.js"></script>
<script type="text/javascript">
    var enterpriseIdUsed;
    $(function () { //初始化数据
        $(".summernote").summernote({lang: "zh-CN"});
        companyValidate();
        enterpriseValidate();
        loadData();
        loadOneMenu();
        showCombo();
        $("[data-toggle='tooltip']").tooltip('show');
    });

    //清除查询框中的数据
    function clearSelect() {
        $("#findCompanyCode").val("");
        $("#findCompanyName").val("");
        $("#findMobile").val("");
        $("#findLinkInfo").val("");
    }

    //查询数据
    function findSelect() {
        enterpriseIdUsed = '';
        $('#table1').bootstrapTable("refresh");
    }

    //显示分组
    function showCombo() {
        var url = '${ctx }/platform/companyGroup/canUse';
        $.ajax({
            type: "get",
            url: url,
            dataType: "json",
            success: function (data) {
                isLogin(data);
                var oprStr = '';
                $.each(data, function (index, item) {
                    oprStr += '<option value="' + item.id + '" hassubinfo="true">' + item.groupName + '</option>';
                });
                $("#companyGroup").append(oprStr);
                $('#companyGroup').chosen({
                    no_results_text: "无选项!",
                    allow_single_deselect: true,
                    disable_search_threshold: 20,
                    width: "100%"
                });
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
    }

    function companyInfoTxt() {
        var row = getSingleData("table1");
        if (row == null) {
            layer.msg("请选择要导出的景区", {icon: 8});
        } else {
            var url = '${ctx }/platform/enterprise/companyInfoTxt?companyId=' + row.id;
            window.location.href = url;
        }
    }

    //设置分组
    function setGroupId(companyId) {
        var arrayObj = [];
        var url = '${ctx }/platform/companyGroup/groupIdByCompanyId?companyId=' + companyId;
        $.ajax({
            type: "get",
            url: url,
            async: false,
            dataType: "json",
            success: function (data) {
                isLogin(data);
                $.each(data, function (i, value) {
                    arrayObj.push(value);
                });
                $('#companyGroup').val(arrayObj);
                $('#companyGroup').trigger('chosen:updated');//传递完成之后刷新
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
    }

    //景区验证输入
    function companyValidate() {
        return $("#noticForm_company").validate({
            rules: {
                companyName: {
                    required: true,
                },
                address: "required",
                linkInfo: "required",
                email: {
                    email2: true
                },
                mobile: {
                    required: true,
                    mobile: true,
                    remote: {
                        url: "${ctx}/platform/managercompany/validateMobile",     //后台处理程序
                        async: false,
                        cache: false,
                        data: { //要传递的数据
                            mobile: function () {
                                return $("#mobileCompany").val();
                            },
                            id: function () {
                                return $("#id_company").val();
                            }
                        },
                        dataFilter: function (data) {
                            var msg = eval('(' + data + ')');
                            isLogin(msg);
                            return data;
                        }
                    }
                },
                channelMaxNum: {
                    required: true,
                    digits: true,
                },
                dataSort: {
                    required: true, range: [1, 9999], digits: true
                }
            },
            messages: {
                companyName: "请输入景区名字",
                address: "请输入景区地址",
                email: "请输入正确的邮箱地址",
                linkInfo: "请输入联系人姓名",
                mobile: {
                    required: "请输入手机号码",
                    mobile: "请输入正确的手机号码",
                    remote: "该号码已使用"
                },
                channelMaxNum: {
                    required: "请输入园门通道数量",
                    digits: '请输入整数',
                },
                dataSort: {
                    required: "请输入序号",
                    range: "请输入整数序号，可选范围1-9999",
                    digits: "请输入整数序号，可选范围0-9999"
                }
            },
            /* 失去焦点时不验证 */
            onfocusout: function (element) {
                $(element).valid();
            }
        });
    }

    //企业验证输入
    function enterpriseValidate() {
        return $("#noticForm").validate({
            rules: {
                name: {
                    required: true,
                    remote: {
                        url: "${ctx}/platform/enterprise/findName",
                        type: "get",
                        dataType: 'json',
                        async: false,
                        data: {
                            _method: function () {
                                return "get";
                            },
                            cache: false,
                            name: function () {
                                return $("#enterpriseName").val();
                            },
                            id: function () {
                                return $("#id").val();
                            },
                        },
                        dataFilter: function (data) {
                            var msg = eval('(' + data + ')');
                            isLogin(msg);
                            return data;
                        }
                    }
                },
                linkManName: "required",
                address: "required",
                email: {
                    email2: true
                },
                webUrl: {
                    url2: true
                },
                mobile: {
                    required: true,
                    mobile: true
                },
                tel: {
                    phone: true
                },
                fax: {
                    phone: true
                }
            },
            messages: {
                name: {
                    required: "请输入企业名称",
                    remote: "该名称已使用"
                },
                linkManName: "请输入联系人姓名",
                address: "请输入景区地址",
                email: "请输入正确的邮箱地址",
                webUrl: "请输入正确的网址",
                mobile: "请输入正确的手机号码",
                tel: "请输入正确的电话号码",
                fax: "请输入正确的传真号码",
            },
            /* 失去焦点时不验证 */
            onfocusout: function (element) {
                $(element).valid();
            }
        });
    }

    //加载企业
    function loadOneMenu() {
        var m = $("#findEnterpriseName").val();
        $.ajax({
            type: "GET",
            url: "${ctx}/platform/enterprise/list",
            dataType: "json",
            data: {
                name: m
            },
            success: function (data) {
                isLogin(data);
                $("#leftOneMenu").html("");
                var str = '';
                $.each(data, function (index, item) {
                    if (enterpriseIdUsed == item.id) {
                        str += ' <li style="overflow:hidden;"><a class="J_menuItem" id="' + item.id + '" onclick="reload(\'' + item.id + '\',this)" data-index="1"><i name="leftListBtn" class="fa fa-check text-navy"></i>' + item.name + '</a></li>';
                    } else {
                        str += ' <li style="overflow:hidden;"><a class="J_menuItem" id="' + item.id + '" onclick="reload(\'' + item.id + '\',this)" data-index="1"><i name="leftListBtn"></i>' + item.name + '</a></li>';
                    }
                });
                $("#leftOneMenu").html(str);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
    }

    //添加企业
    function add() {
        claerValidate();
        $('#noticForm')[0].reset();
        $("#_method").val("post");
        $("#id").val("");
        $("#enterpriseName").removeData("previousValue");
        tokenSession("token", "${ctx}/common/tokenSession");
        dilogForm("添加", "${ctx}/platform/enterprise/add");
    }

    //清除validate
    function claerValidate() {
        $("label.error").hide();
        $(".error").removeClass("error");
    }

    //修改企业
    function editor() {
        claerValidate();
        $("#enterpriseName").removeData("previousValue");
        if (enterpriseIdUsed == null) {
            layer.msg("请选择要修改的企业", {icon: 8});
        } else {
            $.ajax({
                type: "post",
                dataType: "json",
                url: "${ctx}/platform/enterprise/find/" + enterpriseIdUsed,
                success: function (dataObj) {
                    if (dataObj != null) {
                        dilogForm("修改", "${ctx}/platform/enterprise/update/" + enterpriseIdUsed);
                        isLogin(dataObj);
                        $("#_method").val("post");
                        $("#id").val(dataObj.id);
                        $("#enterpriseName").val(dataObj.name);
                        $("#enterpriseAdress").val(dataObj.address);
                        $("#enterpriseTel").val(dataObj.tel);
                        $("#enterpriseFax").val(dataObj.fax);
                        $("#enterpriseEmail").val(dataObj.email);
                        $("#enterpriseWebUrl").val(dataObj.webUrl);
                        $("#linkManName").val(dataObj.linkManName);
                        $("#mobile").val(dataObj.mobile);
                        $("#bankName").val(dataObj.bankName);
                        $("#bankAccount").val(dataObj.bankAccount);
                        $("#bankAccountName").val(dataObj.bankAccountName);
                        $("#simpleInfo").val(dataObj.simpleInfo);
                        $("#memo").val(dataObj.memo);
                    }
                },
                error: function () {
                    layer.msg("请选择要修改的记录", {icon: 8});
                }
            });
        }
    }

    //删除企业
    function dele() {
        if (enterpriseIdUsed != null) {
            parent.layer.confirm('确定删除吗？', {
                btn: ['确定', '取消'], //按钮
                shade: false //不显示遮罩
            }, function () {
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "${ctx}/platform/enterprise/" + enterpriseIdUsed,
                    data: {
                        _method: "delete"
                    },
                    success: function (msg) {
                        if (isLogin(msg)) {
                            if (msg == 1) {
                                layer.msg("删除成功", {icon: 1});
                                parent.layer.closeAll();
                                //location.reload();
                                enterpriseIdUsed = null;
                                loadOneMenu();
                                $('#table1').bootstrapTable('refresh', {query: {'enterprise.id': ""}});
                            } else {
                                layer.msg("该企业在景区中被引用，无法删除", {icon: 8});
                                parent.layer.closeAll();
                            }
                        }
                    }
                });

            }, function () {

            });
        } else {
            layer.msg("请选择要删除的企业", {icon: 8});
        }
    }

    function dilogForm(title, url) {
        var index = layer.open({
            type: 1,
            shade: false,
            title: title, //显示标题
            content: $('#editer_form_div'),
            closeBtn: 1,
            btn: ['保存', '关闭'], //只是为了演示
            yes: function (index, layero) {
                submitForm(url);
            }, btn2: function (index, layero) {
                layer.closeAll();
                //按钮【按钮二】的回调
            },
            success: function () {
                enterpriseValidate().resetForm();
            },
            area: ['90%', '98%']
        });
    }

    //
    function submitForm(url) {
        var enterpriseVali = enterpriseValidate();
        enterpriseVali.form();
        if (enterpriseVali.form()) {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: url,
                data: $('#noticForm').serialize(),
                success: function (msg) {
                    isLogin(msg);
                    if (msg == "添加成功" || msg == "更新成功") {
                        layer.closeAll();
                        layer.msg(msg, {icon: 1});
                        loadOneMenu();
                    } else {
                        layer.closeAll();
                        layer.msg(msg, {icon: 8});
                    }

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.alert("服务异常,请返回刷新重试");
                }
            });
        }
    }

    //加载景区信息
    function loadData() {
        $('#table1').bootstrapTable({
            url: "${ctx}/platform/managercompany/pageSort",
            dataType: "json",
            pagination: true, //分页
            singleSelect: true,
            striped: true,
            clickToSelect: true,
            search: false, //显示搜索框
            sidePagination: "server", //服务端处理分
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20, 50, 100],
            queryParams: function (Params) {
                var par = {
                    "companyCode": $("#findCompanyCode").val(),
                    "companyName": $("#findCompanyName").val(),
                    "mobile": $("#findMobile").val(),
                    "linkInfo": $("#findLinkInfo").val(),
                    'enterprise.id': enterpriseIdUsed
                };
                var p = $.extend({}, Params, par);
                return p;
            },
            checkboxHeader: false,
            showColumns: true,
            showRefresh: true,
            showToggle: true,
            cache: false,
            sortable: true,      //是否启用排序
            sortOrder: "asc",     //排序方式
            sortName: "dataSort",
            toolbar: "#tableToolbar",
            onLoadSuccess: function (data) {
                isLogin(data);
            },
            columns: [{
                checkbox: true
            }, {
                field: "dataSort",
                title: "序号",
                sortable: true,
                width: "10"
            }, {
                title: '景区代码',
                field: 'companyCode',
                sortable: true
            }, {
                title: '景区名称',
                field: 'companyName',
                sortable: true
            }, {
                title: '所属企业',
                field: 'enterprise.name'
            }, {
                title: '联系人姓名',
                field: 'linkInfo'
            }, {
                title: '电话号码',
                field: 'mobile'
            }, {
                title: 'appId',
                field: 'appId'
            }, {
                title: 'appKey',
                field: 'appKey'
            }, {
                title: '通道最大数量',
                field: 'channelMaxNum'
            }, {
                title: '状态',
                field: 'useFlag',
                formatter: function (value, row) {
                    if (true == value) {
                        return '<span class="label label-primary">可用</span>';
                    } else if (false == value) {
                        return '<span class="label label-danger">禁用</span>';
                    }
                }
            }, {
                title: '权限',
                field: 'charExtOne',
                formatter: function (value, row) {
                    return "<a href='#'  class='btn btn-primary btn-xs' onclick=\"dilogAuthorizationForm('" + row.id + "')\"><i class='fa fa-paw'></i> 权限详情</a>  ";
                }
            }
            ]
        });
    }

    function dilogAuthorizationForm(companyid) {
        $("#pathData1_id").html('');
        $("#pathData2_id").html('');
        $("#pathData3_id").html('');
        $("#pathData4_id").html('');
        $("#pathData5_id").html('');
        $("#pathData6_id").html('');
        var menuUrl = "${ctx}/platform/enterprise/serchMenu";
        $.ajax({
            type: "POST",
            url: menuUrl,
            dataType: "json",
            data: {
                _method: "get",
                companyid: companyid
            },
            success: function (data) {
                isLogin(data);
                var str1 = '';
                var str2 = '';
                var str3 = '';
                var str4 = '';
                var str5 = '';
                var str6 = '';
                $.each(data.menuRows1, function (index, item1) {
                    if (item1.dataLevels == 1) {
                        str1 += '<div class="row""><div class="col-sm-2"><span class="btn btn-primary">' + item1.menuName + '</span></div><div class="col-sm-10">';
                        $.each(data.menuRows1, function (index, item2) {
                            if (item2.dataLevels == 2 && item1.id == item2.parentId) {
                                str1 += '   <button class="btn btn-success btn-sm" style="margin-top: 2px" title="' + item2.memo + '">' + item2.menuName + '</button>';
                            }
                        });
                        str1 += '</div></div><br>';
                    }
                });
                $.each(data.menuRows2, function (index, item1) {
                    if (item1.dataLevels == 1) {
                        str2 += '<div class="row"><div class="col-sm-2"><span class="btn btn-primary">' + item1.menuName + '</span></div><div class="col-sm-10">';
                        $.each(data.menuRows2, function (index, item2) {
                            if (item2.dataLevels == 2 && item1.id == item2.parentId) {
                                str2 += '   <button class="btn btn-success btn-sm" style="margin-top: 2px" title="' + item2.memo + '">' + item2.menuName + '</button>';
                            }
                        });
                        str2 += '</div></div><br>';
                    }
                });
                $.each(data.menuRows3, function (index, item1) {
                    if (item1.dataLevels == 1) {
                        str3 += '<div class="row" ><div class="col-sm-2"><span class="btn btn-primary">' + item1.menuName + '</span></div><div class="col-sm-10">';
                        $.each(data.menuRows3, function (index, item2) {
                            if (item2.dataLevels == 2 && item1.id == item2.parentId) {
                                str3 += '   <button class="btn btn-success btn-sm" style="margin-top: 2px" title="' + item2.memo + '">' + item2.menuName + '</button>';
                            }
                        });
                        str3 += '</div></div><br>';
                    }
                });
                $.each(data.menuRows4, function (index, item1) {
                    if (item1.dataLevels == 1) {
                        str4 += '<div class="row" ><div class="col-sm-2"><span class="btn btn-primary">' + item1.menuName + '</span></div><div class="col-sm-10">';
                        $.each(data.menuRows4, function (index, item2) {
                            if (item2.dataLevels == 2 && item1.id == item2.parentId) {
                                str4 += '   <button class="btn btn-success btn-sm" style="margin-top: 2px" title="' + item2.memo + '">' + item2.menuName + '</button>';
                            }
                        });
                        str4 += '</div></div><br>';
                    }
                });
                $.each(data.menuRows5, function (index, item1) {
                    if (item1.dataLevels == 1) {
                        str5 += '<div class="row" ><div class="col-sm-2"><span class="btn btn-primary">' + item1.menuName + '</span></div><div class="col-sm-10">';
                        $.each(data.menuRows5, function (index, item2) {
                            if (item2.dataLevels == 2 && item1.id == item2.parentId) {
                                str5 += '   <button class="btn btn-success btn-sm" style="margin-top: 2px" title="' + item2.memo + '">' + item2.menuName + '</button>';
                            }
                        });
                        str5 += '</div></div><br>';
                    }
                });
                $.each(data.menuRows6, function (index, item1) {
                    if (item1.dataLevels == 1) {
                        str6 += '<div class="row" ><div class="col-sm-2"><span class="btn btn-primary">' + item1.menuName + '</span></div><div class="col-sm-10">';
                        $.each(data.menuRows6, function (index, item2) {
                            if (item2.dataLevels == 2 && item1.id == item2.parentId) {
                                str6 += '   <button class="btn btn-success btn-sm" style="margin-top: 2px" title="' + item2.memo + '">' + item2.menuName + '</button>';
                            }
                        });
                        str6 += '</div></div><br>';
                    }
                });
                //加载所有权限
                $("#pathData1_id").html(str1);
                $("#pathData2_id").html(str2);
                $("#pathData3_id").html(str3);
                $("#pathData4_id").html(str4);
                $("#pathData5_id").html(str5);
                $("#pathData6_id").html(str6);
            },
            error: function (textStatus) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
        dilogAuth("权限", id);
    }

    function dilogAuth(title, id) {
        var index = layer.open({
            type: 1,
            shade: false,
            title: title, //显示标题
            content: $('#show_auth_div'),
            closeBtn: 1,
            btn: ['关闭'], //只是为了演示
            yes: function (index, layero) {
                layer.closeAll();
            },
            area: ['90%', '98%']
        });
    }

    //根据企业id刷新景区信息
    function reload(enterpriseId, obj) {
        enterpriseIdUsed = enterpriseId;
        $('i[name="leftListBtn"]').removeClass("fa fa-check text-navy");
        $(obj).children().addClass("fa fa-check text-navy");
        $('#table1').bootstrapTable("refresh");
    }

    //添加景区
    function addCompany() {
        claerValidate();
        if (enterpriseIdUsed == null) {
            layer.msg("请选择企业", {icon: 8});

        } else {
            dilogFormCompany("添加", "${ctx}/platform/managercompany");
            $('#noticForm_company')[0].reset();
            $('#summernote').summernote("code", "");
            $("#_method_company").val("post");
            $("#id_company").val("");
            $("#id_enterprise").val(enterpriseIdUsed);
            $('#companyGroup').val("");
            $("#dataSort").val("1");
            $('#companyGroup').trigger('chosen:updated');//传递完成之后刷新
            tokenSession("token_company", "${ctx}/common/tokenSession");
            RandomCode();
        }
    }

    //获取appid和companyCode
    function RandomCode() {
        $.ajax({
            type: "get",
            url: "${ctx}/platform/managercompany/randomCode",
            dataType: "json",
            data: {},
            success: function (data) {
                isLogin(data);
                $("#companyCode").val(data.companyCode);
                $("#appId").val(data.appId);
            }
        });
    }

    //编辑景区
    function editorCompany() {
        claerValidate();
        var row = getSingleData("table1");
        if (row != null) {
            getChannelNum(row.id);
            dilogFormCompany("修改", "${ctx}/platform/managercompany/" + row.id);
            $("#_method_company").val("PUT");
            $("#id_company").val(row.id);
            $("#id_enterprise").val(row.enterprise.id);
            $("#companyCode").val(row.companyCode);
            $("#companyName").val(row.companyName);
            $("#pwd").val(row.pwd);
            $("#appId").val(row.appId);
            $("#appKey").val(row.appKey);
            $("#mobileCompany").val(row.mobile);
            $("#linkInfo").val(row.linkInfo);
            $("#channelMaxNum").val(row.channelMaxNum);
            $("#addressCompany").val(row.address);
            $("#dataSort").val(row.dataSort);
            if (row.useFlag == true) {
                $("#useFlag1").prop("checked", "checked");
            } else if (row.useFlag == false) {
                $("#useFlag2").prop("checked", "checked");
            }
            $("#bankName").val(row.bankName);
            $("#emailComapny").val(row.email);
            $("#memoComapny").val(row.memo);
            $("#summernote").summernote("code", row.memo);

            setGroupId(row.id);
        } else {
            layer.msg("请选择要修改的景区", {icon: 8});
        }
    }

    //获取景区现有的通道数量
    function getChannelNum(companyId) {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "${ctx}/platform/managercompany/getChannelNum",
            data: {
                _method: "POST",
                companyId: companyId,
            },
            success: function (data) {
                isLogin(data);
                $("#channelMaxNum").rules("remove", "range"); //移除 range验证
                var d = parseInt(data);
                if (d == 0) {
                    d = 1;
                }
                $("#channelMaxNum").rules("add", {
                    range: [d, 99999999],
                    messages: {
                        range: '请输入' + d + '~99999999之间的整数'
                    }
                });
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
    }

    //删除景区
    function deleCompany() {
        var row = getSingleData("table1");
        if (row != null) {
            parent.layer.confirm('确定删除吗？', {
                btn: ['确定', '取消'], //按钮
                shade: false //不显示遮罩
            }, function () {
                var companyId = row.id;
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "${ctx}/platform/managercompany/" + companyId,
                    data: {
                        _method: "delete",
                        id: companyId,
                    },
                    success: function (msg) {
                        isLogin(msg);
                        if (msg == 1) {
                            parent.layer.closeAll();
                            layer.msg("删除成功", {icon: 1});
                            $('#table1').bootstrapTable('refresh', {query: {'enterprise.id': enterpriseIdUsed}});
                        } else {
                            parent.layer.closeAll();
                            layer.msg(msg.toString(), {icon: 2});
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        layer.alert("服务异常,请返回刷新重试");
                    }
                });

            }, function () {
            });
        } else {
            layer.msg("请选择要删除的景区", {icon: 8});
        }
    }

    //重置密码
    function formatPWD() {
        var row = getSingleData("table1");
        if (row != null) {
            var companyId = row.id;
            parent.layer.confirm('确定重置管理员密码吗？', {
                btn: ['确定', '取消'], //按钮
                shade: false //不显示遮罩
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "${ctx}/platform/managercompany/initCompanyManagerPwd",
                    data: {
                        _method: "PUT",
                        id: companyId
                    },
                    success: function (msg) {
                        isLogin(msg);
                        parent.layer.closeAll();
                        layer.msg("重置成功", {icon: 1});
                        $('#table1').bootstrapTable('refresh', {query: {'enterprise.id': enterpriseIdUsed}});
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        parent.layer.closeAll();
                        layer.msg("重置失败！", {icon: 2});
                    }
                });
            }, function () {
            });
        } else {
            layer.msg("请选择要重置密码的景区！", {icon: 8});
        }
    }

    function dilogFormCompany(title, url) {
        var index = layer.open({
            type: 1,
            shade: false,
            title: title, //显示标题
            content: $('#editer_form_div_company'),
            closeBtn: 1,
            btn: ['保存', '关闭'], //只是为了演示
            yes: function (index, layero) {
                submitFormCompany(url);
            }, btn2: function (index, layero) {
                layer.closeAll();
                //按钮【按钮二】的回调
            },
            success: function () {
                companyValidate().resetForm();
            },
            area: ['90%', '98%']
        });
    }

    function submitFormCompany(url) {
        var sHTML = $('#summernote').summernote("code");
        $('#memoComapny').val(sHTML);
        var companyVali = companyValidate();
        companyVali.form();
        if (companyVali.form()) {
            $.ajax({
                type: "POST",
                url: url,
                data: $('#noticForm_company').serialize(),
                dataType: "json",
                success: function (msg) {
                    isLogin(msg);
                    layer.closeAll();
                    msg = msg.toString();
                    if (msg.indexOf("成功") != -1) {
                        layer.msg(msg, {icon: 1});
                        $('#table1').bootstrapTable('refresh', {query: {'enterprise.id': enterpriseIdUsed}});
                    } else {
                        layer.msg(msg, {icon: 8});
                    }

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.alert("服务异常,请返回刷新重试");
                }
            });
        }
    }
</script>
</body>
</html>
