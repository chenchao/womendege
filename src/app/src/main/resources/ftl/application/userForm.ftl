<html>
<head>
    <title>用户新增/编辑</title>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet"/>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet"/>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.css">
</head>

<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="${rc.contextPath}/">权限管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">用户管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>用户<#if action?? && action == 'create'>新增</#if><#if action?? && action == 'update'>编辑</#if>
                </div>
            </div>
            <div class="portlet-body form">
                <form id="myForm" action="${rc.contextPath}/authority/user/${action}" onsubmit="return checkInfo();" class="form-horizontal form-bordered" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${knUser.id}"/>
                    <input type="hidden" name="content" id="content"/>
                    <input type="hidden" name="imageAddress" id="imageAddress"/>

                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">登录账号<span class="required">
											 *
										</span></label>

                                    <div class="col-md-10">
                                        <input type="text" class="form-control" placeholder="登录账号" name="loginName" required="true" value="${knUser.loginName}" maxlength="15">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">登录密码<span class="required">
											 *
										</span></label>

                                    <div class="col-md-10">
                                        <input type="password" class="form-control" placeholder="登录密码" required="true" name="password" value="${knUser.password}" maxlength="15">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">用户名称<span class="required">
											 *
										</span></label>

                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="name" required="true" value="${knUser.name}" maxlength="15">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">来自系统<span class="required">
											 *
										</span></label>

                                    <div class="col-md-10">
                                        <input type="text" class="form-control" required="true" name="fromSystem" value="${knUser.fromSystem}" maxlength="15">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">用户ID</label>

                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="userId" value="${knUser.userId}" maxlength="15">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">用户类型</label>

                                    <div class="col-md-10">
                                        <input type="password" class="form-control" name="userType" value="${knUser.userType}" maxlength="15">
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">手机</label>

                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="phone" value="${knUser.phone}" maxlength="15">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">座机</label>

                                    <div class="col-md-10">
                                        <input type="password" class="form-control" name="telephone" value="${knUser.telephone}" maxlength="15">
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">邮箱</label>

                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="email" email="true" value="${knUser.email}" maxlength="30">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-2" name="info.icon" id="info.icon">用户图像</label>

                                    <div class="col-md-6">
                                        <div class="col-md-7" style="vertical-align: middle; height: 74px; line-height: 74px;">
                                            <span class="btn green btn-file" id="uploadFile_clone1" style="width: 180px;">
                                                <i class="icon-select_file"></i>
                                                <span class="fileinput-new">
                                                      选择图片文件
                                                </span>
                                             <input type="file" name="files" id="files" onchange="javascript:setImagePreview('files' ,'showIcon' ,'localImag' ,'74px' ,'74px' ,'74px' ,'74px')">
                                            </span>
                                        </div>
                                        <div class="col-md-5">
                                            <div id="localImag">
                                                <img src="${rc.contextPath}${knUser.imageAddress}" width="74px" height="74px" id="showIcon" name="showIcon"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-3 col-md-9">
                            <button type="submit" class="btn green">保存</button>
                            <button type="button" class="btn default" onclick="javascript:window.location.href='${rc.contextPath}/authority/user';">取消</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<content tag="script">
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-validate.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/lang/summernote-zh-CN.js" type="text/javascript"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.js"></script>
    <script type="text/javascript">
        /**
         *  实时上传用户图像文件
         * */
        $('#myForm').fileupload({
            autoUpload:true,
            method:'POST',
            url:'${rc.contextPath}/upload-file',
            success:function(a){
                $('#imageAddress').val(a['url']);
            }
        });
        /**
         * 检测 表单所填是否符合规则
         */
        function checkInfo(){
            return $('#myForm').valid();
        }

    </script>
</content>
</html>
