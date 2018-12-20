<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>修改密码
                    </h5>
                </div>
                <div class="ibox-content">
                    <form method="post" class="form-horizontal" id="alterPwdForm">
                        <input type="hidden" name="_method" value="put">
                        <input type="hidden" name="id" id="id">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">欢迎：</label>
                            <div class="col-sm-3">
                                <p id="companyCodeSession" class="form-control-static">${employeeName}</p>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">旧密码</label>
                            <div class="col-sm-3">
                                <input type="password" class="form-control" name="oldPwd" id="oldPwd"
                                       aria-required="true">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新密码</label>
                            <div class="col-sm-3">
                                <input type="password" class="form-control" name="newPwd" id="newPwd">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">再次输入新密码</label>
                            <div class="col-sm-3">
                                <input type="password" class="form-control" name="newPwdAgain" id="newPwdAgain">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-primary" type="button" onclick="submitForm()">提交</button>
                                <button class="btn btn-primary" type="button" onclick="clearForm()">重置</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/common/commonjs.jsp" %>
<script src="${staticCtx}/common/webuploader/webuploader.min.js"></script>
<script>
    var uploader;
    $(function () {
        validateForm();
    })
    function validateForm() {
        return $("#alterPwdForm").validate({
            rules: {
                oldPwd: {
                    required: true,
                   },
                newPwd: {
                    required:true,
                    codeValidate: true
                },
                newPwdAgain: {
                    required:true,
                    codeValidate: true,
                    equalTo: "#newPwd"
                }
            },
            messages: {
                oldPwd: {
                    required:"请输入旧密码"
                },
                newPwd: {
                    required: "请输入新密码"
                },
                newPwdAgain: {
                    required: "请再次输入新密码",
                    equalTo:"两次输入的密码不一致"
                }
            },
            /* 失去焦点时不验证 */
            onfocusout: false
        });
    }

    function submitForm() {
        var v = validateForm();
        v.form();
        if (v.form()) {
            $.ajax({
                type: "POST",
                url: "${ctx}/platform/employee/alterPwd",
                data: $('#alterPwdForm').serialize(),
                dataType:"json",
                success: function (msg) {
                    isLogin(msg);
                    layer.msg(msg.toString(), {time: 1000,icon: 1},function(){
                        window.location.reload();//刷新当前页面.
                        clearForm();
                    });
                },
                error: function () {
                    layer.alert("failure");
                }
            });
        }
    }

    function clearForm(){
        $("#oldPwd").val("");
        $("#newPwd").val("");
        $("#newPwdAgain").val("");
    }
</script>
</body>
</html>
