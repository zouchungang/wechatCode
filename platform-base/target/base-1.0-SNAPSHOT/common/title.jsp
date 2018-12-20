<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    response.setHeader("P3P", "CP=CAO PSA OUR");
%>
<link href="${staticCtx }/common/h5/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="${staticCtx }/common/h5/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="${staticCtx }/common/h5/css/animate.min.css" rel="stylesheet">
<link href="${staticCtx }/common/h5/css/plugins/chosen/chosen.css" rel="stylesheet">
<link href="${staticCtx }/common/h5/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<link href="${staticCtx }/common/h5/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">

<script type="text/javascript">
    var ctx = '${ctx}';
    var staticCtx = '${staticCtx}';
</script>