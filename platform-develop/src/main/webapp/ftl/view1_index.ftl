<!DOCTYPE html>
<%@ page language="java" pageEncoding="utf-8"%>
<html>
<head>
    <%@ include file="/common/title.jsp" %>
<#if havcheckbox == "1">
    <link href="<#noparse>${ctx }</#noparse>/common/h5/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
</#if>
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
                                <#list searchList as entity>
                                    <label class="col-sm-2 control-label">${entity.fieldNameU}</label>
                                    <div class="col-sm-2">
                                        <input type="text" id="search${entity.fieldName}" placeholder="请输入参数名称"
                                               class="form-control">
                                    </div>
                                    <#if (entity_index+1)%3 ==0>
                                    </div>
                                    <div class="form-group">
                                    </#if>
                                </#list>
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
	<#list allList as entity>
		<#if entity.hiddenWhether == "true">
            <input type="hidden" id="${entity.fieldName}" name="${entity.fieldName}">
		</#if>
	</#list>
        <div class="col-md-12">
		<#list allList as entity>
			<#if entity.hiddenWhether == "false">
				<#if entity.formType == "text"||entity.formType == "number">
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">${entity.fieldNameU}
							<#if entity.mustWrite == "true">
                                (<span class="text-danger">*</span>)
							</#if>
                            :</label>
                        <div class="col-sm-6">
                            <input type="text" id="${entity.fieldName}" name="${entity.fieldName}" class="form-control" placeholder="${entity.fieldNameU}">
                        </div>
                    </div>
				</#if>
				<#if entity.formType == "booleanselect">
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">${entity.fieldNameU}<#if entity.mustWrite == "true">
                            (<span class="text-danger">*</span>)
						</#if>:</label>
                        <div class="col-sm-6">
                            <div class="radio radio-info radio-inline">
                                <input type="radio" id="${entity.fieldName}1" value="true" name="${entity.fieldName}" checked="checked">
                                <label for="${entity.fieldName}1">true</label>
                            </div>
                            <div class="radio radio-info radio-inline">
                                <input type="radio" id="${entity.fieldName}2" value="false" name="${entity.fieldName}">
                                <label for="${entity.fieldName}2">false</label>
                            </div>
                        </div>
                    </div>
				</#if>
				<#if entity.formType == "wjselect">
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">${entity.fieldNameU}<#if entity.mustWrite == "true">
                            (<span class="text-danger">*</span>)
						</#if>:</label>
                        <div class="col-sm-6">
                            <select class="form-control" name="${entity.fieldName}.id" id="${entity.fieldName}">
                            </select>
                        </div>
                    </div>
				</#if>
				<#if entity.formType == "date">
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">${entity.fieldNameU}<#if entity.mustWrite == "true">
                            (<span class="text-danger">*</span>)
						</#if>:</label>
                        <div class="col-sm-6">
                            <input type="text" id="${entity.fieldName}" name="${entity.fieldName}" class="form-control layer-date"
                                   placeholder="${entity.fieldNameU}"
                                   onclick="laydate({istime: true, format: 'YYYY-MM-DD',choose:checkDate})">
                        </div>
                    </div>
				</#if>
				<#if entity.formType == "time">
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">${entity.fieldNameU}<#if entity.mustWrite == "true">
                            (<span class="text-danger">*</span>)
						</#if>:</label>
                        <div class="col-sm-6">
                            <input type="text" id="${entity.fieldName}" name="${entity.fieldName}" class="form-control layer-date"
                                   placeholder="${entity.fieldNameU}"
                                   onclick="laydate({istime: true, format: 'hh:mm',choose:checkDate})">
                        </div>
                    </div>
				</#if>
				<#if entity.formType == "textarea">
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">${entity.fieldNameU}<#if entity.mustWrite == "true">
                            (<span class="text-danger">*</span>)
						</#if>:</label>
                        <div class="col-sm-6">
                            <textarea type="text" id="${entity.fieldName}" name="${entity.fieldName}" class="form-control" placeholder="${entity.fieldNameU}"></textarea>
                        </div>
                    </div>
				</#if>
			</#if>
		</#list>
        </div>
    </form>
</div>
<%@ include file="/common/commonjs.jsp" %>
<#if havdate == "1">
<script type="text/javascript" src="<#noparse>${ctx }</#noparse>/common/h5/js/plugins/layer/laydate/laydate.js"></script>
</#if>
<#if haveWaijian==true>
<script src="<#noparse>${ctx }</#noparse>/common/js/common.js"></script>
</#if>
<script type="text/javascript">
    $(function() {
        loadData();
        validateForm();
	<#list listList as entity>
		<#if entity.formType == "wjselect">
            alert("请修改外键数据源"+${entity.fieldName});
            showSelect('${entity.fieldName}', '', '<#noparse>${ctx }</#noparse>/platform/dept/deptList', 'id', 'name', '');
		</#if>
	</#list>

    });

    function loadData() {
        var url = "<#noparse>${ctx }</#noparse>/${moduleType}/${classNameL}/<#if sortFlag==false>page</#if><#if sortFlag==true>pageSort</#if>";
        $('#tablepager').bootstrapTable({
            url: url,
            dataType: "json",
            pagination: true, //分页
            singleSelect: true,//只能选择一行
            clickToSelect: true,
            search: false, //显示搜索框
            sidePagination: "server", //服务端处理分
		<#if sortFlag==true>
            sortable: true, //是否启用排序
            sortName: "${sort}",
            sortOrder: "asc",
		</#if>
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20, 50, 100],
            queryParams:function(params){
                var par={<#list searchList as entity><#if entity.formType == "wjselect">"${entity.fieldName}.id":$("#search${entity.fieldName}").val(),<#else>"${entity.fieldName}":$("#search${entity.fieldName}").val(),</#if></#list>};
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
			<#list listList as entity>
				<#if entity.formType == "text"||entity.formType == "number"||entity.formType == "datetime"||entity.formType == "time"||entity.formType == "date"||entity.formType == "textarea">
                    {
                        field : "${entity.fieldName}",
                        title : "${entity.fieldNameU}"
						<#if entity.sortWhether == "true">
                            ,
                            sortable: true
						</#if>
                    }
				</#if>
				<#if entity.formType == "booleanselect">
                    {
                        field : "${entity.fieldName}",
                        title : "${entity.fieldNameU}",
                        formatter: function (value, row) {
                            if (1 == value) {
                                return '<span class="label label-primary">true</span>';
                            } else if (0 == value) {
                                return '<span class="label label-danger">false</span>';
                            }
                        }
                    }
				</#if>
				<#if entity.formType == "wjselect">
                    {
                        field : "${entity.fieldName}",
                        title : "${entity.fieldNameU}",
                        formatter: function (value, row) {
                            if (row != null) {
                                return row.${entity.fieldName}.id;
                            }
                        }
                    }
				</#if>
				<#if entity_has_next>
                    ,
				</#if>
			</#list>
            ]
        });
    }

    function searchTable(){
        $('#tablepager').bootstrapTable("refresh");
    }

    function validateForm() {
    $("#myForm").validate({
    rules: {
	<#list allList as entity>
		<#if entity.mustWrite == "true"||entity.validateType!="0">
			<#if entity.mustWrite == "true"&&entity.validateType=="0">
				<#if entity.formType == "wjselect">
                    '${entity.fieldName}.id': "required",
				</#if>
				<#if entity.formType != "wjselect">
				${entity.fieldName}: "required",
				</#if>
			<#elseif entity.mustWrite == "true"&&entity.validateType!="0">
			${entity.fieldName}: {
                required: true,
			${entity.validateType}:true
            },
			<#else >
			${entity.fieldName}: {
			${entity.validateType}:true
            },
			</#if>
		</#if>
	</#list>
    },messages: {
		<#list listList as entity>
			<#if entity.mustWrite == "true"||entity.validateType!="0">
				<#if entity.mustWrite == "true"&&entity.validateType=="0">
					<#if entity.formType == "wjselect">
                        '${entity.fieldName}.id': "请选择${entity.fieldNameU}",
					</#if>
					<#if entity.formType != "wjselect">
					${entity.fieldName}: "请输入${entity.fieldNameU}",
					</#if>
				<#elseif entity.mustWrite == "true"&&entity.validateType!="0">
				${entity.fieldName}: {
                    required: "请输入${entity.fieldNameU}",
				${entity.validateType}:"请输入正确的${entity.fieldNameU}"
                },
				<#else >
				${entity.fieldName}: {
				${entity.validateType}:"请输入正确的${entity.fieldNameU}"
                },
				</#if>
			</#if>
		</#list>
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
        tokenSession("token", "<#noparse>${ctx }</#noparse>/common/tokenSession");
        dilogForm("添加", "<#noparse>${ctx }</#noparse>/${moduleType}/${classNameL}");
    }
    function editor() {
        $('#myForm')[0].reset();
        $("#myForm").validate().resetForm();
        var row = getSingleData("tablepager");
        if (row != null) {
            dilogForm("修改", "<#noparse>${ctx }</#noparse>/${moduleType}/${classNameL}/" + row.id);
            $("#_method").val("put");
            $("#id").val(row.id);

		<#list allList as entity>
			<#if entity.formType == "text"||entity.formType == "number"||entity.formType == "datetime"||entity.formType == "time"||entity.formType == "date"||entity.formType == "textarea">
                $("#${entity.fieldName}").val(row.${entity.fieldName});
			</#if>
			<#if entity.formType == "booleanselect">
                if (row.${entity.fieldName} == 1) {
                    $("#${entity.fieldName}1").prop("checked", "checked");
                } else {
                    $("#${entity.fieldName}2").prop("checked", "checked");
                }
			</#if>
			<#if entity.formType == "wjselect">
                $("#${entity.fieldName}").val(row.${entity.fieldName}.id);
			</#if>
		</#list>
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
                    url: "<#noparse>${ctx }</#noparse>/${moduleType}/${classNameL}/" + row.id,
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
    <#list searchList as entity>
        $("#search${entity.fieldName}").val("");
    </#list>
    }
</script>
</body>
</html>

</body>




