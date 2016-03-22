<html>
<head>
    <title>功能Zip包新增</title>
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
                <a href="#">功能管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>功能<#if action?? && action == 'create'>新增</#if><#if action?? && action == 'update'>编辑</#if>
                </div>
            </div>
            <div class="portlet-body form">
                <form  id="myForm"  style="margin-top: -5px;" action="${rc.contextPath}/application/function-version/save-func-version" onsubmit="return checkInfo();" class="form-horizontal " method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${functionVersion.id}"/>
                    <input type="hidden" name="functionId" value="${functionVersion.functionId}"/>

                    <div class="form-body">
                        <h2 class="form-section" id='zip_name'>功能名称：${functionName}</h2>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">zip状态
															<span class="required">
																 *
															</span>
                                    </label>

                                    <div class="col-md-9">
                                        <select name="workStatus" class="form-control" value="${functionVersion.workStatus}" required="true">
                                            <option value="usable">可用</option>
                                            <option value="unusable">不可用</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">ZIP包
                                    </label>

                                    <div class="col-md-9">
                                        <div class="input-group">
                                            <span class="btn green btn-file fileinput-button input-group-btn " id="uploadFile_clone" style="width: 180px;">
                                                <input type="hidden" id="funcZipUrl" name="funcZipUrl" value="${functionVersion.funcZipUrl}"/>
                                                <i class="icon-select_file"></i>
                                                <span class="fileinput-new">选择ZIP包</span>
                                                <input type="file" name="uploadFile" id="uploadFile" onchange="getFullPath(this,'zipLocalPath')">
                                            </span>
                                        </div>
                                        <span id="zipLocalPath" class="file-block">请选择功能使用的ZIP包.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">网络地址</label>

                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="interfaceUrl" id="interfaceUrl" value="${functionVersion.interfaceUrl}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">描述</label>

                                    <div class="col-md-9">
                                        <textarea class="form-control" style="resize:none;" rows="3" name="remark" value="${functionVersion.remark}" id="remark">${function.remark}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-3 col-md-9">
                            <button type="submit" class="btn green" id="btnSubmit">保存</button>
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
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.js"></script>
<script type="text/javascript">

    //获取上传文件的名字
    function getFullPath(obj,id){
        if(obj){
            var path=obj.value;
            var index=path.lastIndexOf("\\")+1;
            if(index>0){
                $('#'+id).html(path.substr(index));
            }else{
                $('#'+id).html(path);
            }
        }
    }
    /**
     * 检测 表单所填是否符合规则
     */
    function checkInfo(){
        if(($('#uploadFile').val()==null||$('#uploadFile').val()=='')&&($('#interfaceUrl').val()==null||$('#interfaceUrl').val()=='')){
            bootbox.alert('请上传版本。');
            return false;
        }
        return $('#myForm').valid();
    }
</script>
</content>
</html>
