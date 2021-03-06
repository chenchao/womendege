<html>
<head>
    <title>商品管理</title>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.css">
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="${rc.contextPath}/">商品管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="${rc.contextPath}/product/class">商品分类</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#"><#if action?? && action =='create'>创建<#elseif action=='view'>查看<#else>修改</#if>商品分类</a>
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
                    <i class="fa fa-gift"></i><#if action?? && action =='create'>创建<#elseif action=='view'>查看<#else>修改</#if>商品分类
                </div>
            <#if action?? && action =='view'>
                <div class="actions">
                    <div class="btn-group">
                        <a href="${rc.contextPath}/product/class/update/${d.id}/${parent}" class="btn blue">
                            <i class="fa fa-edit"></i>
                            <span class="hidden-480">编辑</span>
                        </a>
                        <#if parent?? && parent =='ROOT'>
                            <a href="${rc.contextPath}/product/class" class="btn green">
                                <i class="fa fa-undo"></i>
                                <span class="hidden-480">返回</span>
                            </a>
                        <#else>
                            <a href="${rc.contextPath}/product/class/sub-view/${parent}" class="btn green">
                                <i class="fa fa-undo"></i>
                                <span class="hidden-480">返回</span>
                            </a>
                        </#if>
                    </div>
                </div>
            </#if>
            </div>
            <div class="portlet-body form">
                <form action="${rc.contextPath}/product/class/create/${parent}" class="form-horizontal form-bordered" method="POST" id="classForm" name="classForm" enctype="multipart/form-data">
                    <input type="hidden" id="classId" name="id" value="${d.id}">
                    <input type="hidden" id="removeTag" name="removeTag" value="${d.removeTag}">
                    <input type="hidden" id="path" name="path" value="${d.path}">
                    <div class="form-body">
                    <#if parent?? && parent =='ROOT'>
                        <input type="hidden" id="parentClassHidden" name="parentClass" value="${parent}">
                    <#else>
                        <div class="form-group">
                            <label class="col-md-2 control-label">上级编码<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control required" placeholder="" id="parentClass" readonly name="parentClass" value="${parent}">
                            </div>
                        </div>
                    </#if>
                        <div class="form-group">
                            <label class="col-md-2 control-label">分类编码<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control required" placeholder="" id="classCode" name="classCode" value="${d.classCode}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">分类名称<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control required" id="className" name="className" placeholder="" value="${d.className}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">分类排序</label>

                            <div class="col-md-4">
                                <input type="text" class="form-control required" id="classSort" name="classSort" placeholder="" value="${d.classSort}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">关键字</label>

                            <div class="col-md-4">
                                <input type="text" class="form-control required" id="classKeyword" name="classKeyword" placeholder="" value="${d.classKeyword}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">描述</label>

                            <div class="col-md-8">
                                <textarea class="form-control" id="classDesc" name="classDesc" rows="3" cols="40">${d.classDesc}</textarea>
                            </div>
                        </div>
                    <#if action?? && action !='view'>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-5 col-md-7">
                                <button type="button" id="saveBtn" class="btn green" onclick="saveInfo();">保存</button>
                                <#if parent?? && parent =='ROOT'>
                                    <button type="button" id="cancelBtn" class="btn default" data-dismiss="modal" onclick="javascript:window.location.href='${rc.contextPath}/product/class'">取消</button>
                                <#else>
                                    <button type="button" id="cancelBtn" class="btn default" data-dismiss="modal" onclick="javascript:window.location.href='${rc.contextPath}/product/class/sub-view/${parent}'">取消</button>
                                </#if>
                            </div>
                        </div>
                    </#if>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<content tag="script">
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-validate.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/fnReloadAjax.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/common.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jstree/dist/jstree.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
        <#if action=='view'>
            $("input").attr("readonly","readonly");
            $("#classDesc").attr("readonly","readonly");
        </#if>
        <#if action=='update'>
            $("#classCode").attr("readonly","readonly");
        </#if>
        });
        function saveInfo(){
            if(validation()){
                $("#classForm").submit();
            }
        }
        function validation(){
            var classCode=$("#classCode").val();
            if($.trim(classCode).length==0){
                bootbox.alert("请输入分类编码!");
                return false;
            }
            var className=$("#className").val();
            if($.trim(className).length==0){
                bootbox.alert("请输入分类名称!");
                return false;
            }
            var classSort=$("#classSort").val();
            if($.trim(classSort).length==0){
                bootbox.alert("请输入分类排序!");
                return false;
            }
            if(isNaN($.trim(classSort))){
                bootbox.alert("分类排序必须为数字!");
                return false;
            }
            if(!checkCodeExists($.trim(classCode))){
                return false;
            }
            if(!checkNameExists($.trim(className))){
                return false;
            }
            return true;
        }
        function checkCodeExists(code){
            var id=$("#classId").val();
            var b=true;
            $.ajax({
                url:'${rc.contextPath}/product/class/checkDataExists',
                type:'POST',
                data:{"search_EQ_id":id,"search_EQ_classCode":code,"search_EQ_type":"classCode"},
                dataType:"json",
                traditional:true,
                async:false,
                success:function(data){
                    if(data.result=="exists"){
                        bootbox.alert("分类编码["+code+"]已存在，请重新输入！");
                        b=false;
                    }
                }
            });
            return b;
        }
        function checkNameExists(name){
            var id=$("#classId").val();
            var b=true;
            $.ajax({
                url:'${rc.contextPath}/product/class/checkDataExists',
                type:'POST',
                data:{"search_EQ_id":id,"search_EQ_className":name,"search_EQ_type":"className"},
                dataType:"json",
                traditional:true,
                async:false,
                success:function(data){
                    if(data.result=="exists"){
                        bootbox.alert("分类名称["+name+"]已存在，请重新输入！");
                        b=false;
                    }
                }
            });
            return b;
        }
    </script>
</content>
</html>
