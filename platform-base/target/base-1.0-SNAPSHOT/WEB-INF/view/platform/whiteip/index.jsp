<!DOCTYPE html>
<%@ page language="java" pageEncoding="utf-8" %>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="col-sm-2">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>企业信息</h5>
                <div class="ibox-tools">
                    <button class="btn btn-xs btn-primary" type="button" onclick="leftOneMenu()">
                        <i class="fa fa-refresh" aria-hidden="true"></i>
                    </button>
                    <button class="btn btn-xs btn-primary" type="button"
                            onclick="parent.helpView('${ctx}/help/01')">
                        <i class="glyphicon glyphicon-question-sign" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
            <div class="ibox-content">
                <div class="file-manager">
                    <ul class="folder-list m-b-md" id="leftOneMenu" aria-expanded="true"
                        style="padding: 0;line-height: 20px">
                    </ul>
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
                                <div class="col-sm-10">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">景区
                                        </label>
                                        <div class="col-sm-3">
                                            <select data-placeholder="请选择景区..." name="company.id" id="allCompany_id"
                                                    class="form-control"
                                                    tabindex="2">
                                                <option value="" selected>请选择景区</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">系统类型
                                        </label>
                                        <div class="col-sm-3">
                                            <select class="form-control chosen-container chosen-container-single"
                                                    id="findDict">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">ip</label>
                                            <div class="col-sm-3">
                                                <input type="text" placeholder="请输入ip地址进行查询"
                                                       class="form-control" id="findIp">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <p>
                                        <button class="btn  btn-primary"
                                                type="submit" onclick="findSelect()"><strong>查询</strong>
                                        </button>
                                        <button class="btn  btn-white"
                                                onclick="clearSelect()"><strong>清空查询条件</strong>
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ibox-content">
            <div id="tableToolbar" role="group">
                <button type="button" class="btn btn-primary btn-xm" onclick="add()">
                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>添加
                </button>
                <button type="button" class="btn btn-primary btn-xm" onclick="editor()">
                    <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>修改
                </button>
                <button type="button" class="btn btn-primary btn-xm" onclick="deletedata()">
                    <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
                </button>
                <button type="button" class="btn btn-primary btn-xm" onclick="parent.helpView('${ctx}/help/01')">
                    <i class="glyphicon glyphicon-question-sign" aria-hidden="true"></i>
                </button>
            </div>
            <table id="tablepager">
            </table>

        </div>
    </div>
</div>
<div id="editer_form_div" style="display: none;">
    <form class="form-horizontal" id="myForm">
        <input type="hidden" name="_method" id="_method">
        <input type="hidden" name="id" id="id">
        <input type="hidden" id="token" name="token">
        <div class="col-md-12">
            <div class="ibox-content">
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">景区
                        (<span class="text-danger">*</span>)
                        :</label>
                    <div class="col-sm-6">
                        <select class="form-control" name="company.id" id="company">
                        </select>
                    </div>
                </div>

                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">系统类型
                        (<span class="text-danger">*</span>)
                        :</label>
                    <div class="col-sm-6">
                        <select class="form-control" name="dict.id" id="dict" onchange="fsaleManagerUser();">
                        </select>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">域名
                        (<span class="text-danger">*</span>)
                        :</label>
                    <div class="col-sm-6">
                        <input type="text" id="webSiteUrl" name="webSiteUrl" class="form-control"
                               placeholder="域名格式：http://www.baidu.com">
                    </div>
                </div>
                <div class="col-sm-5" style="display: none;">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">系统标识码</label>
                        <div class="col-sm-9">
                            <input type="text"
                                   class="form-control" id="systemCode" name="systemCode">
                        </div>
                    </div>

                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">ip
                        (<span class="text-danger">*</span>)
                        :</label>
                    <div class="col-sm-6">
                        <input type="text" id="ip" name="ip" class="form-control" placeholder="ip">
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">业务系统代码
                        (<span class="text-danger">*</span>)
                        :</label>
                    <div class="col-sm-6">
                        <input type="text" id="systemNum" name="systemNum" class="form-control" placeholder="业务系统代码">
                    </div>
                </div>
                <div id="accountShowFlag" style="display: none;">
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分销系统管理账号(<span class="text-danger">*</span>)
                            :</label>
                        <div class="col-sm-6">
                            <input type="text"
                                   class="form-control" id="userName" name="userName" placeholder="请输入分销系统管理账号">
                        </div>
                    </div>
                </div>
                <div id="pwdShowFlag" style="display: none;">
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分销系统管理密码(<span class="text-danger">*</span>)
                            :</label>
                        <div class="col-sm-6">
                            <input type="password"
                                   class="form-control" id="pwd" name="pwd" placeholder="请输入分销系统管理密码">
                        </div>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">业务端服务端口号
                        (<span class="text-danger">*</span>)
                        :</label>
                    <div class="col-sm-6">
                        <input type="text"
                               class="form-control" id="servicePort" name="servicePort">
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">业务端服务根路径
                        :</label>
                    <div class="col-sm-6">
                        <input type="text"
                               class="form-control" id="serviceUrl" name="serviceUrl">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<%@ include file="/common/commonjs.jsp" %>
<script src="${ctx }/common/js/common.js"></script>
<script src="${staticCtx }/common/h5/js/plugins/layer/laydate/laydate.js"></script>
<script type="text/javascript">
    var enterpriseIdUsed;
    $(function () {
        leftOneMenu();
        loadData();
        validateForm();
        showSelect('company', '', '${ctx }/platform/managercompany/list', 'id', 'companyName', '');
        <%--showSelect('findCompanyName', '', '${ctx }/platform/managercompany/list', 'id', 'companyName', '');--%>
        showSelect('dict', '', '${ctx }/platform/baseinfo/dict/dictByType?type=DT0002', 'value', 'name', '');
        showSelect('findDict', '', '${ctx }/platform/baseinfo/dict/dictByType?type=DT0002', 'value', 'name', '');
        getAllCompany();
        jQuery.validator.addMethod("port", function (value, element) {
            return this.optional(element) || /^([0-9]|[1-9]\d|[1-9]\d{2}|[1-9]\d{3}|[1-5]\d{4}|6[0-4]\d{3}|65[0-4]\d{2}|655[0-2]\d|6553[0-5])$/.test(value);
        }, "Please enter a valid port");
        $(".hx-tooltip").tooltip();
        jQuery.validator.addMethod("systemNumv", function (value, element) {
            return this.optional(element) || /^[a-zA-Z0-9]{3,5}$/.test(value);
        }, "只能包括3到5位英文字母和数字");
        $("[data-toggle='tooltip']").tooltip('show');
    });


    function fsaleManagerUser() {
        $("#ip").removeData("previousValue");
        if ($("#dict").find("option:selected").text() == "分销业务系统") {
            $("#accountShowFlag").show();
            $("#pwdShowFlag").show();
        } else {
            $("#accountShowFlag").hide();
            $("#pwdShowFlag").hide();
        }
    }

    function clearSelect() {
        $('#allCompany_id').val("");
        $('#allCompany_id').trigger('chosen:updated');//传递完成之后刷新
        $("#findDict").val("");
        $("#findIp").val("");
    }

    function findSelect() {
        $("#tablepager").bootstrapTable("refresh");
    }

    function leftOneMenu() {
        $.ajax({
            type: "GET",
            url: "${ctx}/platform/enterprise/list",
            dataType: "json",
            data: {},
            success: function (data) {
                isLogin(data);
                $("#leftOneMenu").html("");
                var str = ' <li><a class="J_menuItem" onclick="reload(\'' + '\',this)" data-index="1"><i name="leftListBtn" class="fa fa-check text-navy"></i>' + "全部数据" + '</a></li>';
                $.each(data, function (index, item) {
                    str += ' <li style="overflow:hidden;"><a class="J_menuItem" onclick="reload(\'' + item.id + '\',this)" data-index="1"><i name="leftListBtn"></i>' + item.name + '</a></li>';
                });
                $("#leftOneMenu").html(str);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
    }

    function reload(enterpriseId, obj) {
        if (enterpriseId == "") {
            $('i[name="leftListBtn"]').removeClass("fa fa-check text-navy");
            $(obj).children().addClass("fa fa-check text-navy");
            enterpriseIdUsed = "";
            getAllCompany("");
            $('#tablepager').bootstrapTable("refresh");
        } else {
            enterpriseIdUsed = enterpriseId;
            showSelect('company', '', '${ctx }/platform/enterprise/findCompany/' + enterpriseIdUsed, 'id', 'companyName', '');
            <%--showSelect('findCompanyName', '', '${ctx }/platform/enterprise/findCompany', 'id', 'companyName', '');--%>
            var companyUrl = '${ctx }/platform/enterprise/findCompany/' + enterpriseIdUsed;
            getAllCompany(companyUrl);
            $('i[name="leftListBtn"]').removeClass("fa fa-check text-navy");
            $(obj).children().addClass("fa fa-check text-navy");
            $('#tablepager').bootstrapTable("refresh");
        }
    }

    function getAllCompany(companyUrl) {
        if (companyUrl == null || companyUrl == "") {
            companyUrl = "${ctx}/platform/managercompany/list?useFlag=1";
        } else {
            companyUrl = '${ctx }/platform/enterprise/findCompany/' + enterpriseIdUsed;
        }
        $.ajax({
            type: "POST",
            url: companyUrl,
            dataType: "json",
            data: {
                _method: "get",
                groupId: ""
            },
            success: function (data) {
                isLogin(data);
                var oprStr = '';
                $.each(data, function (index, item) {
                    oprStr += '<option value="' + item.id + '" hassubinfo="true">' + item.companyName + '（' + item.companyCode + ')</option>';
                });
                $("#allCompany_id").empty().append(oprStr);
                $('#allCompany_id').val("");
                $("#allCompany_id").chosen("destroy");
                $("#allCompany_id").chosen({
                    no_results_text: "无选项!",
                    allow_single_deselect: true,
                    search_contains: true,
                    disable_search_threshold: 10
                });
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
    }

    function loadData() {
        var url = "${ctx }/platform/whiteip/page";
        $('#tablepager').bootstrapTable({
            url: url,
            dataType: "json",
            pagination: true, //分页
            singleSelect: true,//只能选择一行
            clickToSelect: true,
            search: false, //显示搜索框
            sidePagination: "server", //服务端处理分
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20, 50, 100],
            queryParams: function (Params) {
                var name = $("#allCompany_id").find("option:selected").val();
                var dict = $("#findDict").find("option:selected").val();
                var par = {
                    'company.id': name,
                    ip: $("#findIp").val(),
                    'dict.id': dict,
                    'company.enterprise.id': enterpriseIdUsed
                };
                var p = $.extend({}, Params, par);
                return p;
            },
            showColumns: true,
            showRefresh: true,
            showToggle: true,
            toolbar: "#tableToolbar",
            onLoadSuccess: function (data) {
                isLogin(data);
            },
            columns: [{
                checkbox: true
            }, {
                field: "company",
                title: "景区名称",
                formatter: function (value, row) {
                    if (row != null) {
                        return row.company.companyName + "(" + row.company.companyCode + ")";
                    }
                }
            }, {
                field: "dict",
                title: "系统类型",
                formatter: function (value, row) {
                    if (row != null) {
                        return row.dict.paramName;
                    }
                }
            }, {
                field: "ip",
                title: "ip"
            }, {
                field: "webSiteUrl",
                title: "域名"
            }, {
                field: "systemCode",
                title: "系统标识码"
            }, {
                field: "systemNum",
                title: "业务系统代码"
            }, {
                title: "分销管理账号",
                field: "fsaleManagerName"
            }, {
                title: '操作',
                formatter: function (value, row) {
                    var str;
                    if (row.dict.paramValue == "2") {
                        str = "<a  class='btn btn-primary btn-xs' onclick=\"resPWD('" + row.id + "')\"><i class='glyphicon glyphicon-retweet'></i> 重置分销密码</a>  ";
                        str = str + "<a  class='btn btn-primary btn-xs hx-tooltip' data-toggle='tooltip' data-placement='left' onclick=\"companyAuth('" + row.id + "')\"><i class='glyphicon glyphicon-retweet'></i> 景区授权</a>  ";
                        return str;
                    } else {
                        return "无";
                    }
                }
            }
            ]
        });
    }

    function companyAuth(id) {
        parent.layer.open({
            type: 2,
            title: "分销系统供应商授权",
            shadeClose: true,
            shade: 0.8,
            area: ['90%', '90%'],
            btn: ['关闭'],
            content: "${ctx}/platform/whiteip/fsaleauthsupplier?id=" + id,
        }, function () {
            parent.layer.closeAll();
        });
    }


    function resPWD(rowid) {
        parent.layer.confirm('确定重置吗？', {
            btn: ['确定', '取消'], //按钮
            shade: false //不显示遮罩
        }, function () {
            $.ajax({
                type: "get",
                url: "${ctx}/platform/fsaleManagerUser/respwd",
                data: {
                    id: rowid
                },
                success: function (msg) {
                    parent.layer.closeAll();
                    layer.msg(msg, {icon: 1});
                    setTimeout(function () {
                        window.location.reload();
                    }, 3000);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    parent.layer.closeAll();
                    layer.msg("重置失败！", {icon: 2});
                }
            });
        }, function () {
        });
    }

    function validateForm() {
        return $("#myForm").validate({
            rules: {
                'company.id': "required",
                'dict.id': "required",
                ip: {
                    required: true,
                    ipv4: true,
                    remote: {
                        url: "${ctx}/platform/whiteip/remoteIp",
                        type: "get",
                        dataType: 'json',
                        cache: false,
                        async: false,
                        data: {
                            _method: function () {
                                return "post";
                            },
                            cache: false,
                            companyId: function () {
                                return $("#company").val();
                            },
                            dictId: function () {
                                return $("#dict").val();
                            },
                            ip: function () {
                                return $("#ip").val();
                            },
                            id: function () {
                                return $("#id").val();
                            }
                        },
                        dataFilter: function (data) {
                            var msg = eval('(' + data + ')');
                            isLogin(msg);
                            return data;
                        }
                    }
                },
                systemNum: {
                    required: true,
                    systemNumv: true,
                    remote: {
                        url: "${ctx}/platform/whiteip/remoteSystemNum",
                        type: "get",
                        dataType: "json",
                        async: false,
                        cache: false,
                        data: {
                            id: function () {
                                return $("#id").val();
                            },
                            systemNum: function () {
                                return $("#systemNum").val();
                            }
                        }

                    }

                },
                webSiteUrl: {
                    required: true,
                    url2: true
                },
                servicePort: {
                    required: true,
                    port: true
                },
                userName: "required",
                pwd: "required"
            }, messages: {
                'company.id': "请选择景区",
                'dict.id': "请选择系统类型",
                userName: "请输入账号",
                pwd: "请输入密码",
                ip: {
                    required: "请输入ip",
                    ipv4: "ip地址格式错误",
                    remote: "同一个景区和业务系统下不允许有相同的ip地址"
                },
                webSiteUrl: {
                    required: "请输入正确的域名",
                    url2: "网站格式错误"
                },
                systemNum: {
                    required: "请输入业务系统代码",
                    remote: "该业务系统代码已被使用"
                },
                servicePort: {
                    required: "请输入服务端口号",
                    port: "请输入正确的端口号"
                }
            },
            onfocusout: function (element) {
                $(element).valid();
            }
        });
    }

    function claerValidate() {
        $("label.error").hide();
        $(".error").removeClass("error");
    }

    function add() {
        $("#dict").removeAttr("disabled");
        $("#company").removeAttr("disabled");
        $("#accountShowFlag").hide();
        $("#pwdShowFlag").hide();
        claerValidate();
        $("#ip").removeData("previousValue");
        $("#systemNum").removeData("previousValue");
        if (enterpriseIdUsed != null) {
            $('#myForm')[0].reset();
            $("#_method").val("post");
            $("#id").val("");
            tokenSession("token", "${ctx }/common/tokenSession");
            dilogForm("添加", "${ctx }/platform/whiteip");
        } else {
            layer.msg("请选择要添加景区白名单的企业", {icon: 8});
        }
    }

    function editor() {
        $("#accountShowFlag").hide();
        $("#pwdShowFlag").hide();
        claerValidate();
        $('#myForm')[0].reset();
        $("#dict").attr("disabled", "disabled");
        $("#company").attr("disabled", "disabled");
        $("#ip").removeData("previousValue");
        $("#systemNum").removeData("previousValue");
        var row = getSingleData("tablepager");
        if (row != null) {
            dilogForm("修改", "${ctx }/platform/whiteip/" + row.id);
            if (row.dict.paramValue == '2') {
                $("#accountShowFlag").show();
            } else {
                $("#accountShowFlag").hide();
            }
            $("#userName").val(row.fsaleManagerName);
            $("#_method").val("put");
            $("#id").val(row.id);
            $("#webSiteUrl").val(row.webSiteUrl);
            $("#company").val(row.company.id);
            $("#dict").val(row.dict.id);
            $("#ip").val(row.ip);
            $("#servicePort").val(row.servicePort);
            $("#systemCode").val(row.systemCode);
            $("#serviceUrl").val(row.serviceUrl);
            $("#systemNum").val(row.systemNum);
        } else {
            layer.msg("选择要修改的记录", {icon: 8});
        }
    }

    function getPwd(id) {
        $.ajax({
            url: "${ctx}/platform/fsaleManagerUser/getData",
            type: "get",
            dataType: "json",
            data: {
                whiteId: id
            },
            success: function (data) {
                $("#pwd").val(data);
            }
        });
    }

    function deletedata() {
        var row = getSingleData("tablepager");
        if (row != null) {
            if (row.dict.paramValue == "2") {
                layer.confirm("分销业务系统删除分销管理账号也会被删除!", {
                    btn: ['确认', '取消'], //按钮
                    shade: false
                }, function (index) {
                    layer.confirm("确认删除？", {
                        btn: ['确认', '取消'], //按钮
                        shade: false
                    }, function (index) {
                        layer.close(index);
                        $.ajax({
                            type: "post",
                            dataType: "json",
                            url: "${ctx }/platform/whiteip/" + row.id,
                            data: {_method: "delete"},
                            success: function (msg) {
                                isLogin(msg);
                                if (msg == "删除成功") {
                                    layer.msg(msg, {icon: 1});
                                    $('#tablepager').bootstrapTable('refresh');
                                } else {
                                    layer.msg(msg, {icon: 8});
                                }
                            }
                        });
                    }, function () {
                    });
                }, function () {
                    return;
                });
            } else {
                layer.confirm("确认删除？", {
                    btn: ['确认', '取消'], //按钮
                    shade: false
                }, function (index) {
                    layer.close(index);
                    $.ajax({
                        type: "post",
                        dataType: "json",
                        url: "${ctx }/platform/whiteip/" + row.id,
                        data: {_method: "delete"},
                        success: function (msg) {
                            isLogin(msg);
                            if (msg == "删除成功") {
                                layer.msg(msg, {icon: 1});
                                $('#tablepager').bootstrapTable('refresh');
                            } else {
                                layer.msg(msg, {icon: 8});
                            }
                        }
                    });
                }, function () {
                });
            }
        } else {
            layer.msg("选择要删除的记录", {icon: 8});
        }
    }

    function dilogForm(title, url) {
        var index = layer.open({
            type: 1,
            shade: false,
            title: title, //显示标题
            content: $('#editer_form_div'),
            closeBtn: 1,
            btn: ['提交', '关闭'], //只是为了演示
            yes: function (index, layero) {
                submitForm(url);
            }, btn2: function (index, layero) {
                layer.closeAll();
                //按钮【按钮二】的回调
            },
            //shadeClose: true,
            //maxmin: true,
            area: ['90%', '98%']
        });
    }

    function submitForm(url) {
        var v = validateForm();
        v.form();
        if (v.form()) {
            $("#dict").removeAttr("disabled");
            $("#company").removeAttr("disabled");
            $.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                data: $('#myForm').serialize(),
                success: function (msg) {
                    if (isLogin(msg)) {
                        if (msg.indexOf("成功") >= 0) {
                            layer.closeAll();
                            $('#tablepager').bootstrapTable('refresh');
                        }
                        layer.msg(msg.toString(), {icon: 1});
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





