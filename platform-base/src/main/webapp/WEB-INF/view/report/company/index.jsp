<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>ECharts</title>
    <%@ include file="/common/title.jsp" %>
</head>
<body style="overflow-y: hidden">
<div class="easyui-layout" style="overflow: hidden"
     data-options="fit:true" id="company_layout">
    <div data-options="region:'center',border:false,fit:true"
         style="overflow: auto;">
        <div id="main"
             style="height: 450px; border: 1px solid #ccc; padding: 10px;"></div>
    </div>
</div>
<script src="${staticCtx }/common/echarts/echarts.min.js"></script>
<script type="text/javascript">
    require.config({
        paths: {
            echarts: '${ctx }/common/echarts'
        }
    });

    require(['echarts', 'echarts/chart/bar', 'echarts/chart/line',
        'echarts/chart/map'], function (ec) {
        var myChart = ec.init(document.getElementById('main'));
        myChart.setOption({
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['demo1', 'demo2']
            },
            toolbox: {
                show: true,
                feature: {
                    mark: {
                        show: true
                    },
                    dataView: {
                        show: true,
                        readOnly: false
                    },
                    magicType: {
                        show: true,
                        type: ['line', 'bar']
                    },
                    restore: {
                        show: true
                    },
                    saveAsImage: {
                        show: true
                    }
                }
            },
            calculable: true,
            xAxis: [{
                type: 'category',
                data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月',
                    '10月', '11月', '12月']
            }],
            yAxis: [{
                type: 'value',
                splitArea: {
                    show: true
                }
            }],
            series: [
                {
                    name: 'demo1',
                    type: 'bar',
                    data: [2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2,
                        32.6, 20.0, 6.4, 3.3]
                },
                {
                    name: 'demo2',
                    type: 'bar',
                    data: [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2,
                        48.7, 18.8, 6.0, 2.3]
                }]
        });
        //window.onresize = myChart.resize;
    });
</script>
</body>
</html>
