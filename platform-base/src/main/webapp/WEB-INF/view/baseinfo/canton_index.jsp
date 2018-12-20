<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>客源地</title>
    <%@ include file="/common/title.jsp" %>
    <link href="${staticCtx }/common/h5/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-3">
            <div class="ibox-content">
                <div id="treeview" class="test"></div>
            </div>
        </div>
        <div class="col-sm-9">
            <!-- Example Toolbar -->
            <div class="example-wrap">
                <div class="example">
                    <p id="tableToolbar" role="group">
                        <button type="button" class="btn  btn-xm btn-primary" onclick="add()">
                            <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>添加
                        </button>
                        <button type="button" class="btn  btn-xm btn-primary" onclick="editor()">
                            <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>修改
                        </button>
                        <%--<button type="button" class="btn  btn-xm btn-primary" onclick="deleteChannel()">--%>
                        <%--<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除--%>
                        <%--</button>--%>
                        <button class="btn btn-xm btn-primary" type="button"
                                onclick="parent.helpView('${ctx}/help/14')">
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
    <form class="form-horizontal" id="cantonForm">
        <input type="hidden" name="_method" id="_method">
        <input type="hidden" name="id" id="id">
        <input type="hidden" id="token" name="token">
        <div class="col-md-12">
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">所属区域(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="pname" class="form-control"
                           readonly="readonly">
                    <input type="hidden" id="pid" name="parentId" class="form-control"
                           readonly="readonly">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">名称(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="cantonName" name="cantonName" class="form-control"
                           placeholder="名称">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">区域编码：</label>
                <div class="col-sm-3">
                    <input type="text" id="cantonCode" name="cantonCode" class="form-control"
                           placeholder="区域编码">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">区域坐标：</label>
                <div class="col-sm-3">
                    <input type="text" id="coordinates" name="coordinates" class="form-control"
                           placeholder="格式:xxx,xxx或者xxx.xx,xxx.xx">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="useFlag1">启用状态(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="useFlag1" value="1" name="useFlag" checked="checked">
                        <label for="useFlag1">是</label>
                    </div>
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="useFlag2" value="0" name="useFlag">
                        <label for="useFlag2">否</label>
                    </div>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">排序(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="dataSort" name="dataSort" value="1" class="form-control" placeholder="排序">
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
<script src="${staticCtx }/common/h5/js/plugins/treeview/bootstrap-treeview.js"></script>
<script src="${ctx }/common/js/common.js"></script>
<script>
    var selectId = '';
    var selectname = '';
    $(function () {
        $("[data-toggle='tooltip']").tooltip();
        initTree();
        validateForm();
        loadData();
        jQuery.validator.addMethod("zuobiao", function (value, element) {
            var reg1 = /^[-\+]?\d+(\.\d+)?\,[-\+]?\d+(\.\d+)?$/;
            return this.optional(element) || (reg1.test(value));
        }, "坐标格式错误");
    });

    //加载左侧菜单
    function initTree() {
        $.ajax({
            type: "GET",
            url: "${ctx}/platform/baseinfo/canton/cantonTree",
            data: {
                _method: "GET"
            },
            success: function (data) {
                var e = data;
                $("#treeview").treeview({
                    data: e,
                    onNodeSelected: function (e, o) {
                        selectId = o.id;
                        selectname = o.name;
                        $('#table').bootstrapTable('refresh');
                    }
                });
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert(textStatus);
            }
        });
    }

    function loadData() {
        $('#table').bootstrapTable({
            url: "${ctx}/platform/baseinfo/canton/listByPId?n=" + new Date(),
            dataType: "json",
            pagination: true, //分页
            singleSelect: true,
//            striped: true,
            clickToSelect: true,
//            search: true, //显示搜索框
            sidePagination: "server", //服务端处理分
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20, 50, 100],
            //onlyInfoPagination:true,
            checkboxHeader: true,
            showColumns: true,
            showRefresh: true,
            showToggle: true,
            cache: false,
            sortable: true,      //是否启用排序
            sortOrder: "asc",     //排序方式
            sortName: "dataSort",
            toolbar: "#tableToolbar",
            queryParams: function (params) {
                var par = {"parentId": selectId};
                var p = $.extend({}, params, par);
                return p;    //请求服务器数据时，你可以通过重写参数的方式添加一些额外的参数，本项目中用于自定义表格的查询，于别的文章详细阐述。
            },
            columns: [{
                checkbox: true
            }, {
                title: '序号',
                field: 'dataSort',
                sortable: true,
                width: 10
            }, {
                title: '名称',
                field: 'cantonName'
            }, {
                title: '助记码',
                field: 'shortCode'
            }, {
                title: '行政区域编码',
                field: 'cantonCode',
            }, {
                title: '地理位置',
                field: 'coordinates'
            }, {
                title: '启用状态',
                field: 'useFlag',
                formatter: function (value, row) {
                    if (1 == value) {
                        return '<span class="label label-primary">是</span>';
                    } else if (0 == value) {
                        return '<span class="label label-danger">否</span>';
                    }
                }
            }
            ]
        });
    }

    function validateForm() {
        $("#cantonForm").validate({
            rules: {
                cantonName: {
                    required: true,
                    remote: {
                        url: "${ctx}/platform/baseinfo/canton/remoteName",
                        type: "get",
                        dataType: 'json',
                        data: {
                            id: function () {
                                return $("#id").val();
                            },
                            name: function () {
                                return $("#cantonName").val();
                            },
                            pid: function () {
                                return selectId;
                            }
                        }
                    }
                },
                cantonCode: {
                    required: true,
                    number: true,
                    maxStringLength: 50
                },
                dataSort: {
                    required: true,
                    digits: true,
                    range: [1, 9999]
                },
                coordinates: {
                    zuobiao: true
                },
                memo: {maxStringLength: 400}
            },
            messages: {
                cantonName: {
                    required: "请输入区域名称",
                    remote: "该名称已使用"
                },
                cantonCode: {
                    required: "请输入区域编码",
                },
                dataSort: {
                    required: "请输入1-9999之间的整数",
                    digits: "请输入1-9999之间的整数",
                    range: "请输入1-9999之间的整数"
                }
            }
        });
    }

    function add() {
        if (!selectId) {
            layer.msg("请先在左侧列表树选择", {icon: 8});
            return false;
        }
        $('#cantonForm')[0].reset();
        $("#_method").val("post");
        $("#id").val("");
        $("#pid").val(selectId);
        $("#pname").val(selectname);
        $("#cantonCode").removeData("previousValue");
        $("#cantonName").removeData("previousValue");
        tokenSession("token", "${ctx}/common/tokenSession");
        dilogForm("添加", "${ctx}/platform/baseinfo/canton");
    }

    function editor() {
        var row = getSingleData("table");
        $('#cantonForm')[0].reset();
        if (row != null) {
            if (row.parentId == '-1') {
                layer.msg("顶级不可修改", {icon: 8});
            } else {
                $("#_method").val("put");
                $("#id").val(row.id);
                $.ajax({
                    type: "GET",
                    url: "${ctx}/platform/baseinfo/canton/" + row.parentId,
                    data: {
                        _methed: "get"
                    },
                    success: function (data) {
                        $("#pname").val(eval(data));
                    }
                });
                $("#pid").val(row.parentId);
                $("#cantonCode").val(row.cantonCode);
                $("#cantonCode").removeData("previousValue");
                $("#cantonName").val(row.cantonName);
                $("#cantonName").removeData("previousValue");
                if (row.useFlag == true) {
                    $("#useFlag1").prop("checked", true);
                } else {
                    $("#useFlag2").prop("checked", true);
                }
                $("#dataSort").val(row.dataSort);
                $("#memo").val(row.memo);
                $("#coordinates").val(row.coordinates);
                $("#cantonForm").valid();
                dilogForm("修改", "${ctx}/platform/baseinfo/canton/" + row.id);
            }
        } else {
            layer.msg("选择要修改的记录", {icon: 8});
        }
    }

    function dilogForm(title, url) {
        $("#cantonForm").validate().resetForm();
        $(".error").removeClass("error");
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
            area: ['90%', '100%']
        });
    }

    function submitForm(url) {
        if ($("#cantonForm").validate().form()) {
            $.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                data: $('#cantonForm').serialize(),
                success: function (msg) {
                    if(msg.code=="200"){
                        layer.closeAll();
                        layer.msg(msg.msg, {icon: 1});
                    }else {
                        $("#token").val(msg.token);
                        layer.msg(msg.msg, {icon: 8});
                    }
                    $('#table').bootstrapTable('refresh');
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.alert(textStatus);
                }
            });
        }
    }

    function deleteChannel() {
        var row = getSingleData("table");
        if (row != null) {
            layer.confirm('确认删除？', {
                btn: ['确认', '取消'], //按钮
                shade: false
            }, function (index) {
                layer.close(index);
                $.ajax({
                    type: "POST",
                    url: "${ctx}/platform/baseinfo/canton/" + row.id,
                    dataType: "json",
                    data: {
                        _method: "delete"
                    },
                    success: function (msg) {
                        layer.msg(msg, {icon: 1});
                        $('#table').bootstrapTable('refresh');
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        layer.alert(textStatus);
                    }
                });
            }, function () {
            });

        } else {
            layer.msg("选择要删除的记录", {icon: 8});
        }
    }
</script>
</body>
</html>
