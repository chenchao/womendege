<html>
<head>
    <title>商品管理</title>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.css">
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"/>
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
                <a href="${rc.contextPath}/product/catalog">商品目录组</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#"><#if action?? && action =='create'>创建<#elseif action=='view'>查看<#else>修改</#if>商品目录组</a>
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
                    <i class="fa fa-gift"></i><#if action?? && action =='create'>创建<#elseif action=='view'>查看<#else>修改</#if>商品目录组
                </div>
            <#if action?? && action =='view'>
                <div class="actions">
                    <div class="btn-group">
                        <a href="${rc.contextPath}/product/catalog/update/${d.id}" class="btn blue">
                            <i class="fa fa-edit"></i>
                            <span class="hidden-480">编辑</span>
                        </a>
                        <a href="${rc.contextPath}/product/catalog" class="btn green">
                            <i class="fa fa-undo"></i>
                            <span class="hidden-480">返回</span>
                        </a>
                    </div>
                </div>
            </#if>
            </div>
            <div class="portlet-body form">
                <form action="${rc.contextPath}/product/catalog/create" class="form-horizontal form-bordered" method="POST" id="catalogForm" name="catalogForm" enctype="multipart/form-data">
                    <input type="hidden" id="catalogId" name="id" value="${d.id}">
                    <input type="hidden" id="removeTag" name="removeTag" value="${d.removeTag}">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-2 control-label">目录组名称<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control required" placeholder="" id="catalogName" name="catalogName" value="${d.catalogName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">目录组描述</label>
                            <div class="col-md-8">
                                <textarea class="form-control" id="catalogDesc" name="catalogDesc" rows="3" cols="40">${d.catalogDesc}</textarea>
                            </div>
                        </div>
                    <#if action?? && action !='view'>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-5 col-md-7">
                                <button type="button" id="saveBtn" class="btn green" onclick="saveInfo();">保存</button>
                                <button type="button" id="cancelBtn" class="btn default" data-dismiss="modal" onclick="javascript:window.location.href='${rc.contextPath}/product/catalog'">取消</button>
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
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-validate.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/fnReloadAjax.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jstree/dist/jstree.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
        <#if action=='view'>
            $("input").attr("readonly","readonly");
            $("#catalogDesc").attr("readonly","readonly");
        </#if>
        });
        function saveInfo(){
            if(validation()){
                $("#catalogForm").submit();
            }
        }
        function validation(){
            var catalogName=$("#catalogName").val();
            if($.trim(catalogName).length==0){
                bootbox.alert("请输入目录组名称!");
                return false;
            }
            if(!checkNameExists($.trim(catalogName))){
                return false;
            }
            return true;
        }
        function checkNameExists(name){
            var id=$("#catalogId").val();
            var b=true;
            $.ajax({
                url:'${rc.contextPath}/product/catalog/checkDataExists',
                type:'POST',
                data:{"search_EQ_id":id,"search_EQ_catalogName":name,"search_EQ_type":"catalogName"},
                dataType:"json",
                traditional:true,
                async:false,
                success:function(data){
                    if(data.result=="exists"){
                        bootbox.alert("目录组名称["+name+"]已存在，请重新输入！");
                        b=false;
                    }
                }
            });
            return b;
        }
    </script>
</content>
</html>
