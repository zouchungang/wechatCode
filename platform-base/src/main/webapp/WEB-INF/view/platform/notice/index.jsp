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
        <div class="example-wrap">
            <div class="example">
                <p id="tableToolbar" role="group">
                    <button type="button" class="btn  btn-xm btn-primary" onclick="add()">
                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>添加
                    </button>
                    <button type="button" class="btn  btn-xm btn-primary" onclick="editor()">
                        <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>修改
                    </button>
                    <button type="button" class="btn  btn-xm btn-primary" onclick="deleteNotice()">
                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
                    </button>
                    <button type="button" class="btn  btn-xm btn-primary" onclick="parent.helpView('${ctx}/help/01')">
                        <i class="glyphicon glyphicon-question-sign" aria-hidden="true"></i>
                    </button>
                </p>
                <div class="ibox-content">
                    <table id="table" data-mobile-responsive="true">
                    </table>
                </div>
            </div>
        </div>
        <!-- End Example Toolbar -->
    </div>
</div>
<div id="editer_form_div" style="display: none;">
    <form class="form-horizontal" id="noticForm">
        <input type="hidden" name="_method" id="_method">
        <input type="hidden" name="id" id="id">
        <input type="hidden" id="token" name="token">
        <div class="col-md-12">
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">通知名称(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
                    <input type="text" id="noticeName" name="noticeName" class="form-control"
                           placeholder="通知名称">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">通知时间(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
                    <input type="text" id="noticeDate" name="noticeDate" class="form-control layer-date"
                           placeholder="通知时间"
                           onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss',choose:checkDate})" readonly>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">失效时间(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
                    <input type="text" id="availabilityDate" name="availabilityDate" class="form-control  layer-date"
                           placeholder="失效时间"
                           onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss',choose:checkDate1})" readonly>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">发布人(<span class="text-danger">*</span>)：</label>
                <div class="col-sm-6">
                    <input type="text" id="ownerName" name="ownerName" class="form-control" placeholder="发布人">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">通知内容：</label>
                <div class="col-sm-9">
                    <input type="hidden" id="noticeContent" name="noticeContent">
                    <div id="summernote" class="summernote"></div>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
        </div>
    </form>
</div>
<%@ include file="/common/commonjs.jsp" %>
<script src="${staticCtx }/common/h5/js/plugins/layer/laydate/laydate.js"></script>
<script src="${staticCtx }/common/h5/js/plugins/summernote/summernote.min.js"></script>
<script src="${staticCtx }/common/h5/js/plugins/summernote/summernote-zh-CN.js"></script>
<script>
    $(function () {
        $("#summernote").summernote({lang: "zh-CN"});
        loadData();
        validateForm();
        $("[data-toggle='tooltip']").tooltip('show');
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
            checkboxHeader: true,
            showColumns: true,
            showRefresh: true,
            showToggle: true,
            cache: false,
            sortable: true,      //是否启用排序
            sortOrder: "desc",     //排序方式
            sortName: "noticeDate",
            toolbar: "#tableToolbar",
            onLoadSuccess: function (data) {
                isLogin(data);
            },
            columns: [{
                checkbox: true
            }, {
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

    $.validator.addMethod("compareDate", function (value, element) {
        var date1 = new Date($("#noticeDate").val());
        var date2 = new Date(value);
        return date1 < date2;
    });

    function validateForm() {
        return $("#noticForm").validate({
            rules: {
                noticeName: "required",
                noticeDate: {
                    date: true,
                    required: true
                },
                availabilityDate: {
                    compareDate: "#noticeDate",
                    date: true,
                    required: true
                },
                ownerName: "required"
            },
            messages: {
                noticeName: "请填写通知名称",
                noticeDate: {
                    required: "请选择日期",
                    date: "请选择正确格式的日期",
                },
                availabilityDate: {
                    date: "请选择正确格式的日期",
                    required: "请选择日期",
                    compareDate: "结束时间必须大于开始时间"
                },
                ownerName: "请填写发布人"
            },
            /* 失去焦点时不验证 */
            onfocusout: false
        });
    }

    /**
     *
     * @param name
     */
    function reload(name) {
        $('#table').bootstrapTable("refresh", {
            url: "${ctx}/platform/notice/list?n=" + new Date(), query: {"noticeName": name}

        })
    }

    function add() {
        $('#noticForm')[0].reset();
        $("#_method").val("post");
        $('#summernote').summernote("code","");
        $("#id").val("");
        tokenSession("token", "${ctx}/common/tokenSession");
        dilogForm("添加", "${ctx}/platform/notice");
    }

    function editor() {
        $('#noticForm')[0].reset();
        var row = getSingleData("table");
        if (row != null) {
            dilogForm("修改", "${ctx}/platform/notice/" + row.id);
            $("#_method").val("put");
            $("#id").val(row.id);
            $("#noticeName").val(row.noticeName);
            $("#noticeDate").val(row.noticeDate);
            $("#availabilityDate").val(row.availabilityDate);
            $("#noticeContent").val(row.noticeContent);
            $("#ownerName").val(row.ownerName);
            $('#summernote').summernote("code",row.noticeContent);
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

    function submitForm(url) {
        var sHTML = $('#summernote').summernote("code");
        $('#noticeContent').val(sHTML);
        if (validateForm().form()) {
            $.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                data: $('#noticForm').serialize(),
                success: function (msg) {
                    isLogin(msg);
                    layer.closeAll();
                    layer.msg(msg.toString(), {icon: 1});
                    $('#table').bootstrapTable('refresh');
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.alert("服务异常,请返回刷新重试");
                }
            });
        }
    }

    function deleteNotice() {
        var row = getSingleData("table");
        if (row != null) {
            layer.confirm("确认删除？", {
                btn: ['确认', '取消'], //按钮
                shade: false
            }, function (index) {
                layer.close(index);
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "${ctx}/platform/notice/" + row.id,
                    data: {
                        _method: "delete"
                    },
                    success: function (msg) {
                        isLogin(msg);
                        layer.msg(msg.toString(), {icon: 1});
                        $('#table').bootstrapTable('refresh');
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

    function checkDate() {
        $("#noticForm").validate().element($("#noticeDate"));
    }

    function checkDate1() {
        $("#noticForm").validate().element($("#availabilityDate"));
    }
</script>
</body>
</html>
