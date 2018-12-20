<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <%--<div class="row" id="tipRow">--%>
        <%--<div class="col-sm-12">--%>
            <%--<div class="alert alert-warning">--%>
                <%--<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>--%>
                <%--<p>&nbsp;&nbsp;&nbsp;&nbsp; <em style="color: red">友情提示</em></p>--%>
                <%--<div id="tipDiv">日志数据只保留一个月的记录</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <div class="row">
        <div class="col-sm-12">
            <div class="example">
                <div id="tableToolbar" role="group">
                    <div class="btn-group">
                        <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle">清理日志 <span
                                class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#" onclick="deleteAll(this,'6')">清理半年之前日志</a>
                            </li>
                            <li>
                                <a href="#" onclick="deleteAll(this,'3')">清理三个月之前日志</a>
                            </li>
                            <li>
                                <a href="#" onclick="deleteAll(this,'1')">清理一个月之前日志</a>
                            </li>
                            <li>
                                <a href="#" onclick="deleteAll(this,'0')">清理全部日志</a>
                            </li>
                        </ul>
                    </div>
                    <%--<div class="btn-group">--%>
                        <%--<button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" aria-expanded="false">--%>
                            <%--导出文件 <span class="caret"></span>--%>
                        <%--</button>--%>
                        <%--<ul class="dropdown-menu">--%>
                            <%--<li><a href="${ctx}/platform/report/exportExcel">excel</a>--%>
                            <%--</li>--%>
                            <%--<li><a href="buttons.html#" class="font-bold">csv</a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>
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
<%@ include file="/common/commonjs.jsp" %>
<script src="${staticCtx}/common/js/common.js"></script>
<script>
    $("[data-toggle='tooltip']").tooltip('show');
    $('#tablepager').bootstrapTable({
        url: "${ctx}/platform/log/list",
        dataType: "json",
        pagination: true, //分页
        singleSelect: false,
        search: true, //显示搜索框
        sidePagination: "server", //服务端处理分
        pageNumber: 1,
        pageSize: 10,
        pageList: [10, 20, 50, 100],
        //onlyInfoPagination:true,
        showColumns: true,
        showRefresh: true,
        showToggle: true,
        sortable: true,      //是否启用排序
        sortOrder: "desc",     //排序方式
        sortName: "operationTime",
        toolbar: "#tableToolbar",
        onLoadSuccess: function (data) {
            isLogin(data);
        },
        columns: [{
            title: '操作人',
            field: 'employeeCode'
        }, {
            field: "userType",
            title: "用户类型",
            formatter: function (value, row) {
                if (row != null) {
                    switch (row.userType) {
                        case 1:
                            return '<span class="label label-primary">平台用户</span>';
                        case 2:
                            return '<span class="label label-success">景区用户</span>';
                    }
                }
            }
        }, {
            title: '操作模块',
            field: 'menuName'
        }, {
            title: "操作时间",
            field: "operationTime",
            sortable: true
        }, {
            title: '请求操作描述',
            field: 'operationName'
        }, {
            title: "请求人IP",
            field: "ip"
        }]
    });

    function deleteAll(e,f) {
        var text=$(e).text();
        layer.confirm('确定'+text+'？', {icon: 3, title: '提示'}, function (index) {
            //do something
            $.ajax({
                type: "post",
                dataType: "json",
                url: "${ctx}/platform/log/delete",
                data: {
                    _method: "DELETE",
                    type:f
                },
                success: function (msg) {
                    isLogin(msg);
                    layer.msg(msg.toString());
                    $('#tablepager').bootstrapTable('refresh');
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    layer.alert("服务器繁忙，请刷新重试");
                }
            });
        });
        //layer.close(index);
    }

</script>
</body>
</html>
