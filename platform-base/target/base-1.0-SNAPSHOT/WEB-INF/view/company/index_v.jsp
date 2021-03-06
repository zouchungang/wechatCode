<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首页</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="${staticCtx }/common/h5/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <!-- Morris -->
    <link href="${staticCtx }/common/h5/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <!-- Gritter -->
    <link href="${staticCtx }/common/h5/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/animate.min.css" rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/style.min862f.css?v=4.1.0" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-success pull-right">总</span>
                    <h5>销售金额</h5>
                </div>
                <div class="ibox-content">
                    <div class="spinner">
                        <div class="sk-spinner sk-spinner-wave">
                            <div class="sk-rect1"></div>
                            <div class="sk-rect2"></div>
                            <div class="sk-rect3"></div>
                            <div class="sk-rect4"></div>
                            <div class="sk-rect5"></div>
                        </div>
                    </div>
                    <div class="loaddata" hidden>
                        <h1 id="payAmount" class="no-margins">0</h1>
                        <div class="stat-percent font-bold text-success">0% <i class="fa fa-bolt"></i>
                        </div>
                        <small>总金额</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-info pull-right">总</span>
                    <h5>订单</h5>
                </div>
                <div class="ibox-content">
                    <div class="spinner">
                        <div class="sk-spinner sk-spinner-wave">
                            <div class="sk-rect1"></div>
                            <div class="sk-rect2"></div>
                            <div class="sk-rect3"></div>
                            <div class="sk-rect4"></div>
                            <div class="sk-rect5"></div>
                        </div>
                    </div>
                    <div class="loaddata" hidden>
                        <h1 id="orderNum" class="no-margins">0</h1>
                        <div class="stat-percent font-bold text-info">0% <i class="fa fa-level-up"></i>
                        </div>
                        <small>总订单</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-primary pull-right">今天</span>
                    <h5>订单</h5>
                </div>
                <div class="ibox-content">
                    <div class="spinner">
                        <div class="sk-spinner sk-spinner-wave">
                            <div class="sk-rect1"></div>
                            <div class="sk-rect2"></div>
                            <div class="sk-rect3"></div>
                            <div class="sk-rect4"></div>
                            <div class="sk-rect5"></div>
                        </div>
                    </div>
                    <div class="loaddata" hidden>
                        <h1 id="orderNumToDay" class="no-margins">0</h1>
                        <div class="stat-percent font-bold text-navy">0% <i class="fa fa-level-up"></i>
                        </div>
                        <small>新订单</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-danger pull-right">本月</span>
                    <h5>订单</h5>
                </div>
                <div class="ibox-content">
                    <div class="spinner">
                        <div class="sk-spinner sk-spinner-wave">
                            <div class="sk-rect1"></div>
                            <div class="sk-rect2"></div>
                            <div class="sk-rect3"></div>
                            <div class="sk-rect4"></div>
                            <div class="sk-rect5"></div>
                        </div>
                    </div>
                    <div class="loaddata" hidden>
                        <h1 id="orderNumMonth" class="no-margins">0</h1>
                        <div class="stat-percent font-bold text-danger">0% <i class="fa fa-level-down"></i>
                        </div>
                        <small>月</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>订单</h5>
                    <div class="pull-right">
                        <div class="btn-group">
                            <button type="button" class="btn btn-xs btn-white active">数据展示</button>
                        </div>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="">
                                <div class="flot-chart-content" id="echarts-bar-month" style="height: 450px"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>
<script type="text/javascript" src="${staticCtx }/common/h5/js/jquery.min.js?v=2.1.4"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/flot/jquery.flot.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/flot/jquery.flot.spline.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/flot/jquery.flot.resize.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/flot/jquery.flot.pie.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/flot/jquery.flot.symbol.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/peity/jquery.peity.min.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/demo/peity-demo.min.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript"
        src="${staticCtx }/common/h5/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script type="text/javascript"
        src="${staticCtx }/common/h5/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/easypiechart/jquery.easypiechart.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/sparkline/jquery.sparkline.min.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/demo/sparkline-demo.min.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/echarts/echarts.min.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/echarts/skin/shine.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        loadData();
    });

    function loadData() {
        var url = "${ctx }/company/orderInfo/getPageData";
        $.ajax({
            type: "get",
            dataType: "json",
            url: url,
            data: {
                _method: "get",
            },
            success: function (data) {
                $("#orderNumMonth").html(data.orderNumMonth);
                $("#payAmount").html(data.payAmount);
                $("#orderNumToDay").html(data.orderNumToDay);
                $("#orderNum").html(data.orderNum);
                //过渡动画效果
                $(".spinner").hide();
                $(".loaddata").show();
                loadecharts(data.list);
            }
        });
    }
    function loadecharts(list) {
        var myChart = echarts.init(document.getElementById('echarts-bar-month'),"shine");
        var option = {
            title: {
                text: '景区订单信息',
                subtext: '全部数据'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['订单数量', '票数量','销售总金额']
            },
            toolbox: {
                show: true,
                feature: {
                    mark: {show: true},
                    magicType: {show: true, type: ['bar', 'line', 'stack', 'tiled']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            calculable: true,
            xAxis: [
                {
                    type: 'category',
                    data: list.monthdataDate,
                    axisLabel: {
                        show: true,
                        interval: '0',
                        rotate: 40,
                        margin: 8,
                        clickable: false,
                        textStyle: {fontSize: 13,},
                    },
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '订单数',
                    axisLabel: {
                        formatter: '{value} 单'
                    },
                    splitLine: {
                        show: true,
                        lineStyle: {
                            color: '#483d8b',
                            type: 'dotted',
                            width: 1
                        }
                    },
                },
                {
                    type: 'value',
                    name: '金额',
                    axisLabel: {
                        formatter: '{value} ￥'
                    },
                    splitLine: {
                        show: false,
                    },
                }
            ],
            series: [
                {
                    name: '订单数量',
                    type: 'bar',
                    data: list.orderNums,
                    barGap: 0,
                    barMaxWidth: 25,
                },
                {
                    name: '票数量',
                    type: 'bar',
                    data: list.orderGoodsNums,
                    barGap: 0,
                    barMaxWidth: 25,
                },
                {
                    name: '销售总金额',
                    type: 'line',
                    yAxisIndex: 1,
                    smooth:true,
                    barGap: 0,
                    barMaxWidth: 25,
                    data: list.payAmounts
                },

            ]
        };
        myChart.setOption(option);
        window.onresize = function(){
            myChart.resize();
        };
    }

</script>
</body>
</html>
