<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
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
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>平台企业信息</h5>
                    <div class="ibox-tools">
                        <button class="btn btn-xs btn-primary" type="button"
                                onclick="parent.helpView('${ctx}/help/01')">
                            <i class="glyphicon glyphicon-question-sign" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
                <div class="ibox-content">
                    <form method="post" class="form-horizontal" id="companyForm">
                        <input type="hidden" name="_method" value="put">
                        <input type="hidden" name="id" id="id">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">企业名称</label>
                            <div class="col-sm-3">
                                <input type="text" name="name" class="form-control" id="name"
                                       aria-required="true">
                            </div>
                            <label class="col-sm-2 control-label">企业传真</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="fax" id="fax"
                                       aria-required="true">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">企业电话</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="tel" id="tel"
                                       aria-required="true">
                            </div>
                            <label class="col-sm-2 control-label">企业邮箱</label>
                            <div class="col-sm-3">
                                <input type="email" class="form-control" id="email" name="email">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">联系人姓名</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="linkManName" id="linkManName">
                            </div>
                            <label class="col-sm-2 control-label">企业网站</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="webUrl" id="webUrl">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">手机号码</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="mobile" id="mobile">
                            </div>
                            <label class="col-sm-2 control-label">企业地址</label>
                            <div class="col-sm-3">
                                <input type="text" name="address" class="form-control" id="address">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">开户银行</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" name="bankName" id="bankName">
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">银行账号</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" name="bankAccount" id="bankAccount">
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">银行账户名称</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" name="bankAccountName"
                                               id="bankAccountName">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">企业徽标</label>
                                    <div class="col-sm-3">
                                        <img id="imgView" src="" style="width: 120px;height: 120px;">
                                        <div id="picker">上传企业徽标</div>
                                        <input type="hidden" id="logo" name="logo">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">平台信息简介</label>
                            <div class="col-sm-8">
                                <input type="hidden" id="simpleInfo" name="simpleInfo">
                                <div id="summernote" class="summernote"></div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">备注</label>
                            <div class="col-sm-8">
                                <textarea id="memo" name="memo" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-primary" type="button" onclick="submitForm()">保存</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/common/commonjs.jsp" %>
<script type="text/javascript" src="${staticCtx}/common/js/common.js"></script>
<script type="text/javascript" src="${staticCtx}/common/webuploader/webuploader.min.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/summernote/summernote.min.js"></script>
<script type="text/javascript" src="${staticCtx }/common/h5/js/plugins/summernote/summernote-zh-CN.js"></script>
<script type="text/javascript">
    var uploader;
    $(document).ready(function () {
        $("#summernote").summernote({lang: "zh-CN"});
        validateForm();
        loadData();
        initWebuploader();
        $("[data-toggle='tooltip']").tooltip('show');
    })

    function loadData() {
        $.ajax({
            type: "post",
            dataType: "json",
            url: "${ctx}/platform/info/firstEntity",
            data: {
                _method: "get"
            },
            success: function (data) {
                isLogin(data);
                $("#id").val(data.id);
                $("#name").val(data.name);
                $("#address").val(data.address);
                $("#tel").val(data.tel);
                $("#fax").val(data.fax);
                $("#email").val(data.email);
                $("#imgView").attr("src", "${staticUpfileCtx}" + data.logo);
                $("#logo").val(data.logo);
                $("#webUrl").val(data.webUrl);
                $("#linkManName").val(data.linkManName);
                $("#mobile").val(data.mobile);
                $("#bankName").val(data.bankName);
                $("#bankAccount").val(data.bankAccount);
                $("#bankAccountName").val(data.bankAccountName);
                $("#simpleInfo").val(data.simpleInfo);
                $('#summernote').summernote("code",data.simpleInfo);
                $("#memo").val(data.memo);
            }
        });
    }

    function initWebuploader() {
        uploader = WebUploader.create({
            fileNumLimit: 1,//上传数量限制
            fileSizeLimit: 1024 * 1024 * 3,//限制上传所有文件大小
            fileSingleSizeLimit: 1024 * 1024 * 3,//限制上传单个文件大小
            auto: true,
            // swf文件路径
            // swf: BASE_URL + '/js/Uploader.swf',
            // 文件接收服务端。
            server: "${ctx}/platform/info/logo",
            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#picker',
            // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: false,
            duplicate: true
        })
        ;
        //上传每个文件之前设置额外参数
        uploader.on("uploadStart", function () {
        });
        uploader.on("startUpload", function () {
        });
        uploader.on("uploadSuccess", function (file, response) {
            $("#imgView").attr("src", "${staticUpfileCtx}" + response);
            $("#logo").val(response);
            layer.msg("上传成功");
            uploader.destroy();
            initWebuploader();
        });
        uploader.on("uploadFinished", function () {
            //layer.msg("上传成功")
        });
        /**
         * 验证文件格式以及文件大小
         */
        uploader.on("error", function (type) {
            if (type == "Q_TYPE_DENIED") {
                layer.msg("请上传JPG、PNG格式文件");
            } else if (type == "F_EXCEED_SIZE") {
                layer.msg("文件大小不能超过3M");
            }
        });
    }

    function validateForm() {
        return $("#companyForm").validate({
            rules: {
                name: "required",
                tel: "required",
                linkManName: "required",
                address: "required",
                email: {
                    email: true
                },
                webUrl: {
                    url: true
                },
                mobile: {
                    mobile: true
                }
            },
            messages: {
                name: "请输入公司名称",
                tel: "请输入公司电话",
                linkManName: "请输入联系人",
                address: "请输入地址"
            },
            /* 失去焦点时不验证 */
            onfocusout: function (element) {
                $(element).valid();
            }
        });
    }

    function submitForm() {
        var sHTML = $('#summernote').summernote("code");
        $('#simpleInfo').val(sHTML);
        if (validateForm().form()) {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${ctx}/platform/info/" + $("#id").val(),
                data: $('#companyForm').serialize(),
                success: function (msg) {
                    if (isLogin(msg)) {
                        layer.msg(msg.toString(), {icon: 1});
                        window.location.reload();//刷新当前页面.
                    }
                },
                error: function () {
                    layer.msg("服务器错误", {icon: 2});
                }
            });
        }
    }
</script>
</body>
</html>
