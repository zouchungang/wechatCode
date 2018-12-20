<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
    <%@ include file="/common/commonjs.jsp" %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>景区企业--菜单管理</title>
    <meta name="keywords" content="景区企业 菜单管理">
    <meta name="description" content="景区企业 菜单管理">
    <link href="${staticCtx }/common/h5/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
    <style>
        .selectMenu {
            color: #3c3c3c;
        }
    </style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <%--<div class="row">--%>
    <%--<div class="col-sm-12">--%>
    <%--<div class="alert alert-warning"><button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>警告：</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <div class="row">
        <div class="col-sm-3">
            <div class="widget style1 navy-bg text-center" id="widget_1">
                <button class="btn btn-sm btn-outline btn-rounded selectMenu" onclick="reloadByBussType(1)" id="btn_1">
                    <i class="fa fa-user fa-3x"></i>
                    <h3 class="font-bold">景区基础平台系统</h3>
                </button>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="widget style1 navy-bg text-center" id="widget_2">
                <button onclick="reloadByBussType(2)" class="btn btn-sm btn-outline btn-rounded"
                        role="button" id="btn_2">
                    <i class="fa fa-users fa-3x"></i>
                    <h3 class="font-bold">分销平台系统</h3>
                </button>
            </div>
        </div>
        <%--<div class="col-sm-3">--%>
            <%--<div class="widget style1 navy-bg text-center" id="widget_3">--%>
                <%--<button onclick="reloadByBussType(3)" class="btn btn-sm btn-outline btn-rounded"--%>
                        <%--role="button" id="btn_3">--%>
                    <%--<i class="fa fa-cart-arrow-down fa-3x"></i>--%>
                    <%--<h3 class="font-bold">电商系统</h3>--%>
                <%--</button>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="col-sm-3">
            <div class="widget style1 navy-bg text-center" id="widget_4">
                <button onclick="reloadByBussType(4)" class="btn btn-sm btn-outline btn-rounded"
                        role="button" id="btn_4">
                    <i class="fa fa-laptop fa-3x"></i>
                    <h3 class="font-bold">窗口业务系统</h3>
                </button>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="widget style1 navy-bg text-center" id="widget_5">
                <button onclick="reloadByBussType(5)" class="btn btn-sm btn-outline btn-rounded"
                        role="button" id="btn_5">
                    <i class="fa fa-laptop fa-3x"></i>
                    <h3 class="font-bold">窗口售票系统</h3>
                </button>
            </div>
        </div>
        <%--<div class="col-sm-2">--%>
            <%--<div class="widget style1 navy-bg text-center" id="widget_6">--%>
                <%--<button onclick="reloadByBussType(6)" class="btn btn-sm btn-outline btn-rounded"--%>
                        <%--role="button" id="btn_6">--%>
                    <%--<i class="fa fa-laptop fa-3x"></i>--%>
                    <%--<h3 class="font-bold">旅行社业务系统</h3>--%>
                <%--</button>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>
    <div class="row">
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="file-manager">
                        <h5>菜单目录</h5>
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
            <div class="example-wrap">
                <div class="example">
                    <p id="tableToolbar" role="group">
                        <button type="button" class="btn  btn-xm btn-primary" onclick="add()">
                            <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>添加
                        </button>
                        <button type="button" class="btn  btn-xm btn-primary" onclick="editor()">
                            <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>修改
                        </button>
                        <button type="button" class="btn  btn-xm btn-primary" onclick="deleteDistributionMenu()">
                            <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
                        </button>
                        <button type="button" class="btn  btn-xm btn-primary" onclick="parent.helpView('${ctx}/help/01')">
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
    <form class="form-horizontal cmxform" id="baseMenuForm">
        <input type="hidden" name="_method" id="_method">
        <input type="hidden" name="id" id="id">
        <input type="hidden" name="dataLevels" id="dataLevels" value="2">
        <input type="hidden" name="bussinessType" id="bussinessType">
        <input type="hidden" id="token" name="token">
        <div class="col-md-12">
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">父级菜单(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
                    <select class="form-control" name="parentId" id="parentSelectMenu"></select>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">菜单名称(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
                    <input type="text" id="menuName" name="menuName" class="form-control"
                           placeholder="菜单名称" required/>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">访问地址(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
                    <input type="text" id="gotoPageUrl" name="gotoPageUrl" class="form-control"
                           placeholder="访问地址"/>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">排序(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-2">
                    <input type="text" id="dataSort" name="dataSort" class="form-control"
                           placeholder="排序"/>
                </div>
                <label class="col-sm-2 control-label" for="useFlag1">状态(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-2">
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="useFlag1" value="1" name="useFlag" checked="">
                        <label for="useFlag1">启用</label>
                    </div>
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="useFlag2" value="0" name="useFlag" checked="">
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
<script>
    var bussType = 1;
    var lpId;

    $(function () {
        loadData();
        loadOneMenu(1);
        validateForm();
        //reloadByBussType(1);
        $('#parentSelectMenu').change(function (event) {
            $("#baseMenuForm").validate().resetForm();
        });
        $("[data-toggle='tooltip']").tooltip('show');
    });


    function validateForm() {
        $("#baseMenuForm").validate({
            rules: {
                parentId: {required: true},
                menuName: {
                    required: true,
                    remote: {
                        url: "${ctx}/platform/auth/bussinessMenu/remoteName",
                        type: "get",
                        dataType: 'json',
                        data: {
                            _method: function () {
                                return "get";
                            },
                            cache: false,
                            name: function () {
                                return $("#menuName").val();
                            },
                            id: function () {
                                return $("#id").val();
                            }, parentId: function () {
                                return $("#parentSelectMenu").val();
                            }
                        },
                        dataFilter: function (data) {
                            var msg = eval('(' + data + ')');
                            isLogin(msg);
                            return data;
                        }
                    }
                },
                gotoPageUrl: {required: true},
                dataSort: {required: true, range: [1, 9999], digits: true},
                useFlag: {required: true}
            },
            messages: {
                parentId: {required: "请选择父级菜单"},
                menuName: {required: "请输入菜单名称", remote: "该菜单名称已使用"},
                gotoPageUrl: {required: "请输入地址"},
                dataSort: {required: "请输入序号", range: "请输入整数序号，可选范围1-9999", digits: "请输入整数序号，可选范围0-9999"},
                useFlag: {required: "请选择状态"}
            }
        });
    }

    //加载左侧一级菜单
    function loadOneMenu(type) {
        $.ajax({
            type: "POST",
            url: "listOne",
            dataType: "json",
            data: {
                _method: "GET",
                bussinessType: type
            },
            success: function (data) {
                isLogin(data);
                $("#leftOneMenu").html("");
                var str = "";
                $.each(data, function (index, item) {
                    str += "<li style='overflow:hidden;'><a href='#' data-index='1' class='J_menuItem' onclick=\"reloadByPMenu('" + item.id + "',this,'" + type + "')\"><i name='leftListBtn'></i>" + item.menuName + "</a></li> ";
                });
                $("#leftOneMenu").html(str);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
    }

    function loadData() {
        var url = "${ctx}/platform/auth/bussinessMenu/list?n=" + new Date();
        $('#table').bootstrapTable({
            url: url,
            dataType: "json",
            pagination: true, //分页
            singleSelect: true,
            striped: true,
            queryParams: function (params) {
                var par = {"bussinessType": bussType, "parentId": lpId};
                var p = $.extend({}, params, par);
                return p;    //请求服务器数据时，你可以通过重写参数的方式添加一些额外的参数，本项目中用于自定义表格的查询，于别的文章详细阐述。
            },
            clickToSelect: true,
            search: false, //显示搜索框
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
            onLoadSuccess: function (data) {
                isLogin(data);
            },
            columns: [{
                checkbox: true
            }, {
                title: "序号",
                field: "dataSort",
                sortable: true,
                valign: "middle",
                align: "center",
                width: 12
            }, {
                title: '菜单名称',
                field: 'menuName',
                sortable: true
            }, {
                title: '菜单地址',
                field: 'gotoPageUrl'
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

    function reloadByPMenu(pid, obj, type) {
        $("i[name='leftListBtn']").removeClass("fa fa-check text-navy");
        $(obj).children().addClass("fa fa-check text-navy");
        $('#table').bootstrapTable("refresh", {
            url: "${ctx}/platform/auth/bussinessMenu/list?n=" + new Date(),
            query: {"parentId": pid, "bussinessType": type}
        });
        lpId = pid;
    }

    function reloadByBussType(type) {
        loadOneMenu(type);
        lpId = "";
        $('#table').bootstrapTable("refresh", {
            url: "${ctx}/platform/auth/bussinessMenu/list?n=" + new Date(), query: {"bussinessType": type}
        });
        $("#btn_1,#btn_2,#btn_3,#btn_4,#btn_5,#btn_6").attr("class", "btn btn-sm btn-outline btn-rounded");
        $("#btn_" + type).attr("class", "btn btn-sm btn-outline btn-rounded selectMenu");
        bussType = type;
    }

    function add() {
        $('#baseMenuForm')[0].reset();
        $("#_method").val("post");
        $("#bussinessType").val(bussType);
        $("#useFlag1").prop("checked", true);
        $("#id").val("");
        $("#dataSort").val("1");
        tokenSession("token", "${ctx}/common/tokenSession");
        dilogForm("添加", "${ctx}/platform/auth/bussinessMenu", lpId, bussType);
        $("#parentSelectMenu").val(lpId);
        $("#baseMenuForm").validate().resetForm();
    }

    function editor() {
        var row = getSingleData("table");
        $('#baseMenuForm')[0].reset();
        if (row != null) {
            dilogForm("修改", "${ctx}/platform/auth/bussinessMenu/" + row.id, row.parentId, row.bussinessType);
            $("#_method").val("put");
            $("#id").val(row.id);
            setChecked(row);
            $("#parentSelectMenu").val(row.parentId);
            $("#menuName").val(row.menuName);
            $("#bussinessType").val(row.bussinessType);
            $("#dataSort").val(row.dataSort);
            $("#gotoPageUrl").val(row.gotoPageUrl);
            $("#memo").val(row.memo);
            $("#baseMenuForm").validate().resetForm();
        } else {
            layer.msg("选择要修改的记录", {icon: 8});
        }
    }

    function loadLeftMenu(pid, type) {
        $.ajax({
            type: "POST",
            url: "listOne",
            dataType: "json",
            data: {
                _method: "GET",
                useFlag: true,
                bussinessType: type
            },
            success: function (data) {
                isLogin(data);
                $("#parentSelectMenu").html("");
                var str = '';
                $.each(data, function (index, item) {
                    if (item.id == pid) {
                        str += '<option value="' + item.id + '" selected>' + item.menuName + '</option>';
                    } else {
                        str += '<option value="' + item.id + '">' + item.menuName + '</option>';
                    }
                });
                $("#parentSelectMenu").html(str);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
    }

    function dilogForm(title, url, parentId, type) {
        loadLeftMenu(parentId, type);
        var index = layer.open({
            type: 1,
            shade: false,
            title: title, //显示标题
            content: $('#editer_form_div'),
            closeBtn: 1,
            btn: ['提交', '关闭'], //只是为了演示
            yes: function (index, layero) {
                submitForm(url, parentId, type);
            }, btn2: function (index, layero) {
                layer.closeAll();
                //按钮【按钮二】的回调
            },
            //shadeClose: true,
            //maxmin: true,
            area: ['90%', '98%']
        });
    }

    function submitForm(url, pid, type) {
        if ($("#baseMenuForm").validate().form()) {
            $.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                data: $('#baseMenuForm').serialize(),
                success: function (msg) {
                    isLogin(msg);
                    layer.closeAll();
                    layer.msg(msg.toString(), {icon: 1});
                    //$('#table').bootstrapTable('refresh');
                    $('#table').bootstrapTable("refresh", {
                        url: "${ctx}/platform/auth/bussinessMenu/list?n=" + new Date(),
                        query: {"parentId": pid, "bussinessType": type}
                    });
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.alert("服务异常,请返回刷新重试");
                }
            });
        }
    }

    function deleteDistributionMenu() {
        var row = getSingleData("table");
        if (row != null) {
            layer.confirm("确认删除？", {
                btn: ['确认', '取消'], //按钮
                shade: false
            }, function (index) {
                layer.close(index);
                $.ajax({
                    type: "POST",
                    url: "${ctx}/platform/auth/bussinessMenu/" + row.id,
                    dataType: "json",
                    data: {
                        _method: "delete"
                    },
                    success: function (msg) {
                        isLogin(msg);
                        layer.msg(msg.toString(), {icon: 1});
                        //$('#table').bootstrapTable('refresh');
                        $('#table').bootstrapTable("refresh", {
                            url: "${ctx}/platform/auth/bussinessMenu/list?n=" + new Date(),
                            query: {"parentId": row.parentId, "bussinessType": row.bussinessType}
                        });
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        layer.alert("服务异常,请返回刷新重试");
                    }
                });
            }, function () {
            });
        } else {
            layer.msg("选择要删除的记录", {icon: 8});
        }
    }

    function setChecked(row) {
        $("#useFlag1").prop("checked", false);
        $("#useFlag2").prop("checked", false);
        if (row.useFlag) {
            $("#useFlag1").prop("checked", true);
        } else {
            $("#useFlag2").prop("checked", true);
        }
    }

</script>
</body>
</html>
