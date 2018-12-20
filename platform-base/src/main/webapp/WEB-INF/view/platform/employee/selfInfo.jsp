<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
    <link href="${staticCtx}/common/webuploader/webuploader.css" rel="stylesheet" type="text/css">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>我的资料
                    </h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal" id="employeeForm">
                        <input type="hidden" name="_method" id="_method" value="PUT">
                        <input type="hidden" id="token" name="token">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">员工登录名：</label>
                                <div class="col-sm-6">
                                    <p class="form-control-static">&nbsp;&nbsp;${platformEmployee.employeeCode}</p>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">员工名称：</label>
                                <div class="col-sm-6">
                                    <p class="form-control-static">&nbsp;&nbsp;${platformEmployee.employeeName}</p>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">身份证：</label>
                                <div class="col-sm-6">
                                    <input type="text" id="cardId" name="cardId" class="form-control" placeholder="身份证"
                                           value="${platformEmployee.cardId}">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">手机：</label>
                                <div class="col-sm-6">
                                    <input type="text" id="mobile" name="mobile" class="form-control" placeholder="手机"
                                           value="${platformEmployee.mobile}">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">性别：</label>
                                <div class="col-sm-6">
                                    <div class="radio radio-info radio-inline">
                                        <input type="radio" id="sex1" value="1" name="sex"
                                               <c:if test="${platformEmployee.sex eq 1}">checked="checked"</c:if>>
                                        <label for="sex1">男</label>
                                    </div>
                                    <div class="radio radio-info radio-inline">
                                        <input type="radio" id="sex2" value="0" name="sex"
                                               <c:if test="${platformEmployee.sex ne 1}">checked="checked"</c:if>>
                                        <label for="sex2">女</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">头像：</label>
                                <div class="col-sm-6">
                                    <img id="imgView" src="${ctx }/upfile/default.jpg"
                                         style="width: 120px;height: 120px;">
                                    <div id="picker">上传头像</div>
                                    <input type="hidden" id="photo" name="photo" class="form-control" placeholder="头像">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-5 col-sm-offset-5">
                                <button class="btn btn-primary" type="button" onclick="submitForm()">提交</button>
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
<script src="${staticCtx}/common/webuploader/webuploader.min.js"></script>
<script>

    var picAllSize = 1024 * 1024 * 20;
    var picSingleSize = 1024 * 1024 * 2;
    var picNum = 1;
    var rootPath = '${ctx}';
    var staticUpfileCtx = '${staticUpfileCtx}';
    $(function () {
        validateForm();
        <%--initWebuploader("${ctx}/company/employee/photo",picNum,picAllSize,picSingleSize,rootPath);--%>
        initWebuploader("${ctx}/platform/employee/logo", picNum, picAllSize, picSingleSize, rootPath,staticUpfileCtx);
        var imgFile = '${platformEmployee.photo}';
        if (imgFile != null && imgFile.length > 0) {
            $("#imgView").attr("src", '${staticUpfileCtx }' + imgFile);
            $("#photo").val(imgFile);
        }
    })
    function validateForm() {
        return $("#employeeForm").validate({
            rules: {
                mobile: {
                    mobile: true
                },
                cardId: {
                    idcardcode: true
                }
            },
            messages: {
                mobile: "请输入正确的手机号码",
            },
            onfocusout: function (element) {
                $(element).valid();
            }
        });
    }

    function submitForm() {
        var v = validateForm();
        v.form();
        if (v.form()) {
            $.ajax({
                type: "POST",
                url: "${ctx}/platform/employee/alterInfo",
                data: $('#employeeForm').serialize(),
                dataType: "json",
                success: function (msg) {
                    isLogin(msg);
                    layer.confirm(msg.toString() + "---点击确定刷新页面", {
                            btn: ['确定']
                        }, function (index, layero) {
                            window.location.reload();//刷新当前页面.
                        }
                    );
                },
                error: function () {
                    layer.alert("服务发生错误");
                }
            });
        }
    }
</script>
</body>
</html>
