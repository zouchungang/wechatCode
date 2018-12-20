<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<%@include file="/common/title.jsp" %>
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/common/css/sys.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/common/css/jqzoom.css">
</head>
<body>
<form:form id="entityList" action="${pageContext.request.contextPath}/generate"
           method="post">
    <table width="98%">
        <tr>
            <td colspan="10" align="right">
                <button type="submit">
                    提交
                </button>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                模块：${moduleName }
                <br>
                类：${packageName }.entity.${className }
                <input type="hidden" name="packageName" value="${packageName }">
                <input type="hidden" name="className" value="${className }">
                <input type="hidden" name="moduleName" value="${moduleName }">
                <input type="hidden" name="moduleMemo" value="${moduleMemo }">
                <input type="hidden" name="moduleType" value="${moduleType}">
            </td>
            <td colspan="5" rowspan="2">
                <div id="jqzoom" class="jqzoom">
                    <img id="imgview" alt=""
                         src="${pageContext.request.contextPath}/common/images/develop/view0.jpg"
                         jqimg="${pageContext.request.contextPath}/common/images/develop/view0.jpg"
                         style="width: 300px; height: 180px;">
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="checkbox" name="sdao" value="1" checked="checked">
                生成：Dao
                <br>
                <input type="checkbox" name="sservice" value="1" checked="checked">
                生成：Service
                <br>
                <input type="checkbox" name="scontroller" value="1"
                       checked="checked">
                生成：Controller(Action)
                <br>
            </td>
            <td colspan="3">
                <input type="checkbox" name="sjsp" value="1" checked="checked">
                生成：Jsp
                <br>
                选择生成jsp的样式:
                <select name="jsptemptype" id="jspview" onchange="viewImg()">
                    <option value="view0">
                        增删查改（无查询条件）
                    </option>
                    <option value="view1">
                        增删查改、查询条件
                    </option>
                    <option value="view2">
                        增删查改、查询条件、树
                    </option>
                </select>
            </td>

        </tr>
        <tr>
            <td width="10%">
                字段
            </td>
            <td width="10%">
                类型
            </td>
            <td width="10%">
                注释
            </td>
            <td width="10%">
                表单类型
            </td>
            <td width="%" class="tree" style="display: none">
                是否树(最多选一个)
            </td>
            <td width="10%">
                表单名称(jsp页面form用)
            </td>
            <td width="5%">
                表单内是否隐藏
            </td>
            <td width="15%">
                必填|验证类型
            </td>
            <td width="5%">
                列表显示
            </td>
            <td width="5%">
                查询条件
            </td>
            <td width="5%">
                是否排序
            </td>
        </tr>
        <c:forEach items="${returnList }" var="m" varStatus="i">
            <tr>
                <td>
                        ${m.fieldName }
                    <input type="hidden" name="fieldName" value="${m.fieldName }">
                </td>
                <td>
                        ${m.type }
                    <input type="hidden" name="type" value="${m.type }">
                </td>
                <td>
                        ${m.annoType }
                    <input type="hidden" name="annoType" value="${m.annoType }">
                </td>
                <td>
                    <select name="formType">
                        <option value="text">
                            文本输入框
                        </option>
                        <option value="booleanselect"
                                <c:if test="${ m.type == 'java.lang.Boolean'}">selected="selected"</c:if>>
                            是否/启用禁用
                        </option>
                        <option value="wjselect"
                                <c:if test="${m.annoType == 'ManyToOne' }">selected="selected"</c:if>>
                            外键下拉框
                        </option>
                        <option value="number"
                                <c:if test="${m.type == 'java.lang.Integer '}">selected="selected"</c:if>>
                            数字输入框
                        </option>
                        <option value="date">
                            日期
                        </option>
                            <%--<option value="time">--%>
                            <%--时间--%>
                            <%--</option>--%>
                        <option value="datetime">
                            日期+时间
                        </option>
                        <option value="textarea">
                            文本域（textarea）
                        </option>
                            <%--<option value="none">--%>
                            <%--不显示--%>
                            <%--</option>--%>
                    </select>
                </td>
                <td class="tree" style="display: none">
                    <select name="isTree" style="width: 60px;">
                        <option value="false">
                            否
                        </option>
                        <option value="true">
                            是
                        </option>
                    </select>
                </td>
                <td>
                    <input type="text" name="fieldNameU" value="${m.fieldName }">
                </td>
                <td><select name="fieldNameHidden" style="width: 60px;">
                    <option value="false">
                        否
                    </option>
                    <option value="true">
                        是
                    </option>
                </select></td>
                <td>
                    <select name="must">
                        <option value="false">
                            非必填
                        </option>
                        <option value="true">
                            必填
                        </option>
                    </select>
                    <select name="validatetype">
                        <option value="0">
                            无
                        </option>
                        <option value="codeValidate">
                            code验证
                        </option>
                        <option value="dataSort">
                            排序字段dataSort
                        </option>
                        <option value="number">
                            数字
                        </option>
                        <option value="digits">
                            整数
                        </option>
                        <option value="email">
                            邮箱
                        </option>
                        <option value="url">
                            url
                        </option>
                        <option value="date">
                            date
                        </option>
                    </select>
                </td>
                <td>
                    <select name="showList">
                        <option value="true">
                            显示
                        </option>
                        <option value="false">
                            不显示
                        </option>
                    </select>
                </td>
                <td>
                    <select name="showSearch">
                        <option value="false">
                            否
                        </option>
                        <option value="true">
                            是
                        </option>
                    </select>
                </td>
                <td>
                    <select name="sortSearch">
                        <option value="false">
                            否
                        </option>
                        <option value="true">
                            是
                        </option>
                    </select>
                </td>
            </tr>
        </c:forEach>
    </table>
</form:form>

<script type="text/javascript" src="${pageContext.request.contextPath}/common/js/jquery.jqzoom.js"></script>
<script type="text/javascript">
    /*使用jqzoom*/
    $(function () {
        zoomImg();
    });
    function viewImg() {
        var t = $("#jspview").val();
        var tosrc = "${pageContext.request.contextPath}/common/images/develop/" + t + ".jpg";
        $("#imgview").attr("src", tosrc);
        $("#imgview").attr("jqimg", tosrc);
        zoomImg();
        if (t == "view2") {
            $(".tree").css("display", "");
        } else {
            $(".tree").css("display", "none");
        }
    }
    function zoomImg() {
        $(".jqzoom").jqueryzoom({
            xzoom: 400, //放大图的宽度(默认是 200)
            yzoom: 400, //放大图的高度(默认是 200)
            offset: 10, //离原图的距离(默认是 10)
            position: "right", //放大图的定位(默认是 "right")
            preload: 1
        });
    }
</script>
</body>
</html>