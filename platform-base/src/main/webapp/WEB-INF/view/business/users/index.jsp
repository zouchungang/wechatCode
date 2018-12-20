<!DOCTYPE html>
<%@ page language="java" pageEncoding="utf-8"%>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="col-sm-12">
        <div class="example">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>查询条件</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                    隐藏
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="row form-horizontal">
                                <div class="col-sm-10">
                                    <div class="form-group">
                                    <label class="col-sm-2 control-label">uid</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchuid" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    <label class="col-sm-2 control-label">uname</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchuname" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    <label class="col-sm-2 control-label">upwd</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchupwd" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    </div>
                                    <div class="form-group">
                                    <label class="col-sm-2 control-label">phone</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchphone" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    <label class="col-sm-2 control-label">email</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchemail" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    <label class="col-sm-2 control-label">truename</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchtruename" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    </div>
                                    <div class="form-group">
                                    <label class="col-sm-2 control-label">sex</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchsex" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    <label class="col-sm-2 control-label">address</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchaddress" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    <label class="col-sm-2 control-label">image</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchimage" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    </div>
                                    <div class="form-group">
                                    <label class="col-sm-2 control-label">remark</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchremark" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <p>
                                        <button class="btn  btn-primary" onclick="searchTable()"
                                                type="submit"><strong>查询</strong>
                                        </button>
                                        <button class="btn  btn-white"
                                                type="submit" onclick="clearSearchBtn()"><strong>清空查询条件</strong>
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <p class="hidden-xs" id="tableToolbar" role="group">
                <button type="button" class="btn  btn-xm btn-primary" onclick="add()">
                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>添加
                </button>
                <button type="button" class="btn  btn-xm btn-primary" onclick="editor()">
                    <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>修改
                </button>
                <button type="button" class="btn  btn-xm btn-primary" onclick="deletedata()">
                    <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
                </button>
            </p>
            <div  class="ibox-content">
                <table id="tablepager" data-mobile-responsive="true">
                </table>
            </div>
        </div>
    </div>
</div>
<div id="editer_form_div" style="display: none;">
    <form class="form-horizontal" id="myForm">
        <input type="hidden" name="_method" id="_method">
        <input type="hidden" name="id" id="id">
        <input type="hidden" id="token" name="token">
        <div class="col-md-12">
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">uid
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="uid" name="uid" class="form-control" placeholder="uid">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">uname
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="uname" name="uname" class="form-control" placeholder="uname">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">upwd
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="upwd" name="upwd" class="form-control" placeholder="upwd">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">phone
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="phone" name="phone" class="form-control" placeholder="phone">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="email" name="email" class="form-control" placeholder="email">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">truename
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="truename" name="truename" class="form-control" placeholder="truename">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">sex
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="sex" name="sex" class="form-control" placeholder="sex">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">address
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="address" name="address" class="form-control" placeholder="address">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">image
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="image" name="image" class="form-control" placeholder="image">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">remark
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="remark" name="remark" class="form-control" placeholder="remark">
                        </div>
                    </div>
        </div>
    </form>
</div>
<%@ include file="/common/commonjs.jsp" %>
<script type="text/javascript">
    $(function() {
        loadData();
        validateForm();

    });

    function loadData() {
        var url = "${ctx }/bussiness/rUsersEntity/page";
        $('#tablepager').bootstrapTable({
            url: url,
            dataType: "json",
            pagination: true, //分页
            singleSelect: true,//只能选择一行
            clickToSelect: true,
            search: false, //显示搜索框
            sidePagination: "server", //服务端处理分
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20, 50, 100],
            queryParams:function(params){
                var par={"uid":$("#searchuid").val(),"uname":$("#searchuname").val(),"upwd":$("#searchupwd").val(),"phone":$("#searchphone").val(),"email":$("#searchemail").val(),"truename":$("#searchtruename").val(),"sex":$("#searchsex").val(),"address":$("#searchaddress").val(),"image":$("#searchimage").val(),"remark":$("#searchremark").val(),};
                var p= $.extend({},params,par);
                return p;
            },
            showColumns: true,
            showRefresh: true,
            showToggle: true,
            toolbar: "#tableToolbar",
            columns: [{
                checkbox: true
            },
                    {
                        field : "uid",
                        title : "uid"
                    }
                    ,
                    {
                        field : "uname",
                        title : "uname"
                    }
                    ,
                    {
                        field : "upwd",
                        title : "upwd"
                    }
                    ,
                    {
                        field : "phone",
                        title : "phone"
                    }
                    ,
                    {
                        field : "email",
                        title : "email"
                    }
                    ,
                    {
                        field : "truename",
                        title : "truename"
                    }
                    ,
                    {
                        field : "sex",
                        title : "sex"
                    }
                    ,
                    {
                        field : "address",
                        title : "address"
                    }
                    ,
                    {
                        field : "image",
                        title : "image"
                    }
                    ,
                    {
                        field : "remark",
                        title : "remark"
                    }
            ]
        });
    }

    function searchTable(){
        $('#tablepager').bootstrapTable("refresh");
    }

    function validateForm() {
    $("#myForm").validate({
    rules: {
    },messages: {
        },
        onfocusout: function (element) {
            $(element).valid();
        }
    });
    }

    function add() {
        $('#myForm')[0].reset();
        $("#myForm").validate().resetForm();
        $("#_method").val("post");
        $("#id").val("");
        tokenSession("token", "${ctx }/common/tokenSession");
        dilogForm("添加", "${ctx }/bussiness/rUsersEntity");
    }
    function editor() {
        $('#myForm')[0].reset();
        $("#myForm").validate().resetForm();
        var row = getSingleData("tablepager");
        if (row != null) {
            dilogForm("修改", "${ctx }/bussiness/rUsersEntity/" + row.id);
            $("#_method").val("put");
            $("#id").val(row.id);

                $("#uid").val(row.uid);
                $("#uname").val(row.uname);
                $("#upwd").val(row.upwd);
                $("#phone").val(row.phone);
                $("#email").val(row.email);
                $("#truename").val(row.truename);
                $("#sex").val(row.sex);
                $("#address").val(row.address);
                $("#image").val(row.image);
                $("#remark").val(row.remark);
        } else {
            layer.msg("选择要修改的记录", {icon: 7});
        }
    }

    function deletedata(row) {
        var row = getSingleData("tablepager");
        if (row != null) {
            layer.confirm("确认删除？", {
                btn: ['确认', '取消'], //按钮
                shade: false
            }, function (index) {
                layer.close(index);
                $.ajax({
                    type: "post",
                    dataType: "json",
                    url: "${ctx }/bussiness/rUsersEntity/" + row.id,
                    data: {_method: "delete"},
                    success: function (msg) {
                        layer.msg(msg, {icon: 1});
                        $('#tablepager').bootstrapTable('refresh');
                    }
                });
            }, function () {
            });
        } else {
            layer.msg("选择要删除的记录", {icon: 7});
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
            //shadeClose: true,
            //maxmin: true,
            area: ['90%', '98%']
        });
    }

    function submitForm(url) {
        if ($("#myForm").validate().form()) {
            $.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                data: $('#myForm').serialize(),
                success: function (msg) {
                    layer.closeAll();
                    $('#tablepager').bootstrapTable('refresh');
                    layer.msg(msg, {icon: 1});
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    layer.alert(textStatus);
                }
            });
        }
    }

    function clearSearchBtn(){
        $("#searchuid").val("");
        $("#searchuname").val("");
        $("#searchupwd").val("");
        $("#searchphone").val("");
        $("#searchemail").val("");
        $("#searchtruename").val("");
        $("#searchsex").val("");
        $("#searchaddress").val("");
        $("#searchimage").val("");
        $("#searchremark").val("");
    }
</script>
</body>
</html>

</body>




