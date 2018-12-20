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
            <div class="ibox">
                <div class="ibox-title">
                    <div class="col-sm-5 ">
                        <h3>当前景区：${whiteIp.company.companyName}</h3>
                    </div>
                    <div class="col-sm-2 text-center"></div>
                    <div class="col-sm-5">
                        <h3>当前业务系统:${whiteIp.dict.paramName}</h3>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-5 ">
                            <h3>未分配的供应商</h3>
                            <table id="tablepagerW" data-mobile-responsive="true">
                            </table>
                        </div>
                        <div class="col-sm-2 text-center">
                            <button type="button" class="btn  btn-xm btn-primary" onclick="addSome()">
                                添加<i class="fa fa-angle-double-right" aria-hidden="true"></i>
                            </button>
                            <br>
                            <br>
                            <button type="button" class="btn  btn-xm btn-primary" onclick="deleteSome()">
                                <i class="fa fa-angle-double-left" aria-hidden="true"></i>删除
                            </button>
                        </div>
                        <div class="col-sm-5">
                            <h3>已拥有的供应商</h3>
                            <table id="tablepagerY" data-mobile-responsive="true"></table>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/common/commonjs.jsp" %>
<script src="${ctx }/common/js/common.js"></script>
<script type="text/javascript">
    $(function () {
        loadData();
    });

    function loadData() {
        var url = "${ctx }/platform/fsaleAuthSupplier/findFsaleAuthSupplier";
        $('#tablepagerW').bootstrapTable({
            url: url,
            dataType: "json",
            singleSelect: false,//只能选择一行
            clickToSelect: true,
            checkAll: true,
            search: false, //显示搜索框
            sidePagination: "server", //服务端处理分
            toolbar: "#tableToolbar",
            pagination: true, //分页
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20, 50, 100],
            queryParams: function (params) {
                var par = {
                    "searchType": "2",//未拥有的供应商和
                    'whiteIp.id': '${whiteIp.id}',
                    "companyId": "${whiteIp.company.id}"
                };//未拥有的供应商
                var p = $.extend({}, params, par);
                return p;
            },
            columns: [{
                checkbox: true
            }, {
                field: "companyCode",
                title: "景区代码"
            }, {
                field: "companyName",
                title: "景区名字",
            }, {
                field: 'enterprise.name',
                title: "所属企业",
            }, {
                field: "linkInfo",
                title: "联系人"
            }
            ]
        });
        $('#tablepagerY').bootstrapTable({
            url: url,
            dataType: "json",
            singleSelect: false,//只能选择一行
            clickToSelect: true,
            checkAll: true,
            search: false, //显示搜索框
            sidePagination: "server", //服务端处理分
            toolbar: "#tableToolbar",
            pagination: true, //分页
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20, 50, 100],
            queryParams: function (params) {
                var par = {
                    'whiteIp.id': '${whiteIp.id}',
                    "searchType": "1",//已拥有的供应商
                    "companyId": "${whiteIp.company.id}"
                };
                var p = $.extend({}, params, par);
                return p;
            },
            columns: [{
                checkbox: true
            }, {
                field: "companyCode",
                title: "景区代码"
            }, {
                field: "companyName",
                title: "景区名字",
            }, {
                field: 'enterprise.name',
                title: "所属企业",
            }, {
                field: "linkInfo",
                title: "联系人"
            }
            ]
        });
    }

    function addSome() {
        var row = getSingleData("");
        var rows = $('#tablepagerW').bootstrapTable('getSelections');
        if (rows.length > 0) {
            var ids = "";
            $.each(rows, function (key, val) {
                ids += rows[key].id + ",";
            });
            $.ajax({
                type: "post",
                url: '${ctx}/platform/fsaleAuthSupplier/batchCreate',
                dataType: "json",
                data: {
                    _method: "post",
                    companyId: ids,
                    whiteId: '${whiteIp.id}'
                },
                success: function (msg) {
                    layer.closeAll();
                    $('#tablepagerW').bootstrapTable('refresh');
                    $('#tablepagerY').bootstrapTable('refresh');
                    layer.msg(msg, {icon: 1});
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.alert("服务异常，请刷新重试");
                }
            });
        } else {
            layer.msg("选择要添加的记录", {icon: 8});
        }
    }
    function deleteSome() {
        var row = getSingleData("");
        var rows = $('#tablepagerY').bootstrapTable('getSelections');
        if (rows.length > 0) {
            var ids = "";
            $.each(rows, function (key, val) {
                ids += rows[key].id + ",";
            });
            $.ajax({
                type: "post",
                url: "${ctx}/platform/fsaleAuthSupplier/batchDelte",
                dataType: "json",
                data: {
                    _method: "post",
                    companyId: ids,
                    whiteId: '${whiteIp.id}'
                },
                success: function (msg) {
                    layer.closeAll();
                    $('#tablepagerW').bootstrapTable('refresh');
                    $('#tablepagerY').bootstrapTable('refresh');
                    layer.msg(msg, {icon: 1});
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.alert("服务异常，请刷新重试");
                }
            });
        } else {
            layer.msg("选择要删除的记录", {icon: 8});
        }
    }

</script>
</body>
</html>

</body>