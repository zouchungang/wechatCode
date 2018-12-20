<!DOCTYPE html>
<%@ page language="java" pageEncoding="utf-8" %>
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
										<label class="col-sm-2 control-label">标题</label>
										<div class="col-sm-2">
											<input type="text" id="searchtitle" placeholder="请输入参数名称"
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
				<button type="button" class="btn  btn-xm btn-primary" onclick="editor()">
					<i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>查看
				</button>
				<button type="button" class="btn  btn-xm btn-primary" onclick="deletedata()">
					<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
				</button>
			</p>
			<div class="ibox-content">
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
				<label class="col-sm-2 control-label">uid:</label>
				<div class="col-sm-6">
					<select class="form-control" name="uid.id" id="uid">
					</select>
				</div>
			</div>
			<div class="hr-line-dashed"></div>
			<div class="form-group">
				<label class="col-sm-2 control-label">hid:</label>
				<div class="col-sm-6">
					<select class="form-control" name="hid.id" id="hid">
					</select>
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
				<label class="col-sm-2 control-label">aid
					:</label>
				<div class="col-sm-6">
					<input type="text" id="aid" name="aid" class="form-control" placeholder="aid">
				</div>
			</div>
			<div class="hr-line-dashed"></div>
			<div class="form-group">
				<label class="col-sm-2 control-label">acreage
					:</label>
				<div class="col-sm-6">
					<input type="text" id="acreage" name="acreage" class="form-control" placeholder="acreage">
				</div>
			</div>
			<div class="hr-line-dashed"></div>
			<div class="form-group">
				<label class="col-sm-2 control-label">title
					:</label>
				<div class="col-sm-6">
					<input type="text" id="title" name="title" class="form-control" placeholder="title">
				</div>
			</div>
			<div class="hr-line-dashed"></div>
			<div class="form-group">
				<label class="col-sm-2 control-label">pirce
					:</label>
				<div class="col-sm-6">
					<input type="text" id="pirce" name="pirce" class="form-control" placeholder="pirce">
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
				<label class="col-sm-2 control-label">esthment
					:</label>
				<div class="col-sm-6">
					<input type="text" id="esthment" name="esthment" class="form-control" placeholder="esthment">
				</div>
			</div>
			<div class="hr-line-dashed"></div>
			<div class="form-group">
				<label class="col-sm-2 control-label">img
					:</label>
				<div class="col-sm-6">
					<input type="text" id="img" name="img" class="form-control" placeholder="img">
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
		</div>
	</form>
</div>
<%@ include file="/common/commonjs.jsp" %>
<script src="${ctx }/common/js/common.js"></script>
<script type="text/javascript">
	$(function () {
		loadData();
		validateForm();
		alert("请修改外键数据源" + uid);
		showSelect('uid', '', '${ctx }/platform/dept/deptList', 'id', 'name', '');
		alert("请修改外键数据源" + hid);
		showSelect('hid', '', '${ctx }/platform/dept/deptList', 'id', 'name', '');

	});

	function loadData() {
		var url = "${ctx }/bussiness/rLeaseroomEntity/pageSort";
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
			queryParams: function (params) {
				var par = {
					"title": $("#searchtitle").val()
				};
				var p = $.extend({}, params, par);
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
					title: "序号",
					field: "dataSort",
					sortable: true,
					width: 10
				}
				,
				{
					field: "time",
					title: "发布时间"
					,
					sortable: true
				}
				,
				{
					field: "title",
					title: "标题"
				}
				,
				{
					field: "state",
					title: "状态"
				}
				,
				{
					field: "operate",
					title: "操作"
				}
			]
		});
	}

	function searchTable() {
		$('#tablepager').bootstrapTable("refresh");
	}

	function validateForm() {
		$("#myForm").validate({
			rules: {}, messages: {},
			onfocusout: function (element) {
				$(element).valid();
			}
		});
	}

	function editor() {
		$('#myForm')[0].reset();
		$("#myForm").validate().resetForm();
		var row = getSingleData("tablepager");
		if (row != null) {
			dilogForm("修改", "${ctx }/bussiness/rLeaseroomEntity/" + row.id);
			$("#_method").val("put");
			$("#id").val(row.id);

			$("#id").val(row.id);
			$("#uid").val(row.uid.id);
			$("#hid").val(row.hid.id);
			$("#address").val(row.address);
			$("#aid").val(row.aid);
			$("#time").val(row.time);
			$("#acreage").val(row.acreage);
			$("#title").val(row.title);
			$("#pirce").val(row.pirce);
			$("#chamber").val(row.chamber);
			$("#hall").val(row.hall);
			$("#toilet").val(row.toilet);
			$("#esthment").val(row.esthment);
			$("#img").val(row.img);
			$("#remark").val(row.remark);
			$("#state").val(row.state);
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
					url: "${ctx }/bussiness/rLeaseroomEntity/" + row.id,
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

	function clearSearchBtn() {
		$("#searchid").val("");
		$("#searchuid").val("");
		$("#searchhid").val("");
		$("#searchaddress").val("");
		$("#searchaid").val("");
		$("#searchtime").val("");
		$("#searchacreage").val("");
		$("#searchtitle").val("");
		$("#searchpirce").val("");
		$("#searchchamber").val("");
		$("#searchhall").val("");
		$("#searchtoilet").val("");
		$("#searchesthment").val("");
		$("#searchimg").val("");
		$("#searchremark").val("");
		$("#searchstate").val("");
	}
</script>
</body>
</html>

</body>




