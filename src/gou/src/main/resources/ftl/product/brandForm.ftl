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
                <a href="${rc.contextPath}/product/brand">商品品牌</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#"><#if action?? && action =='create'>创建<#elseif action=='view'>查看<#else>修改</#if>商品品牌</a>
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
                    <i class="fa fa-gift"></i><#if action?? && action =='create'>创建<#elseif action=='view'>查看<#else>修改</#if>商品品牌
                </div>
            <#if action?? && action =='view'>
                <div class="actions">
                    <div class="btn-group">
                        <a href="${rc.contextPath}/product/brand/update/${d.id}" class="btn blue">
                            <i class="fa fa-edit"></i>
                            <span class="hidden-480">编辑</span>
                        </a>
                        <a href="${rc.contextPath}/product/brand" class="btn green">
                            <i class="fa fa-undo"></i>
                            <span class="hidden-480">返回</span>
                        </a>
                    </div>
                </div>
            </#if>
            </div>
            <div class="portlet-body form">
                <form action="${rc.contextPath}/product/brand/create" class="form-horizontal form-bordered" method="POST" id="brandForm" name="brandForm" enctype="multipart/form-data">
                    <input type="hidden" id="brandId" name="id" value="${d.id}">
                    <input type="hidden" id="removeTag" name="removeTag" value="${d.removeTag}">

                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-2 control-label">品牌编码<span class="required">*</span></label>

                            <div class="col-md-4">
                                <input type="text" class="form-control required" placeholder="" id="brandCode" name="brandCode" value="${d.brandCode}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">品牌名称<span class="required">*</span></label>

                            <div class="col-md-4">
                                <input type="text" class="form-control required" id="brandName" name="brandName" placeholder="" value="${d.brandName}">
                            </div>
                        </div>

                        <!-- 上传模态窗口 -->
                        <div class="modal fade" id="uploadModal" tabindex="-1" backdrop="false" role="dialog"
                                aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span
                                                aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                        <h4 class="modal-title" id="myModalLabel">上传图片</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="input-group">
                                            <input id="cover" class="form-control" placeholder="示意图" type="text"
                                                    name="img1" value=""/>
                                        <span class="btn btn-success fileinput-button input-group-btn">
                                            <span>上传</span><input id="fileupload" type="file" name="files" multiple>
                                        </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">品牌图片</label>
                            <input type="hidden" id="brandIcon" name="brandIcon" value="${e.brandIcon?if_exists}">
                            <div class="col-md-10">
                                &nbsp;&nbsp;<img id="showPicture" style="cursor:pointer" src="${rc.contextPath}${e.brandIcon?if_exists}"
                                    alt="点击上传图片" width="70px;" height="60px" onclick="showUploadModal();">
                                请上传品牌图片
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">描述</label>

                            <div class="col-md-8">
                                <textarea class="form-control" id="brandDesc" name="brandDesc" rows="3" cols="40">${d.classDesc}</textarea>
                            </div>
                        </div>
                    <#if action?? && action !='view'>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-5 col-md-7">
                                <button type="button" id="saveBtn" class="btn green" onclick="saveInfo();">保存</button>
                                <button type="button" id="cancelBtn" class="btn default" data-dismiss="modal" onclick="javascript:window.location.href='${rc.contextPath}/product/brand'">取消</button>
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
        $('#fileupload').fileupload({
            autoUpload:true,method:'POST',url:'${rc.contextPath}/upload-file',success:function(a){
                $('#cover').val(a['url']);
                $("#uploadModal").modal('hide');
                var url=a['url'];
                $('#brandIcon').val(a['url']);
                $('#showPicture').attr("src","${rc.contextPath}"+a['url']);
            }
        });
        function showUploadModal(){
            $("#uploadModal").modal('toggle');
        }
        $(document).ready(function(){
        <#if action =='create'>
            $('#showPicture').attr("src",null);
        </#if>

        <#if  action =='update'>
            if("${d.brandIcon}"==null||""=="${d.brandIcon}"){
                $('#showPicture').attr("src",null);
            }else{
                $('#showPicture').attr("src","${rc.contextPath}"+"${d.brandIcon}");
            }
        </#if>
        <#if action=='view'>
            $("input").attr("readonly","readonly");
            $("#brandDesc").attr("readonly","readonly");
            if("${d.brandIcon}"==null||""=="${d.brandIcon}"){
                $('#showPicture').attr("src",null);
            }else{
                $('#showPicture').attr("src","${rc.contextPath}"+"${d.brandIcon}");
            }
        </#if>
        });
        function saveInfo(){
            if(validation()){
                $("#brandForm").submit();
            }
        }
        function validation(){
            var brandCode=$("#brandCode").val();
            if($.trim(brandCode).length==0){
                bootbox.alert("请输入品牌编码!");
                return false;
            }
            var brandName=$("#brandName").val();
            if($.trim(brandName).length==0){
                bootbox.alert("请输入品牌名称!");
                return false;
            }
            if(!checkCodeExists($.trim(brandCode))){
                return false;
            }
            if(!checkNameExists($.trim(brandName))){
                return false;
            }
            return true;
        }
        function checkCodeExists(code){
            var id=$("#brandId").val();
            var b=true;
            $.ajax({
                url:'${rc.contextPath}/product/brand/checkDataExists',
                type:'POST',
                data:{"search_EQ_id":id,"search_EQ_brandCode":code,"search_EQ_type":"brandCode"},
                dataType:"json",
                traditional:true,
                async:false,
                success:function(data){
                    if(data.result=="exists"){
                        bootbox.alert("品牌编码["+code+"]已存在，请重新输入！");
                        b=false;
                    }
                }
            });
            return b;
        }
        function checkNameExists(name){
            var id=$("#brandId").val();
            var b=true;
            $.ajax({
                url:'${rc.contextPath}/product/brand/checkDataExists',
                type:'POST',
                data:{"search_EQ_id":id,"search_EQ_brandName":name,"search_EQ_type":"brandName"},
                dataType:"json",
                traditional:true,
                async:false,
                success:function(data){
                    if(data.result=="exists"){
                        bootbox.alert("品牌名称["+name+"]已存在，请重新输入！");
                        b=false;
                    }
                }
            });
            return b;
        }
    </script>
</content>
</html>
