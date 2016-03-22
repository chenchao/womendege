<html>
<head>
    <title>角色新增/编辑</title>
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
                <a href="#">角色管理</a>
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
                    <i class="fa fa-gift"></i>角色<#if action?? && action == 'create'>新增</#if><#if action?? && action == 'update'>编辑</#if>
                </div>
            </div>
            <div class="portlet-body form">
                <form id="myForm" action="${rc.contextPath}/application/role/save" onsubmit="return checkInfo();" class="form-horizontal " method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${role.id}"/>
                    <input type="hidden" name="content" id="content"/>

                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">角色名称<span class="required">
                                                     *
                                                </span></label>

                                    <div class="col-md-9">
                                        <input type="text" class="form-control required" placeholder="角色名称" name="name" value="${role.name}">
                                    </div>
                                </div>
                                </div>
                            </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">角色描述</label>

                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="description" value="${role.description}">
                                    </div>
                                </div>
                                </div>
                            </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">角色代号</label>

                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="code" value="${role.code}">
                                    </div>
                                </div>
                                </div>
                            </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">状态</label>

                                    <div class="col-md-9">
                                        <select name="active" class="form-control" id="active" value="${role.active}">
                                            <option value="ENABLE">启用</option>
                                            <option value="DISABLE">禁用</option>
                                        </select>
                                    </div>
                                </div>
                                </div>
                            </div>
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-3 col-md-9">
                            <button type="submit" class="btn green">保存</button>
                            <button type="button" class="btn default" onclick="javascript:window.location.href='${rc.contextPath}/application/role';">取消</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<content tag="script">
    <script src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/lang/summernote-zh-CN.js" type="text/javascript"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.js"></script>
    <script type="text/javascript">

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
            <#if action == 'update'>
                var stats="${role.active}";
                if(null==stats||''==stats){
                    stats='DISABLE';
                }
                $("#active option[value="+stats+"]").attr('selected','true');
            </#if>
        });

    </script>
</content>
</html>
