<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
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
                    <h5>景区信息 </h5>
                    <div class="ibox-tools">
                        <button class="btn btn-xs btn-primary" type="button"
                                onclick="parent.helpView('${ctx}/help/09')">
                            <i class="glyphicon glyphicon-question-sign" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal" id="companyForm">
                        <input type="hidden" name="_method" id="_method">
                        <input type="hidden" name="id" id="id">
                        <input type="hidden" name="enterprise.id" id="id_enterprise">
                        <input type="hidden" id="token" name="token">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">景区代码:</label>
                            <div class="col-sm-3">
                                <p class="form-control-static" id="companyCode"></p>
                            </div>
                            <label class="col-sm-2 control-label">景区名称(<span class="text-danger">*</span>):</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="companyName" id="companyName"
                                       aria-required="true">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">appId:</label>
                            <div class="col-sm-3">
                                <p class="form-control-static" id="appId"></p>
                            </div>
                            <label class="col-sm-2 control-label">appKey:</label>
                            <div class="col-sm-3">
                                <p class="form-control-static" id="appKey"></p>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">排序(<span class="text-danger">*</span>):</label>
                            <div class="col-sm-3">
                                <p class="form-control-static" id="dataSort"></p>
                            </div>
                            <label class="col-sm-2 control-label">通道最大数量(<span class="text-danger">*</span>):</label>
                            <div class="col-sm-3">
                                <p class="form-control-static" id="channelMaxNum"></p>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">联系人姓名(<span class="text-danger">*</span>):</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="linkInfo" name="linkInfo">
                            </div>
                            <label class="col-sm-2 control-label">手机号码(<span class="text-danger">*</span>):</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="mobileCompany" name="mobile">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">景区地址(<span class="text-danger">*</span>):</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="addressCompany" name="address">
                            </div>
                            <label class="col-sm-2 control-label">email:</label>
                            <div class="col-sm-3">
                                <input type="text" id="emailComapny" name="email" class="form-control">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">简介：</label>
                            <div class="col-sm-8">
                                <input type="hidden" id="memo" name="memo">
                                <div id="summernote" class="summernote"></div>
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
<script src="${staticCtx}/common/js/common.js"></script>
<script src="${staticCtx }/common/h5/js/plugins/summernote/summernote.min.js"></script>
<script src="${staticCtx }/common/h5/js/plugins/summernote/summernote-zh-CN.js"></script>
<script type="text/javascript">
    $(function () {
        validateForm();
        $("#summernote").summernote({lang: "zh-CN"});
        loadData();
        $("[data-toggle='tooltip']").tooltip();
    })

    function loadData() {
        $.ajax({
            type: "post",
            dataType: "json",
            url: "${ctx}/company/info/companyInfo",
            data: {
                _method: "get"
            },
            success: function (data) {
                isLogin(data);
                $("#id").val(data.id);
                $("#companyCode").html(data.companyCode);
                $("#appId").html(data.appId);
                $("#appKey").html(data.appKey);
                $("#channelMaxNum").html(data.channelMaxNum);
                $("#dataSort").html(data.dataSort);
                $("#companyName").val(data.companyName);
                $("#mobileCompany").val(data.mobile);
                $("#linkInfo").val(data.linkInfo);
                $("#addressCompany").val(data.address);
                $("#emailComapny").val(data.email);
                $("#memo").val(data.memo);
                $("#summernote").summernote("code", data.memo);
                $('#_method').val("PUT");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                layer.alert("服务器错误，请重新登陆");
            }
        });
    }

    function validateForm() {
        return $("#companyForm").validate({
            rules: {
                companyName: "required",
                linkInfo: "required",
                address: "required",
                mobile: {
                    required: true,
                    mobile: true,
                    remote: {
                        url: "${ctx}/company/info/validateMobile",     //后台处理程序
                        async: false,
                        cache: false,
                        data: { //要传递的数据
                            mobile: function () {
                                return $("#mobileCompany").val();
                            },
                            id: function () {
                                return $("#id").val();
                            }
                        },
                        dataFilter: function (data) {
                            var msg = eval('(' + data + ')');
                            isLogin(msg);
                            return data;
                        }
                    }
                },
                email: {
                    email2: true
                }
            },
            messages: {
                companyName: "请输入景区名字",
                linkInfo: "请输入联系人姓名",
                address: "请输入景区地址",
                mobile: {
                    required: "请输入手机号码",
                    mobile: "请输入正确的手机号码",
                    remote: "该号码已使用"
                },
                email: "请输入正确的邮箱地址"
            },
            /* 失去焦点时不验证 */
            onfocusout: function (element) {
                $(element).valid();
            }
        });
    }


    function submitForm() {
        var sHTML = $('#summernote').summernote("code");
        $('#memo').val(sHTML);
        var v = validateForm();
        v.form();
        if (v.form()) {
            var noticeIndex = hx_loading();//开启加载动画
            $.ajax({
                type: "POST",
                url: "${ctx}/company/info/" + $("#id").val(),
                data: $('#companyForm').serialize(),
                success: function (msg) {
                    isLogin(msg);
                    layer.close(noticeIndex);//关闭加载动画
                    msg = msg.toString();
                    if (msg.indexOf("成功") != -1) {
                        layer.msg(msg, {icon: 1});
                        window.location.reload();//刷新当前页面.
                    } else {
                        layer.msg(msg, {icon: 8});
                    }
                },
                error: function () {
                    layer.close(noticeIndex);//关闭加载动画
                    layer.alert("请求过于频繁,请稍后再试");
                }
            });
        }
    }
</script>
</body>
</html>
