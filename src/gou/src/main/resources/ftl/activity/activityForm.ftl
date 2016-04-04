<html>
<head>
    <title>活动编辑</title>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet"/>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet"/>
    <link href="${rc.contextPath}/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.css">
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-datetimepicker/css/datetimepicker.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
    <style>
    </style>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="${rc.contextPath}/">驾驶舱</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="${rc.contextPath}/news/article">活动管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">活动编辑</a>
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>编辑活动
                </div>
            </div>

            <div class="portlet-body form">
                <form action="${rc.contextPath}/activity/save" class="form-horizontal form-bordered" method="POST" id="form1">

                    <!--隐藏元素-->
                    <input id="activityId" name="id" type="hidden" value="${activity.id}"/>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-2 control-label">活动名称<span class="required">*</span></label>

                            <div class="col-md-2">
                                <div class="input-group">
                                <#--<span class="input-group-addon"><i class="fa fa-key"></i></span>-->
                                    <input check-type='required' name="name" type="text" class="form-control required" placeholder="" value="${activity.name}">

                                </div>
                            </div>

                            <label class="col-md-2 control-label">活动编号<span class="required">*</span></label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input name="activityCode" type="text" class="form-control required" placeholder="" value="${activity.activityCode}">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label">活动内容</label>
                            <div class="col-md-2">
                                <div class="input-group">
                                    <textarea name="content">${activity.content}</textarea>
                                </div>
                            </div>

                            <label class="col-md-2 control-label">活动折扣</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input name="discount" type="text" class="form-control required" placeholder="" value="${activity.discount}">
                                    <span>折</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">开始时间<span class="required">*</span></label>
                            <div class="col-md-2">
                                <div class="input-group date datetime-picker margin-bottom-5" data-date-format="yyyy-mm-dd hh:ii">
                                    <input type="text" class="form-control form-filter input-sm required" readonly name="startTimeStr" value="${activity.startTimeStr?if_exists}" placeholder="创建时间">
				                    <span class="input-group-btn">
				                    <button class="btn btn-sm default date-set" type="button"><i class="fa fa-calendar"></i></button>
				                     </span>
                                </div>
                            </div>
                            <label class="col-md-2 control-label">结束时间<span class="required">*</span></label>
                            <div class="col-md-4">
                                <div class="input-group date datetime-picker margin-bottom-5" data-date-format="yyyy-mm-dd hh:ii">
                                    <input type="text" class="form-control form-filter input-sm required" readonly name="endTimeStr" value="${activity.endTimeStr?if_exists}" placeholder="结束时间">
				                    <span class="input-group-btn">
				                    <button class="btn btn-sm default date-set" type="button"><i class="fa fa-calendar"></i></button>
				                     </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">排位</label>

                            <div class="col-md-2">
                                <div class="input-group">
                                    <input name="pri" type="text" class="form-control required" placeholder="" value="${activity.pri}">
                                </div>
                            </div>

                            <label class="col-md-2 control-label">状态</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <#if 'ready'==activity.state>
                                        未开始
                                    <#elseif 'running'==activity.state>
                                        进行中
                                    <#elseif 'finish'==activity.state>
                                        已完成
                                    <#elseif 'closed'==activity.state>
                                        已关闭
                                    </#if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="table-container">
                        <div class="table-actions-wrapper">1111<span>1111</span>
                        </div>
                        <table class="table table-striped table-bordered table-hover dataTable" style="width: 81%" align="center">
                            <thead>
                            <tr role="row" class="heading">
                                <th width="10%">位置</th>
                                <th width="10%">编码</th>
                                <th width="10%">类型</th>
                                <th width="10%">宽</th>
                                <th width="10%">高</th>
                                <th width="30%">图片</th>
                                <th width="10%">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list activityPositions as ap>
                            <tr>
                                <td>${ap.position.name}</td>
                                <td>${ap.position.code}</td>
                                <td>${ap.position.type}</td>
                                <td>${ap.position.width}</td>
                                <td>${ap.position.height}</td>
                                <td>
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <span id="spanShow_${ap.position.id}" style="padding-left: 50px;font-size: 14px;">
                                                <span id="imgSpan_${ap.position.id}">
                                                    <#if ap.imgPath!= '' && ap.imgPath!= null>
                                                        <img src="${rc.contextPath}${ap.imgPath}" width="54px" height="54px"/>
                                                        <a href="javascript:void(0)" onclick="deleteAttachment('${ap.position.id}')">［删除］</a>
                                                    </#if>
                                                </span>
                                            </span>
                                        </div>
                                    </div>
                                    <input type="hidden" class="form-filter" name="imgPaths" id="imgPath_${ap.position.id}" value="${ap.position.id}_${ap.imgPath}"/>
                                </td>
                                <td>
                                    <div class="form-group">
                                        <span id="spanDocId" class="btn btn-success fileinput-button input-group-btn" style="width:100px;display: inline-block;margin-bottom: 5px;margin-left: 15px;">
                                            <span>上传附件</span><input class="fileupload" onclick="uploadImg(this)" positionId="${ap.position.id}" title="后台只支持上传图片格式（gif、jpeg、jpg、png），文件需小于2兆" type="file" name="files" multiple style="width:100px;display: inline-block">
                                        </span>
                                    </div>
                                </td>
                            </tr>
                            </#list>
                            <span id="spanFile"></span>
                            </tbody>
                        </table>
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-5 col-md-6">
                            <button type="submit" class="btn blue" id="saveBtn">保存</button>

                            <button type="button" id="cancelBtn" class="btn default" data-dismiss="modal" onclick="javascript:window.location.href='${rc
                            .contextPath}/activity'">
                                返回
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    <#if activity??>
        <div class="row">
            <div class="col-md-12">
                <ul class="page-breadcrumb breadcrumb" style="margin: 0px;padding: 10px;width: 100%">
                    <li style="width: 70%">
                        <i class="fa fa-home"></i>
                        <a href="javascript:void(0)">活动商品</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                    <li style="width: 29%;text-align: right">
                        <div class="btn-group">
                            <a href="javascript:void(0);" onclick="showProducts()" class="btn green">
                                <i class="fa fa-plus"></i>
                                <span class="hidden-480">编辑商品</span>
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="table-container">
            <div class="table-actions-wrapper"><span></span>
            </div>
            <table class="table table-striped table-bordered table-hover" align="center" id="product_data_table">
                <thead>
                <tr role="row" class="heading">
                    <th>商品编码</th>
                    <th>商品名称</th>
                    <th>商品简称</th>
                    <th>所属品牌</th>
                    <th>所属分类</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </#if>
        <!-- 展示所有的员工列表 -->

            <div id="emp_members_list_div" class="modal fade" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog" style="width:1100px;">
                    <div class="modal-content">
                        <div class="modal-header" style="border-bottom:none;">
                            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row" id="tableDatas">
                                <div class="col-md-12">
                                    <div class="portlet">
                                        <div class="portlet-title">
                                            <div class="caption"><i class="fa fa-cogs"></i>商品列表</div>
                                            <div class="actions">
                                                <div class="btn-group">
                                                    <a href="javascript:void(0);" onclick="addProduct(null)" class="btn green">
                                                        <i class="fa fa-plus"></i>
                                                        <span class="hidden-480">添加</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <table class="table table-striped table-bordered table-hover" id="data_table">
                                                <thead>
                                                <tr role="row" class="heading">
                                                    <th>商品编码</th>
                                                    <th>商品名称</th>
                                                    <th>商品简称</th>
                                                    <th>所属品牌</th>
                                                    <th>所属分类</th>
                                                    <th>操作</th>
                                                </tr>
                                                <tr role="row" class="filter">
                                                    <td>
                                                        <input type="text" class="form-control form-filter input-sm" name="search_activityId" value="${activity.id}" style="display: none">
                                                        <input type="text" class="form-control form-filter input-sm" name="search_LIKE_code">
                                                    </td>
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_name"></td>
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_shortName"></td>
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_brand"></td>
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_class"></td>
                                                    <td>
                                                        <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i>搜索</button>
                                                        <button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i>重置</button>
                                                    </td>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

    </div>
</div>
</body>
<content tag="script">
    <script src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-validate.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
    <script src="${rc.contextPath}/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/lib/jquery.form.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/jquery-validation/js/jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js"></script>

    <script type="text/javascript">
        $(function(){
            $('#form1').validate({
                rules:{
                    name:{
                        required:true,
                        maxlength:6
                    }
                }
            });
        });
        $('.datetime-picker').datetimepicker({
            rtl:Metronic.isRTL(),
            autoclose:true,
            language:'zh-CN'
        });
        var grid=new Datatable();
        if('${activity.id}'!=""){
            grid.init({
            src:$("#product_data_table"),dataTable:{
                "sDom":"<'table-scrollable't><'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'>r>>",//dataTable翻页,只保留表格底部翻页样式
                "aLengthMenu":[[10,20,50,100,150,-1],[10,20,50,100,150,"All"]],
                "aaSorting":[[0,"asc"]],
                "iDisplayLength":10,
                "<bServ></bServ>erSide":true,
                "aoColumnDefs":[{"bSortable":false,"aTargets":[5]}],
                "sAjaxSource":"${rc.contextPath}/activity/activityProductList/${activity.id}",
                "aoColumns":[
                    {"sTitle":"商品编码","mData":"product.productCode","mRender":function(data,type,row){
                        return '<a href="javascript:goView('+row.id+')">'+data+'</a>';
                    }},
                    {"sTitle":"商品名称","mData":"product.productName"},
                    {"sTitle":"商品简称","mData":"product.productShortName"},
                    {"sTitle":"所属品牌","mData":"product.brandName"},
                    {"sTitle":"所属分类","mData":"product.fullClassName"},
                    {"sTitle":"操作","mData":"id","mRender":function(data,type,row){
                        return '<a class="btn btn-xs red" href="javascript:deleteProduct('+row.id+')"><i class="fa fa-trash-o"></i>删除</a>';
                    }
                }]
            }
        });
        }

/**
 * 上传附件
 */
 function uploadImg(obj){
    $(obj).fileupload({
    autoUpload:true,
    method:'POST',
    acceptFileTypes:/(\.|\/)(gif|jpe?g|png)$/i,
    maxFileSize:2000000,
    url:'${rc.contextPath}/upload-file',
    success:function(a){
        var positionId=$(obj).attr("positionId");
        $("#imgPath_"+positionId).val(positionId+'_'+a['url'])
        $('.fileupload').removeAttr("disabled");
        showAttachment(a['ext'],a['url'],positionId);
    },error:function(){
        $('.fileupload').removeAttr("disabled");
    }
 })}
/**
 * 预览附件
 */
function showAttachment(ext,address,positionId){
    var spanHtml='<span id="imgSpan_'+positionId+'">';
    ext=ext.toLowerCase();
    if(ext=="gif"||ext=="jpeg"||ext=="jpg"||ext=="png"){
        spanHtml+='<a href="'+address+'" class="fancybox" rel="img"><img src="'+address+'" width="54px" height="54px">';
    }else if(ext=="wav"){
        spanHtml+='<a href="'+address+'" target="_blank"><img src="${rc.contextPath}/assets/voice.png" width="54px" height="54px">';
    }else if(ext=="mp4"){
        spanHtml+='<a href="'+address+'" target="_blank"><img src="${rc.contextPath}/assets/video.png" width="54px" height="54px">';
    }
    spanHtml+='</a>';
    spanHtml+='&nbsp;&nbsp;<a href="javascript:void(0)" onclick="deleteAttachment(\''+positionId+'\')">［删除］</a>';
    spanHtml+='</span>&nbsp;&nbsp;';
    $('#spanShow_'+positionId).html(spanHtml);
}

/**
 *删除附件
 */
function deleteAttachment(positionId){
    $("#imgPath_"+positionId).val('')
    $("#imgSpan_"+positionId).remove();
}
var productGrid=new Datatable();
productGrid.init({
    src:$("#data_table"),dataTable:{
        "aLengthMenu":[[10,20,50,100,150,-1],[10,20,50,100,150,"All"]],
        "aaSorting":[[0,"asc"]],
        "iDisplayLength":10,
        "bServerSide":true,
        "aoColumnDefs":[{"bSortable":false,"aTargets":[5]}],
        "sAjaxSource":"${rc.contextPath}/activity/products?activityId=${activity.id}",
        "aoColumns":[
            {"sTitle":"商品编码","mData":"productCode","mRender":function(data,type,row){
                return '<a href="javascript:goView('+row.id+')">'+data+'</a>';
            }},
            {"sTitle":"商品名称","mData":"productName"},
            {"sTitle":"商品简称","mData":"productShortName"},
            {"sTitle":"所属品牌","mData":"brandName"},
            {"sTitle":"所属分类","mData":"fullClassName"},
            {"sTitle":"操作","mData":"id","mRender":function(data,type,row){
                return '<a href="javascript:void(0);" onclick="addProduct(\''+data+'\')" class="btn btn-xs green" title ="添加"><i class="fa fa-plus"></i>添加</a>';
            }
        }]
    }
});
function showProducts(){
    productGrid.getDataTable().fnDraw();
    $('#emp_members_list_div').modal('show');
}

function addProduct(data){
    var ids=[];
    if(data){
        ids.push(data);
        ajaxUpdateProduct($("#activityId").val(),ids,productGrid) ;
    }else{
        $.each(productGrid.getSelectedRows(),function(key,val){
            ids.push(val['value']);
        });
        if(ids.length==0){
            Metronic.alert({type:'danger',icon:'warning',message:'请至少选择一名要添加的员工',container:productGrid.getTableWrapper(),place:'prepend'});
            setTimeout("$('.alert').alert('close');",3000);
            return;
        }
        bootbox.dialog({
            message: "您确认添加所选的员工吗?",
            buttons: {
                main: {
                    label: "取消",
                    className: "gray",
                    callback: function() {
                        $(this).hide();
                    }
                },
                success: {
                    label: "确定",
                    className: "green",
                    callback: function() {
                        ajaxUpdateProduct($("#activityId").val(),ids,productGrid) ;
                    }
                }
            }
        });
    }
}
function ajaxUpdateProduct(activityId ,activityProductIds ,tabDataGrid){
    Metronic.startPageLoading();
    $.ajax({
        url:'${rc.contextPath}/activity/saveActivityProduct',
        type: 'POST',
        data: {"activityId": activityId,"activityProductIds":activityProductIds},
        dataType: "json",
        traditional: true,
        success: function (data) {
            Metronic.stopPageLoading();
            Metronic.alert({type:'success',message:'添加成功,可继续添加成员.',container:tabDataGrid.getTableWrapper(),place:'prepend'});
            setTimeout("$('.alert').alert('close');",3000);
            tabDataGrid.getDataTable().fnDraw();
            grid.getDataTable().fnDraw();
        },error:function(data){
            Metronic.stopPageLoading();
            Metronic.alert({type:'danger',icon:'warning',message:'添加失败',container:tabDataGrid.getTableWrapper(),place:'prepend'});
            setTimeout("$('.alert').alert('close');",3000);
            tabDataGrid.getDataTable().fnDraw();
        }
    });
}
function ajaxDeleteProduct(activityProductIds ,tabDataGrid){
    Metronic.startPageLoading();
    $.ajax({
        url:'${rc.contextPath}/activity/deleteActivityProduct',
        type: 'POST',
        data: {"activityProductIds":activityProductIds},
        dataType: "json",
        traditional: true,
        success: function (data) {
            Metronic.stopPageLoading();
            Metronic.alert({type:'success',message:'删除成功',container:tabDataGrid.getTableWrapper(),place:'prepend'});
            setTimeout("$('.alert').alert('close');",3000);
            grid.getDataTable().fnDraw();
        },error:function(){
            Metronic.stopPageLoading();
            Metronic.alert({type:'danger',icon:'warning',message:'删除失败',container:tabDataGrid.getTableWrapper(),place:'prepend'});
            setTimeout("$('.alert').alert('close');",3000);
        }
    });
}
/**
 * 删除员工
 * @param data
 */
function deleteProduct(data){
    var ids=[];
    if(data){
        ids.push(data);
    }else{
        //批量删除
        $.each(grid.getSelectedRows(),function(key,val){
            ids.push(val['value']);
        });
        if(ids.length==0){
            Metronic.alert({type:'danger',icon:'warning',message:'请至少选择一条要删除的信息。',container:grid.getTableWrapper(),place:'prepend'});
            setTimeout("$('.alert').alert('close');",3000);
            return;
        }
    }
    bootbox.dialog({
        message: "您是否确认删除?",
        buttons: {
            main: {
                label: "取消",
                className: "gray",
                callback: function() {
                    $(this).hide();
                }
            },
            success: {
                label: "确定",
                className: "green",
                callback: function() {
                    ajaxDeleteProduct(ids,grid);
                }
            }
        }
    });
}
    </script>
</content>
</html>
