<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<%@include file="/common/title.jsp" %>
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/common/css/sys.css">
</head>
<body>
<form id="gform" name="gform" action="${pageContext.request.contextPath}/entity">
    <table>
        <tr>
            <td colspan="3" style="text-align: center">
                <h1>生成器首页</h1> <em style="color: red">${error}</em>

            </td>
        </tr>
        <tr>
            <td style="text-align: center" width="10%">
                view path<br>(视图路径)：
            </td>
            <td>
                <input type="text" name="moduleName" id="moduleName"><em id="moduleNameLabel"></em>
            </td>
            <td>
                生成jsp的目录(<em color="red">全部小写</em>)<br>
                jsp文件路径为WEB-INF/view 格式：platform/notic
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                Java source path<br>(java源码路径【action,service,dao】)
            </td>
            <td>
                <input type="text" name="packageName" id="packageName"><em id="packageNameLabel"></em>
            </td>
            <td>
                格式：com.uticket.product<br>【模块的包路径】
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                实体类名：
            </td>
            <td>
                <input type="text" name="className" id="className"><em id="classNameLabel"></em>
            </td>
            <td>
                格式：H05product<br>【实体类固定放入到develop项目的waiting目录下】
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                Controller Root Path<br>(模块根路径)
            </td>
            <td>
                <select name="moduleType" onchange="fnc()" id="moduleType">
                    <option value="system" selected>系统管理(system)</option>
                    <option value="platform">平台(platform)</option>
                    <option value="supplier">供应商(supplier)</option>
                    <option value="distribution">分销商(distribution)</option>
                    <option value="facilitiesinfo">设施信息(facilitiesinfo)</option>
                    <option value="ticket">票务(ticket)</option>
                    <option value="bussiness">业务信息(bussiness)</option>
                </select>
                <em id="viewSelect">/system</em>
            </td>
            <td>
                格式：H05product
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                功能描述：
            </td>
            <td>
                <textarea name="moduleMemo" style="width: 300px;height: 100px"></textarea>
            </td>
            <td>
                格式：系统管理<br>【统一注释】
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <button type="submit">
                    提交
                </button>
            </td>
        </tr>
    </table>
</form>
<hr>
<table>
    <tr>
        <td colspan="2" style="text-align: center">
            <h1>生成文件存放路径(<em style="color: red">提交前请确认路径是否正确</em>)</h1>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            源码根路径：
        </td>
        <td id="srcDirView">
            ${srcDir}
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            视图根路径：
        </td>
        <td>
            ${viewDir}
        </td>
    </tr>
</table>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/js/index.js"></script>
</body>
</html>