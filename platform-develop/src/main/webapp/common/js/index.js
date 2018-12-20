function fnc() {
    $("#viewSelect").html('/' + $("#moduleType").val());
}
$(document).ready(function () {
    $("#gform").bind("submit", function () {
        var txt_moduleName = $("#moduleName").val();
        var txt_packageName = $("#packageName").val();
        var txt_className = $("#className").val();

        $("#moduleNameLabel").text("")
        $("#packageNameLabel").text("")
        $("#classNameLabel").text("")

        var isSuccess = 1;
        if (txt_moduleName.length == 0) {
            $("#moduleNameLabel").text("视图路径不能为空！")
            $("#moduleNameLabel").css({"color": "red"});
            isSuccess = 0;
        }
        if (txt_packageName.length == 0) {
            $("#packageNameLabel").text("包路径名称不能为空！")
            $("#packageNameLabel").css({"color": "red"});
            isSuccess = 0;
        }
        if (txt_className.length == 0) {
            $("#classNameLabel").text("实体类名不能为空！")
            $("#classNameLabel").css({"color": "red"});
            isSuccess = 0;
        }
        if (isSuccess == 0) {
            return false;
        }
    })
})