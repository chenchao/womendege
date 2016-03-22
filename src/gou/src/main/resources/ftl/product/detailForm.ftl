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
                <a href="${rc.contextPath}/product/detail">商品</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#"><#if action?? && action =='create'>创建<#elseif action=='view'>查看<#else>修改</#if>商品详情</a>
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
                    <i class="fa fa-gift"></i><#if action?? && action =='create'>创建<#elseif action=='view'>查看<#else>修改</#if>商品详情
                </div>
            <#if action?? && action =='view'>
                <div class="actions">
                    <div class="btn-group">
                        <a href="${rc.contextPath}/product/detail/update/${d.id}" class="btn blue">
                            <i class="fa fa-edit"></i>
                            <span class="hidden-480">编辑</span>
                        </a>
                        <a href="${rc.contextPath}/product/detail" class="btn green">
                            <i class="fa fa-undo"></i>
                            <span class="hidden-480">返回</span>
                        </a>
                    </div>
                </div>
            </#if>
            </div>
            <div class="portlet-body form">
                <form action="${rc.contextPath}/product/detail/create" class="form-horizontal form-bordered" method="POST" id="productForm" name="productForm" enctype="multipart/form-data">
                    <input type="hidden" id="productId" name="id" value="${d.id}">
                    <input type="hidden" id="removeTag" name="removeTag" value="${d.removeTag}">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">详情信息</label>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">商品编码<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control required" placeholder="" readonly id="productCode" name="productCode" value="${d.productCode}">
                            </div>
                            <label class="col-md-2 control-label">商品名称<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control required" placeholder="" readonly id="productName" name="productName" value="${d.productName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">详情编码<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control required" id="productBrand" name="productBrand" placeholder="" value="${d.productBrand}">
                            </div>
                            <label class="col-md-2 control-label">详情名称<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control required" id="productShortName" name="productShortName" placeholder="" value="${d.productShortName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">详情单位<span class="required">*</span></label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input type="text" class="form-control required" id="productClass" name="productClass" placeholder="请选择基础单位" value="${d.productClass}">
                                    <div class="input-group-addon" id="selectCustomer2"><span class="glyphicon glyphicon-hand-up"></span></div>
                                </div>
                            </div>
                            <label class="col-md-2 control-label">详情单价<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control required" id="productShortName" name="productShortName" placeholder="" value="${d.productShortName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">详情库存<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control required" id="productBrand" name="productBrand" placeholder="" value="${d.productBrand}">
                            </div>
                            <label class="col-md-2 control-label">是否上架<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="radio" class="form-control"  name="lockAble" value="0" <#if info.lockAble=='' || info.lockAble =='0'>checked="checked"</#if> />否
                                <input type="radio" class="form-control"  name="lockAble" value="1" <#if info.lockAble =='1'>checked="checked"</#if>/>是
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">详情规格
                                <span id="spanDocId" class="btn btn-success fileinput-button input-group-btn" style="width:100px;display: inline-block;margin-bottom: 5px;margin-left: 15px;">
                                    <span>选择规格</span>
                                </span>
                                <font color="blue" style="font-size: small;">规格名称</font>
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">85CM<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control required" id="productBrand" name="productBrand" placeholder="" value="${d.productBrand}">
                            </div>
                            <label class="col-md-2 control-label">90CM<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control required" id="productShortName" name="productShortName" placeholder="" value="${d.productShortName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">100CM<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control required" id="productBrand" name="productBrand" placeholder="" value="${d.productBrand}">
                            </div>
                            <label class="col-md-2 control-label">110CM<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control required" id="productShortName" name="productShortName" placeholder="" value="${d.productShortName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">120CM<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control required" id="productBrand" name="productBrand" placeholder="" value="${d.productBrand}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">详情图片
                                <span id="spanDocId" class="btn btn-success fileinput-button input-group-btn" style="width:100px;display: inline-block;margin-bottom: 5px;margin-left: 15px;">
                                    <span>上传附件</span><input id="fileupload" type="file" name="files" multiple style="width:100px;display: inline-block">
                                </span>
                                <font color="blue" style="font-size: small;">后台只支持上传图片格式（gif、jpeg、jpg、png），文件需小于2兆</font>
                            </label>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <span id="spanShow" style="padding-left: 50px;font-size: 14px;">暂无图片</span>
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
