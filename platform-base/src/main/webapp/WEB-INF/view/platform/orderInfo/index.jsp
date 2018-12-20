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
                                        <label class="col-sm-2 control-label">主订单号：</label>
                                        <div class="col-sm-2">
                                            <input type="text" id="searchorderNo" placeholder="主订单号"
                                                   class="form-control">
                                        </div>
                                        <label class="col-sm-2 control-label">下单日期：</label>
                                        <div class="col-sm-2">
                                            <input type="text" id="startTime" name="startTime" class="form-control"
                                                   placeholder="开始时间"
                                                   onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                                            <input type="text" id="endTime" name="endTime" class="form-control"
                                                   placeholder="截止时间"
                                                   onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                                        </div>
                                        <label class="col-sm-2 control-label">支付时间：</label>
                                        <div class="col-sm-2">
                                            <input type="text" id="startPayTime" name="startPayTime"
                                                   class="form-control"
                                                   placeholder="开始时间"
                                                   onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                                            <input type="text" id="endPayTime" name="endPayTime" class="form-control"
                                                   placeholder="截止时间"
                                                   onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">第三方订单号：</label>
                                        <div class="col-sm-2">
                                            <input type="text" id="searchthreeOrderNo" placeholder="第三方订单号"
                                                   class="form-control">
                                        </div>
                                        <label class="col-sm-2 control-label">订单来源：</label>
                                        <div class="col-sm-2">
                                            <select class="form-control chosen-container chosen-container-single"
                                                    name="orderInfo.id" id="searchorderSource">
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">支付类型：</label>
                                        <div class="col-sm-2">
                                            <select class="form-control chosen-container chosen-container-single"
                                                    id="searchpayType">
                                                <option value="" selected>请选择</option>
                                                <option value="1">预付</option>
                                                <option value="2">到付</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">返利状态：</label>
                                        <div class="col-sm-2">
                                            <select class="form-control chosen-container chosen-container-single"
                                                    id="searchrebateFlag">
                                                <option value="" selected>请选择</option>
                                                <option value="0">未返利</option>
                                                <option value="1">已返利</option>
                                                <option value="2">无返利</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">优惠状态：</label>
                                        <div class="col-sm-2">
                                            <select class="form-control chosen-container chosen-container-single"
                                                    id="searchpreferentialFlag">
                                                <option value="" selected>请选择</option>
                                                <option value="0">无优惠</option>
                                                <option value="1">现金优惠</option>
                                                <option value="2">增票优惠</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">订单状态：</label>
                                        <div class="col-sm-2">
                                            <select class="form-control chosen-container chosen-container-single"
                                                    name="orderInfo.id" id="findOrderStatu">
                                            </select>
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <p  id="tableToolbar" role="group">
                <button type="button" class="btn  btn-xm btn-primary" onclick="showOrderData()">
                    <i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i>订单详细信息
                </button>
                <button type="button" class="btn  btn-xm btn-primary" onclick="showOrderRebateData()">
                    <i class="glyphicon glyphicon-share-alt" aria-hidden="true"></i>订单返利信息
                </button>
                <button type="button" class="btn  btn-xm btn-primary" onclick="showOrderPreferentialData()">
                    <i class="glyphicon glyphicon-star-empty" aria-hidden="true"></i>订单优惠信息
                </button>
            </p>
            <div class="ibox-content">
                <table id="tablepager" data-mobile-responsive="true">
                </table>
            </div>
        </div>
    </div>
</div>
<div id="show_orderInfo_div" style="display: none;">
    <div class="col-md-12">
        <div class="hr-line-dashed"></div>
        <div class="panel panel-primary">
            <div class="panel-heading text-center">
                订单详情
            </div>
        </div>
        <div class="col-md-12" id="splitData_id">
        </div>
    </div>
</div>
<div id="show_orderLog_div" style="display: none;">
    <div class="col-md-12">
        <div class="hr-line-dashed"></div>
        <div class="panel panel-primary">
            <div class="panel-heading text-center">
                订单操作记录
            </div>
        </div>
        <div class="col-md-12" id="orderSplitLog_id">
        </div>
    </div>
</div>
<%@ include file="/common/commonjs.jsp" %>
<script src="${ctx }/common/js/common.js"></script>
<script src="${staticCtx }/common/h5/js/plugins/layer/laydate/laydate.js"></script>
<script type="text/javascript">
    $(function () {
        loadData();
        showSelect('searchorderSource', '', '${ctx }/platform/baseinfo/dict/dictValueByType?type=DT0002', 'value', 'name', '');
        showSelect('findOrderStatu', '', '${ctx }/platform/baseinfo/dict/dictValueByType?type=DT0011', 'value', 'name', '');
    });

    var orderSpStr = '';
    function loadData() {
        $('#tablepager').bootstrapTable({
            url: "${ctx }/platform/orderInfo/pageSort",
            dataType: "json",
            pagination: true, //分页
            singleSelect: true,
            clickToSelect: true,
            search: false, //显示搜索框
            sidePagination: "server", //服务端处理分
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20, 50, 100],
            showColumns: true,
            showRefresh: true,
            showToggle: true,
            sortable: true, //是否启用排序
            sortName: "orderDate",
            sortOrder: "desc",
            toolbar: "#tableToolbar",
            queryParams: function (params) {
                var par = {
                    "orderNo": $("#searchorderNo").val(),
                    "threeOrderNo": $("#searchthreeOrderNo").val(),
                    "startTime": $("#startTime").val(),
                    "endTime": $("#endTime").val(),
                    "startPayTime": $("#startPayTime").val(),
                    "endPayTime": $("#endPayTime").val(),
                    "orderSource": $("#searchorderSource").val(),
                    "orderNum": $("#searchorderNum").val(),
                    "payType": $("#searchpayType").val(),
                    "payTime": $("#searchpayTime").val(),
                    "rebateFlag": $("#searchrebateFlag").val(),
                    "preferentialFlag": $("#searchpreferentialFlag").val(),
                    "orderStatus": $("#findOrderStatu").val(),
                    "printInvoiceFlag": $("#searchprintInvoiceFlag").val()
                };
                var p = $.extend({}, params, par);
                return p;
            },
            onLoadSuccess: function (data) {
                isLogin(data);
            },
            columns: [{
                checkbox: true
            }, {
                field: "orderDate",
                title: "下单时间",
                sortable: true
            }, {
                field: "orderNo",
                title: "订单号"
            }, {
                field: "threeOrderNo",
                title: "第三方订单号"
            }, {
                field: "contactName",
                title: "联系人"
            }, {
                field: "orderStatus",
                title: "订单状态",
                formatter: function (value, row) {
                    if (1 == value) {
                        return '待支付';
                    } else if (2 == value) {
                        return '已付款';
                    } else if (3 == value) {
                        return '已出票';
                    } else if (4 == value) {
                        return '交易完成';
                    } else if (5 == value) {
                        return '交易取消';
                    } else if (6 == value) {
                        return '已结算';
                    } else if (7 == value) {
                        return '等待审核';
                    }
                }
            }, {
                field: "consumFlag",
                title: "是否已消费",
                formatter: function (value, row) {
                    if (value) {
                        return '已消费';
                    } else if (!value) {
                        return '未消费';
                    }
                }, sortable: true
            }, {

                field: "orderSource",
                title: "订单来源"
                ,
                sortable: true,
                formatter: function (value, row) {
                    if (1 == value) {
                        return '分销业务系统';
                    } else if (2 == value) {
                        return '电商业务系统';
                    } else if (3 == value) {
                        return '旅行社业务系统';
                    } else if (4 == value) {
                        return '窗口售票业务系统';
                    } else if (5 == value) {
                        return '其他途径';
                    }
                } //1.分销业务系统，2.电商业务系统，3.旅行社业务系统，4.窗口售票业务系统，5.其他途径
            }, {

                field: "orderNum",
                title: "订单商品数量"
            }, {

                field: "payAmount",
                title: "总金额"
            }, /* {

                field: "payType",
                title: "支付类型",
                formatter: function (value, row) {
                    if (1 == value) {
                        return '预付扣款';
                    } else if (2 == value) {
                        return '线下到付';
                    } else if (3 == value) {
                        return '平台代收';
                    }
                }
            }, {

                field: "payTime",
                title: "支付时间",
                sortable: true
            }, {

                field: "rebateFlag",
                title: "返利状态",
                formatter: function (value, row) {
                    if (0 == value) {
                        return '未返利';
                    } else if (1 == value) {
                        return '已返利';
                    } else if (2 == value) {
                        return '不返利';
                    }
                }
            }, {

                field: "preferentialFlag",
                title: "优惠状态",
                formatter: function (value, row) {
                    if (0 == value) {
                        return '无优惠';
                    } else if (1 == value) {
                        return '现金优惠';
                    } else if (2 == value) {
                        return '赠票优惠';
                    }
                }
            }, {

                field: "printInvoiceFlag",
                title: "是否已打印出票",
                formatter: function (value, row) {
                    if (value) {
                        return '已打印';
                    } else if (!value) {
                        return '不打印';
                    }
                }
             }*/
            ],
            detailView: true,//详情展开
            detailFormatter: function (index, row) {
                orderSpStr = '';
                var htmlStr = '';
                $.ajax({
                    type: "POST",
                    url: "${ctx}/platform/orderInfo/orderDetails",
                    dataType: "json",
                    async: false,
                    data: {
                        _method: "get",
                        orderId: row.id
                    },
                    success: function (data) {
                        $.each(data.orderSplitsDetailRow, function (index, item) {
                            htmlStr += '<table class="table table-bordered" data-mobile-responsive="true"><tbody>' +
                                    '<tr class="warning"><td align="right">子订单号：</td><td>' + item.subOrderNo + '</td><td align="right">门票名称(编码)：</td><td>' + item.ticketName + '</td><td align="right">订单状态：</td><td>' + item.orderStatusName + '</td>' +
                                    '<td align="right">所属景区(编码)：</td><td>' + item.companyName + '</td><td align="right">销售单价：</td><td>' + item.ticketPrice + '</td><td align="right">游客数量：</td><td>' + item.playerNum + '</td><td align="right">销售金额：</td><td>' + item.saleMoney + '</td></tr>' +
                                    '</tbody></table>';
                        });
                        orderSpStr = htmlStr;
                    }
                });
                return orderSpStr;
            }, onExpandRow(index, row, $detail){

            }
        });
    }

    function searchTable() {
        $('#tablepager').bootstrapTable("refresh");
    }

    /*显示订单详情。子订单，子订单详情，退订信息*/
    function showOrderData() {
        var row = getSingleData("tablepager");
        $("#splitData_id").html('');
        var htmlStr = '';
        var orderinfoStr = '';
        var ordersplitStr = '<div class="panel panel-primary"><div class="panel-heading text-center">子订单详情</div></div>';
        if (row != null) {
            var id = row.id;
            $.ajax({
                type: "POST",
                url: "${ctx}/platform/orderInfo/orderDetails",
                dataType: "json",
                async: false,
                data: {
                    _method: "get",
                    orderId: id
                },
                success: function (data) {
                    isLogin(data);
                    var orderInfoOBJ = data.orderInfoRow;
                    var payMethodName = data.payMethodName;//支付方式 1.支付宝网页支付，2.支付宝扫码付款，3.微信网页支付，4.微信扫码支付5.现金支付，6.银联支付
                    var payTypeName = data.payTypeName;
                    var orderStatusName = data.orderStatusName;//订单状态
                    var orderSourceName = data.orderSourceName;
                    var preferentialName = data.preferentialFlagName;//优惠状态 0.没有优惠，1.现金优惠，2.门票赠送
                    var rebateFlagName = data.rebateFlagName;//返利状态 0.未返利，1.已返利，2.不返利
                    var printInvoiceFlagName = '';// 0.未打印，1.已打印
                    if (orderInfoOBJ.printInvoiceFlag == 0) {
                        printInvoiceFlagName += '未打印';
                    } else if (orderInfoOBJ.printInvoiceFlag == 1) {
                        printInvoiceFlagName += '已打印';
                    } else {
                        rebateFlagName += '未知';
                    }
                    var threeOrderNo = '';
                    if (orderInfoOBJ.threeOrderNo != null) {
                        threeOrderNo = orderInfoOBJ.threeOrderNo;
                    }
                    var payTimeStr = '';
                    if (orderInfoOBJ.payTime != null) {
                        payTimeStr = orderInfoOBJ.payTime;
                    }
                    orderinfoStr += '<table class="table table-bordered" data-mobile-responsive="true"><tbody>' +
                            '<tr class="danger"><td align="right" data-color="red">订单号：</td><td>' + orderInfoOBJ.orderNo + '</td><td align="right">订单状态：</td><td>' + orderStatusName + '</td><td align="right">第三方订单号：</td><td>' + threeOrderNo + '</td><td align="right">订单创建时间：</td><td>' + orderInfoOBJ.orderDate + '</td><td align="right">订单来源：</td><td>' + orderSourceName + '</td></tr>' +
                            '<tr class="danger"><td align="right">联系人名称：</td><td>' + orderInfoOBJ.contactName + '</td><td align="right">联系人手机号：</td><td>' + orderInfoOBJ.contactMobile + '</td><td align="right">联系人身份证号码：</td><td>' + orderInfoOBJ.contactIdCard + '</td><td align="right">支付类型：</td><td>' + payTypeName + '</td><td align="right">支付方式：</td><td>' + payMethodName + '</td></tr>' +
                            '<tr class="danger"><td align="right">支付时间：</td><td>' + payTimeStr + '</td><td align="right">订单数量：</td><td>' + orderInfoOBJ.orderNum + '（个）</td><td align="right">付款金额：</td><td>' + orderInfoOBJ.payAmount + '￥</td><td align="right">优惠状态：</td><td>' + preferentialName + '</td><td align="right">返利状态：</td><td>' + rebateFlagName + '</td></tr>' +
                            '<tr class="danger"><td align="right">是否已打印发票：</td><td>' + printInvoiceFlagName + '</td><td align="right">消费描述：</td><td colspan="7">' + orderInfoOBJ.orderMemo + '</td></tr></tbody></table>';
                    $.each(data.orderSplitsDetailRow, function (index, item) {
                        var logRows = item.orderLogRow;
                        var orderLogs = "";
                        $.each(logRows, function (index, item1) {
                            orderLogs += '<tr class="warning"><td align="right">订单操作记录：</td><td colspan="11">' + item1.logContent + '</td></tr>';
                        });
                        ordersplitStr += '<table class="table table-bordered"><caption>订单号：' + item.subOrderNo + ' 订单状态：' + item.orderStatusName + '</caption><tbody>' +
                                '<tr class="warning"><td align="right">所属景区(编码)：</td><td>' + item.companyName + '</td><td align="right">门票名称(编码)：</td><td>' + item.ticketName + '</td>' +
                                '<td align="right">通关码类型：</td><td>' + item.passNoTypeName + '</td><td align="right">通关码：</td><td>' + item.passNo + '</td></tr>' +
                                '<tr class="warning"><td align="right">门票有效期：</td><td colspan="2">' + item.validityPeriod + '</td>' +
                                '<td align="right">订单有效期：</td><td colspan="2">' + item.tourPeriod + '</td><td align="right">支持通关类型：</td><td>' + item.allPassNoTypeName + '</td></tr>' +
                                '<tr class="warning"><td align="right">游玩人数量：</td><td>' + item.playerNum + '（个）</td><td align="right">是否已经出票：</td><td>' + item.outTicketFlagName + '</td>' +
                                '<td align="right">是否已验证：</td><td>' + item.consumFlagName + '</td><td align="right">人/张类型：</td><td>' + item.playerPerTicketName + '</td></tr>' +
                                '<tr class="warning"><td align="right">销售数量：</td><td>' + item.ticketNum + '（个）</td><td align="right">销售价格：</td><td>' + item.ticketPrice + '（￥/个）</td>' +
                                '<td align="right">销售金额：</td><td>' + item.saleMoney + '￥</td><td align="right">结算价格：</td><td>' + item.ticketSettlePrice + '￥</td></tr>' +
                                '<tr class="warning"><td align="right">结算金额：</td><td>' + item.settleMoney + '￥</td><td align="right">首次通行时间：</td><td>' + item.firstConsumTime + '</td>' +
                                '<td align="right">最近验票时间：</td><td>' + item.lastCheckTime + '</td><td align="right">退订申请时间：</td><td>' + item.cancelTime + '</td></tr>' +
                                '<tr class="warning"><td align="right">是否做过改签：</td><td>' + item.changerFlagName + '</td><td align="right">是否是赠送票：</td><td>' + item.givingFlagName + '</td>' +
                                '<td align="right">消费描述：</td><td colspan="3">' + item.consumMemo + '</td></tr>' + orderLogs +
                                '</tbody></table><div class="hr-line-dashed"></div>';
                    });
                    htmlStr = orderinfoStr + ordersplitStr;
                    $("#splitData_id").html(htmlStr);
                }
            });
            dilogAuth('订单详情', row.id, 'show_orderInfo_div');
        } else {
            layer.msg("请选择一个订单", {icon: 8});
        }
    }


    /*显示订单操作记录*/
    function showOrderOptions() {
        var row = getSingleData("tablepager");
        if (row != null) {

            dilogAuth('订单操作记录', row.id, 'show_orderLog_div');
        } else {
            layer.msg("请选择一个订单", {icon: 8});
        }

    }
    /*订单返利信息*/
    function showOrderRebateData() {
        var row = getSingleData("tablepager");
        if (row != null) {

        } else {
            layer.msg("请选择一个订单", {icon: 8});
        }

    }
    /*订单优惠信息*/
    function showOrderPreferentialData() {
        var row = getSingleData("tablepager");
        if (row != null) {

        } else {
            layer.msg("请选择一个订单", {icon: 8});
        }

    }


    function dilogAuth(title, id, divId) {
        var index = layer.open({
            type: 1,
            shade: false,
            title: title, //显示标题
            content: $('#' + divId),
            closeBtn: 1,
            btn: ['关闭'], //只是为了演示
            yes: function (index, layero) {
                layer.closeAll();
            },
            area: ['90%', '98%']
        });
    }

    function clearSearchBtn() {
        $("#searchorderNo").val("");
        $("#searchthreeOrderNo").val("");
        $("#searchorderSource").val("");
        $("#searchorderNum").val("");
        $("#searchpayType").val("");
        $("#searchrebateFlag").val("");
        $("#searchpreferentialFlag").val("");
        $("#searchorderStatus").val("");
        $("#searchprintInvoiceFlag").val("");
        $("#startTime").val("");
        $("#endTime").val("");
        $("#startpayTime").val("");
        $("#endpayTime").val("");
    }
</script>
</body>
</html>

</body>




