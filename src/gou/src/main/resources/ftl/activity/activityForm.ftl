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
                    <input name="id" type="hidden" value="${activity.id}"/>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-2 control-label">活动名称</label>

                            <div class="col-md-2">
                                <div class="input-group">
                                <#--<span class="input-group-addon"><i class="fa fa-key"></i></span>-->
                                    <input check-type='required' name="name" type="text" class="form-control" placeholder="" value="${activity.name}">

                                </div>
                            </div>

                            <label class="col-md-2 control-label">活动编号</label>
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
                            <label class="col-md-2 control-label">开始时间</label>
                            <div class="col-md-2">
                                <div class="input-group date datetime-picker margin-bottom-5" data-date-format="yyyy-mm-dd hh:ii">
                                    <input type="text" class="form-control form-filter input-sm" readonly name="startTimeStr" value="${activity.startTimeStr?if_exists}" placeholder="创建时间">
				                    <span class="input-group-btn">
				                    <button class="btn btn-sm default date-set" type="button"><i class="fa fa-calendar"></i></button>
				                     </span>
                                </div>
                            </div>
                            <label class="col-md-2 control-label">结束时间</label>
                            <div class="col-md-4">
                                <div class="input-group date datetime-picker margin-bottom-5" data-date-format="yyyy-mm-dd hh:ii">
                                    <input type="text" class="form-control form-filter input-sm" readonly name="endTimeStr" value="${activity.endTimeStr?if_exists}" placeholder="结束时间">
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
                                ${activity.state}
                                </div>
                            </div>
                        </div>

                    <#--<div class="form-group">-->
                    <#--<label class="col-md-2 control-label">创建时间</label>-->

                    <#--<div class="col-md-4">-->
                    <#--<div class="input-group">-->
                    <#--<span></span>-->
                    <#--</div>-->
                    <#--</div>-->

                    <#--<label class="col-md-2 control-label">创建人</label>-->
                    <#--<div class="col-md-4">-->
                    <#--<div class="input-group">-->
                    <#--<span></span>-->
                    <#--</div>-->
                    <#--</div>-->
                    <#--</div>-->
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
                                <th width="40%">图片</th>
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
                                            <span id="spanShow_${ap.position.id}" style="padding-left: 50px;font-size: 14px;"></span>
                                        </div>
                                    </div>
                                    <#if ap.imgPath!= '' && ap.imgPath!= null>
                                        <img src="${rc.contextPath}/${ap.imgPath}"/>
                                    </#if>
                                    <input type="hidden" name="imgPath_${ap.position.id}"/>
                                </td>
                                <td>
                                    <div class="form-group">
                                        <span id="spanDocId" class="btn btn-success fileinput-button input-group-btn" style="width:100px;display: inline-block;margin-bottom: 5px;margin-left: 15px;">
                                            <span>上传附件</span><input class="fileupload" positionId="${ap.position.id}" title="后台只支持上传图片格式（gif、jpeg、jpg、png），文件需小于2兆" type="file" name="files" multiple style="width:100px;display: inline-block">
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
                            .contextPath}/order'">
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
                <ul class="page-breadcrumb breadcrumb" style="margin: 0px;padding: 10px;">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="javascript:void(0)">活动商品</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                </ul>
            </div>
        </div>
        <div class="table-container">
            <div class="table-actions-wrapper"><span></span>
            </div>
            <table class="table table-striped table-bordered table-hover" style="width: 81%" align="center" id="comment_data_table">
                <thead>
                <tr role="row" class="heading">
                    <th width="10%">位置</th>
                    <th width="10%">编码</th>
                    <th width="10%">类型</th>
                    <th width="10%">宽</th>
                    <th width="10%">高</th>
                    <th width="40%">图片</th>
                    <th width="10%">操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </#if>
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

    <script type="text/javascript">
        $('.datetime-picker').datetimepicker({
            rtl:Metronic.isRTL(),
            autoclose:true,
            language:'zh-CN'
        });
        var grid=new Datatable();
        if('${activity.id}'!=""){
            grid.init({
                src:$("#comment_data_table"),
                onSuccess:function(grid){
                },
                onError:function(grid){
                },
                dataTable:{
                    //"sDom":"<'table-scrollable't><'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'>r>>",//dataTable翻页,只保留表格底部翻页样式
                    "sDom":'<<"clear">>rt<"bottom">',
                    "aLengthMenu":[
                        [10,20,50,-1],
                        [10,20,50,"All"]
                    ],
                    "iDisplayLength":10,
                    "bServerSide":true,
                    "sAjaxSource":"${rc.contextPath}/activity/activityProductList/${activity.id}",
                    "aaSorting":[
                        [ 0,"desc" ]
                    ],
                    "aoColumns":[

                        { "sTitle":"位置","mData":"orderNo","mRender":function(data,type,row){
                        return data;
                        }},
                        {  "sTitle":"编码","mData":"quatity","mRender":function(data,type,row){
                            return data;
                        }},
                        {  "sTitle":"类型","mData":"quatity","mRender":function(data,type,row){
                            return data;
                        }},
                        {  "sTitle":"宽","mData":"quatity","mRender":function(data,type,row){
                            return data;
                        }},
                        {  "sTitle":"高","mData":"price","mRender":function(data,type,row){
                            return data;
                        }},
                        {  "sTitle":"图片","mData":"price","mRender":function(data,type,row){
                            return data;
                        }},
                        {  "sTitle":"操作","mData":"price","mRender":function(data,type,row){
                            return data;
                        }}
                    ]
                }
            });
        }


        function getYmd(date){
            return date.substr(0,10);
        }

/**
 * 上传附件
 */
 var currentImgBtn;
 $('.fileupload').click(function(){
    currentImgBtn=$(this).attr("positionId");
    alert(currentImgBtn);
    $('.fileupload').attr("disabled","disabled");
 });
$('.fileupload').fileupload({
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
        alert(1);
        $('.fileupload').removeAttr("disabled");
    },error:function(){
    alert(0);
        $('.fileupload').removeAttr("disabled");
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
    alert(currentImgBtn);
    $('#spanShow_'+currentImgBtn).append(spanHtml);
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
    </script>
</content>
</html>
