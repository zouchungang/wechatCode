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
                <div class="ibox-content">
                    <div class="file-manager">
                        <h5>字典类型</h5>
                        <div class="hr-line-dashed"></div>
                        <ul class="folder-list m-b-md" id="leftOneMenu" style="padding: 0;line-height: 20px">
                        </ul>
                        <div class="hr-line-dashed"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-10">
            <!-- Example Toolbar -->
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
                                        <div class="col-sm-9">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">参数名称</label>
                                                <div class="col-sm-3">
                                                    <input type="text" id="searchEmployeeName" placeholder="请输入参数名称"
                                                           class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <p>
                                                <button class="btn  btn-primary" onclick="searchTable()"
                                                        type="submit"><strong>查询</strong>
                                                </button>
                                                <button class="btn  btn-white"
                                                        type="submit" onclick="clearSearchBtn()"><strong>清空查询条件</strong>
                                                </button>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <p  id="tableToolbar" role="group">
                        <button type="button" class="btn  btn-xm btn-primary" onclick="add()">
                            <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>添加
                        </button>
                        <button type="button" class="btn  btn-xm btn-primary" onclick="editor()">
                            <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>修改
                        </button>
                        <button type="button" class="btn  btn-xm btn-primary" onclick="deleteDict()">
                            <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
                        </button>
                    </p>
                    <div class="ibox-content">
                        <table id="table" data-mobile-responsive="true">
                        </table>
                    </div>
                </div>
            </div>
            <!-- End Example Toolbar -->
        </div>
    </div>
</div>
<div id="editer_form_div" style="display: none;">
    <form class="form-horizontal" id="dictForm">
        <input type="hidden" name="_method" id="_method">
        <input type="hidden" name="id" id="id">
        <input type="hidden" id="token" name="token">
        <div class="col-md-12">
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">父级菜单(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
                    <select class="form-control" name="dictType.id" id="parentSelectMenu" onchange="remoteNameAndValue()">
                    </select>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">参数名称(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
                    <input type="text" id="paramName" name="paramName" class="form-control"
                           placeholder="参数名称">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">参数值(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
                    <input type="text" id="paramValue" name="paramValue" class="form-control"
                           placeholder="参数值">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="useFlag1">状态(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
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
                    <input type="text" id="memo" name="memo" class="form-control" placeholder="备注">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
        </div>
    </form>
</div>
<%@ include file="/common/commonjs.jsp" %>
<script>
    var dictTypeId;
    $(function () {
        loadData();
        validateForm();
        loadOneMenu();
    });
    //加载左侧字典类型
    function loadOneMenu() {
        $.ajax({
            type: "GET",
            url: "${ctx}/platform/baseinfo/dict/listType",
            dataType: "json",
            data: {},
            success: function (data) {
                isLogin(data);
                $("#leftOneMenu").html("");
                var str = '';
                $.each(data, function (index, item) {
                    str += ' <li><a class="J_menuItem" onclick="reload(\'' + item.id + '\',this)" data-index="1"><i name="leftListBtn"></i>' + item.typeName + '(' + item.typeCode + ')</a></li>';
                });
                $("#leftOneMenu").html(str);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
    }
    //修改父级菜单时验证name和value唯一性
    function remoteNameAndValue(){
        if($("#paramName").val()){
            $("#paramName").removeClass("error");
            $("#paramName").removeData("previousValue").valid();
        }
        if($("#paramValue").val()){
            $("#paramValue").removeClass("error");
            $("#paramValue").removeData("previousValue").valid();
        }
    }

    function validateForm() {
        return $("#dictForm").validate({
            rules: {
                'dictType.id': "required"
                , paramName: {
                    required: true,
                    remote: {
                        url: "${ctx}/platform/baseinfo/dict/validateParamName",     //后台处理程序
                        async: false,
                        cache: false,
                        data: { //要传递的数据
                            paramName: function () {
                                return $("#paramName").val();
                            },
                            id: function () {
                                return $("#id").val();
                            },
                            dictTypeId: function () {
                                return $("#parentSelectMenu").val();
                            }
                        },
                        dataFilter: function (data) {
                            console.info(data);
                            var msg = eval('(' + data + ')');
                            isLogin(msg);
                            return data;
                        }
                    }
                }, paramValue: {
                    required: true,
                    digits: true,
                    remote: {
                        url: "${ctx}/platform/baseinfo/dict/validateParamValue",     //后台处理程序
                        dataType: "json",           //接受数据格式
                        type: "get",               //数据发送方式
                        cache: false,
                        async: false,
                        data: { //要传递的数据
                            paramValue: function () {
                                return $("#paramValue").val();
                            },
                            id: function () {
                                return $("#id").val();
                            },
                            dictTypeId: function () {
                                return $("#parentSelectMenu").val();
                            }
                        },
                        dataFilter: function (data) {
                            var msg = eval('(' + data + ')');
                            isLogin(msg);
                            return data;
                        }
                    }
                }
            }, messages: {
                'dictType.id': "请选择字典类型"
                , paramValue: {
                    required: "请输入参数值",
                    digits: "请输入数字",
                    remote: "此值已存在"
                }
                , paramName: {
                    required: "请输入参数名称",
                    remote: "此名称已存在"
                }
            },
            onfocusout: function (element) {
                $(element).valid();
            }
        })
    }
    function reload(id, obj) {
        dictTypeId = id;
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
            url: "${ctx}/platform/baseinfo/dict/list?n=" + new Date(),
            dataType: "json",
            pagination: true, //分页
            singleSelect: true,
            striped: true,
            clickToSelect: true,
            search: false, //显示搜索框
            sidePagination: "server", //服务端处理分
            sortable: true, //是否启用排序
            sortName: "paramValue",
            sortOrder: "asc",
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20, 50, 100],
            checkboxHeader: true,
            queryParams: function (params) {
                var par = {"paramName": $("#searchEmployeeName").val(), "dictType.id": dictTypeId};
                var p = $.extend({}, params, par);
                return p;
            },
            showColumns: true,
            showRefresh: false,
            showToggle: true,
            cache: false,
            toolbar: "#tableToolbar",
            onLoadSuccess: function (data) {
                isLogin(data);
            },
            columns: [{
                checkbox: true
            }, {
                title: '参数名称',
                field: 'paramName',
                width: 450
            }, {
                title: '参数值',
                field: 'paramValue',
                sortable: true
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
            }, {
                title: '是否初始化数据',
                field: 'initFlag',
                formatter: function (value, row) {
                    if (1 == value) {
                        return '<span class="label label-danger">初始化</span>';
                    } else if (0 == value) {
                        return '<span class="label label-primary">自定义</span>';
                    }
                }
            }]
        });
    }
    function add() {
        $('#dictForm')[0].reset();
        claerValidate();
        $("#_method").val("post");
        $("#id").val("");
        loadLeftMenu(dictTypeId);
        tokenSession("token", "${ctx}/common/tokenSession");
        $("#paramValue").removeData("previousValue");
        $("#paramName").removeData("previousValue");
        $("#parentSelectMenu").val(dictTypeId);
        dilogForm("添加", "${ctx}/platform/baseinfo/dict/add");
    }
    function loadLeftMenu(pid) {
        $.ajax({
            type: "GET",
            url: "${ctx}/platform/baseinfo/dict/listType?n=" + new Date(),
            dataType: "json",
            data: {
                _method: "GET",
                useFlag: true
            },
            success: function (data) {
                isLogin(data);
                $("#parentSelectMenu").html("");
                var str = '';
                $.each(data, function (index, item) {
                    if (item.id == pid) {
                        str += '<option value="' + item.id + '" selected>' + item.typeName + '</option>';
                    } else {
                        str += '<option value="' + item.id + '">' + item.typeName + '</option>';
                    }

                });
                $("#parentSelectMenu").html(str);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
    }
    function editor() {
        var row = getSingleData("table");
        $('#dictForm')[0].reset();
        claerValidate();
        if (row != null) {
            if (row.initFlag == 0) {
                loadLeftMenu(row.dictType.id);
                $("#_method").val("put");
                $("#id").val(row.id);
                $("#paramValue").removeData("previousValue");
                $("#paramName").removeData("previousValue");
                //alert(row.dictType.id);
                $("#parentSelectMenu").val(row.dictType.id);
                // $("#parentSelectMenu").attr("value",row.dictType.id);
                $("#paramName").val(row.paramName);
                $("#paramValue").val(row.paramValue);
                if (row.useFlag == 1) {
                    $("#useFlag1").prop("checked", "checked");
                } else if (row.useFlag == 0) {
                    $("#useFlag2").prop("checked", "checked");
                }
                $("#demo").val(row.demo);
                dilogForm("修改", "${ctx}/platform/baseinfo/dict/update");
            } else {
                layer.msg("系统初始化参数，不能修改", {icon: 8});
            }
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
                layer.closeAll();
            },
            success: function () {
                validateForm().resetForm();
            },
            area: ['90%', '100%']
        });
    }
    function submitForm(url) {
        var v = validateForm();
        v.form();
        if (v.form()) {
            $.ajax({
                type: "POST",
                url: url,
                data: $('#dictForm').serialize(),
                dataType: "json",
                success: function (msg) {
                    isLogin(msg);
                    layer.closeAll();
                    layer.msg(msg.toString(), {icon: 1});
                    $('#table').bootstrapTable('refresh', {query: {'dictType.id': dictTypeId}});
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.alert("服务异常,请返回刷新重试");
                }
            });
        }
    }
    function deleteDict() {
        var row = getSingleData("table");
        if (row != null) {
            if (row.initFlag == 0) {
                layer.confirm("确认删除？", {
                    btn: ['确认', '取消'], //按钮
                    shade: false
                }, function (index) {
                    layer.close(index);
                    $.ajax({
                        type: "POST",
                        url: "${ctx}/platform/baseinfo/dict/" + row.id,
                        data: {
                            _method: "delete"
                        },
                        dataType: "json",
                        success: function (msg) {
                            isLogin(msg);
                            layer.msg(msg.toString(), {icon: 1});
                            $('#table').bootstrapTable('refresh');
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            layer.alert("服务异常,请返回刷新重试");
                        }
                    });
                }, function () {
                });
            } else {
                layer.msg("系统初始化参数，不能删除", {icon: 8});
            }
        } else {
            layer.msg("选择要删除的记录", {icon: 8});
        }
    }
    function clearSearchBtn() {
        $("#searchEmployeeName").val("");
    }
</script>
</body>
</html>
