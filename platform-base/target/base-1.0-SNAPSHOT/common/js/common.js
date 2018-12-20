// 返回格式为MM/dd/yyyy的当前日期
function nowDate() {
    var md = new Date();
    var year = md.getFullYear();
    var month = md.getMonth() + 1;
    if (month < 10)
        month = "0" + month;
    var day = md.getDate();
    if (day < 10)
        day = "0" + day;
    var _date = month + "/" + day + "/" + year;
    return _date;
}

// 返回格式为yyyy-MM的当前月
function nowMonth() {
    var md = new Date();
    var year = md.getFullYear();
    var month = md.getMonth() + 1;
    if (month < 10)
        month = "0" + month;
    var _month = year + "-" + month;
    return _month;
}

/**
 * 自定义时间
 *
 * @param date
 * @returns
 */
function formatDate(date, format) {
    if (!date)
        return;
    if (format == "" || format == null || format == undefined) {
        format = "MM/dd/yyyy HH:mm:ss";
    }
    switch (typeof date) {
        case "string":
            date = new Date(date.replace(/-/, "/"));
            break;
        case "number":
            date = new Date(date);
            break;
    }
    if (!date instanceof Date)
        return;
    var dict = {
        "yyyy": date.getFullYear(),
        "M": date.getMonth() + 1,
        "d": date.getDate(),
        "H": date.getHours(),
        "m": date.getMinutes(),
        "s": date.getSeconds(),
        "MM": ("" + (date.getMonth() + 101)).substr(1),
        "dd": ("" + (date.getDate() + 100)).substr(1),
        "HH": ("" + (date.getHours() + 100)).substr(1),
        "mm": ("" + (date.getMinutes() + 100)).substr(1),
        "ss": ("" + (date.getSeconds() + 100)).substr(1)
    };
    return format.replace(/(yyyy|MM?|dd?|HH?|ss?|mm?)/g, function () {
        return dict[arguments[0]];
    });
}

// *********自定义format方法
Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1, // month
        "d+": this.getDate(), // day
        "H+": this.getHours(), // hour
        "m+": this.getMinutes(), // minute
        "s+": this.getSeconds(), // second
        "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
        "S": this.getMilliseconds()
        // millisecond
    };
    if (/(y+)/.test(format))
        format = format.replace(RegExp.$1, (this.getFullYear() + "")
            .substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(format))
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
                : ("00" + o[k]).substr(("" + o[k]).length));
    return format;
};

/**
 * @param url 地址
 * @param num 上传数量
 * @param totalSize 限制上传所有文件大小
 * @param singleSize 限制上传单个文件大小
 */
function initWebuploader(url, num, totalSize, singleSize, rootPath, viewPath) {
    uploader = WebUploader.create({
        fileNumLimit: num,//上传数量限制
        fileSizeLimit: totalSize,//限制上传所有文件大小
        fileSingleSizeLimit: singleSize,//限制上传单个文件大小
        auto: true,
        // swf文件路径
        // swf: BASE_URL + '/js/Uploader.swf',
        // 文件接收服务端。
        server: url,
        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: '#picker',
        // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
        resize: false,
        accept: {// 只允许选择图片文件格式
            title: 'Images',
            extensions: 'gif,jpg,bmp,png',
            mimeTypes: 'image/*'
        },
        duplicate: true
    })
    //上传每个文件之前设置额外参数
    uploader.on("uploadStart", function () {
    });
    uploader.on("startUpload", function () {
    });
    uploader.on("uploadSuccess", function (file, response) {
        $("#imgView").attr("src", viewPath + response);
        $("#photo").val(response);
        layer.msg("上传成功");
    });
    uploader.on("uploadFinished", function () {
        //layer.msg("上传成功")
        uploader.destroy();
        initWebuploader(url, num, totalSize, singleSize, rootPath);
    });
    /**
     * 验证文件格式以及文件大小
     */
    uploader.on("error", function (type) {
        if (type == "Q_TYPE_DENIED") {
            layer.msg("请上传JPG、PNG、GIF、BMP格式文件");
        } else if (type == "Q_EXCEED_SIZE_LIMIT") {
            layer.msg("文件大小不能超过2M");
        } else {
            layer.msg("上传出错！请检查后重新上传！错误代码" + type);
        }
    });
}

/**
 * 得到下拉框
 */
function showSelect(selectId, selectedvalue, methods, optionValue, optionTest,
                    defualtOption) {
    $.ajax({
        type: "GET",
        dataType: "json",
        url: encodeURI(methods),
        success: function (data) {
            if (data.length < 1) {
                $("#" + selectId).find("option").remove();
                $("#" + selectId).append("<option value=''>无可选数据</option>");
            } else {
                $("#" + selectId).find("option").remove();
                if (defualtOption != "") {
                    $("#" + selectId).append("<option value=''>" + defualtOption + "</option>");
                } else {
                    $("#" + selectId).append("<option value=''>请选择</option>");
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
        }
    });
}

function helpView(url) {
    layer.open({
        title: "在线帮助",
        shade: 0,
        type: 2,
        area: ['40%', '30%'],
        offset: 'rb',
        fixed: false, //不固定
        maxmin: false,
        content: url
    });
}

//加载动画
function hx_loading() {
    return layer.open({
        type: 1,
        title: false,
        closeBtn: false,
        area: '300px;',
        shade: [0.1,'#00000000'],
        id: 'LAY_layuipro', //设定一个id，防止重复弹出
        moveType: 1, //拖拽模式，0或者1
        content: '<div id="notice"style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+
        '<div class="sk-spinner sk-spinner-wave" style="width: 100px">'+
        '<h4>数据处理中...</h4> </div>'+
        '<div class="sk-spinner sk-spinner-wave">'+
        '<div class="sk-rect1"></div>'+
        '<div class="sk-rect2"></div>'+
        '<div class="sk-rect3"></div>'+
        '<div class="sk-rect4"></div>'+
        '<div class="sk-rect5"></div>'+
        '</div> </div>'
    });
}