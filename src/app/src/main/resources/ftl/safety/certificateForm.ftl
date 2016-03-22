<html>
<head>
    <title>证书新增/编辑</title>
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
                <a href="${rc.contextPath}/">安全管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="${rc.contextPath}/safety/certificate">证书管理</a>
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
                    <i class="fa fa-gift"></i>证书<#if action?? && action == 'add'>新增</#if><#if action?? && action == 'update'>编辑</#if>
                </div>
            </div>
            <div class="portlet-body form">
                <form id="myForm" action="${rc.contextPath}/safety/certificate/save-edit" onsubmit="return checkInfo();" class="form-horizontal" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${certificate.id}"/>
                    <input type="hidden" name="action" value="${action}"/>

                    <div class="form-body">
                        <h3 class="form-section">基本信息</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">应用名称
															<span class="required">
																 *
															</span>
                                    </label>

                                    <div class="col-md-9">
                                        <select name="apid" class="form-control" required="true" >
                                            <option value="">请选择</option>
                                        <#list list as m>
                                            <#if  m.title==certificate.applicationInfo.title>
                                                <option value='${m.id}' selected='selected'>${m.title}</option>
                                            <#else>
                                                <option value='${m.id}'>${m.title}</option>
                                            </#if>
                                        </#list>

                                        </select>
                                                                 <span class="help-block">
																	 证书所属的应用
																</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label class="control-label col-md-3">证书状态<span class="required">*</span></label>

                                    <div class="col-md-9">
                                        <select name="workStatus" class="form-control" required="true" >
                                        <#list workStatus as m>
                                            <#if m.name() == certificate.workStatus>
                                                <option value='${m.name()}' selected='selected'>${m.getTypeName()}</option>
                                            <#elseif  m.name() == 'usable' || m.name() == 'unusable'>
                                                <option value='${m.name()}'>${m.getTypeName()}</option>
                                            </#if>
                                        </#list>

                                        </select>
                                        <span class="help-block">
                                             证书的状态
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">平台类型<span class="required">*</span>
                                    </label>

                                    <div class="col-md-9">
                                        <select name="platformType" class="form-control" required="true" >
                                        <#list platformType as m>
                                            <#if m.name() == certificate.platformType>
                                                <option value='${m.name()}' selected='selected'>${m.getM_type()}</option>
                                            <#else>
                                                <option value='${m.name()}'>${m.getM_type()}</option>
                                            </#if>
                                        </#list>
                                        </select>
                                        <span class="help-block">
                                             平台的类型
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label class="control-label col-md-3">证书密码<span class="required">*</span>
                                    </label>

                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="certificatePwd" id="certificatePwd" value="${certificate.certificatePwd}" required="true" >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">证书文件
                                    </label>

                                    <div class="col-md-9">
                                        <div class="form-group">
                                            <span class="btn green btn-file fileinput-button input-group-btn" style="width: 180px;">
                                                <span>选择证书文件</span>
                                                <input type="file" name="uploadFile" id="uploadFile" onchange="getFullPath(this,'functionLocalPath');">
                                            </span>
                                        </div>
                                        <span id="functionLocalPath" class="file-block"><#if loadpath??>${cerpath}</#if><#if loadpath == null>请选择证书文件.</#if></span>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <h3 class="form-section">其它信息</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">证书地址
                                    </label>

                                    <div class="col-md-9">
                                    <#if loadpath?? && loadpath != null><a href="../../../${loadpath}">${cerpath}</a></#if>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-3 col-md-9">
                            <button type="submit" class="btn green">保存</button>
                            <button type="button" class="btn default" onclick="javascript:window.location.href='${rc.contextPath}/safety/certificate';">取消</button>
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

        function getFullPath(obj,id)
        {
            if(obj)
            {
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
            return $('#myForm').valid();
        }
    </script>
</content>
</html>
