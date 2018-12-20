<!DOCTYPE html>
<%@ page language="java" pageEncoding="utf-8" %>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
    <%@ include file="/common/commonjs.jsp" %>
    <title>权限组</title>
    <link href="${staticCtx }/common/h5/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/plugins/iCheck/custom.css" rel="stylesheet">
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
                <button type="button" class="btn btn-primary btn-xm" onclick="parent.helpView('${ctx}/help/12')">
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
    <form class="form-horizontal" id="myForm">
        <input type="hidden" name="_method" id="_method">
        <input type="hidden" name="id" id="id">
        <input type="hidden" name="roleCode" value="" id="roleCode">
        <input type="hidden" id="token" name="token">
        <input type="hidden" id="company" name="company.id">
        <div class="col-md-12">
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">权限组名称
                    (<span class="text-danger">*</span>)
                    :</label>
                <div class="col-sm-6">
                    <input type="text" id="roleName" name="roleName" class="form-control" placeholder="权限组名称">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group" id="dataSort_f">
                <label class="col-sm-2 control-label">序号
                    (<span class="text-danger">*</span>)
                    :</label>
                <div class="col-sm-6">
                    <input type="text" id="dataSort" name="dataSort" class="form-control" placeholder="序号">
                </div>
            </div>
        </div>
    </form>
</div>
<div id="editer_auth_div" style="display: none;">
    <form class="form-horizontal" id="GroupAuthForm">
        <div class="col-md-12">
            <div class="form-group">
                <div class="col-sm-2">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            菜单
                        </div>
                    </div>
                </div>

                <div class="col-sm-10">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            功能
                        </div>
                    </div>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="col-md-12" id="pathData_id">
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript" src="${staticCtx}/common/js/common.js"></script>
<script type="text/javascript">
    $(function () {
        loadData();
        validateForm();
        $("[data-toggle='tooltip']").tooltip();
    });

    function loadData() {
        var url = "${ctx }/company/companyRole/pageSort";
        $('#tablepager').bootstrapTable({
            url: url,
            dataType: "json",
            pagination: true, //分页
            singleSelect: true,//只能选择一行
            striped: true,
            clickToSelect: true,
            search: false, //显示搜索框
            sidePagination: "server", //服务端处理分
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20, 50, 100],
            //onlyInfoPagination: true,
            showColumns: true,
            showRefresh: true,
            showToggle: true,
            cache: false,
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
                align: "center",
                width: 10,
                sortable: true
            }, {
                field: "roleName",
                title: "权限组",
                align: "center"
            }, {
                title: '授权',
                field: 'id',
                formatter: function (value, row, index) {
                    return "<a href='#'  class='btn btn-primary btn-xs' onclick=\"distriAath('" + row.id + "',1)\">   企</a>  " +
                        "<a href='#'  class='btn btn-primary btn-xs' onclick=\"distriAath('" + row.id + "',2)\">   销</a>  " +
                        //"<a href='#'  class='btn btn-primary btn-xs' onclick=\"distriAath('" + row.id + "',3)\">   电</a>  " +
                        "<a href='#'  class='btn btn-primary btn-xs' onclick=\"distriAath('" + row.id + "',4)\">   窗</a>  " +
                        "<a href='#'  class='btn btn-primary btn-xs' onclick=\"distriAath('" + row.id + "',5)\">   口</a>  " +
                        "<a href='#'  class='btn btn-primary btn-xs' onclick=\"distriAath('" + row.id + "',6)\">   旅</a>  ";
                }
            }
            ]
        });
    }


    function validateForm() {
        return $("#myForm").validate({
            rules: {
                roleName: {
                    required: true,
                    remote: {
                        url: "${ctx}/company/companyRole/remoteName",
                        type: "get",
                        dataType: 'json',
                        data: {
                            _method: "get",
                            cache: false,
                            name: function () {
                                return $("#roleName").val();
                            },
                            id: function () {
                                return $("#id").val();
                            }
                        },
                        dataFilter: function (data) {
                            isLogin(eval('(' + data + ')'));
                            return data;
                        }
                    },
                },
                dataSort: {required: true, range: [1, 9999], digits: true}
            },
            messages: {
                roleName: {required: "请输入权限组名称", remote: "该权限组名称已使用"},
                dataSort: {required: "请输入序号", range: "请输入序号，可选范围1-9999", digits: "请输入序号，可选范围1-9999"}
            },
            onfocusout: function (element) {
                $(element).valid();
            }

        });
    }

    function add() {
        $('#myForm')[0].reset();
        $("#_method").val("post");
        $("#id").val("");
        $("#company").val("${companyid}");
        $("#dataSort_f").hide();
        tokenSession("token", "${ctx }/common/tokenSession");
        dilogForm("添加", "${ctx }/company/companyRole");
    }

    function editor() {
        var row = getSingleData("tablepager");
        $('#myForm')[0].reset();
        if (row != null) {
            dilogForm("修改", "${ctx }/company/companyRole/" + row.id);
            $("#_method").val("put");
            $("#id").val(row.id);
            $("#company").val(row.company.id);
            $("#roleName").val(row.roleName);
            $("#roleCode").val(row.roleCode);
            $("#dataSort").val(row.dataSort);
            $("#myForm").validate().resetForm();
            $("#dataSort_f").show();
        } else {
            layer.msg("选择要修改的记录", {icon: 8});
        }
    }

    function deletedata() {
        var row = getSingleData("tablepager");
        if (row != null) {
            layer.confirm("确认删除？", {
                btn: ['确认', '取消'], //按钮
                shade: false
            }, function (index) {
                layer.close(index);
                var noticeIndex = hx_loading();//开启加载动画
                $.ajax({
                    type: "post",
                    dataType: "json",
                    url: "${ctx }/company/companyRole/" + row.id,
                    data: {_method: "delete"},
                    success: function (msg) {
                        if (isLogin(msg)) {
                            layer.msg(msg, {icon: 1});
                            $('#tablepager').bootstrapTable('refresh');
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
                dataType: "json",
                data: $('#myForm').serialize(),
                success: function (data) {
                    if (isLogin(data)) {
                        if (data.code == "200") {
                            layer.closeAll();
                            $('#tablepager').bootstrapTable('refresh');
                            layer.msg(data.msg, {icon: 1});
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

    function distriAath(roleid, type) {
        $('#GroupAuthForm')[0].reset();
        var pathUrl = "";
        var menuUrl = "";
        var htmlStr = '';
        menuUrl += "${ctx}/company/companyRoleMenu/listMenu";
        pathUrl += "${ctx}/company/companyRoleMenu/updateAuthMenu";
        $.ajax({
            type: "POST",
            url: menuUrl,
            dataType: "json",
            data: {
                _method: "get",
                companyRole: roleid,
                bussinessType: type
            },
            success: function (data) {
                if (isLogin(data)) {
                    $("#pathData_id").html("");
                    //加载所有权限
                    if (data.rows1[0] != null) {
                        $.each(data.rows1, function (index, item) {
                            htmlStr += '<div class="form-group" id="group_' + item.id + '">' +
                                '<div class="col-sm-2">' +
                                '<label class="checkbox-inline i-checks" id="label_' + item.id + '" for="id">' +
                                '<input type="checkbox" value="' + item.id + '" name="pathMenuId" id="menu_' + item.id + '">' + item.menuName + '</label>' +
                                '</div>' +
                                '<div class="col-sm-10" id="menu_two_' + item.id + '">';
                            $.each(data.rows2, function (index2, item2) {
                                if (item2.parentId == item.id) {
                                    htmlStr += '<div class="col-sm-2" id="menu_three_' + item2.id + '">' +
                                        '<label class="checkbox-inline  i-checks" id="label_' + item2.id + '" for="id">' +
                                        '<input type="checkbox" name="pathMenuId" value="' + item2.id + '"  id="menu_' + item2.id + '">' + item2.menuName + '</label>' +
                                        '</div>';
                                }
                            });
                            htmlStr += '</div>' +
                                '</div>' +
                                '<div class="hr-line-dashed" style="margin:10px;"></div>';

                        });
                    } else {
                        htmlStr += '<div class="form-group"> 不具有权限</div>';
                    }

                    $("#pathData_id").html(htmlStr);
                    //加载iCheck样式
                    $(".i-checks").iCheck({
                        checkboxClass: "icheckbox_square-green",
                        radioClass: "iradio_square-green",
                    });
                    //将权限附上

                    $.each(data.pathRows, function (index3, item3) {
                        $("#menu_" + item3).iCheck('check');
                        $("#label_" + item3).children("div").addClass("checked");
                    });
                    //添加点击事件
                    $("#pathData_id input").on('ifChecked', function (event) {
                        var id = event.target.defaultValue;
                        $("#menu_two_" + id + " input").iCheck('check');
                        $("#menu_three_" + id).parent().prev().first().children().first().children().first().attr("class", "icheckbox_square-green checked");
                        $("#menu_three_" + id).parent().prev().first().children().first().children().first().children().first().attr("checked", "checked");
                    }).on('ifUnchecked', function (event) {
                        var id = event.target.defaultValue;
                        $("#menu_two_" + id + " input").iCheck('uncheck');
                    });
                }
            },
            error: function () {
                layer.alert("请求过于频繁,请稍后再试");
            }
        });
        dilogAuth("业务系统授权", pathUrl, roleid, type);


    }

    function dilogAuth(title, url, id, type) {
        var index = layer.open({
            type: 1,
            shade: false,
            title: title, //显示标题
            content: $('#editer_auth_div'),
            closeBtn: 1,
            btn: ['提交', '关闭'],
            yes: function (index, layero) {
                sendCommand(url, id, type);
            }, btn2: function (index, layero) {
                layer.closeAll();
            },
            area: ['90%', '98%']
        });
    }

    //判断点击选择所涉及的事件
    function sendCommand(url, id, type) {
        var str = "";
        $("[name='pathMenuId']:checked").each(function () {
            str += $(this).val() + ",";
        });
        $.ajax({
            type: "POST",
            url: url,
            dataType: "json",
            data: {
                _method: "PUT",
                pathMenus: str,
                companyRoleid: id,
                bussinessType: type
            },
            success: function (msg) {
                if (isLogin(msg))
                    layer.closeAll();
                layer.msg(msg, {icon: 1});
                $('#tablepager').bootstrapTable('refresh');
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("请求过于频繁,请稍后再试");
            }
        });
    }

</script>
</body>
</html>

</body>




