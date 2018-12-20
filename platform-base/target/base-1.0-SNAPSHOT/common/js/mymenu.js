$(function () {
    initMenu();
});
function initMenu() {
    $.ajax({
        type: "get",
        dataType: "json",
        async: false,
        url: ctx + "/platform/employeeMenu/tree",
        success: function (data) {
            var menulist = "";
            $.each(data.pathRows, function (j, o) {
                menulist += "<li><a href=\"#\"><i class=\"fa " + o.iconCss + "\"></i><span class=\"nav-label\">"
                menulist += o.menuname
                menulist += "</span><span class=\"fa arrow\"></span></a>"
                menulist += "<ul class=\"nav nav-second-level\">"
                $.each(o.children, function (i, p) {
                    menulist += "<li><a class=\"J_menuItem\" href=\"" + ctx + p.url + "\">"
                    menulist += p.menuname + "</a></li>"
                });
                menulist += "</ul>"
                menulist += "</li>";
            });
            $("#side-menu").append(menulist);
        }
    });
}
