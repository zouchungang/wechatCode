<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>通知公告</title>
    <%@ include file="/common/title.jsp" %>
    <link href="${staticCtx }/common/h5/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
    <style type="text/css">
        .modal-backdrop {
            z-index: 0 !important;
            display: none;
        }
        .modal-open {
            overflow: auto !important;
        }
    </style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="col-sm-12">
        <!-- Example Toolbar -->
        <div class="example-wrap">
            <div class="example">
                <div class="ibox-content">
                    <table id="table" data-mobile-responsive="true">
                    </table>
                </div>
            </div>
        </div>
        <!-- End Example Toolbar -->
    </div>
</div>
<%@ include file="/common/commonjs.jsp" %>
<script src="${staticCtx }/common/h5/js/plugins/layer/laydate/laydate.js"></script>
<script>
    $(function () {
        loadData();
    });

    function loadData(name) {
        $('#table').bootstrapTable({
            url: "${ctx}/platform/notice/pageSort?n=" + new Date(),
            dataType: "json",
            pagination: true, //分页
            singleSelect: true,
            striped: true,
            clickToSelect: true,
            search: false, //显示搜索框
            sidePagination: "server", //服务端处理分
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20, 50, 100],
            checkboxHeader: false,
            showColumns: true,
            showRefresh: true,
            showToggle: true,
            cache: false,
            sortable: true,      //是否启用排序
            sortOrder: "desc",     //排序方式
            sortName: "noticeDate",
            onLoadSuccess: function (data) {
                isLogin(data);
            },
            columns: [{
                title: '通知名称',
                field: 'noticeName',
                sortable: true
            }, {
                title: '发布人',
                field: 'ownerName'
            }, {
                title: '通知时间',
                field: 'noticeDate',
                sortable: true
            }, {
                title: '通知失效时间',
                field: 'availabilityDate',
                sortable: true
            }
            ]
        });
    }

</script>
</body>
</html>
