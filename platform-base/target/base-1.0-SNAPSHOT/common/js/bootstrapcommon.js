/**
 *
 * @param tableid 表格id
 * @returns 如果不是选择一行或者没有选择都返回null
 */
function getSingleData(tableid) {
    var row = null;
    var rows = $('#' + tableid).bootstrapTable('getSelections');
    if (rows.length == 1) {
        row = rows[0]
    }
    return row;
}
/**
 * 得到下拉框
 * selectId html（select）id
 * selectedvalue 定位到传入的 option的 value值
 * methods执行的方法（action）
 * optionValue option中value的值;
 * optionTest option中显示的值;
 */
function showMySelect(selectId, selectedvalue, methods, optionValue, optionTest,
                      defualtOption) {
    //alert(selectId);
    var index = methods.indexOf("?");
    var parameterPlace = "?";
    if (index > 0) {
        parameterPlace = "&";
    }
    $.ajax({
        type: "POST",
        dataType: "json",
        url: encodeURI(methods + parameterPlace + "nowdate=" + new Date()),
        success: function (data) {
            $("#" + selectId).find("option").remove();
            $("#" + selectId).append("<option value=''>请选择</option>");
            if (defualtOption != null && defualtOption != '') {
                var optfirst = "<option value=''>请选择</option>";
                $("#" + selectId).append(optfirst);
            }
            $.each(data, function (i, n) {
                var opt = "";
                if (selectedvalue == n[optionValue]) {
                    opt = "<option value='" + n[optionValue] + "' selected>"
                        + n[optionTest] + "</option>";
                } else {
                    opt = "<option value='" + n[optionValue] + "'>"
                        + n[optionTest], +"</option>";
                }

                $("#" + selectId).append(opt);
            });
        }
    });
}
/**
 *
 * @param deleteMethod
 * @param id
 */
function singleDelete(deleteMethod, id) {
    $.ajax({
        type: "POST",
        dataType: "text",
        url: deleteMethod,
        data: {
            "id": id
        },
        success: function (data) {
            promptMsg(data);
        }
    });
}
function multiDelete(deleteMethod, ids) {
    $.ajax({
        type: "POST",
        dataType: "text",
        url: deleteMethod,
        data: {
            "ids": ids.join(",")
        },
        success: function (data) {
            promptMsg(data);
        }
    });

}
/**
 *
 * @param msg
 */
function promptMsg(msg) {
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "onclick": null,
        "showDuration": "400",
        "hideDuration": "1000",
        "timeOut": "7000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
    toastr.success(msg, "提示");
}
/**
 *
 * @param tokenId
 * @param url
 */
function tokenSession(tokenId, url) {
    $.ajax({
        type: "get",
        async: false,
        dataType: "json",
        url: url,
        success: function (data) {
            $("#" + tokenId).val(data);
        }
    });
}
/**
 * 判断是否登录，没登录刷新当前页，促使Shiro拦截后跳转登录页
 * @param result    ajax请求返回的值
 * @returns {如果没登录，刷新当前页}
 */
function isLogin(result) {
    if (result && result.httpStatCode && result.httpStatCode == 300) {
        layer.confirm('Session过期，请重新登录？', {
            btn: ['确定']
        }, function () {
            window.location.reload(true);//刷新当前页
        });
        return false;
    }
    return !0;//返回true
}