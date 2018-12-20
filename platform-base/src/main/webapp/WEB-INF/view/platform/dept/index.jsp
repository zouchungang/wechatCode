<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
    <link href="${staticCtx }/common/h5/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="col-sm-12">
        <div class="example">
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
            <div class="ibox-content">
                <table id="tablepager" data-mobile-responsive="true">
                </table>
            </div>
        </div>
    </div>
</div>
<div id="editer_form_div" style="display: none;">
    <form class="form-horizontal" id="deptForm">
        <input type="hidden" name="_method" id="_method">
        <input type="hidden" name="id" id="id">
        <input type="hidden" id="token" name="token">
        <div class="col-md-12">
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">部门编码(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
                    <input type="text" id="deptCode" name="deptCode" class="form-control" readonly
                           placeholder="部门编码">
                    <span class="help-block m-b-none text-navy">系统自动分配，不可修改</span>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">部门名称(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
                    <input type="text" id="deptName" name="deptName" class="form-control"
                           placeholder="部门名称">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">

                <label class="col-sm-2 control-label" for="useFlag1">状态(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-2">
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
                <label class="col-sm-2 control-label">备注：</label>
                <div class="col-sm-6">
                    <input type="text" id="memo" name="memo" class="form-control"
                           placeholder="备注">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group" id="dataSort_f">
                <label class="col-sm-2 control-label">排序(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-2">
                    <input type="text" id="dataSort" name="dataSort" class="form-control"
                           placeholder="排序">
                </div>
            </div>
        </div>
    </form>
</div>
<%@ include file="/common/commonjs.jsp" %>
<script src="${staticCtx }/common/h5/js/plugins/layer/laydate/laydate.js"></script>
<script>
    $(function () {
        loadData();
        validateForm();
        $("[data-toggle='tooltip']").tooltip('show');
    })

    function validateForm() {
        return $("#deptForm").validate({
            rules: {
                deptCode: {
                    range: [100, 999],
                    required: true
                },
                deptName: {
                    required: true,
                    remote: {
                        url: "${ctx}/platform/dept/remoteName",
                        type: "get",
                        async: false,
                        cache: false,
                        data: {
                            name: function () {
                                return $("#deptName").val();
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
                    },
                },
                dataSort: {required: false, range: [1, 9999], digits: true}
            },
            messages: {
                deptCode: {
                    range: "编码取值范围为100-999",
                    required: "请输入编码"
                },
                deptName: {
                    required: "请输入部门名称",
                    remote: "该名称已使用"
                }
            },
            onfocusout: function (element) {
                $(element).valid();
            }
        });
    }

    function loadData() {
        $('#tablepager').bootstrapTable({
            url: "${ctx}/platform/dept/pageSort",
            dataType: "json",
            pagination: true, //分页
            singleSelect: true,
            clickToSelect: true,
            search: false, //显示搜索框
            sidePagination: "server", //服务端处理分
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20, 50, 100],
            showColumns: true,
            showRefresh: true,
            showToggle: true,
            sortable: true, //是否启用排序
            sortName: "dataSort",
            sortOrder: "asc",
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
                title: '企业',
                field: 'platformInfo',
                formatter: function (value, row) {
                    if (row != null) {
                        return row.platformInfo.name;
                    }
                }
            }, {
                title: '部门名称',
                field: 'deptName'
            }, {
                title: "部门编码",
                field: "deptCode"
            }, {
                title: "状态",
                field: "useFlag",
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
        $('#deptForm')[0].reset();
        $("#_method").val("post");
        $("#id").val("");
        tokenSession("token", "${ctx}/common/tokenSession");
        getdeptCode();
        $("#deptCode").attr("readonly", true);
        $("#deptCode").removeData("previousValue");
        $("#deptName").removeData("previousValue");
        $("#dataSort").val(1);
        $("#dataSort_f").hide();
        dilogForm("添加", "${ctx}/platform/dept");
    }

    function editor() {
        $('#deptForm')[0].reset();
        var row = getSingleData("tablepager");
        if (row != null) {
            dilogForm("修改", "${ctx}/platform/dept/" + row.id);
            $("#_method").val("put");
            $("#id").val(row.id);
            $("#deptName").val(row.deptName);
            $("#deptName").removeData("previousValue");
            $("#deptCode").val(row.deptCode);
            $("#deptCode").attr("readonly", true);
            $("#deptCode").removeData("previousValue");
            if (row.useFlag == 1) {
                $("#useFlag1").prop("checked", "checked");
            } else {
                $("#useFlag2").prop("checked", "checked");
            }
            $("#dataSort").val(row.dataSort);
            $("#memo").val(row.memo);
            $("#dataSort_f").show();
        } else {
            layer.msg("选择要修改的记录", {icon: 8});
        }
    }

    function deletedata(row) {
        var row = getSingleData("tablepager");
        if (row != null) {
            layer.confirm("确认删除？", {
                btn: ['确认', '取消'], //按钮
                shade: false
            }, function (index) {
                layer.close(index);
                $.ajax({
                    type: "post",
                    dataType: "json",
                    url: "${ctx}/platform/dept/" + row.id,
                    data: {_method: "delete"},
                    success: function (msg) {
                        if (isLogin(msg)) {
                            if (msg.indexOf("成功") >= 0) {
                                $('#tablepager').bootstrapTable('refresh');
                                layer.msg(msg.toString(), {icon: 1});
                            } else {
                                layer.msg(msg.toString(), {icon: 8});

                            }
                        }
                    }
                });
            }, function () {
            });
        } else {
            layer.msg("选择要删除的记录", {icon: 8});
        }
    }

    function dilogForm(title, url) {
        var index = layer.open({
            type: 1,
            shade: false,
            title: title,
            content: $('#editer_form_div'),
            closeBtn: 1,
            btn: ['提交', '关闭'],
            yes: function (index, layero) {
                submitForm(url);
            }, btn2: function (index, layero) {
                layer.closeAll();
            },
            success: function () {
                validateForm().resetForm();
            },
            area: ['90%', '98%']
        });
    }

    function submitForm(url) {
        var v = validateForm();
        v.form();
        if (v.form()) {
            $.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                data: $('#deptForm').serialize(),
                success: function (data) {
                    isLogin(data);
                    if (data.code == '200') {
                        layer.closeAll();
                        $('#tablepager').bootstrapTable('refresh');
                        layer.msg(data.msg, {icon: 1});
                    } else {
                        layer.msg(data.msg, {icon: 1});
                        $("#token").val(data.token);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.alert("服务异常,请返回刷新重试");
                }
            });
        }
    }

    function getdeptCode() {
        var code = "";
        $.ajax({
            type: "post",
            dataType: "json",
            url: "${ctx}/platform/dept/getDeptCode",
            data: {_method: "get"},
            success: function (msg) {
                isLogin(msg);
                $("#deptCode").val(msg.deptCode);
            }
        });
    }
</script>
</body>
</html>
