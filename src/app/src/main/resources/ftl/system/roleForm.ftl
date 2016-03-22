<html>
<head>
    <title>角色编辑</title>
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
                <a href="${rc.contextPath}/system/role/">角色管理</a>
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
                    <i class="fa fa-gift"></i><#if action?? && action =='create'>新建<#else>修改</#if>角色
                </div>
            </div>
            <div class="portlet-body form">
                <form action="${rc.contextPath}/system/role/${action}" class="form-horizontal form-bordered" method="POST" id="roleForm">
                    <input type="hidden" name="id" value="${role.id}"/>
                    <input type="hidden" name="ids"/>

                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-2 control-label">名称</label>

                            <div class="col-md-10">
                                <input type="text" class="form-control" placeholder="录入角色名称" name="name" value="${role.name}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label">编码</label>

                            <div class="col-md-10">
                                <input type="text" class="form-control" placeholder="录入角色编码" name="code" value="${role.code}">
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
                        <div class="form-group">
                            <label class="col-md-2 control-label">描述<span class="required">*</span></label>

                            <div class="col-md-10">
                                <textarea name="description" type="text" class="form-control" placeholder="请输入角色描述">${role.description}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">资源树</label>

                            <div class="col-md-10">
                                <div id="resourceTree"></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-3 col-md-9">
                            <button type="button" class="btn green" id="roleBtnSave">保存</button>
                            <button type="button" class="btn default" onclick="javascript:window.location.href='${rc.contextPath}/system/role';">取消</button>
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
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/localization/messages_zh.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jstree/dist/jstree.js" type="text/javascript"></script>
    <script type="text/javascript">
        var tree=$("#resourceTree").jstree({
            "checkbox":{"keep_selected_style":false},
            "core":{
                "multiple":true,
                "animation":0,
                "themes":{
                    theme:"classic",
                    "dots":true,
                    "icons":true
                },
                "check_callback":true,
                'data':${resourceTree}
            },
            "plugins":["wholerow","checkbox"],
        });
        $("select[name=active] option[value='${role.active}']").attr("selected","selected");
        $('#roleBtnSave').click(function(){
            var array=$.jstree.reference('#resourceTree').get_selected(true);
            var ar=new Array();
            if(array){
                for(var i=0; i<array.length; i++){
                    var a=array[i]
                    ar.push(a.id);
                    if(a.parent!="#"){
                        ar.push(a.parent);
                    }
                }
            }
            $('input[name=ids]').val(ar.join(","));
            $('#roleForm').submit();
        });
    </script>
</content>
</html>