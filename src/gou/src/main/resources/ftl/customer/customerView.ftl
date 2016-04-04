<html>
<head>
    <title>会员编辑</title>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet"/>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet"/>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.css">
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>

    <style>
    </style>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="${rc.contextPath}/">驾驶舱</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="${rc.contextPath}/news/article">会员管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">会员查看</a>
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>查看会员
                </div>
            </div>

            <div class="portlet-body form">
                <form class="form-horizontal form-bordered" >
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-2 control-label">账号</label>

                            <div class="col-md-4">
                                <div class="input-group">
                                    ${customer.loginName}

                                </div>
                            </div>

                            <label class="col-md-2 control-label">姓名</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    ${customer.userName}
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label">昵称</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    ${customer.nickName}
                                </div>
                            </div>

                            <label class="col-md-2 control-label">性别</label>
                            <div class="col-md-4">
                                    ${customer.sex}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">手机号码</label>

                            <div class="col-md-4">
                                <div class="input-group">
                                    ${customer.phone}
                                </div>
                            </div>

                            <label class="col-md-2 control-label">邮箱</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    ${customer.email}
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">积分</label>

                            <div class="col-md-4">
                                <div class="input-group">
                                    ${customer.integral}
                                </div>
                            </div>
                        </div>



                        <div class="form-group">
                            <label class="col-md-2 control-label">积分</label>

                            <div class="col-md-4">
                                <div class="input-group">
                                ${customer.integral}
                                </div>
                            </div>
                        </div>
                </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-5 col-md-6">
                            <button type="button" id="cancelBtn" class="btn default" data-dismiss="modal" onclick="javascript:window.location.href='${rc
                            .contextPath}/customer'">
                                返回
                            </button>
                        </div>
                    </div>
                    </form>
            </div>
        </div>
    </div>
</div>
</body>
<content tag="script">
    <script src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>

</content>
</html>
