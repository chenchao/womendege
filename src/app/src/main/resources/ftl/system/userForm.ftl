<html>
<head>
    <title>系统用户编辑</title>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
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

            <li><a href="${rc.contextPath}/system/user/">用户管理</a>
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i><#if action =='create'>新建<#else>修改</#if>用户
                </div>
            </div>
            <div class="portlet-body form">
                <form action="${rc.contextPath}/system/user/${action}" class="form-horizontal form-bordered" method="POST" id="userForm">
                    <input type="hidden" name="id" value="${u.id}"/>
                    <input type="hidden" name="salt" value="${u.salt}"/>

                    <div class="form-body">
                        <div class="alert alert-danger display-hide">
                            <button class="close" data-close="alert"></button>
                            请检查后再提交
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">登录名<span class="required">*</span></label>

                            <div class="col-md-10">
                                <div class="input-icon right">
                                    <i class="fa"></i>

                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                        <input type="text" class="form-control" name="loginName" placeholder="请输入登录名" value="${u.loginName}"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label">用户名<span class="required">*</span></label>

                            <div class="col-md-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input type="text" class="form-control" name="name" placeholder="请输入用户名" value="${u.name}"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">电子邮件<span class="required">*</span></label>

                            <div class="col-md-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                    <input name="email" type="text" class="form-control" value="${u.email}" placeholder="电子邮件地址">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">密码</label>

                            <div class="col-md-10">
                                <div class="input-icon right">
                                    <i class="fa"></i>

                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                        <input name="plainPassword" type="password" class="form-control" placeholder="请输入登录密码">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">状态</label>

                            <div class="col-md-10">
                                <select name="status" class="form-control">
                                    <option value="ENABLE">启用</option>
                                    <option value="DISABLE">禁用</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">角色</label>

                            <div class="col-md-10">
                                <select name="ids" multiple="multiple" class="select" style="width: 100%;">
                                <#list roles as r>
                                    <option value="${r.id}">${r.name}</option>
                                </#list>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-3 col-md-9">
                            <button type="submit" class="btn green">保存</button>
                            <button type="button" class="btn default" onclick="javascript:window.location.href='${rc.contextPath}/system/user';">取消</button>
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
    <script src="${rc.contextPath}/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/lib/jquery.form.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/localization/messages_zh.js" type="text/javascript"></script>
    <script type="text/javascript">
        var select=$(".select").select2();
        <#if action =='update'>
        $("select[name=status] option[value='${u.status}']").attr("selected","selected");
        var data=[];
            <#list u.role as r>
            data.push({id:${r.id},text:'${r.name}'});
            </#list>
        select.select2("data",data);
        </#if>
        var form=$('#userForm');
        var error=$('.alert-danger',form);
        form.validate({
            errorElement:'span',
            errorClass:'help-block help-block-error',
            focusInvalid:true,
            messages:{
                loginName:{remote:"登陆名已经存在"}
            },
            rules:{
                loginName:{
                    minlength:2,
                    maxlength:30,
                    required:true,
                    remote:'${rc.contextPath}/system/user/check/${u.id}'
                },
                name:{
                    required:true
                },
                email:{
                    required:true,
                    email:true
                },
                active:{
                    required:true
                },
                plainPassword:{
                    maxlength:16
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