<html>
<head>
    <title>功能新增/编辑</title>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet"/>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet"/>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.css">
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="${rc.contextPath}/">应用管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">功能管理</a>
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
                    <i class="fa fa-gift"></i>功能<#if action?? && action == 'create'>新增</#if><#if action?? && action == 'update'>编辑</#if>
                </div>
            </div>
            <div class="portlet-body form">
                <form  id="myForm"  action="${rc.contextPath}/application/function/save-func" onsubmit="return checkInfo();" class="form-horizontal " method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${function.id}"/>
                    <input type="hidden" name="content" id="content"/>
                    <input type="hidden" name="version" value="${function.version}"/>
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">功能名称
															<span class="required">
																 *
															</span>
                                    </label>

                                    <div class="col-md-9">
                                        <input type="text" class="form-control required" name="name" value="${function.name}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label class="control-label col-md-3">英文名称</label>

                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="enTitle" value="${function.enTitle}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">功能标识
                                    </label>

                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="markName" id="markName" value="${function.markName}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label class="control-label col-md-3">功能状态<span class="required">
																 *
															</span></label>

                                    <div class="col-md-9">
                                        <select id="active" name="active" class="form-control" value="${function.active}" required="true">
                                            <option value="ENABLE">可用</option>
                                            <option value="SETUPFILE">安装包</option>
                                            <option value="COMMON">公用</option>
                                            <option value="PUBLICPACKAGE">公共包</option>
                                            <option value="DISABLE">不可用</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">功能图标
                                    </label>

                                    <div class="col-md-9">
                                        <div class="input-group">
                                            <span class="btn green btn-file fileinput-button input-group-btn" style="width: 180px;">
                                                <span>选择图片文件</span><input id="files" type="file" name="files" onchange="javascript:setImagePreview('files' ,'showIcon' ,'localImag' ,'74px' ,'74px' ,'74px' ,'74px')"/>
                                                <input id="icon" class="form-control" type="hidden" name="icon" value="${function.icon}"/>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label class="control-label col-md-3" for="localImag">缩略图</label>

                                    <div class="col-md-9">
                                        <div id="localImag">
                                            <img src="${rc.contextPath}${function.icon}" width="74px" height="74px" id="showIcon" name="showIcon"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">描述</label>

                                    <div class="col-md-9">
                                        <textarea class="form-control" style="resize:none;" rows="3" name="description" value="${function.description}" id="description">${function.description}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-3 col-md-9">
                            <button type="submit" class="btn green">保存</button>
                            <button type="button" class="btn default" onclick="javascript:window.location.href='${rc.contextPath}/application/function';">取消</button>
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

        $('#myForm').fileupload({
            autoUpload:true,
            method:'POST',
            url:'${rc.contextPath}/upload-file',
            success:function(a){
                $('#icon').val(a['url']);
            }
        });
        /**
         * 检测 表单所填是否符合规则
         */
        function checkInfo(){
            return $('#myForm').valid();
        }

        jQuery(function($){
            <#if  action =='update'>
                var stats="${function.active}";
                if(null==stats||''==stats){
                    stats='DISABLE';
                }
                $("#active option[value="+stats+"]").attr('selected','true');
            </#if>
        });
    </script>
</content>
</html>
