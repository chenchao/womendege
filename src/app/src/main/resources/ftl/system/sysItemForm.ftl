<html>
<head>
    <title>字典编辑</title>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/select2/select2.css" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="${rc.contextPath}/">系统设置</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">字典管理</a>
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
                    <i class="fa fa-gift"></i><#if action?? && action =='create'>新建<#else>修改</#if>字典
                </div>
            </div>
            <div class="portlet-body form">
                <form action="${rc.contextPath}/system/sysitem/${action}" class="form-horizontal form-bordered" method="POST" id="itemForm">
                    <input type="hidden" name="id" value="${si.id}"/>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-2 control-label">项目代码</label>

                            <div class="col-md-10">
                                <input type="text" class="form-control" placeholder="录入项目代码" name="itemId" value="${si.itemId}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">对象代码</label>

                            <div class="col-md-10">
                                <input type="text" class="form-control" placeholder="录入对象代码" name="objId" value="${si.objId}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label">说明A</label>

                            <div class="col-md-10">
                                <input type="text" class="form-control" placeholder="说明A" name="annexa" value="${si.annexa}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label">说明B</label>

                            <div class="col-md-10">
                                <input type="text" class="form-control" placeholder="录入说明B" name="annexb" value="${si.annexb}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label">说明C</label>

                            <div class="col-md-10">
                                <input type="text" class="form-control" placeholder="录入说明C" name="annexc" value="${si.annexc}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label">说明D</label>

                            <div class="col-md-10">
                                <input type="text" class="form-control" placeholder="录入说明D" name="annexd" value="${si.annexd}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label">说明E</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" placeholder="录入说明E" name="annexe" value="${si.annexe}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">状态<span class="required">*</span></label>
                            <div class="col-md-10">
                                <select name="active" class="form-control">
                                    <option value="ENABLE">启用</option>
                                    <option value="DISABLE">禁用</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-3 col-md-9">
                            <button type="submit" class="btn green">保存</button>
                            <button type="button" class="btn default" onclick="javascript:window.location.href='${rc.contextPath}/system/sysitem';">取消</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<content tag="script">
    <script src="${rc.contextPath}/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/lib/jquery.form.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/localization/messages_zh.js" type="text/javascript"></script>
    <script type="text/javascript">
        var form=$('#itemForm');
        var error=$('.alert-danger',form);
        form.validate({
            errorElement:'span',
            errorClass:'help-block help-block-error',
            focusInvalid:true,
            messages:{
                objId:{remote:"对象代码已经存在"}
            },
            rules:{
                itemId:{
                    required:true,
                    maxlength:30
                },
                objId:{
                    minlength:2,
                    maxlength:30,
                    required:true,
                    remote:'${rc.contextPath}/system/sysitem/check/${si.id}'
                },
                name:{
                    required:true
                },
                annexa:{
                    maxlength:50,
                },
                annexb:{
                    maxlength:100,
                },
                annexc:{
                    maxlength:150,
                },
                annexd:{
                    maxlength:200,
                },
                annexe:{
                    maxlength:250,
                },
                active:{
                    required:true
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