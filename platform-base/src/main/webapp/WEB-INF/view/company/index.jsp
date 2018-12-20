<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>景区后台管理--登录</title>
    <meta name="keywords" content="">
    <meta name="description" content=" ">
    <link href="${staticCtx }/common/h5/css/bootstrap.min.css" rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/animate.min.css" rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/style.min.css" rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/login.min.css" rel="stylesheet">
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location
        }
    </script>
</head>
<body class="company">
<div class="signinpanel">
    <div class="row">
        <div class="col-sm-7">
            <div class="signin-info">
                <div class="logopanel m-b">
                    <h1>租房网智慧旅游--景区平台</h1>
                </div>
                <div class="m-b"></div>
                <h4>欢迎使用 <strong>景区平台管理</strong></h4>
                <ul class="m-b">
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 全域旅游</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 智慧景区</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 智慧旅游</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 智慧服务</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 未来票房</li>
                </ul>
                <%--<strong>还没有账号？ <a href="#">立即注册&raquo;</a></strong>--%>
            </div>
        </div>
        <div class="col-sm-5">
            <form method="post" id="login_form" action="${ctx }/company/login">
                <h4 class="no-margins">登录：</h4>
                <p class="m-t-md">登录到旅游智慧景区平台</p>
                <input type="text" name="username" id="username" class="form-control uname" placeholder="用户名/手机号"/>
                <input type="password" name="password" id="password" class="form-control pword m-b" placeholder="密码"/>
                <%--<a href="#">忘记密码了？</a>--%>
                <span>${msg}</span>
                <button class="btn btn-success btn-block">登录</button>
            </form>
        </div>
    </div>
    <div class="signup-footer">
        <div class="pull-left">
            &copy; 2015 All Rights Reserved. <a href="http://www.unionticket.cn/" target="_blank">租房网</a>
        </div>
    </div>
</div>
<script src="${staticCtx }/common/h5/js/jquery.min.js?v=2.1.4"></script>
<script src="${staticCtx }/common/h5/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript">
    $(function () {
        $("#username").focus();
        document.onkeydown = function (e) {
            var ev = document.all ? window.event : e;
            if (ev.keyCode == 13) {
                loginsubmit();
            }
        }
    });

    function loginsubmit() {
        var username = $("#username").val();
        var pwd = $("#password").val();
        if (username == null || username == "") {
            return false;
        } else if (pwd == null || pwd == "") {
            return false;
        } else {
            $("#login_form").submit();
        }
    }
</script>
</body>
</html>
