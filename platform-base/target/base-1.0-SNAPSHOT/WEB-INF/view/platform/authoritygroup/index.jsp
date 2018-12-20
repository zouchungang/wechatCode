<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
    <%@ include file="/common/commonjs.jsp" %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>权限分组</title>
    <meta name="keywords" content="权限分组">
    <meta name="description" content="权限分组">
    <link href="${staticCtx }/common/h5/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/plugins/iCheck/custom.css" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-9">
            <div class="example">
                <div  id="tableToolbar" role="group">
                    <button type="button" class="btn btn-primary btn-xm" onclick="add()">
                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>添加
                    </button>
                    <button type="button" class="btn btn-primary btn-xm" onclick="editor()">
                        <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>修改
                    </button>
                    <button type="button" class="btn btn-primary btn-xm" onclick="deleteCompanyGroup()">
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
        <div class="col-sm-3">
            <div class="ibox">
                <div class="ibox-title">
                    <h5>
                        查看景区所属权限组
                    </h5>
                </div>
                <div class="ibox-content">
                    <select style="width: 100%;" data-placeholder="请选择企业..." id="allCompany_id" class="chosen-select"
                            tabindex="2">
                        <option value="">请选择企业</option>
                    </select>
                    <table class="table" data-mobile-responsive="true">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>权限组</th>
                        </tr>
                        </thead>
                        <tbody id="cg_id">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="editer_form_div" style="display: none;">
    <form class="form-horizontal" id="companyGroupForm">
        <input type="hidden" name="_method" id="_method">
        <input type="hidden" name="id" id="id">
        <input type="hidden" id="token" name="token">
        <div class="col-md-12">
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">分组名称(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
                    <input type="text" id="groupName" name="groupName" class="form-control"
                           placeholder="分组名称">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">排序(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-2">
                    <input type="text" id="dataSort" name="dataSort" class="form-control" placeholder="排序">
                </div>
                <label class="col-sm-2 control-label" for="useFlag1">状态：</label>
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
                            &nbsp; &nbsp; 功能
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
<div id="editer_GCrel_div" style="display: none;">
    <form class="form-horizontal" id="GroupGCrelForm">
        <div class="col-md-12">
            <div class="form-group">
                <div class="col-sm-2">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            企业
                        </div>
                    </div>
                </div>
                <div class="col-sm-10">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            &nbsp; &nbsp; 景区
                        </div>
                    </div>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="col-md-12" id="GCrelData_id">
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="${staticCtx }/common/h5/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript">
    $(function () {
        validateForm();
        loadData();
        $('#allCompany_id').change(function (e, p) {
            loadCompsGroup(p.selected);
        });
        getAllCompany();
        $("[data-toggle='tooltip']").tooltip('show');
    });
    //验证表单
    function validateForm() {
        return $("#companyGroupForm").validate({
            rules: {
                groupName: {
                    required: true,
                    remote: {
                        url: "${ctx}/platform/companyGroup/remoteName",
                        type: "post",
                        async: false,
                        dataType: 'json',
                        data: {
                            _method: function () {
                                return "post";
                            },
                            cache: false,
                            name: function () {
                                return $("#groupName").val();
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
                dataSort: {required: true, range: [1, 9999], digits: true}
            },
            messages: {
                groupName: {required: "请输入分组名称", remote: "该分组名称已使用"},
                dataSort: {required: "请输入序号", range: "请输入整数序号，可选范围0-9999", digits: "请输入整数序号，可选范围0-9999"}
            },
            onfocusout: function (element) {
                $(element).valid();
            }

        });
    }
    //加载列表
    function loadData() {
        $('#tablepager').bootstrapTable({
            url: "${ctx}/platform/companyGroup/listBySort",
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
                title: "序号",
                field: "dataSort",
                sortable: true,
                valign: "middle",
                align: "center",
                width: 10
            }, {
                title: '权限组',
                field: 'groupName',
                sortable: true,
                valign: "middle",
                align: "center"
            }, {
                title: '授权',
                field: 'dataVerson',
                formatter: function (value, row, index) {
                    if (true == row.useFlag) {
                        return "<a href='#'  class='btn btn-primary btn-xs' onclick=\"regacve('" + row.id + "',1)\">   基</a>  " +
                            "<a href='#'  class='btn btn-primary btn-xs' onclick=\"regacve('" + row.id + "',2)\">   销</a>  " +
                            //"<a href='#'  class='btn btn-primary btn-xs' onclick=\"regacve('" + row.id + "',3)\">   电</a>  " +
                            "<a href='#'  class='btn btn-primary btn-xs' onclick=\"regacve('" + row.id + "',4)\">   窗</a>  " +
                            "<a href='#'  class='btn btn-primary btn-xs' onclick=\"regacve('" + row.id + "',5)\">   口</a>  " +
//                            "<a href='#'  class='btn btn-primary btn-xs' onclick=\"regacve('" + row.id + "',6)\">   旅</a>  " +
                            "<a href='#'  class='btn btn-info btn-xs' onclick=\"distriCompany('" + row.id + "')\">   企</a>  ";
                    } else {
                        return "";
                    }
                }
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
    //增
    function add() {
        $('#companyGroupForm')[0].reset();
        $("#_method").val("post");
        $("#id").val("");
        $("#dataSort").val("1");
        tokenSession("token", "${ctx}/common/tokenSession");
        dilogForm("添加", "${ctx}/platform/companyGroup");
    }
    //改
    function editor() {
        var row = getSingleData("tablepager");
        $('#companyGroupForm')[0].reset();
        if (row != null) {
            dilogForm("修改", "${ctx}/platform/companyGroup/" + row.id);
            $("#_method").val("put");
            $("#id").val(row.id);
            $("#groupName").val(row.groupName);
            setChecked(row);
            $("#dataSort").val(row.dataSort);
            $("#memo").val(row.memo);

        } else {
            layer.msg("选择要修改的记录", {icon: 8});
        }
    }
    //启禁用特殊处理
    function setChecked(row) {
        $("#useFlag1").prop("checked", false);
        $("#useFlag2").prop("checked", false);
        if (row.useFlag) {
            $("#useFlag1").prop("checked", true);
        } else {
            $("#useFlag2").prop("checked", true);
        }
    }
    //弹出表单
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
            success: function () {
                validateForm().resetForm();
            },
            //shadeClose: true,
            //maxmin: true,
            area: ['90%', '98%']
        });
    }
    //提交方法
    function submitForm(url) {
        var v = validateForm();
        v.form();
        if (v.form()) {
            $.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                data: $('#companyGroupForm').serialize(),
                success: function (msg) {
                    if (isLogin(msg)) {
                        if (msg.indexOf("成功") >= 0) {
                            layer.closeAll();
                            layer.msg(msg.toString(), {icon: 1});
                        } else {
                            layer.closeAll();
                            layer.msg(msg.toString(), {icon: 8});
                        }
                        $('#tablepager').bootstrapTable('refresh');
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.alert("服务异常,请返回刷新重试");
                }
            });
        }
    }
    //删除方法
    function deleteCompanyGroup() {
        var row = getSingleData("tablepager");
        if (row != null) {
            layer.confirm("确认删除？", {
                btn: ['确认', '取消'], //按钮
                shade: false
            }, function (index) {
                layer.close(index);
                $.ajax({
                    type: "POST",
                    url: "${ctx}/platform/companyGroup/" + row.id,
                    dataType: "json",
                    data: {
                        _method: "delete",
                    },
                    success: function (msg) {
                        if (isLogin(msg)) {
                            if (msg.indexOf("成功") >= 0) {
                                layer.msg(msg.toString, {icon: 1});
                            } else {
                                layer.msg(msg.toString(), {icon: 8});
                            }
                            $('#tablepager').bootstrapTable('refresh');
                        }
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

    /**
     * 分权限
     else if(2==i){
     }else if(3==i){
     }else if(4==i){
     }*/
    function regacve(id, i) {
        var pathUrl = "";
        var menuUrl = "";
        var htmlStr = '';
        menuUrl += "${ctx}/platform/auth/bussinessMenu/listMenu?bussinessType=" + i;
        pathUrl += "${ctx}/platform/auth/groupBussinessMenu/updateAuthMenu";
        $.ajax({
            type: "POST",
            url: menuUrl,
            dataType: "json",
            data: {
                _method: "get",
                groupId: id
            },
            success: function (data) {
                isLogin(data);
                $("#pathData_id").html("");
                //加载所有权限
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
                                '</div>' +
                                '<input type="hidden" value="' + item2.parentId + '"  id="menu_p_' + item2.id + '">';
                        }
                    });
                    htmlStr += '</div>' +
                        '</div>' +
                        '<div class="hr-line-dashed" style="margin:10px;"></div>';
                });
                $("#pathData_id").html(htmlStr);
                //加载iCheck样式
                $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});
                //将权限附上
                $.each(data.pathRows, function (index3, item3) {
                    $("#menu_" + item3.bussinessMenu.id).iCheck('check');
                    $("#label_" + item3.bussinessMenu.id).children("div").addClass("checked");
                });
//              添加点击事件
                $("#pathData_id input").on('ifChecked', function (event) {
                    var id = event.target.defaultValue;
                    var pid = $("#menu_p_" + id).val();
                    $("#menu_" + pid).iCheck('check');
                }).on('ifClicked', function (event) {
                    var id = event.target.defaultValue;
                    $("#menu_two_" + id + " input").iCheck('check');
                    $("#menu_three_" + id).parent().prev().first().children().first().children().first().attr("class", "icheckbox_square-green checked");
                    $("#menu_three_" + id).parent().prev().first().children().first().children().first().children().first().attr("checked", "checked");
                }).on('ifUnchecked', function (event) {
                    var id = event.target.defaultValue;
                    $("#menu_two_" + id + " input").iCheck('uncheck');
                });
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
        dilogAuth("业务系统授权", pathUrl, id, i);
    }

    //弹出权限框
    function dilogAuth(title, url, id, i) {
        var index = layer.open({
            type: 1,
            shade: false,
            title: title, //显示标题
            content: $('#editer_auth_div'),
            closeBtn: 1,
            btn: ['提交', '关闭'], //只是为了演示
            yes: function (index, layero) {
                //submitForm(url);
                sendCommand(url, id, i);
            }, btn2: function (index, layero) {
                layer.closeAll();
                //按钮【按钮二】的回调
            },
            //shadeClose: true,
            //maxmin: true,
            area: ['90%', '98%']
        });
    }

    //判断点击选择所涉及的事件
    function sendCommand(url, id, i) {
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
                authorityGroupId: id,
                bussinessType: i
            },
            success: function (msg) {
                isLogin(msg);
                layer.closeAll();
                layer.msg(msg.toString(), {icon: 1});
                $('#tablepager').bootstrapTable('refresh');
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
    }


    /*给分组分配景区*/
    function distriCompany(id) {
        var pathUrl = "";
        var companyUrl = "";
        var htmlStr = "";
        companyUrl += "${ctx}/platform/companyGroup/listCompany?useFlag=1";
        pathUrl += "${ctx}/platform/companyGroup/updateAuthCompany";
        $.ajax({
            type: "POST",
            url: companyUrl,
            dataType: "json",
            data: {
                _method: "get",
                groupId: id
            },
            success: function (data) {
                 //添加点击事件*/
                isLogin(data);
                $("#GCrelData_id").html("");
                //加载所有权限
                $.each(data.rows1, function (index, item) {
                    htmlStr += '<div class="form-group" id="enterprise_' + item.id + '">' +
                            '<div class="col-sm-2" >' +
                            '<label class="checkbox-inline i-checks" id="label_' + item.id + '" for="id">' +
                            '<input type="checkbox" value="' + item.id + '" name="pathGroupId" id="enterprise_' + item.id + '">' + item.name + '</label>' +
                            '</div>' +
                            '<div class="col-sm-10" id="company_two_' + item.id + '">';
                    $.each(data.rows2, function (index2, item2) {
                        if (item2.enterprise.id == item.id) {
                            htmlStr += '<div class="col-sm-2" id="company_three_' + item2.id + '">' +
                                    '<label class="checkbox-inline  i-checks" id="label_' + item2.id + '" for="id">' +
                                    '<input type="checkbox" name="pathCompanyId" value="' + item2.id + '"  id="company_' + item2.id + '">' + item2.companyName + '(' + item2.companyCode + ')</label>' +
                                    '</div>' +
                                    '<input type="hidden" value="' + item2.enterprise.id + '"  id="company_p_' + item2.id + '">';
                        }
                    });

                    htmlStr += '</div>' +
                            '</div>' +
                            '<div class="hr-line-dashed"></div>';
                });
                $("#GCrelData_id").html(htmlStr);
                //加载iCheck样式
                $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});
                //将权限附上
                $.each(data.companyRows, function (index3, item3) {
                    $("#company_" + item3.company.id).iCheck('check');
                    $("#label_" + item3.company.id).children("div").addClass("checked");
                    $("#label_" + item3.company.enterprise.id).children("div").addClass("checked");
                });
//              添加点击事件
                $("#GCrelData_id input").on('ifChecked', function (event) {
                    var id = event.target.defaultValue;
                    var pid = $("#company_p_" + id).val();
                    $("#label_" + pid).children("div").addClass("checked");
                }).on('ifClicked', function (event) {
                    var id = event.target.defaultValue;
                    $("#company_two_" + id + " input").iCheck('check');
                    $("#company_three_" + id).parent().prev().first().children().first().children().first().attr("class", "icheckbox_square-green checked");
                    $("#company_three_" + id).parent().prev().first().children().first().children().first().children().first().attr("checked", "checked");
                }).on('ifUnchecked', function (event) {
                    var id = event.target.defaultValue;
                    $("#company_two_" + id + " input").iCheck('uncheck');
                });
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
        dilogCompany("景区授权", pathUrl, id);
    }

    function dilogCompany(title, url, id) {
        var index = layer.open({
            type: 1,
            shade: false,
            title: title, //显示标题
            content: $('#editer_GCrel_div'),
            closeBtn: 1,
            btn: ['提交', '关闭'], //只是为了演示
            yes: function (index, layero) {
                //submitForm(url);
                sendComnpany(url, id);
            }, btn2: function (index, layero) {
                layer.closeAll();
                //按钮【按钮二】的回调
            },
            //shadeClose: true,
            //maxmin: true,
            area: ['90%', '90%']
        });
    }

    //判断点击选择所涉及的事件
    function sendComnpany(url, id) {
        var str = "";
        $("[name='pathCompanyId']:checked").each(function () {
            str += $(this).val() + ",";
        });
        $.ajax({
            type: "POST",
            url: url,
            dataType: "json",
            data: {
                _method: "PUT",
                pathCompanys: str,
                authorityGroupId: id
            },
            success: function (msg) {
                isLogin(msg);
                layer.closeAll();
                layer.msg(msg.toString(), {icon: 1});
                $('#tablepager').bootstrapTable('refresh');
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
    }

    function getAllCompany() {
        var companyUrl = "${ctx}/platform/companyGroup/listCompany?useFlag=1";
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
                $.each(data.rows2, function (index, item) {
                    oprStr += '<option value="' + item.id + '" hassubinfo="true">' + item.companyName + '（' + item.companyCode + ')</option>';
                });
                $("#allCompany_id").append(oprStr);
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

    function loadCompsGroup(id) {
        var GroupUrl = "${ctx}/platform/companyGroup/listGroupByComp";
        $.ajax({
            type: "POST",
            url: GroupUrl,
            dataType: "json",
            data: {
                _method: "get",
                companyId: id
            },
            success: function (data) {
                isLogin(data);
                $("#cg_id").html("");
                var htStr = '';
                $.each(data, function (index, item) {
                    var i = index + 1;
                    htStr += '<tr><td>' + i + '</td><td>' + item.authorityGroup.groupName + '</td></tr>';
                });
                $("#cg_id").html(htStr);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
    }
</script>
</body>
</html>
