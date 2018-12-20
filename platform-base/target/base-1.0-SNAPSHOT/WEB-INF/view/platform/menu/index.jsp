<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
    <link href="${staticCtx }/common/h5/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet" type="text/css">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>菜单 </h5>
                    <div class="ibox-tools">
                        <button class="btn btn-xs btn-primary" type="button"
                                onclick="parent.helpView('${ctx}/web/help/01')">
                            <i class="glyphicon glyphicon-question-sign" aria-hidden="true"></i>
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
            <div class="example">
                <div id="tableToolbar" role="group">
                    <button type="button" class="btn btn-primary btn-xm" onclick="add()">
                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>添加
                    </button>
                    <button type="button" class="btn btn-primary btn-xm" onclick="editor()">
                        <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>修改
                    </button>
                    <button type="button" class="btn btn-primary btn-xm" onclick="parent.helpView('${ctx}/help/01')">
                        <i class="glyphicon glyphicon-question-sign" aria-hidden="true"></i>
                    </button>
                </div>
                <div class="ibox-content">
                    <table id="tablepager">
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="editer_form_div" style="display: none;">
    <form class="form-horizontal" id="menuForm">
        <input type="hidden" name="_method" id="_method">
        <input type="hidden" name="id" id="id">
        <input type="hidden" id="token" name="token">
        <div class="col-md-12">
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">上级菜单(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
                    <select type="text" id="parentId" name="parentId" class="form-control"
                            placeholder="上级菜单">
                    </select>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">菜单名称(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
                    <input type="text" id="menuName" name="menuName" class="form-control"
                           placeholder="菜单名称">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">地址(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="gotoPageUrl" name="gotoPageUrl"
                           placeholder="地址"/>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">排序(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-2">
                    <input type="text" id="levelSequence" name="levelSequence" class="form-control"
                           placeholder="排序"
                    >
                </div>
                <label class="col-sm-2 control-label" for="useFlag1">状态(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-2">
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="useFlag1" value="1" name="useFlag" checked="checked">
                        <label for="useFlag1">启用</label>
                    </div>
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="useFlag2" value="0" name="useFlag">
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
        </div>
    </form>
</div>
<%@ include file="/common/commonjs.jsp" %>
<script src="${staticCtx}/common/js/common.js"></script>
<script>
    var parentid;
    $(function () {
        loadData();
        loadOneMenu()
        validateForm();
        showSelect('parentId', '', '${ctx}/platform/menu/firstLevelMenu', 'id', 'menuName', '');
        $("[data-toggle='tooltip']").tooltip('show');
    })

    function validateForm() {
        return $("#menuForm").validate({
            rules: {
                parentId: "required",
                menuName: {
                    required: true,
                    remote: {
                        url: "${ctx}/platform/menu/remote",
                        type: "get",
                        async: false,
                        cache: false,
                        data: {
                            name: function () {
                                return $("#menuName").val();
                            },
                            pid: function () {
                                return $("#parentId").val();
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
                gotoPageUrl: "required",
                levelSequence: {required: true, range: [1, 9999], digits: true}
            },
            messages: {
                parentId: "请选择上级菜单",
                menuName: {
                    required: "请输入菜单名称",
                    remote: "该名称已使用"
                },
                gotoPageUrl: "请填写地址",
            },
            /* 失去焦点时不验证 */
            onfocusout: false
        });
    }

    //加载左侧一级菜单
    function loadOneMenu() {
        $.ajax({
            type: "GET",
            url: "${ctx}/platform/menu/firstLevelMenu",
            dataType: "json",
            data: {},
            success: function (data) {
                isLogin(data);
                $("#leftOneMenu").html("");
                var str = '';
                $.each(data, function (index, item) {
                    str += ' <li><a class="J_menuItem" onclick="reload(\'' + item.id + '\',this)" data-index="1"><i name="leftListBtn"></i>' + item.menuName + '</a></li>';
                });
                $("#leftOneMenu").html(str);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
    }

    function reload(id, obj) {
        $('i[name="leftListBtn"]').removeClass("fa fa-check text-navy");
        $(obj).children().addClass("fa fa-check text-navy");
        $('#tablepager').bootstrapTable("refresh", {query: {'parentid': id}});
        parentid = id;
    }

    function loadData() {
        $('#tablepager').bootstrapTable({
            url: "${ctx}/platform/menu/listBySort",
            dataType: "json",
            pagination: false, //分页
            singleSelect: true,
            clickToSelect: true,
            search: false, //显示搜索框
            sidePagination: "server", //服务端处理分
            sortable: true, //是否启用排序
            sortName: "levelSequence",
            sortOrder: "asc",
            queryParams: function (params) {
                var par = {"parentid": parentid};
                var p = $.extend({}, params, par);
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
                field: "levelSequence",
                title: "序号",
                sortable: true,
                width: "10"
            }, {
                title: '菜单名称',
                field: 'menuName'
            }, {
                title: '地址',
                field: 'gotoPageUrl'
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
            }, {
                title: "备注",
                field: "memo"
            }
            ]
        });
    }

    function add() {
        if (typeof(parentid) != "undefined") {
            $('#menuForm')[0].reset();
            $("#_method").val("post");
            $("#id").val("");
            $("#levelSequence").val(1);
            $("#menuName").removeData("previousValue");
            tokenSession("token", "${ctx}/common/tokenSession");
            $("#parentId").val(parentid);
            dilogForm("添加", "${ctx}/platform/menu");
        } else {
            layer.msg("请先选择左侧菜单", {icon: 8});
        }

    }

    function editor() {
        $('#menuForm')[0].reset();
        var row = getSingleData("tablepager");
        if (row != null) {
            dilogForm("修改", "${ctx}/platform/menu/" + row.id);
            $("#_method").val("put");
            $("#id").val(row.id);
            $("#parentId").val(row.parentId);
            $("#menuName").val(row.menuName);
            $("#menuName").removeData("previousValue");
            $("#gotoPageUrl").val(row.gotoPageUrl);
            $("#levelSequence").val(row.levelSequence);
            if (row.useFlag == 1) {
                $("#useFlag1").prop("checked", "checked");
            } else {
                $("#useFlag2").prop("checked", "checked");
            }
            $("#memo").val(row.memo);
        } else {
            layer.msg("选择要修改的记录", {icon: 8});
        }
    }

    <%--//    逻辑删除--%>
    <%--function isuse(row) {--%>
    <%--var row = getSingleData("tablepager");--%>
    <%--var str1 = "";--%>
    <%--if (row.useFlag == true) {--%>
    <%--str1 = "禁用"--%>
    <%--} else {--%>
    <%--str1 = "启用"--%>
    <%--}--%>
    <%--if (row != null) {--%>
    <%--layer.confirm("确认" + str1 + "？", {--%>
    <%--btn: ['确认', '取消'], //按钮--%>
    <%--shade: false--%>
    <%--}, function (index) {--%>
    <%--layer.close(index);--%>
    <%--$.ajax({--%>
    <%--type: "post",--%>
    <%--dataType: "json",--%>
    <%--data: {--%>
    <%--_method: "put",--%>
    <%--useflag: row.useFlag--%>
    <%--},--%>
    <%--url: "${ctx}/platform/menu/use/" + row.id,--%>
    <%--success: function (msg) {--%>
    <%--layer.msg(msg, {icon: 0});--%>
    <%--$('#tablepager').bootstrapTable('refresh', {query: {'parentid': parentid}});--%>
    <%--}--%>
    <%--});--%>
    <%--}, function () {--%>
    <%--});--%>
    <%--} else {--%>
    <%--layer.msg("选择要删除的记录", {icon: 7});--%>
    <%--}--%>
    <%--}--%>

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
                data: $('#menuForm').serialize(),
                success: function (msg) {
                    if (isLogin(msg)) {
                        if (msg.indexOf("成功") >= 0) {
                            layer.closeAll();
                            $('#tablepager').bootstrapTable("refresh", {query: {'parentid': parentid}});
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