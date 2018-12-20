<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
    <link href="${staticCtx }/common/h5/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
    <link href="${staticCtx}/common/webuploader/webuploader.css" rel="stylesheet" type="text/css">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>部门</h5>
                    <div class="ibox-tools">
                        <button class="btn btn-xs btn-primary" type="button" onclick="loadOneMenu()">
                            <i class="fa fa-refresh" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="file-manager">
                        <ul class="folder-list m-b-md" id="leftOneMenu" style="padding: 0;line-height: 20px">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-10">
            <div class="example-wrap">
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
                                        <row>
                                            <div class="col-sm-9">
                                                <label class="col-sm-2 control-label">员工名称</label>
                                                <div class="col-sm-3">
                                                    <input type="text" id="searchEmployeeName" placeholder="请输入员工名称"
                                                           class="form-control">
                                                </div>
                                                <label class="col-sm-2 control-label">登录名</label>
                                                <div class="col-sm-3">
                                                    <input type="text" id="searchEmployeeCode" placeholder="请输入登录名"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <p>
                                                    <button class="btn  btn-primary" onclick="searchTable()"
                                                            type="submit"><strong>查询</strong>
                                                    </button>
                                                    <button class="btn  btn-white"
                                                            type="submit" onclick="clearSearchBtn()">
                                                        <strong>清空查询条件</strong>
                                                    </button>
                                                </p>
                                            </div>
                                        </row>
                                        <row>
                                            <div class="col-sm-9">
                                                <label class="col-sm-2 control-label">手机号</label>
                                                <div class="col-sm-3">
                                                    <input type="text" id="searchEmployeeMobile" placeholder="请输入您手机号"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                            </div>
                                        </row>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <p id="tableToolbar" role="group">
                        <button type="button" class="btn  btn-xm btn-primary" onclick="add()">
                            <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>添加
                        </button>
                        <button type="button" class="btn  btn-xm btn-primary" onclick="editor()">
                            <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>修改
                        </button>
                        <button type="button" class="btn  btn-xm btn-primary" onclick="deleteDept()">
                            <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
                        </button>
                        <button type="button" class="btn  btn-xm btn-primary" onclick="initPwd()">
                            <i class="glyphicon glyphicon-retweet" aria-hidden="true"></i>初始化密码
                        </button>
                        <button type="button" class="btn btn-primary btn-xm"
                                onclick="parent.helpView('${ctx}/help/11')">
                            <i class="glyphicon glyphicon-question-sign" aria-hidden="true"></i>
                        </button>
                    </p>
                    <div class="ibox-content">
                        <table id="table" data-mobile-responsive="true">
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="editer_form_div" style="display: none;">
    <form class="form-horizontal" id="employeeForm">
        <input type="hidden" name="_method" id="_method">
        <input type="hidden" name="id" id="id">
        <input type="hidden" name="dataLevels" id="dataLevels" value="2">
        <input type="hidden" name="pwd" id="pwd" value="2">
        <input type="hidden" id="token" name="token">
        <div class="col-md-12">
            <div class="form-group">
                <div class="col-md-6">
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">部门菜单(<span class="text-danger">*</span>)：</label>
                        <div class="col-sm-6">
                            <select class="form-control" name="companyDept.id" id="companyDeptId">
                            </select>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div id="addEmployeeCode" class="form-group">
                            <label class="col-sm-4 control-label">登录名(<span class="text-danger">*</span>)：</label>
                            <div class="col-sm-6">
                                <input type="text" id="employeeCode" name="employeeCode" class="form-control"
                                       placeholder="登录名">
                            </div>
                            <div class="col-sm-2">
                                <p id="companyCodeSession" class="form-control-static"></p>
                            </div>
                        </div>
                        <div id="updateEmployeeCode" class="form-group">
                            <label class="col-sm-4 control-label">登录名(<span class="text-danger">*</span>)：</label>
                            <div class="col-sm-6">
                                <input type="text" id="employeeCodeMark" name="employeeCodeMark" class="form-control"
                                       readonly="readonly"
                                       placeholder="登录名">
                            </div>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">员工真实名称(<span class="text-danger">*</span>)：</label>
                        <div class="col-sm-6">
                            <input type="text" id="employeeName" name="employeeName" class="form-control"
                                   placeholder="员工真实名称">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">头像：</label>
                        <div class="col-sm-3">
                            <img id="imgView" src="${ctx }/upfile/default.jpg" style="width: 120px;height: 120px;">
                            <div id="picker">上传头像</div>
                            <input type="hidden" id="photo" name="photo" class="form-control" placeholder="头像">
                        </div>
                    </div>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">手机号(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="mobile" name="mobile" class="form-control"
                           placeholder="手机号">
                </div>
                <label class="col-sm-2 control-label">性别(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="sex1" value="1" name="sex" checked="checked">
                        <label for="sex1">男</label>
                    </div>
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="sex2" value="0" name="sex">
                        <label for="sex2">女</label>
                    </div>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="useFlag1">状态(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="useFlag1" value="true" name="useFlag" checked="checked">
                        <label for="useFlag1">启用</label>
                    </div>
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="useFlag2" value="false" name="useFlag">
                        <label for="useFlag2">禁用</label>
                    </div>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">权限组：</label>
                <div class="col-sm-3">
                    <select data-placeholder="选择权限组..." id="companyRole" name="companyRole"
                            class="chosen-select form-control" multiple="multiple" tabindex="2">
                    </select>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">证件号：</label>
                <div class="col-sm-3">
                    <input type="text" id="cardId" name="cardId" class="form-control"
                           placeholder="证件号">
                </div>
                <label class="col-sm-2 control-label">年龄：</label>
                <div class="col-sm-3">
                    <input type="text" id="age" name="age" class="form-control"
                           placeholder="年龄">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">备注：</label>
                <div class="col-sm-6">
                    <input type="text" id="memo" name="memo" class="form-control" placeholder="备注">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group" id="dataSort_f">
                <label class="col-sm-2 control-label">排序(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="dataSort" name="dataSort" class="form-control"
                           placeholder="排序" value="1">
                </div>
            </div>
        </div>
    </form>
</div>

<%@ include file="/common/commonjs.jsp" %>
<script src="${staticCtx}/common/js/common.js"></script>
<script src="${staticCtx}/common/webuploader/webuploader.min.js"></script>
<script>
    var deptId;
    var companyCodeSession = '${companyCodeSession}';
    var companyIdSession = '${companyIdSession}';
    var picAllSize = 1024 * 1024 * 20;
    var picSingleSize = 1024 * 1024 * 2;
    var picNum = 1;
    var rootPath = '${ctx}';
    var staticUpfileCtx = '${staticUpfileCtx}';
    $(function () {
        showCombo();
        loadData();
        validateForm();
        loadOneMenu();
        $("[data-toggle='tooltip']").tooltip();
    });



    function showCombo() {
        var methods = '${ctx }/company/employee/comboRoots?companyid=' + companyIdSession;
        $.ajax({
            type: "get",
            url: methods,
            dataType: "json",
            success: function (data) {
                if (isLogin(data)) {
                    var oprStr = '';
                    $.each(data, function (index, item) {
                        oprStr += '<option value="' + item.id + '" hassubinfo="true">' + item.roleName + '</option>';
                    });
                    $("#companyRole").append(oprStr);
                    $('#companyRole').chosen({
                        no_results_text: "无选项!",
                        allow_single_deselect: true,
                        disable_search_threshold: 20,
                        width: "100%"
                    });
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.close(noticeIndex);//关闭加载动画
                layer.alert("请求过于频繁,请稍后再试");
            }
        });
    }


    function validateForm() {
        return $("#employeeForm").validate({
            rules: {
                employeeCode: {
                    required: true,
                    WordAndNum: true,
                    remote: {
                        url: "${ctx}/company/employee/remoteCode",     //后台处理程序
                        dataType: "json",           //接受数据格式
                        type: "get",               //数据发送方式
                        async: false,
                        cache: false,
                        data: { //要传递的数据
                            employeeCode: function () {
                                return $("#employeeCode").val() + "@${companyCodeSession}";
                            },
                            id: function () {
                                return $("#id").val();
                            }
                        },
                        dataFilter: function (data) {
                            isLogin(eval('(' + data + ')'));
                            return data;
                        }
                    }
                },
                mobile: {
                    required: true,
                    mobile: true,
                    remote: {
                        url: "${ctx}/company/employee/remoteMobile",     //后台处理程序
                        dataType: "json",           //接受数据格式
                        type: "get",               //数据发送方式
                        async: false,
                        cache: false,
                        data: { //要传递的数据
                            mobile: function () {
                                return $("#mobile").val();
                            },
                            id: function () {
                                return $("#id").val();
                            }
                        },
                        dataFilter: function (data) {
                            isLogin(eval('(' + data + ')'));
                            return data;
                        }
                    }
                },
                age: {
                    number: true
                },
                employeeName: "required",
                'companyDept.id': "required",
                cardId: {
                    idcardcode: true
                },
                dataSort: {
                    required: true, range: [1, 9999], digits: true
                }
            },
            messages: {
                employeeCode: {
                    required: "请输入登录名",
                    remote: "此员工编码已存在",
                    WordAndNum: "请输入正确的登录名，至少包含一位字母，长度不能超过20"

                },
                employeeName: "请输入员工姓名",
                mobile: {
                    required: "请输入正确的手机号码",
                    remote: "该手机号码已经被使用"
                },
                age: {
                    number: "请输入正确的格式"
                },
                dataSort: {
                    required: "请输入排序号"
                },
                'companyDept.id': "请选择部门"
            },
            onfocusout: function (element) {
                $(element).valid();
            }
        });
    }

    //加载左侧一级菜单
    function loadOneMenu() {
        $.ajax({
            type: "GET",
            url: "${ctx}/company/dept/listType",
            dataType: "json",
            data: {},
            success: function (data) {
                if (isLogin(data)) {
                    $("#leftOneMenu").html("");
                    var str = '';
                    $.each(data, function (index, item) {
                        str += ' <li><a class="J_menuItem" onclick="reload(\'' + item.id + '\',this)" data-index="1"><i name="leftListBtn"></i>' + item.deptName + '(' + item.deptCode + ')</a></li>';
                    });
                    $("#leftOneMenu").html(str);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.close(noticeIndex);//关闭加载动画
                layer.alert("请求过于频繁,请稍后再试");
            }
        });
    }

    function reload(id, obj) {
        deptId = id;
        $('i[name="leftListBtn"]').removeClass("fa fa-check text-navy");
        $(obj).children().addClass("fa fa-check text-navy");
        $('#table').bootstrapTable("refresh");
    }

    function searchTable() {
        $('#table').bootstrapTable("refresh");
    }

    function claerValidate() {
        $("label.error").hide();
        $(".error").removeClass("error");
    }

    function loadData() {
        $('#table').bootstrapTable({
            url: "${ctx}/company/employee/list?n=" + new Date(),
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
            onLoadSuccess: function (data) {
                isLogin(data);
            },
            queryParams: function (params) {
                var par = {
                    "employeeCode": $("#searchEmployeeCode").val(),
                    "mobile": $("#searchEmployeeMobile").val(),
                    "employeeName": $("#searchEmployeeName").val(),
                    "companyDept.id": deptId
                };
                var p = $.extend({}, params, par);
                return p;
            },
            checkboxHeader: true,
            showColumns: true,
            showRefresh: false,
            showToggle: true,
            sortable: true,      //是否启用排序
            sortOrder: "asc",     //排序方式
            sortName: "dataSort",
            cache: false,
            toolbar: "#tableToolbar",
            columns: [{
                checkbox: true
            }, {
                title: '序号',
                field: 'dataSort',
                sortable: true,
                width: 10
            }, {
                title: '部门名称',
                field: 'companyDept.deptName'
            }, {
                title: '员工真实名称',
                field: 'employeeName'
            }, {
                title: '登录名',
                field: 'employeeCode'
            }, {
                title: '手机号',
                field: 'mobile'
            }, {
                title: '年龄',
                field: 'age'
            }, {
                title: "性别",
                field: "sex",
                formatter: function (value, row) {
                    if (1 == value) {
                        return '<span class="badge  badge-info">男</span>';
                    } else if (0 == value) {
                        return '<span class="badge badge-warning-light">女</span>';
                    }
                }
            }, {
                title: '状态',
                field: 'useFlag',
                formatter: function (value, row) {
                    if (1 == value) {
                        return '<span class="label label-primary">可用</span>';
                    } else if (0 == value) {
                        return '<span class="label label-danger">禁用</span>';
                    }
                }
            }
            ]
        });
    }

    function add() {
        $('#employeeForm')[0].reset();
        claerValidate();
        $("#_method").val("post");
        initWebuploader("${ctx}/company/employee/photo", picNum, picAllSize, picSingleSize, rootPath, staticUpfileCtx);
        $("#imgView").attr("src", "${ctx }/upfile/default.jpg");
        $("#id").val("");
        $("#employeeCode").removeData("previousValue");
        $('#companyRole').val();
        $('#companyRole').trigger('chosen:updated');//传递完成之后刷新
        $("#addEmployeeCode").show();
        $("#updateEmployeeCode").hide();
        $("#companyCodeSession").html("@" + companyCodeSession);
        $("#companyDeptId").val(deptId);
        $("#sex1").attr("checked", "checked");
        $("#useFlag1").attr("checked", "checked");
        $("#dataSort_f").hide();
        tokenSession("token", "${ctx}/common/tokenSession");
        dilogForm("添加", "${ctx}/company/employee/add");
        loadLeftMenu(deptId);
    }

    function loadLeftMenu(pid) {
        $.ajax({
            type: "GET",
            url: "${ctx}/company/dept/listType?n=" + new Date(),
            dataType: "json",
            data: {
                _method: "GET",
                useFlag: true
            },
            success: function (data) {
                if (isLogin(data)) {
                    $("#companyDeptId").html("");
                    var str = '';
                    $.each(data, function (index, item) {
                        if (item.id == pid) {
                            str += '<option value="' + item.id + '" selected>' + item.deptName + '</option>';
                        } else {
                            str += '<option value="' + item.id + '">' + item.deptName + '</option>';
                        }

                    });
                    $("#companyDeptId").html(str);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.close(noticeIndex);//关闭加载动画
                layer.alert("请求过于频繁,请稍后再试");
            }
        });
    }

    function editor() {
        var row = getSingleData("table");
        $('#employeeForm')[0].reset();
        claerValidate();
        if (row != null) {
            initWebuploader("${ctx}/company/employee/photo", picNum, picAllSize, picSingleSize, rootPath, staticUpfileCtx);
            $("#_method").val("put");
            $("#id").val(row.id);
            $("#employeeCode").removeData("previousValue");
            var roles = row.companyRole;
            var arr = "";
            if (roles != null) {
                arr = roles.split(',');
            }
            $('#companyRole').val(arr);
            $('#companyRole').trigger('chosen:updated');//传递完成之后刷新
            $("#addEmployeeCode").hide();
            $("#employeeCodeMark").val(row.employeeCode);
            $("#updateEmployeeCode").show();
            $("#employeeCode").val(row.employeeCode);
            $("#pwd").val(row.pwd);
            $("#employeeName").val(row.employeeName);
            if (row.sex == 1) {
                $("#sex1").prop("checked", "checked");
            } else if (row.sex == 0) {
                $("#sex2").prop("checked", "checked");
            }
            $("#cardId").val(row.cardId);
            $("#mobile").val(row.mobile);
            $("#age").val(row.age);
//            $("#email").val(row.email);
//            $("#weixin").val(row.weixin);
            $("#photo").val(row.photo);
            $("#imgView").attr("src", "${staticUpfileCtx}" + row.photo);
            if (row.useFlag == 1) {
                $("#useFlag1").prop("checked", "checked");
            } else if (row.useFlag == 0) {
                $("#useFlag2").prop("checked", "checked");
            }
            $("#dataSort").val(row.dataSort);
            $("#memo").val(row.memo);
            $("#dataSort_f").show();
            dilogForm("修改", "${ctx}/company/employee/update");
            loadLeftMenu(row.companyDept.id);
        } else {
            layer.msg("选择要修改的记录", {icon: 8});
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
                uploader.destroy();
                layer.closeAll();
            },
            success: function () {
                validateForm().resetForm();
            }, end: function () {
                uploader.destroy();
            },
            area: ['90%', '98%']
        });
    }

    function submitForm(url) {
        var v = validateForm();
        v.form();
        if (v.form()) {
            var noticeIndex = hx_loading();//开启加载动画
            $.ajax({
                type: "POST",
                url: url,
                data: $('#employeeForm').serialize(),
                dataType: "json",
                success: function (data) {
                    if (isLogin(data)) {
                        if (data.code == "200") {
                            layer.closeAll();
                            layer.msg(data.msg, {icon: 1});
                            $('#table').bootstrapTable('refresh', {query: {'companyDept.id': deptId}});
                            uploader.destroy();
                            layer.close(noticeIndex);//关闭加载动画
                        } else {
                            layer.msg(data.msg, {icon: 8});
                            $("#token").val(data.token);
                            layer.close(noticeIndex);//关闭加载动画
                        }

                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.close(noticeIndex);//关闭加载动画
                    layer.alert("请求过于频繁,请稍后再试");
                }
            });
        }
    }

    function deleteDept() {
        var row = getSingleData("table");
        if (row != null) {
            layer.confirm("确认删除？", {
                btn: ['确认', '取消'], //按钮
                shade: false
            }, function (index) {
                layer.close(index);
                var noticeIndex = hx_loading();//开启加载动画
                $.ajax({
                    type: "POST",
                    url: "${ctx}/company/employee/" + row.id,
                    dataType: "json",
                    data: {
                        _method: "delete"
                    },
                    success: function (msg) {
                        if (isLogin(msg)) {
                            layer.msg(msg, {icon: 1});
                            $('#table').bootstrapTable('refresh');
                            layer.close(noticeIndex);//关闭加载动画
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        layer.close(noticeIndex);//关闭加载动画
                        layer.alert("请求过于频繁,请稍后再试");
                    }
                });
            }, function () {
            });
        } else {
            layer.msg("选择要删除的记录", {icon: 8});
        }
    }

    function initPwd() {
        var row = getSingleData("table");
        if (row != null) {
            var noticeIndex = hx_loading();//开启加载动画
            $.ajax({
                type: "post",
                dataType: "json",
                data: {
                    _method: "put"
                },
                url: "${ctx}/company/employee/initPwd/" + row.id,
                success: function (msg) {
                    if (isLogin(msg)) {
                        layer.msg(msg, {icon: 1});
                        $('#tablepager').bootstrapTable('refresh');
                        layer.close(noticeIndex);//关闭加载动画
                    }
                }
            });
        } else {
            layer.msg("选择要初始化密码的记录", {icon: 8});
        }
    }

    function clearSearchBtn() {
        $("#searchEmployeeName").val("");
        $("#searchEmployeeCode").val("");
        $("#searchEmployeeMobile").val("");
    }
</script>
</body>
</html>
