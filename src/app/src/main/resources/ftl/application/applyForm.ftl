<html>
<head>
    <title>应用新增/编辑</title>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet"/>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet"/>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.css">
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/css/style.css"/>
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
                <a href="${rc.contextPath}/application/list">应用清单</a>
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
                    <i class="fa fa-gift"></i>应用<#if action?? && action == 'create'>新增</#if><#if action?? && action == 'update'>编辑</#if>
                </div>
            </div>
            <div class="portlet-body form">
                <form id="myForm" action="${rc.contextPath}/application/list/${action}"  class="form-horizontal" method="POST" enctype="multipart/form-data">
                    <input type="hidden" id ="id" name="id" value="${knAppInfo.id}"/>
                    <input type="hidden" name="icon" id="icon" value="${knAppInfo.icon}"/>
                    <input type="hidden" name="apiKey"  value="${knAppInfo.apiKey}"/>
                    <input type="hidden" name="downLoadUrl"  value="${knAppInfo.downLoadUrl}"/>
                    <div class="form-body">
                        <h3 class="form-section">基本信息</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">应用名称<span class="required">
											 *
										</span></label>

                                    <div class="col-md-10">
                                        <input type="text" class="form-control" placeholder="应用名称" name="title" required="true" value="${knAppInfo.title}" maxlength="50">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">英文名称</label>

                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="enTitle" value="${knAppInfo.enTitle}" maxlength="50">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">应用状态<span class="required">
											 *
										</span></label>

                                    <div class="col-md-10">
                                        <select name="workStatus" class="form-control" id="workStatus" value="${knAppInfo.workStatus}">
                                            <option value="usable">可用</option>
                                            <option value="company">企业</option>
                                            <option value="unusable">不可用</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">所属企业</label>

                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="forFirm" value="${knAppInfo.forFirm}" maxlength="50">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">应用描述</label>

                                    <div class="col-md-10">
                                        <textarea class="form-control" style="resize:none;" rows="3" id="remark" name="remark">${knAppInfo.remark}</textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-2">应用图标</label>

                                    <div class="col-md-6">
                                        <div class="col-md-7" style="vertical-align: middle; height: 74px; line-height: 74px;">
                                            <span class="btn green btn-file" id="uploadFile_clone1">
                                                <i class="fa fa-search"></i>
                                                <span class="fileinput-new">
                                                      选择图标文件
                                                </span>
                                             <input type="file" name="files" id="files" onchange="javascript:setImagePreview('files' ,'showIcon' ,'localImag' ,'74px' ,'74px' ,'74px' ,'74px')">
                                            </span>
                                        </div>
                                        <div class="col-md-5">
                                            <div id="localImag">
                                                <img src="${rc.contextPath}${knAppInfo.icon}" width="74px" height="74px" id="showIcon" name="showIcon"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h3 class="form-section">其它信息</h3>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-2">下载地址</label>

                                    <div id="downLoadUrl">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-2">APP Key</label>

                                    <div id="apiKey">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-2">创建时间</label>

                                    <div id="createTime">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-2">更新时间</label>

                                    <div id="updateTime">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-3 col-md-9">
                            <button type="submit" class="btn green">保存</button>
                            <button type="button" class="btn default" onclick="javascript:window.location.href='${rc.contextPath}/application/list';">取消</button>
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
         *  实时上传应用图标文件
         * */
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
        /**
         * 设置 应用回填信息
         */
        jQuery(function($){
            <#if  action =='update'>
            var stats="${knAppInfo.workStatus}",   downLoadUrl= "${knAppInfo.downLoadUrl}",createTime = "${knAppInfo.createTime}",updateTime= "${knAppInfo.updateTime}";
            if(null==stats||''==stats){
                stats='unusable';
            }
            $("#workStatus option[value="+stats+"]").attr('selected','true');
            $('#apiKey').html("${knAppInfo.apiKey}");
            $('#apiKey').addClass("hiddenDiv");
            if(downLoadUrl && downLoadUrl.length){
                var a = getURL('${rc.contextPath}')+ downLoadUrl,b,c;
                downLoadUrl = factorial(a,70);
                b = downLoadUrl,c = '<span class="leftSize_d"><a href='+a+' >'+b+'</a></span>';;
                $('#downLoadUrl').html(c);
                $('#downLoadUrl').addClass("hiddenDiv");
            }
            if(createTime && createTime.length){
                $('#createTime').html(new Date(Number(createTime)).format('yyyy-MM-dd hh:mm'));
                $('#createTime').addClass("hiddenDiv");
            }
            if(updateTime && updateTime.length){
                $('#updateTime').html(new Date(Number(updateTime)).format('yyyy-MM-dd hh:mm'));
                $('#updateTime').addClass("hiddenDiv");
            }
            </#if>
        });

        var form=$('#myForm'), error=$('.alert-danger',form),id=$('#id').val();
        if(null ==id ||''==id){id=0;}
        form.validate({
            errorElement:'span',
            errorClass:'help-block help-block-error',
            focusInvalid:true,
            messages:{
                title:{remote:"应用名称已经存在,请修改"}
            },
            rules:{
                title:{
                    required:true,
                    remote:'${rc.contextPath}/application/list/check-name?id='+id
                }
            },
            invalidHandler:function(event,validator){
                error.show();
                Metronic.scrollTo(error,-200);
            },
            highlight:function(element){
                $(element).closest('.form-group').addClass('has-error');
            },
            unhighlight:function(element){
                $(element).closest('.form-group').removeClass('has-error');
            },
            success:function(label){
                label.closest('.form-group').removeClass('has-error');
            },
            submitHandler:function(form){
                error.hide();
                form.submit();
            }
        });
    </script>
</content>
</html>
