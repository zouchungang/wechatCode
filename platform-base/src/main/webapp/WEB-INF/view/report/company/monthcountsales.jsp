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
                                <div class="col-sm-10">
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">订单日期</label>
                                        <div class="col-sm-5">
                                            <input type="text" id="searchOrderTime" placeholder="起始月份"
                                                   class="form-control layer-date"
                                                   onclick="laydate({istime: true, format: 'YYYY-MM'})">
                                            <input type="text" id="searchOrderTimeEnd" placeholder="截止月份"
                                                   class="form-control layer-date"
                                                   onclick="laydate({istime: true, format: 'YYYY-MM'})">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">主单号</label>
                                        <div class="col-sm-2">
                                            <input type="text" id="searchTicketNo" placeholder="请输入票号"
                                                   class="form-control">
                                        </div>
                                        <label class="col-sm-1 control-label">手机号码</label>
                                        <div class="col-sm-2">
                                            <input type="text" id="searchMobile" placeholder="请输入手机号码"
                                                   class="form-control">
                                        </div>
                                        <label class="col-sm-1 control-label">订单状态</label>
                                        <div class="col-sm-2">
                                            <select type="text" id="searchOrderStatus"
                                                    class="form-control">
                                                <option value="">请选择</option>
                                                <option value="2">已付款</option>
                                                <option value="3">已出票</option>
                                                <option value="6">已结算</option>
                                                <option value="4">交易完成</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">子单号</label>
                                        <div class="col-sm-2">
                                            <input type="text" id="searchSubFTicketNo" placeholder="请输入子票号"
                                                   class="form-control">
                                        </div>
                                        <label class="col-sm-1 control-label">身份证号码</label>
                                        <div class="col-sm-2">
                                            <input type="text" id="searchIdCard" placeholder="请输入身份证号码"
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <p>
                                        <button class="btn  btn-primary" onclick="searchTable()"
                                                type="submit"><strong>查询</strong>
                                        </button>
                                        <button class="btn  btn-white"
                                                type="submit" onclick="clearSearchBtn()"><strong>清空查询条件</strong>
                                        </button>
                                    </p>
                                    <div class="btn-group">
                                        <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle"
                                                aria-expanded="false">
                                            导出文件 <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a href="" onclick="changeURL()" id="URl">excel</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ibox-content">
                <table id="tablepager" data-mobile-responsive="true">
                </table>
            </div>
        </div>
    </div>
</div>
<%@ include file="/common/commonjs.jsp" %>
<script src="${staticCtx }/common/js/common.js"></script>
<script src="${staticCtx }/common/h5/js/plugins/layer/laydate/laydate.js"></script>
<script type="text/javascript">
    $(function () {
        loadData();
    });

    function changeURL() {
        var a = document.getElementById("URl")
        var orderDate = $("#searchOrderTime").val();
        var orderDateEnd = $("#searchOrderTimeEnd").val();
        var mobile = $("#searchMobile").val();
        var idCard = $("#searchIdCard").val();
        var orderNo = $("#searchTicketNo").val();
        var orderStatus = $("#searchOrderStatus").val();
        var subTicketNo = $("#searchSubFTicketNo").val();
        var str = "";
        str = "?orderDate=" + orderDate + "&orderDateEnd=" + orderDateEnd + "&mobile=" + mobile + "&idCard=" + idCard + "&orderNo=" + orderNo + "&orderStatus=" + orderStatus + "&subTicketNo=" + subTicketNo;
        a.setAttribute("href", "${ctx}/company/report/monthTicketToExcel" + str)
    }

    function loadData() {
        var url = "${ctx }/company/report/loadMonthSales";
        $('#tablepager').bootstrapTable({
            url: url,
            dataType: "json",
            pagination: true, //分页
            singleSelect: true,//只能选择一行
            clickToSelect: true,
            search: false, //显示搜索框
            sidePagination: "server", //服务端处理分
            sortable: true, //是否启用排序
            sortOrder: "desc",
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20, 50, 100],
            queryParams: function (params) {
                var par = {
                    "orderDate": $("#searchOrderTime").val(),
                    "orderDateEnd": $("#searchOrderTimeEnd").val(),
                    "mobile": $("#searchMobile").val(),
                    "idCard": $("#searchIdCard").val(),
                    "orderNo": $("#searchTicketNo").val(),
                    "orderStatus": $("#searchOrderStatus").val(),
                    "subTicketNo": $("#searchSubFTicketNo").val(),
                };
                var p = $.extend({}, params, par);
                return p;
            },
            columns: [
                {
                    field: "orderDate",
                    title: "售出时间",
                    sortable: true
                }, {
                    field: "ticketName",
                    title: "票名称",
                }, {
                    field: "orderNo",
                    title: "订单号",
                }, {
                    field: "subOrderNo",
                    title: "子订单号",
                }, {
                    field: "contactName",
                    title: "游客姓名",
                }, {
                    field: "contactMobile",
                    title: "游客手机号码",
                    formatter: function (value, row) {
                        var str;
                        str = value.substr(0, 11);
                        return str;
                    }
                }, {
                    field: "contactIdCard",
                    title: "游客身份证号码",
                    formatter: function (value, row) {
                        var str;
                        str = value.substr(0, 18);
                        return str;
                    }
                }, {
                    field: "ticketNum",
                    title: "交易数量",
                    formatter: function (value, row) {
                        return value + "个";
                    }
                }, {
                    field: "ticketPrice",
                    title: "门票金额",
                    formatter: function (value, row) {
                        return value + "￥";
                    }
                }, {
                    field: "orderStatus",
                    title: "订单状态",
                    formatter: function (value, row) {
                        if (2 == value) {
                            return '已付款';
                        } else if (3 == value) {
                            return '已出票';
                        } else if (4 == value) {
                            return '交易完成';
                        } else if (6 == value) {
                            return '已结算';
                        } else if (5 == value) {
                            return '交易取消'
                        }
                    }
                }
            ],
        });
    }

    function searchTable() {
        $('#tablepager').bootstrapTable("refresh");
    }

    function clearSearchBtn() {
        $('#searchOrderTime').val("");
        $('#searchOrderTimeEnd').val("");
        $('#searchEndTime').val("");
        $('#searchTicketNo').val("");
        $('#searchMobile').val("");
        $('#searchIdCard').val("");
        $('#searchOrderStatus').val("");
        $('#searchSubFTicketNo').val("");
    }
</script>
</body>
</html>

</body>




