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
                <a href="#"><#if action?? && action =='create'>创建<#elseif action=='view'>查看<#else>修改</#if>商品</a>
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
                    <i class="fa fa-gift"></i><#if action?? && action =='create'>创建<#elseif action=='view'>查看<#else>修改</#if>商品
                </div>
            </div>
            <div class="portlet-body form">
                <form action="${rc.contextPath}/product/detail/create" class="form-horizontal form-bordered" method="POST" id="productForm" name="productForm" enctype="multipart/form-data">
                    <input type="hidden" id="productId" name="id" value="${d.id}">
                    <input type="hidden" id="removeTag" name="removeTag" value="${d.removeTag}">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">基本信息</label>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">商品编码<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" placeholder="" id="productCode" name="productCode" value="${d.productCode}">
                            </div>
                            <label class="col-md-2 control-label">商品名称<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" placeholder="" id="productName" name="productName" value="${d.productName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">所属品牌<span class="required">*</span></label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="productBrandName" name="productBrandName" placeholder="请选择所属品牌" value="${brandName}">
                                    <input type="hidden" id="productBrand" name="productBrand" value="${d.productBrand}">
                                    <div class="input-group-addon" id="selectBrand"><span class="glyphicon glyphicon-hand-up"></span></div>
                                </div>
                            </div>
                            <label class="col-md-2 control-label">商品简称</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="productShortName" name="productShortName" placeholder="" value="${d.productShortName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">所属分类<span class="required">*</span></label>
                            <div class="col-md-8">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="productClassName" name="productClassName" placeholder="请选择所属分类" value="${parentName}">
                                    <input type="hidden" class="form-control" id="productClass" name="productClass" value="${d.productClass}">
                                    <div class="input-group-addon" id="selectClass"><span class="glyphicon glyphicon-hand-up"></span></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">商品描述</label>
                            <div class="col-md-8">
                                <textarea class="form-control" id="productDesc" name="productDesc" rows="3" cols="40">${d.productDesc}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">其他属性
                                <span id="selectCatalog" class="btn btn-success fileinput-button input-group-btn" style="width:100px;display: inline-block;margin-bottom: 5px;margin-left: 15px;">
                                    <span>选择目录组</span>
                                </span>
                                <font color="blue" style="font-size: small;" id="catalogName">目录组名称</font>
                                <input type="hidden" class="form-control" id="catalogId" name="catalogId" value="${d.catalogId}">
                            </label>
                        </div>
                        <div id="catalogAttrList"></div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">商品图片
                                <span id="spanDocId" class="btn btn-success fileinput-button input-group-btn" style="width:100px;display: inline-block;margin-bottom: 5px;margin-left: 15px;">
                                    <span>上传附件</span><input id="fileupload" type="file" name="files" multiple style="width:100px;display: inline-block">
                                </span>
                                <font color="blue" style="font-size: small;">后台只支持上传图片格式（gif、jpeg、jpg、png），文件需小于2兆</font>
                            </label>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <span id="spanShow" style="padding-left: 50px;font-size: 14px;"></span>
                            </div>
                        </div>
                        <span id="spanFile">
                    <#if action?? && action =='create'>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-5 col-md-7">
                                <button type="button" id="saveBtn" class="btn green" onclick="saveInfo();">保存</button>
                                <button type="button" id="cancelBtn" class="btn default" data-dismiss="modal" onclick="javascript:window.location.href='${rc.contextPath}/product/detail'">取消</button>
                            </div>
                        </div>
                    </#if>
                    <#if action?? && action =='update'>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-5 col-md-7">
                                <button type="button" id="saveBtn" class="btn green" onclick="saveInfo();">保存</button>
                                <button type="button" id="cancelBtn" class="btn default" data-dismiss="modal" onclick="javascript:window.location.href='${rc.contextPath}/product/detail/sub-view/${d.id}'">取消</button>
                            </div>
                        </div>
                    </#if>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="component">
    <div class="modal fade" id="brand-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:950px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">选择商品品牌</h4>
                </div>
                <div class="modal-body" style="margin:5px;">
                    <div class="table-container">
                        <div class="table-actions-wrapper">
                            <input style="width: 170px!important" type="text" class="form-control table-group-action-input form-control input-inline input-small input-sm" placeholder="请输入品牌编码或名称" id="selectInputBrand">
                            <button class="btn btn-sm yellow table-group-action-submit" id="searchBrand"><i class="fa fa-search"></i> 查询</button>
                        </div>
                        <table class="table table-striped table-bordered table-hover" id="brand_list_table">
                            <thead>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="component">
    <div class="modal fade" id="class-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:950px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">选择商品分类</h4>
                </div>
                <div class="modal-body" style="margin:5px;">
                    <div class="table-container">
                        <div class="table-actions-wrapper">
                            <input style="width: 170px!important" type="text" class="form-control table-group-action-input form-control input-inline input-small input-sm" placeholder="请输入分类编码或名称" id="selectInputClass">
                            <button class="btn btn-sm yellow table-group-action-submit" id="searchClass"><i class="fa fa-search"></i> 查询</button>
                        </div>
                        <table class="table table-striped table-bordered table-hover" id="class_list_table">
                            <thead>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="component">
    <div class="modal fade" id="catalog-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:950px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">选择商品目录组</h4>
                </div>
                <div class="modal-body" style="margin:5px;">
                    <div class="table-container">
                        <div class="table-actions-wrapper">
                            <input style="width: 170px!important" type="text" class="form-control table-group-action-input form-control input-inline input-small input-sm" placeholder="请输入商品目录名称" id="selectInputCatalog">
                            <button class="btn btn-sm yellow table-group-action-submit" id="searchCatalog"><i class="fa fa-search"></i> 查询</button>
                        </div>
                        <table class="table table-striped table-bordered table-hover" id="catalog_list_table">
                            <thead>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<content tag="script">
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
<script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
<script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js"></script>
<script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
<script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
<script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
<script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-validate.js"></script>
<script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $(".fancybox").fancybox({
        prevEffect	: 'none',
        nextEffect	: 'none',
        openEffect	: 'none',
        closeEffect	: 'none'
    });
<#if action?? && action != 'view'>
    $("#productBrandName").bind("click",function(){
        $("#brand-modal").modal("show");
    });
    $("#selectBrand").bind("click",function(){
        $("#brand-modal").modal("show");
    }).css("cursor","pointer");
    $("#productClassName").bind("click",function(){
        $("#class-modal").modal("show");
    });
    $("#selectClass").bind("click",function(){
        $("#class-modal").modal("show");
    }).css("cursor","pointer");
    $("#selectCatalog").bind("click",function(){
        $("#catalog-modal").modal("show");
    });
</#if>
<#if action?? && action != 'create'>
    var catalogId='${catalog.id}';
    if(catalogId!=''){
        $("#catalogName").text('${catalog.catalogName}');
        var list=getCatalogAttr(catalogId,'${d.id}');
        console.log(list);
        createCatalogAttrHtml(list);

    }
    var pictures=getAttachment('${d.id}','1');
    if(pictures&&pictures.length>0){
        for(var i=0;i<pictures.length;i++){
            var spanFile=$("#spanFile");
            var attachmentExt='<input type="hidden" id="ext'+pictures[i].pictureName+'" name="fileExt" value="'+pictures[i].pictureType+'" />';
            var attachmentAddress='<input type="hidden" id="address'+pictures[i].pictureName+'" name="fileAddress" value="'+pictures[i].pictureUrl+'" />';
            var attachmentUuid='<input type="hidden" id="uuid'+pictures[i].pictureName+'" name="fileUuid" value="'+pictures[i].pictureName+'" />';
            spanFile.append(attachmentExt);
            spanFile.append(attachmentAddress);
            spanFile.append(attachmentUuid);
            showAttachment(pictures[i].pictureType,pictures[i].pictureUrl,pictures[i].pictureName);
        }
    }
</#if>
});

var brandGrid=new Datatable();
brandGrid.init({
    src:$("#brand_list_table"),
    dataTable:{
        "aLengthMenu":[
            [5,10,20,50,100,-1],
            [5,10,20,50,100,"All"]
        ],
        "aaSorting":[[0,"asc"]],
        "iDisplayLength":5,
        "bServerSide":true,
        "aoColumnDefs":[{"bSortable":false,"aTargets":[2,3,4]}],
        "sAjaxSource":"${rc.contextPath}/product/brand",
        "aoColumns":[{
            "sTitle":"品牌编码","mData":"brandCode"},{"sTitle":"品牌名称","mData":"brandName"},{
            "sTitle":"品牌图片","mData":"brandIcon","mRender":function(data){
                if(data){
                    if(data.indexOf('http')!= -1){
                        return '<img src="'+data+'" width="60px" height="60px" style="margin:auto 0;" >';
                    }else{
                        return '<img src="${rc.contextPath}'+data+'" width="60px" height="60px" style="margin:auto 0;" >';
                    }
                }else{
                    return '<img src="${rc.contextPath}'+'/assets/global/img/default.jpg'+'" width="60px" height="60px" style="margin:auto 0;" >';
                }
            }
        },{"sTitle":"描述","mData":"brandDesc"},{
            "sTitle":"操作","mData":"id","mRender":function(data,type,row){
                return '<input type="radio" name="radio" onclick="selectFromBrand(\''+row.brandName+'\','+row.brandCode+')">';
            }
        }]
    }
});
$('#searchBrand').click(function(){
    selectBrandAjax($("#selectInputBrand").val());
});
function selectBrandAjax(value){
    brandGrid.setAjaxParam("search_OR_brandCode|brandName",value);
    brandGrid.getDataTable().fnDraw();
}
function selectFromBrand(name,code){
    $("#productBrandName").val(name);
    $("#productBrand").val(code);
    $("#brand-modal").modal("hide");
}

var classGrid=new Datatable();
classGrid.setAjaxParam("search_EQ_depth",3);
classGrid.init({
    src:$("#class_list_table"),
    dataTable:{
        "aLengthMenu":[
            [5,10,20,50,100,-1],
            [5,10,20,50,100,"All"]
        ],
        "aaSorting":[[0,"asc"]],
        "iDisplayLength":5,
        "bServerSide":true,
        "aoColumnDefs":[{"bSortable":false,"aTargets":[2,3]}],
        "sAjaxSource":"${rc.contextPath}/product/class/select",
        "aoColumns":[{
            "sTitle":"分类编码","mData":"classCode"},
            {"sTitle":"分类名称","mData":"className"},{"sTitle":"分类路径","mData":"parentName"},{
            "sTitle":"操作","mData":"id","mRender":function(data,type,row){
                return '<input type="radio" name="radio" onclick="selectFromClass(\''+row.parentName+'\','+row.classCode+')">';
            }
        }]
    }
});
$('#searchClass').click(function(){
    selectClassAjax($("#selectInputClass").val());
});
function selectClassAjax(value){
    classGrid.setAjaxParam("search_OR_classCode|className",value);
    classGrid.setAjaxParam("search_EQ_parentClass","");
    classGrid.getDataTable().fnDraw();
}
function selectFromClass(name,code){
    $("#productClassName").val(name);
    $("#productClass").val(code);
    $("#class-modal").modal("hide");
}
function goSearchClass(code){
    $("#selectInputClass").val("");
    classGrid.setAjaxParam("search_OR_classCode|className","");
    classGrid.setAjaxParam("search_EQ_parentClass",code);
    classGrid.getDataTable().fnDraw();
}

var catalogGrid=new Datatable();
catalogGrid.setAjaxParam("search_EQ_catalogType",'SHOP');
catalogGrid.init({
    src:$("#catalog_list_table"),
    dataTable:{
        "aLengthMenu":[
            [5,10,20,50,100,-1],
            [5,10,20,50,100,"All"]
        ],
        "aaSorting":[[0,"asc"]],
        "iDisplayLength":5,
        "bServerSide":true,
        "aoColumnDefs":[{"bSortable":false,"aTargets":[2,3,4]}],
        "sAjaxSource":"${rc.contextPath}/product/catalog",
        "aoColumns":[{
            "sTitle":"目录组名称","mData":"catalogName"},{"sTitle":"目录组类型","mData":"catalogTypeName"},{"sTitle":"目录组描述","mData":"catalogDesc"},{"sTitle":"目录组属性集合","mData":"catalogAttrNames"},{
            "sTitle":"操作","mData":"id","mRender":function(data,type,row){
                return '<input type="radio" name="radio" onclick="selectFromCatalog(\''+row.catalogName+'\','+row.id+')">';
            }
        }]
    }
});
$('#searchCatalog').click(function(){
    selectCatalogAjax($("#selectInputCatalog").val());
});
function selectCatalogAjax(value){
    catalogGrid.setAjaxParam("search_LIKE_catalogName",value);
    catalogGrid.getDataTable().fnDraw();
}
function selectFromCatalog(name,id){
    $("#catalogName").text(name);
    $("#catalogId").val(id);
    var list=getCatalogAttr(id,0);
    createCatalogAttrHtml(list);
    $("#catalog-modal").modal("hide");
}

function createCatalogAttrHtml(list){
    if(list&&list.length>0){
        $("#catalogAttrList").empty();
        var html='<div class="form-group">';
        for(var i=0;i<list.length;i++){
            html+='<label class="col-md-2 control-label">'+list[i].catalogAttrName+'</label>';
            html+='<div class="col-md-4">';
            html+='<input type="text" class="form-control" name="catalogAttrVal" value="'+(list[i].catalogAttrVal?list[i].catalogAttrVal:"")+'"/>';
            html+='<input type="hidden" class="form-control" name="catalogAttrId" value="'+list[i].id+'"/>';
            html+='</div>';
            if(i%2!=0){
                html+='</div>';
                if(i<list.length-1){
                    html+='<div class="form-group">';
                }
            }
        }
        if(list.length%2==0){
            html+='</div>';
        }
        $("#catalogAttrList").append(html);
    }
}

function getCatalogAttr(id,productId){
    var list=[];
    $.ajax({
        url:'${rc.contextPath}/product/catalog/get-catalog-attr/'+id+'/'+productId,
        type:'POST',
        dataType:"json",
        traditional:true,
        async:false,
        success:function(data){
            if(data&&data.length>0){
                list=data;
            }
        }
    });
    return list;
}

/**
 * 上传附件
 */
$('#fileupload').fileupload({
    autoUpload:true,
    method:'POST',
    acceptFileTypes:/(\.|\/)(gif|jpe?g|png)$/i,
    maxFileSize:2000000,
    url:'${rc.contextPath}/upload-file',
    success:function(a){
        var spanFile=$("#spanFile");
        var attachmentExt='<input type="hidden" id="ext'+a['uuid']+'" name="fileExt" value="'+a['ext']+'" />';
        var attachmentAddress='<input type="hidden" id="address'+a['uuid']+'" name="fileAddress" value="'+a['url']+'" />';
        var attachmentUuid='<input type="hidden" id="uuid'+a['uuid']+'" name="fileUuid" value="'+a['uuid']+'" />';
        spanFile.append(attachmentExt);
        spanFile.append(attachmentAddress);
        spanFile.append(attachmentUuid);
        showAttachment(a['ext'],a['url'],a['uuid']);
    }
});
/**
 * 预览附件
 */
function showAttachment(ext,address,uuid){
    var spanHtml='<span id="span'+uuid+'">';
    ext=ext.toLowerCase();
    if(ext=="gif"||ext=="jpeg"||ext=="jpg"||ext=="png"){
        spanHtml+='<a href="'+address+'" class="fancybox" rel="img"><img src="'+address+'" width="54px" height="54px">';
    }else if(ext=="wav"){
        spanHtml+='<a href="'+address+'" target="_blank"><img src="${rc.contextPath}/assets/voice.png" width="54px" height="54px">';
    }else if(ext=="mp4"){
        spanHtml+='<a href="'+address+'" target="_blank"><img src="${rc.contextPath}/assets/video.png" width="54px" height="54px">';
    }
    spanHtml+='</a>';
<#if action?? && action !='view'>
    spanHtml+='&nbsp;&nbsp;<a href="javascript:void(0)" onclick="deleteAttachment(\''+uuid+'\')">［删除］</a>';
</#if>
    spanHtml+='</span>&nbsp;&nbsp;';
    $('#spanShow').append(spanHtml);
}

/**
 *删除附件
 */
function deleteAttachment(uuid){
    $("#ext"+uuid).remove();
    $("#address"+uuid).remove();
    $("#uuid"+uuid).remove();
    $("#span"+uuid).remove();
}

function getAttachment(id,type){
    var list=[];
    $.ajax({
        url:'${rc.contextPath}/product/detail/get-attachment/'+id+'/'+type,
        type:'POST',
        dataType:"json",
        traditional:true,
        async:false,
        success:function(data){
            if(data&&data.length>0){
                list=data;
            }
        }
    });
    return list;
}

function saveInfo(){
    if(validation()){
        $("#productForm").submit();
    }
}
function validation(){
    var productCode=$("#productCode").val();
    if($.trim(productCode).length==0){
        bootbox.alert("请输入商品编码!");
        return false;
    }
    var productName=$("#productName").val();
    if($.trim(productName).length==0){
        bootbox.alert("请输入商品名称!");
        return false;
    }
    var productBrand=$("#productBrand").val();
    if($.trim(productBrand).length==0){
        bootbox.alert("请选择商品品牌!");
        return false;
    }
    var productClass=$("#productClass").val();
    if($.trim(productClass).length==0){
        bootbox.alert("请输入商品分类!");
        return false;
    }
    if(!checkCodeExists($.trim(productCode))){
        return false;
    }
    if(!checkNameExists($.trim(productName))){
        return false;
    }
    return true;
}

function checkCodeExists(code){
    var id=$("#productId").val();
    var b=true;
    $.ajax({
        url:'${rc.contextPath}/product/detail/checkDataExists',
        type:'POST',
        data:{"search_EQ_id":id,"search_EQ_productCode":code,"search_EQ_type":"productCode"},
        dataType:"json",
        traditional:true,
        async:false,
        success:function(data){
            if(data.result=="exists"){
                bootbox.alert("商品编码["+code+"]已存在，请重新输入！");
                b=false;
            }
        }
    });
    return b;
}
function checkNameExists(name){
    var id=$("#productId").val();
    var b=true;
    $.ajax({
        url:'${rc.contextPath}/product/detail/checkDataExists',
        type:'POST',
        data:{"search_EQ_id":id,"search_EQ_productName":name,"search_EQ_type":"productName"},
        dataType:"json",
        traditional:true,
        async:false,
        success:function(data){
            if(data.result=="exists"){
                bootbox.alert("商品名称["+name+"]已存在，请重新输入！");
                b=false;
            }
        }
    });
    return b;
}
</script>
</content>
</html>
