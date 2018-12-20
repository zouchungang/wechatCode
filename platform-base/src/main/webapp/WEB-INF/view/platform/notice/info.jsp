<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>通知公告</title>
    <%@ include file="/common/title.jsp" %>
    <link href="${staticCtx }/common/h5/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="${staticCtx }/common/h5/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
    <style type="text/css">
        .modal-backdrop {
            z-index: 0 !important;
            display: none;
        }
        .modal-open {
            overflow: auto !important;
        }
    </style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content  animated fadeInRight article">
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1">
            <div class="ibox">
                <div class="ibox-content">
                    <div class="pull-right">
                        <button class="btn btn-white btn-xs" type="button">${notice.ownerName}</button>
                        <button class="btn btn-white btn-xs" type="button">${notice.noticeDate}</button>
                    </div>
                    <div class="text-center article-title">
                        <h1>
                            ${notice.noticeName}
                        </h1>
                    </div>
                    <p>
                        ${notice.noticeContent}
                    </p>
                    <hr>
                </div>
            </div>
        </div>
    </div>

</div>
<%@ include file="/common/commonjs.jsp" %>
<script src="${staticCtx }/common/h5/js/plugins/layer/laydate/laydate.js"></script>
</body>
</html>
