<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
    <link href="${staticCtx }/common/h5/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet" type="text/css">
    <link href="${staticCtx}/common/webuploader/webuploader.css" rel="stylesheet" type="text/css">
    <link href="${staticCtx }/common/h5/css/plugins/iCheck/custom.css" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title"><h5>部门</h5></div>
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
                    <button type="button" class="btn btn-primary btn-xm" onclick="initPwd()">
                        <i class="glyphicon glyphicon-retweet" aria-hidden="true"></i>初始化密码
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
    <form class="form-horizontal" id="employeeForm">
        <input type="hidden" name="_method" id="_method">
        <input type="hidden" name="id" id="id">
        <input type="hidden" id="token" name="token">
        <div class="col-md-12">
            <div class="form-group">
                <div class="col-md-6">
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">员工登录名(<span class="text-danger">*</span>)：</label>
                        <div class="col-sm-6">
                            <input type="text" id="employeeCode" name="employeeCode" class="form-control"
                                   placeholder="员工登录名">
                            <span class="help-block m-b-none text-navy">添加完成后不可修改</span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">员工名称(<span class="text-danger">*</span>)：</label>
                        <div class="col-sm-6">
                            <input type="text" id="employeeName" name="employeeName" class="form-control"
                                   placeholder="员工名称">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">部门(<span class="text-danger">*</span>)：</label>
                        <div class="col-sm-6">
                            <select class="form-control" name="platformDept.id" id="platformDept">
                            </select>
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
                <label class="col-sm-2 control-label" for="useFlag1">状态(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
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
                <label class="col-sm-2 control-label">手机(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="mobile" name="mobile" class="form-control" placeholder="手机">
                </div>
                <label class="col-sm-2 control-label">身份证：</label>
                <div class="col-sm-3">
                    <input type="text" id="cardId" name="cardId" class="form-control" placeholder="身份证">
                </div>
            </div>

            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">排序(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-3">
                    <input type="text" id="dataSort" name="dataSort" class="form-control" placeholder="排序">
                </div>
            </div>
        </div>
    </form>
</div>
<div id="editer_auth_div" style="display: none;">
    <form class="form-horizontal" id="empAuthForm">
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
<%@ include file="/common/commonjs.jsp" %>
<script src="${staticCtx}/common/js/common.js"></script>
<script src="${staticCtx}/common/webuploader/webuploader.min.js"></script>
<script src="${staticCtx }/common/h5/js/plugins/iCheck/icheck.min.js"></script>
<script>
    var picAllSize = 1024 * 1024 * 2;
    var picSingleSize = 1024 * 1024 * 2;
    var picNum = 1;
    var rootPath = '${ctx}';
    var staticUpfileCtx = '${staticUpfileCtx}';
    var platformDeptId = '';
    $(function () {
        loadData();
        loadOneMenu();
        validateForm();
        showSelect('platformDept', '', '${ctx}/platform/dept/deptList', 'id', 'deptName', '');
        $("[data-toggle='tooltip']").tooltip('show');
        //$("#help_tip").tooltip('show');
    })

    //加载左侧一级菜单
    function loadOneMenu() {
        $.ajax({
            type: "GET",
            url: "${ctx}/platform/dept/deptList",
            dataType: "json",
            data: {},
            success: function (data) {
                isLogin(data);
                $("#leftOneMenu").html("");
                var str = '';
                $.each(data, function (index, item) {
                    str += ' <li><a class="J_menuItem" onclick="reload(\'' + item.id + '\',this)" data-index="1"><i name="leftListBtn"></i>' + item.deptName + '(' + item.deptCode + ')</a></li>';
                });
                $("#leftOneMenu").html(str);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
    }

    function reload(id, obj) {
        platformDeptId = id;
        $('i[name="leftListBtn"]').removeClass("fa fa-check text-navy");
        $(obj).children().addClass("fa fa-check text-navy");
        $('#tablepager').bootstrapTable("refresh");
    }

    function validateForm() {
        return $("#employeeForm").validate({
            rules: {
                employeeCode: {
                    required: true,
                    WordAndNum: true,
                    remote: {
                        url: "${ctx}/platform/employee/remoteCode",
                        async: false,
                        cache: false,
                        data: {
                            code: function () {
                                return $("#employeeCode").val();
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
                employeeName: "required",
                'platformDept.id': "required",
                mobile: {
                    required: true,
                    mobile: true,
                    remote: {
                        url: "${ctx}/platform/employee/remoteMobile",
                        async: false,
                        cache: false,
                        data: {
                            mobile: function () {
                                return $("#mobile").val();
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
                cardId: {
                    idcardcode: true
                },
                dataSort: {required: true, range: [1, 9999], digits: true}
            },
            messages: {
                employeeCode: {
                    required: "请输入登录名",
                    remote: "该登录名已使用",
                    WordAndNum: "请输入正确的登录名，至少包含一位字母，长度不能超过20"
                },
                employeeName: "请输入员工姓名",
                mobile: {
                    required: "请输入正确的手机号码",
                    remote: "该手机号码已被使用"
                },
                'platformDept.id': "请选择部门"
            }
        });
    }

    function loadData() {
        $('#tablepager').bootstrapTable({
            url: "${ctx}/platform/employee/pageSort",
            dataType: "json",
            pagination: true, //分页
            singleSelect: true,
            clickToSelect: true,
            search: false, //显示搜索框
            sidePagination: "server", //服务端处理分
            sortable: true, //是否启用排序
            sortName: "dataSort",
            sortOrder: "asc",
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20, 50, 100],
            //onlyInfoPagination:true,
            queryParams: function (params) {
                var par = {"platformDept.id": platformDeptId};
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
            columns: [
                {
                    checkbox: true
                }, {
                    field: "dataSort",
                    title: "序号",
                    sortable: true,
                    width: "10"
                }, {
                    title: '登录名',
                    field: 'employeeCode'
                }, {
                    title: '姓名',
                    field: 'employeeName'
                }, {
                    title: "性别",
                    field: "sex",
                    formatter: function (value, row) {
                        if (1 == value) {
                            return '<span class="badge badge-info">男</span>';
                        } else if (0 == value) {
                            return '<span class="badge badge-warning-light">女</span>';
                        }
                    }
                }, {
                    title: '身份证',
                    field: 'cardId'
                }, {
                    title: '手机',
                    field: 'mobile'
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
                },
                {
                    title: "操作",
                    field: "doSomeThing",
                    formatter: function (value, row) {
                        return "<a href='#'  class='btn btn-primary btn-xs' onclick=\"dilogAuthorizationForm('" + row.id + "')\"><i class='fa fa-random'></i> 授权</a>  ";
                    }
                }
            ]
        });
    }

    function add() {
        $('#employeeForm')[0].reset();
        initWebuploader("${ctx}/platform/employee/logo", picNum, picAllSize, picSingleSize, rootPath, staticUpfileCtx);
        $("#_method").val("post");
        $("#id").val("");
        $("#dataSort").val(1);
        $("#photo").val("");
        $("#employeeCode").removeData("previousValue");
        $("#employeeCode").attr("readonly", false);
        $("#platformDept").val(platformDeptId);
        $("#imgView").attr("src", "${ctx }/upfile/default.jpg");
        tokenSession("token", "${ctx}/common/tokenSession");
        dilogForm("添加", "${ctx}/platform/employee");
//        initWebuploader();
    }

    function editor() {
        $('#employeeForm')[0].reset();
        var row = getSingleData("tablepager");
        if (row != null) {
            $("#id").val(row.id);
            dilogForm("修改", "${ctx}/platform/employee/" + row.id);
            initWebuploader("${ctx}/platform/employee/logo", picNum, picAllSize, picSingleSize, rootPath, staticUpfileCtx);
            $("#_method").val("put");
            $("#employeeCode").attr("readonly", true);
            $("#employeeCode").val(row.employeeCode);
            $("#employeeCode").removeData("previousValue");
            $("#employeeName").val(row.employeeName);
            $("#platformDept").val(row.platformDept.id);
            if (row.sex == 1) {
                $("#sex1").prop("checked", "checked");
            } else if (row.sex == 0) {
                $("#sex2").prop("checked", "checked");
            }
            $("#cardId").val(row.cardId);
            $("#mobile").val(row.mobile);
//            $("#email").val(row.email);
//            $("#weixin").val(row.weixin);
            if (row.photo != null && row.photo != "") {
                $("#photo").val(row.photo);
                $("#imgView").attr("src", "${staticUpfileCtx}" + row.photo);
            } else {
                $("#photo").val("");
                $("#imgView").attr("src", "${ctx}/upfile/default.jpg");
            }
            if (row.useFlag == 1) {
                $("#useFlag1").prop("checked", "checked");
            } else if (row.useFlag == 0) {
                $("#useFlag2").prop("checked", "checked");
            }
            $("#dataSort").val(row.dataSort);
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
            }, success: function () {
                validateForm().resetForm();
            }, end: function () {
                uploader.destroy();
            },
            area: ['90%', '98%']
        });
    }

    function dilogAuthorizationForm(id) {
        var pathUrl = "";
        var menuUrl = "";
        var htmlStr = '';
        menuUrl = "${ctx}/platform/employeeMenu/listMenu";
        pathUrl = "${ctx}/platform/employeeMenu/updateAuthMenu";
        $.ajax({
            type: "POST",
            url: menuUrl,
            dataType: "json",
            data: {
                _method: "get",
                empId: id
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
                                '<input type="checkbox" name="pathMenuId" value="' + item2.id + '"  id="menu_' + item2.id + '">' + item2.menuName + '</label></div>' +
                                '<input type="hidden" value="' + item2.parentId + '"  id="menu_p_' + item2.id + '">';
                            ;
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
                    $("#menu_" + item3.platformMenu.id).iCheck('check');
                    $("#label_" + item3.platformMenu.id).children("div").addClass("checked");
                });
//                //添加点击事件
//                $("#pathData_id input").on('ifChecked', function (event) {
//                    var id = event.target.defaultValue;
//                    $("#menu_two_" + id + " input").iCheck('check');
//                    $("#menu_three_" + id).parent().prev().first().children().first().children().first().attr("class", "icheckbox_square-green checked");
//                    $("#menu_three_" + id).parent().prev().first().children().first().children().first().children().first().attr("checked", "checked");
//                }).on('ifUnchecked', function (event) {
//                    var id = event.target.defaultValue;
//                    $("#menu_two_" + id + " input").iCheck('uncheck');
//                });
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
            error: function (textStatus) {
                layer.alert("服务异常,请返回刷新重试");
            }
        });
        dilogAuth("权限", pathUrl, id);
    }

    function dilogAuth(title, url, id) {
        var index = layer.open({
            type: 1,
            shade: false,
            title: title, //显示标题
            content: $('#editer_auth_div'),
            closeBtn: 1,
            btn: ['提交', '关闭'], //只是为了演示
            yes: function (index, layero) {
                sendCommand(url, id);
            }, btn2: function (index, layero) {
                layer.closeAll();
            },
            area: ['90%', '98%']
        });
    }

    //判断点击选择所涉及的事件
    function sendCommand(url, id) {
        var str = "";
        $("[name='pathMenuId']:checked").each(function () {
            str += $(this).val() + ",";
        });
        $("#_Auth_method").val("post");
        $.ajax({
            type: "POST",
            url: url,
            dataType: "json",
            data: {
                _method: "PUT",
                pathMenus: str,
                empid: id
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

    function submitForm(url) {
        var v = validateForm();
        v.form();
        if (v.form()) {
            $.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                data: $('#employeeForm').serialize(),
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
    }

    <%--// 启用禁用--%>
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
    <%--url: "${ctx}/platform/employee/use/" + row.id,--%>
    <%--success: function (msg) {--%>
    <%--layer.msg(msg, {icon: 0});--%>
    <%--$('#tablepager').bootstrapTable("refresh");--%>
    <%--}--%>
    <%--});--%>
    <%--}, function () {--%>
    <%--});--%>
    <%--} else {--%>
    <%--layer.msg("选择要删除的记录", {icon: 7});--%>
    <%--}--%>
    <%--}--%>

    function initPwd() {
        var row = getSingleData("tablepager");
        if (row != null) {
            layer.confirm("确认初始密码？", {
                btn: ['确认', '取消'], //按钮
                shade: false
            }, function (index) {
                layer.close(index);
                $.ajax({
                    type: "post",
                    dataType: "json",
                    data: {
                        _method: "put"
                    },
                    url: "${ctx}/platform/employee/initpwd/" + row.employeeCode,
                    success: function (msg) {
                        isLogin(msg);
                        layer.msg(msg.toString(), {icon: 1});
                        $('#tablepager').bootstrapTable('refresh');
                    }
                });
            }, function () {
            });
        } else {
            layer.msg("选择要初始化密码的记录", {icon: 8});
        }
    }
</script>
</body>
</html>
