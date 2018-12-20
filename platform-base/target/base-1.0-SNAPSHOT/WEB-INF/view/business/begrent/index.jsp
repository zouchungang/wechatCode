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
                                    <label class="col-sm-2 control-label">hid</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchhid" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    <label class="col-sm-2 control-label">aid</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchaid" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    </div>
                                    <div class="form-group">
                                    <label class="col-sm-2 control-label">chamber</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchchamber" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    <label class="col-sm-2 control-label">hall</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchhall" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    <label class="col-sm-2 control-label">toilet</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchtoilet" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    </div>
                                    <div class="form-group">
                                    <label class="col-sm-2 control-label">address</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchaddress" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    <label class="col-sm-2 control-label">minprice</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchminprice" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    <label class="col-sm-2 control-label">maxprice</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchmaxprice" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    </div>
                                    <div class="form-group">
                                    <label class="col-sm-2 control-label">minarceage</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchminarceage" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    <label class="col-sm-2 control-label">maxarceage</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchmaxarceage" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    <label class="col-sm-2 control-label">time</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchtime" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    </div>
                                    <div class="form-group">
                                    <label class="col-sm-2 control-label">remark</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchremark" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    <label class="col-sm-2 control-label">state</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchstate" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    <label class="col-sm-2 control-label">esthment</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="searchesthment" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    </div>
                                    <div class="form-group">
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
                        <label class="col-sm-2 control-label">id
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="id" name="id" class="form-control" placeholder="id">
                        </div>
                    </div>
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
                        <label class="col-sm-2 control-label">hid
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="hid" name="hid" class="form-control" placeholder="hid">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">aid
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="aid" name="aid" class="form-control" placeholder="aid">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">chamber
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="chamber" name="chamber" class="form-control" placeholder="chamber">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">hall
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="hall" name="hall" class="form-control" placeholder="hall">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">toilet
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="toilet" name="toilet" class="form-control" placeholder="toilet">
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
                        <label class="col-sm-2 control-label">minprice
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="minprice" name="minprice" class="form-control" placeholder="minprice">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">maxprice
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="maxprice" name="maxprice" class="form-control" placeholder="maxprice">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">minarceage
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="minarceage" name="minarceage" class="form-control" placeholder="minarceage">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">maxarceage
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="maxarceage" name="maxarceage" class="form-control" placeholder="maxarceage">
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
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">state
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="state" name="state" class="form-control" placeholder="state">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">esthment
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="esthment" name="esthment" class="form-control" placeholder="esthment">
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
        var url = "${ctx }/bussiness/rBegrentEntity/pageSort";
        $('#tablepager').bootstrapTable({
            url: url,
            dataType: "json",
            pagination: true, //分页
            singleSelect: true,//只能选择一行
            clickToSelect: true,
            search: false, //显示搜索框
            sidePagination: "server", //服务端处理分
            sortable: true, //是否启用排序
            sortName: "time",
            sortOrder: "asc",
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20, 50, 100],
            queryParams:function(params){
                var par={"uid":$("#searchuid").val(),"hid":$("#searchhid").val(),"aid":$("#searchaid").val(),"chamber":$("#searchchamber").val(),"hall":$("#searchhall").val(),"toilet":$("#searchtoilet").val(),"address":$("#searchaddress").val(),"minprice":$("#searchminprice").val(),"maxprice":$("#searchmaxprice").val(),"minarceage":$("#searchminarceage").val(),"maxarceage":$("#searchmaxarceage").val(),"time":$("#searchtime").val(),"remark":$("#searchremark").val(),"state":$("#searchstate").val(),"esthment":$("#searchesthment").val(),};
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
                        field : "id",
                        title : "id"
                    }
                    ,
                    {
                        field : "uid",
                        title : "uid"
                    }
                    ,
                    {
                        field : "hid",
                        title : "hid"
                    }
                    ,
                    {
                        field : "aid",
                        title : "aid"
                    }
                    ,
                    {
                        field : "chamber",
                        title : "chamber"
                    }
                    ,
                    {
                        field : "hall",
                        title : "hall"
                    }
                    ,
                    {
                        field : "toilet",
                        title : "toilet"
                    }
                    ,
                    {
                        field : "address",
                        title : "address"
                    }
                    ,
                    {
                        field : "minprice",
                        title : "minprice"
                    }
                    ,
                    {
                        field : "maxprice",
                        title : "maxprice"
                    }
                    ,
                    {
                        field : "minarceage",
                        title : "minarceage"
                    }
                    ,
                    {
                        field : "maxarceage",
                        title : "maxarceage"
                    }
                    ,
                    {
                        field : "time",
                        title : "time"
                            ,
                            sortable: true
                    }
                    ,
                    {
                        field : "remark",
                        title : "remark"
                    }
                    ,
                    {
                        field : "state",
                        title : "state"
                    }
                    ,
                    {
                        field : "esthment",
                        title : "esthment"
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
        dilogForm("添加", "${ctx }/bussiness/rBegrentEntity");
    }
    function editor() {
        $('#myForm')[0].reset();
        $("#myForm").validate().resetForm();
        var row = getSingleData("tablepager");
        if (row != null) {
            dilogForm("修改", "${ctx }/bussiness/rBegrentEntity/" + row.id);
            $("#_method").val("put");
            $("#id").val(row.id);

                $("#id").val(row.id);
                $("#uid").val(row.uid);
                $("#hid").val(row.hid);
                $("#aid").val(row.aid);
                $("#chamber").val(row.chamber);
                $("#hall").val(row.hall);
                $("#toilet").val(row.toilet);
                $("#address").val(row.address);
                $("#minprice").val(row.minprice);
                $("#maxprice").val(row.maxprice);
                $("#minarceage").val(row.minarceage);
                $("#maxarceage").val(row.maxarceage);
                $("#time").val(row.time);
                $("#remark").val(row.remark);
                $("#state").val(row.state);
                $("#esthment").val(row.esthment);
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
                    url: "${ctx }/bussiness/rBegrentEntity/" + row.id,
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
        $("#searchhid").val("");
        $("#searchaid").val("");
        $("#searchchamber").val("");
        $("#searchhall").val("");
        $("#searchtoilet").val("");
        $("#searchaddress").val("");
        $("#searchminprice").val("");
        $("#searchmaxprice").val("");
        $("#searchminarceage").val("");
        $("#searchmaxarceage").val("");
        $("#searchtime").val("");
        $("#searchremark").val("");
        $("#searchstate").val("");
        $("#searchesthment").val("");
    }
</script>
</body>
</html>

</body>




