<!DOCTYPE html>
<%@ page language="java" pageEncoding="utf-8" %>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="col-sm-12">
        <div class="example">
            <div class="hidden-xs" id="tableToolbar" role="group">
                <button type="button" class="btn btn-primary btn-xm" onclick="resPWD()">
                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>重置密码
                </button>
                <%--<button type="button" class="btn btn-primary btn-xm" onclick="editor()">--%>
                <%--<i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>修改--%>
                <%--</button>--%>
                <%--<button type="button" class="btn btn-primary btn-xm" onclick="deletedata()">--%>
                <%--<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除--%>
                <%--</button>--%>
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
        <input type="hidden" id="token" name="token">
        <div class="col-md-12">
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">业务系统:</label>
                <div class="col-sm-6">
                    <select class="form-control" name="whiteIp.id" id="whiteIp">
                    </select>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">账号
                    :</label>
                <div class="col-sm-6">
                    <input type="text" id="userName" name="userName" class="form-control" placeholder="userName">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">密码
                    :</label>
                <div class="col-sm-6">
                    <input type="text" id="pwd" name="pwd" class="form-control" placeholder="pwd">
                </div>
            </div>
        </div>
    </form>
</div>
<%@ include file="/common/commonjs.jsp" %>
<script src="${ctx }/common/js/common.js"></script>
<script type="text/javascript">
    $(function () {
        loadData();
        validateForm();
        showSelect('whiteIp', '', '${ctx }/platform/dept/deptList', 'id', 'name', '');

    });

    function loadData() {
        var url = "${ctx }/platform/fsaleManagerUser/page";
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
            showColumns: true,
            showRefresh: true,
            showToggle: true,
            toolbar: "#tableToolbar",
            columns: [{
                checkbox: true
            },
                {
                    field: "whiteIp",
                    title: "景区业务系统",
                    formatter: function (value, row) {
                        if (row != null) {
                            return row.whiteIp.company.companyName + "," + row.whiteIp.dict.paramName;
                        }
                    }
                }
                ,
                {
                    field: "userName",
                    title: "账号"
                }
            ]
        });
    }

    function validateForm() {
        $("#myForm").validate({
            rules: {}, messages: {},
            onfocusout: function (element) {
                $(element).valid();
            }
        });
    }

    function add() {
        $('#myForm')[0].reset();
        $("#myForm").validate().resetForm();
        $("#_method").val("post");
        $("#id").val("");
        tokenSession("token", "${ctx }/common/tokenSession");
        dilogForm("添加", "${ctx }/platform/fsaleManagerUser");
    }
    function editor() {
        $('#myForm')[0].reset();
        $("#myForm").validate().resetForm();
        var row = getSingleData("tablepager");
        if (row != null) {
            dilogForm("修改", "${ctx }/platform/fsaleManagerUser/" + row.id);
            $("#_method").val("put");
            $("#id").val(row.id);

            $("#whiteIp").val(row.whiteIp.id);
            $("#userName").val(row.userName);
            $("#pwd").val(row.pwd);
        } else {
            layer.msg("选择要修改的记录", {icon: 7});
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
                    url: "${ctx }/platform/fsaleManagerUser/" + row.id,
                    data: {_method: "delete"},
                    success: function (msg) {
                        layer.msg(msg, {icon: 1});
                        $('#tablepager').bootstrapTable('refresh');
                    }
                });
            }, function () {
            });
        } else {
            layer.msg("选择要删除的记录", {icon: 7});
        }
    }

    function resPWD() {
        var row = getSingleData("tablepager");
        if (row != null) {
            parent.layer.confirm('确定重置吗？', {
                btn: ['确定', '取消'], //按钮
                shade: false //不显示遮罩
            }, function () {
                $.ajax({
                    type: "get",
                    url: "${ctx}/platform/fsaleManagerUser/respwd",
                    data: {
                        id: row.id
                    },
                    success: function (msg) {
                        parent.layer.closeAll();
                        layer.msg("重置成功", {icon: 1});
                        $('#table1').bootstrapTable('refresh');
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        parent.layer.closeAll();
                        layer.msg("重置失败！", {icon: 2});
                    }
                });
            }, function () {
            });
        } else {
            layer.msg("请选择要重置密码的记录！", {icon: 8});
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
        if ($("#myForm").validate().form()) {
            $.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                data: $('#myForm').serialize(),
                success: function (msg) {
                    layer.closeAll();
                    $('#tablepager').bootstrapTable('refresh');
                    layer.msg(msg, {icon: 1});
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.alert(textStatus);
                }
            });
        }
    }
</script>
</body>
</html>

</body>




