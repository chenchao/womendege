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
                <a href="${rc.contextPath}/product/detail/sub-view/${productId}">商品详情</a>
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
            </div>
            <div class="portlet-body form">
                <form action="${rc.contextPath}/product/detail/create-sub" class="form-horizontal form-bordered" method="POST" id="productSubForm" name="productSubForm" enctype="multipart/form-data">
                    <input type="hidden" id="productSubId" name="id" value="${d.id}">
                    <input type="hidden" id="productId" name="productId" value="${productId}">
                    <input type="hidden" id="removeTag" name="removeTag" value="${d.removeTag}">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">详情信息</label>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">商品编码</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" readonly placeholder="" id="productCode" name="productCode" value="${productCode}">
                            </div>
                            <label class="col-md-2 control-label">商品名称</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" readonly placeholder="" id="productName" name="productName" value="${productName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">详情编码<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" placeholder="" id="productSubCode" name="productSubCode" value="${d.productSubCode}">
                            </div>
                            <label class="col-md-2 control-label">详情名称<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="productSubName" name="productSubName" placeholder="" value="${d.productSubName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">详情单位<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" placeholder="" id="productUnit" name="productUnit" value="${d.productUnit}">
                            </div>
                            <label class="col-md-2 control-label">详情单价<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="productPrice" name="productPrice" placeholder="" value="${d.productPrice}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">详情库存<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" placeholder="" id="productStock" name="productStock" value="${d.productStock}">
                            </div>
                            <label class="col-md-2 control-label">是否上架<span class="required">*</span></label>
                            <div class="col-md-4">
                                <select name="productShelves" id="productShelves" class="form-control  form-filter input-sm">
                                    <option value="1">是</option>
                                    <option value="0">否</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">规格属性
                                <span id="selectCatalog" class="btn btn-success fileinput-button input-group-btn" style="width:100px;display: inline-block;margin-bottom: 5px;margin-left: 15px;">
                                    <span>选择商品规格</span>
                                </span>
                                <font color="blue" style="font-size: small;" id="catalogName">规格名称</font>
                                <input type="hidden" class="form-control" id="catalogId" name="catalogId" value="${d.catalogId}">
                            </label>
                        </div>
                        <div id="catalogAttrList"></div>
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
                                <span id="spanShow" style="padding-left: 50px;font-size: 14px;"></span>
                            </div>
                        </div>
                        <span id="spanFile">
                    <#if action?? && action !='view'>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-5 col-md-7">
                                <button type="button" id="saveBtn" class="btn green" onclick="saveInfo();">保存</button>
                                <button type="button" id="cancelBtn" class="btn default" data-dismiss="modal" onclick="javascript:window.location.href='${rc.contextPath}/product/detail/sub-view/${productId}'">取消</button>
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
    <div class="modal fade" id="catalog-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:950px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">选择商品规格</h4>
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
    $("#selectCatalog").bind("click",function(){
        $("#catalog-modal").modal("show");
    });
</#if>
<#if action?? && action != 'create'>
    var catalogId='${d.catalogId}';
    if(catalogId!=''){
        $("#catalogName").text('${catalogName}');
        var list=getCatalogAttr(catalogId,'${d.id}');
        console.log(list);
        createCatalogAttrHtml(list);
    }
    var pictures=getAttachment('${d.id}','2');
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
var catalogGrid=new Datatable();
catalogGrid.setAjaxParam("search_EQ_catalogType",'SPEC');
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

function getCatalogAttr(id,productSubId){
    var list=[];
    $.ajax({
        url:'${rc.contextPath}/product/catalog/get-catalog-attr-sub/'+id+'/'+productSubId,
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
        $("#productSubForm").submit();
    }
}
function validation(){
    var productSubCode=$("#productSubCode").val();
    if($.trim(productSubCode).length==0){
        bootbox.alert("请输入详情编码!");
        return false;
    }
    var productSubName=$("#productSubName").val();
    if($.trim(productSubName).length==0){
        bootbox.alert("请输入详情名称!");
        return false;
    }
    var productUnit=$("#productUnit").val();
    if($.trim(productUnit).length==0){
        bootbox.alert("请选择详情单位!");
        return false;
    }
    var productPrice=$("#productPrice").val();
    if($.trim(productPrice).length==0){
        bootbox.alert("请输入详情单价!");
        return false;
    }
    if(isNaN($.trim(productPrice))){
        bootbox.alert("单价必须为数字!");
        return false;
    }
    var productStock=$("#productStock").val();
    if($.trim(productStock).length==0){
        bootbox.alert("请输入详情库存!");
        return false;
    }
    if(isNaN($.trim(productStock))){
        bootbox.alert("库存必须为数字!");
        return false;
    }
    if(!checkCodeExists($.trim(productSubCode))){
        return false;
    }
    if(!checkNameExists($.trim(productSubName))){
        return false;
    }
    return true;
}

function checkCodeExists(code){
    var id=$("#productSubId").val();
    var b=true;
    $.ajax({
        url:'${rc.contextPath}/product/detail/checkDataExists-sub',
        type:'POST',
        data:{"search_EQ_id":id,"search_EQ_productSubCode":code,"search_EQ_type":"productSubCode"},
        dataType:"json",
        traditional:true,
        async:false,
        success:function(data){
            if(data.result=="exists"){
                bootbox.alert("详情编码["+code+"]已存在，请重新输入！");
                b=false;
            }
        }
    });
    return b;
}
function checkNameExists(name){
    var id=$("#productSubId").val();
    var b=true;
    $.ajax({
        url:'${rc.contextPath}/product/detail/checkDataExists-sub',
        type:'POST',
        data:{"search_EQ_id":id,"search_EQ_productSubName":name,"search_EQ_type":"productSubName"},
        dataType:"json",
        traditional:true,
        async:false,
        success:function(data){
            if(data.result=="exists"){
                bootbox.alert("详情名称["+name+"]已存在，请重新输入！");
                b=false;
            }
        }
    });
    return b;
}
</script>
</content>
</html>
