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
                <a href="${rc.contextPath}/product/detail">商品</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">维护商品详情</a>
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
                    <i class="fa fa-gift"></i>商品信息
                </div>
                <div class="actions">
                    <div class="btn-group">
                        <a href="${rc.contextPath}/product/detail/update/${d.id}" class="btn green">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480">编辑商品信息</span>
                        </a>
                        <a href="${rc.contextPath}/product/detail" class="btn green">
                            <i class="fa fa-undo"></i>
                            <span class="hidden-480">返回</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal form-bordered">
                    <input type="hidden" id="productId" name="classId" value="${d.id}">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">基本信息</label>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">商品编码</label>
                            <div class="col-md-4">
                            ${d.productCode}
                            </div>
                            <label class="col-md-2 control-label">商品名称</label>
                            <div class="col-md-4">
                            ${d.productName}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">所属品牌</label>
                            <div class="col-md-4">
                            ${brandName}
                            </div>
                            <label class="col-md-2 control-label">商品简称</label>
                            <div class="col-md-4">
                            ${d.productShortName}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">所属分类</label>
                            <div class="col-md-8">
                            ${parentName}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">商品描述</label>
                            <div class="col-md-8">
                            ${d.productDesc}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">其他属性
                                <font color="blue" style="font-size: small;">${catalogName}</font>
                            </label>
                        </div>
                        <#if (attrs_length>0)>
                            <div class="form-group">
                            <#list attrs as attr>
                                    <label class="col-md-2 control-label">${attr.catalogAttrName}</label>
                                    <div class="col-md-4">
                                    ${attr.catalogAttrVal}
                                    </div>
                                <#if attr_index%2!=0>
                                </div>
                                    <#if (attr_index<attrs_length-1)>
                                    <div class="form-group">
                                    </#if>
                                </#if>
                            </#list>
                        </#if>
                        <div class="form-group">
                            <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">商品图片</label>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <span id="spanShow" style="padding-left: 50px;font-size: 14px;"></span>
                            </div>
                        </div>
                        <span id="spanFile">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#if message??>
<div id="message" class="alert alert-success">
    <button data-dismiss="alert" class="close">×</button>
${message}
</div>
</#if>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>商品详情信息
                </div>
                <#if addDetailFlag==1>
                    <div class="actions" id="actions-button">
                        <div class="btn-group">
                            <a href="${rc.contextPath}/product/detail/create-sub/${d.id}" class="btn green">
                                <i class="fa fa-plus"></i>
                                <span class="hidden-480">新增商品详情</span>
                            </a>
                        </div>
                    </div>
                </#if>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal form-bordered">
                    <div class="form-body">
                        <#list details as detail>
                            <div class="form-actions fluid">
                                <div class="col-md-offset-5 col-md-7">
                                    商品详情【${detail_index+1}】
                                    <button type="button" class="btn green" onclick="editInfo('${detail.id}');">编辑详情</button>
                                    <button type="button" class="btn red" onclick="deleteInfo('${detail.id}');">删除详情</button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">详情信息</label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">详情编码</label>
                                <div class="col-md-4">
                                ${detail.productSubCode}
                                </div>
                                <label class="col-md-2 control-label">详情名称</label>
                                <div class="col-md-4">
                                ${detail.productSubName}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">详情单位</label>
                                <div class="col-md-4">
                                ${detail.productUnit}
                                </div>
                                <label class="col-md-2 control-label">详情单价</label>
                                <div class="col-md-4">
                                ${detail.productPrice}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">详情库存</label>
                                <div class="col-md-4">
                                ${detail.productStock}
                                </div>
                                <label class="col-md-2 control-label">是否上架</label>
                                <div class="col-md-4">
                                <#if detail.productShelves==1>是<#else>否</#if>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">详情规格
                                    <font color="blue" style="font-size: small;">${detail.catalogName}</font>
                                </label>
                            </div>
                            <#list detail.subAttrs as sub_attr>
                                <#if sub_attr_index%2==0>
                                <div class="form-group">
                                </#if>
                                <label class="col-md-2 control-label">${sub_attr.catalogAttrName}</label>
                                <div class="col-md-4">
                                ${sub_attr.catalogAttrVal}
                                </div>
                                <#if sub_attr_index%2!=0>
                                </div>
                                </#if>
                            </#list>
                            <div class="form-group">
                                <label class="col-md-12 control-label"  style="text-align: left;font-weight: bold;font-size: 16px;">详情图片
                                </label>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <span id="spanShow_${detail.id}" style="padding-left: 50px;font-size: 14px;">
                                        <#list detail.pictures as picture>
                                            <#if picture.pictureType=='gif'||picture.pictureType=='jpeg'||picture.pictureType=='jpg'||picture.pictureType=='png'>
                                            <a href="${picture.pictureUrl}" class="fancybox" rel="img"><img src="${rc.contextPath}${picture.pictureUrl}" width="54px" height="54px"></a>
                                            <#elseif picture.pictureType=='wav'>
                                            <a href="${picture.pictureUrl}" target="_blank"><img src="${rc.contextPath}/assets/voice.png" width="54px" height="54px"></a>
                                            <#elseif picture.pictureType=='mp4'>
                                            <a href="${picture.pictureUrl}" target="_blank"><img src="${rc.contextPath}/assets/video.png" width="54px" height="54px"></a>
                                            </#if>
                                        </#list>
                                    </span>
                                </div>
                            </div>
                        </#list>
                    </div>
                </div>
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
        function alertClose(){
            $(".alert").alert('close');
        }
        $(document).ready(function(){
            $(".fancybox").fancybox({
                prevEffect	: 'none',
                nextEffect	: 'none',
                openEffect	: 'none',
                closeEffect	: 'none'
            });
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
        });

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
        function editInfo(id){
            document.location="${rc.contextPath}/product/detail/update-sub/"+id;
        }
        function deleteInfo(id){
            bootbox.dialog({
                message:"您是否确认删除该数据项？",buttons:{
                    main:{
                        label:"取消",className:"gray",callback:function(){
                            $(this).hide();
                        }
                    },success:{
                        label:"确定",className:"green",callback:function(){
                            Metronic.startPageLoading();
                            $.ajax({
                                url:'${rc.contextPath}/product/detail/delete-sub/'+id,type:'POST',dataType:"json",traditional:true,success:function(data){
                                    if(data.result=="success"){
                                        location.reload();
                                    }else{
                                        bootbox.alert("删除数据失败!");
                                    }
                                    Metronic.stopPageLoading();
                                }
                            });
                        }
                    }
                }
            });
        }
    </script>
</content>
</html>
