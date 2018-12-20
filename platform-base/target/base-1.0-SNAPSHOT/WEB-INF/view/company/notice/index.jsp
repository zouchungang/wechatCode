<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
    <%@ include file="/common/commonjs.jsp" %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>通知公告</title>
    <link href="${staticCtx }/common/h5/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
    <link href="${staticCtx}/common/webuploader/webuploader.css" rel="stylesheet" type="text/css">
    <link href="${staticCtx }/common/h5/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
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
                <p id="tableToolbar" role="group">
                    <button type="button" class="btn  btn-xm btn-primary" onclick="add()">
                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>添加
                    </button>
                    <button type="button" class="btn  btn-xm btn-primary" onclick="editor()">
                        <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>修改
                    </button>
                    <button type="button" class="btn  btn-xm btn-primary" onclick="deleteCompanyNotice()">
                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
                    </button>
                    <button type="button" class="btn btn-primary btn-xm" onclick="parent.helpView('${ctx}/help/13')">
                        <i class="glyphicon glyphicon-question-sign" aria-hidden="true"></i>
                    </button>
                </p>
                <div class="ibox-content">
                    <table id="table" data-mobile-responsive="true">
                    </table>
                </div>
            </div>
        </div>
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
                <label class="col-sm-2 control-label">公告名称
                    (<span class="text-danger">*</span>)
                    ：</label>
                <div class="col-sm-6">
                    <input type="text" id="noticeName" name="noticeName" class="form-control"
                           placeholder="公告名称">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">发布人
                    (<span class="text-danger">*</span>)
                    ：</label>
                <div class="col-sm-6">
                    <input type="text" id="ownerName" name="ownerName" class="form-control" placeholder="发布人">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">公告时间
                    (<span class="text-danger">*</span>)
                    ：</label>
                <div class="col-sm-6">
                    <input type="text" id="noticeDate" name="noticeDate" class="form-control layer-date"
                           placeholder="公告时间"
                           onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss',choose:checkDate})" readonly>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">失效时间
                    (<span class="text-danger">*</span>)
                    ：</label>
                <div class="col-sm-6">
                    <input type="text" id="availabilityDate" name="availabilityDate" class="form-control  layer-date"
                           placeholder="失效时间"
                           onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss',choose:checkDate1})" readonly>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">公告内容：</label>
                <div class="col-sm-9">
                    <input type="hidden" id="noticeContent" name="noticeContent">
                    <div id="summernote" class="summernote"></div>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label">附件</label>
                <div class="col-sm-6">
                    <span id="picker">上传附件</span>&nbsp;&nbsp;
                    <a id="annexShow" href="javascript:void(0)"></a>
                    <input type="hidden" id="annexFilePath" name="annexFilePath">
                    <input type="hidden" id="annexName" name="annexName">
                </div>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="${staticCtx}/common/js/common.js"></script>
<script src="${staticCtx }/common/h5/js/plugins/layer/laydate/laydate.js"></script>
<script src="${staticCtx}/common/webuploader/webuploader.min.js"></script>
<script src="${staticCtx }/common/h5/js/plugins/summernote/summernote.min.js"></script>
<script src="${staticCtx }/common/h5/js/plugins/summernote/summernote-zh-CN.js"></script>
<script>
    var uploader;
    $(function () {
        validateForm();
        loadData();
        $("#summernote").summernote({lang: "zh-CN"});
        $("[data-toggle='tooltip']").tooltip();
    });

    function checkDate() {
        $("#noticForm").validate().element($("#noticeDate"));
    }

    function checkDate1() {
        $("#noticForm").validate().element($("#availabilityDate"));
    }

    function initWebuploader(url) {
        uploader = WebUploader.create({
            fileNumLimit: 1,//上传数量限制
            fileSizeLimit: 1024 * 1024 * 5,//限制上传所有文件大小
            fileSingleSizeLimit: 1024 * 1024 * 5,//限制上传单个文件大小
            auto: true,
            // swf文件路径
            // swf: BASE_URL + '/js/Uploader.swf',
            // 文件接收服务端。
            server: url,
            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#picker',
            // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: false
        })
        //上传每个文件之前设置额外参数
        uploader.on("uploadStart", function () {
        });
        uploader.on("startUpload", function () {
        });
        uploader.on("uploadSuccess", function (file, response) {
            $("#annexName").val(response.fileName);
            $("#annexShow").html(response.fileName);
            $("#annexFilePath").val(response.filePath);
            layer.msg("上传成功", {icon: 1});
            uploader.destroy();
            initWebuploader("${ctx}/company/notice/annex");
        });
        uploader.on("uploadFinished", function () {
            //layer.msg("上传成功")
        });
        /**
         * 验证文件格式以及文件大小
         */
        uploader.on("error", function (type) {
            if (type == "F_EXCEED_SIZE") {
                layer.msg("文件大小不能超过5M");
            }
        });
    }

    function loadData() {
        $('#table').bootstrapTable({
            url: "${ctx}/company/notice/pageSort?n=" + new Date(),
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
            sortOrder: "asc",     //排序方式
            sortName: "dataCreateTime",
            toolbar: "#tableToolbar",
            onLoadSuccess: function (data) {
                isLogin(data);
            },
            columns: [{
                checkbox: true
            }, {
                title: '公告名称',
                field: 'noticeName',
            }, {
                title: '发布人',
                field: 'ownerName',
            }, {
                title: '公告开始时间',
                field: 'noticeDate',
                sortable: true
            }, {
                title: '公告结束时间',
                field: 'availabilityDate',
                sortable: true
            }, {
                title: '创建时间',
                field: 'dataCreateTime',
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
                noticeName: {
                    required: true,
                    remote: {
                        url: "${ctx}/company/notice/remote",
                        type: "get",
                        async: false,
                        cache: false,
                        data: {
                            id: function () {
                                return $("#id").val();
                            },
                            noticeName: function () {
                                return $("#noticeName").val();
                            }
                        },
                        dataFilter: function (data) {
                            isLogin(eval('(' + data + ')'));
                            return data;
                        }
                    }
                },
                ownerName: "required",
                noticeDate: {
                    date: true,
                    required: true
                },
                availabilityDate: {
                    compareDate: "#noticeDate",
                    date: true,
                    required: true
                }
            },
            messages: {
                noticeName: {
                    required: "请输入公告名称",
                    remote: "该名称已使用"
                },
                ownerName: "请输入发布人名称",
                noticeDate: {
                    required: "请选择日期",
                    date: "请选择正确格式的日期",
                },
                availabilityDate: {
                    date: "请选择正确格式的日期",
                    required: "请选择日期",
                    compareDate: "结束时间必须大于开始时间"
                }
            }
        });
    }

    function add() {
        $('#noticForm')[0].reset();
        $("#_method").val("post");
        $("#_method").val("post");
        $('#summernote').summernote("code","");
        $("#id").val("");
        $("#annexShow").html("");
        tokenSession("token", "${ctx}/common/tokenSession");
        dilogForm("添加", "${ctx}/company/notice");
        initWebuploader("${ctx}/company/notice/annex");
    }

    function editor() {
        $('#noticForm')[0].reset();
        var row = getSingleData("table");
        if (row != null) {
            dilogForm("修改", "${ctx}/company/notice/" + row.id);
            initWebuploader("${ctx}/company/notice/annex");
            $("#_method").val("put");
            $("#id").val(row.id);
            $("#noticeName").val(row.noticeName);
            $("#noticeDate").val(row.noticeDate);
            $("#availabilityDate").val(row.availabilityDate);
            $("#noticeContent").val(row.noticeContent);
            $("#ownerName").val(row.ownerName);
            $('#summernote').summernote("code",row.noticeContent);
            $("#annexName").val(row.annexName);
            $("#annexShow").html(row.annexName);
            $("#annexFilePath").val(row.annexFilePath);

            /**/
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
            }, end: function (index) {
                uploader.destroy();
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
        var v = validateForm();
        v.form();
        if (v.form()) {
            var noticeIndex = hx_loading();//开启加载动画
            $.ajax({
                type: "POST",
                url: url,
                data: $('#noticForm').serialize(),
                dataType: "json",
                success: function (msg) {
                    if (isLogin(msg)) {
                        layer.closeAll();
                        if (msg.indexOf("成功") != -1) {
                            layer.close(noticeIndex);//关闭加载动画
                            layer.msg(msg, {icon: 1});
                        } else {
                            layer.close(noticeIndex);//关闭加载动画
                            layer.msg(msg, {icon: 8});
                        }
                        $('#table').bootstrapTable('refresh');
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.close(noticeIndex);//关闭加载动画
                    layer.alert("请求过于频繁,请稍后再试");
                }
            });
        }
    }

    function deleteCompanyNotice() {
        var row = getSingleData("table");
        if (row != null) {
            layer.confirm('确认删除？', {
                btn: ['确认', '取消'], //按钮
                shade: false
            }, function (index) {
                layer.close(index);
                var noticeIndex = hx_loading();//开启加载动画
                $.ajax({
                    type: "POST",
                    url: "${ctx}/company/notice/" + row.id,
                    dataType: "json",
                    data: {
                        _method: "delete"
                    },
                    success: function (msg) {
                        if (isLogin(msg)) {
                            layer.close(noticeIndex);//关闭加载动画
                            layer.msg(msg, {icon: 1});
                            $('#table').bootstrapTable('refresh');
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        layer.close(noticeIndex);//关闭加载动画
                        layer.alert("请求过于频繁,请稍后再试");
                    }
                });
            }, function () {
            });
        } else {
            layer.msg("选择要删除的记录", {icon: 8});
        }
    }
</script>
</body>
</html>
