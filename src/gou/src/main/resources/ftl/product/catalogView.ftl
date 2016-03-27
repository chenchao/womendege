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
                <a href="${rc.contextPath}/product/class">商品目录组</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">商品目录组属性</a>
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
                    <i class="fa fa-gift"></i>商品目录组详情
                </div>
                <div class="actions">
                    <div class="btn-group">
                        <a href="${rc.contextPath}/product/catalog/create-attr/${d.id}" class="btn green">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480">新增商品目录组属性</span>
                        </a>
                        <a href="${rc.contextPath}/product/catalog" class="btn green">
                            <i class="fa fa-undo"></i>
                            <span class="hidden-480">返回</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal form-bordered">
                    <input type="hidden" id="classId" name="classId" value="${d.id}">

                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-2 control-label">目录组名称</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" readonly placeholder="" id="catalogName" name="catalogName" value="${d.catalogName}">
                            </div>
                            <label class="col-md-2 control-label">目录组名称</label>
                            <div class="col-md-4">
                                <input type="hidden" id="catalogType" name="catalogType" value="${d.catalogType}">
                                <input type="text" class="form-control" readonly placeholder="" id="catalogTypeName" name="catalogTypeName" value="${d.catalogTypeName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">目录组描述</label>

                            <div class="col-md-8">
                                <textarea class="form-control" readonly id="catalogName" name="catalogName" rows="2" cols="40">${d.catalogDesc}</textarea>
                            </div>
                        </div>
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
                <div class="caption"><i class="fa fa-cogs"></i>商品目录组属性列表</div>
            </div>
            <div class="portlet-body">
                <div class="table-container">
                    <div class="table-actions-wrapper">
                        <input style="width: 190px!important" type="text" class="form-control table-group-action-input form-control input-inline input-small input-sm" placeholder="请输入商品目录组属性名称" id="selectInput">
                        <button class="btn btn-sm yellow table-group-action-submit"><i class="fa fa-search"></i> 查询</button>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="data_table">
                        <thead>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
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
            setInterval(alertClose,3*1000);
        });
        var grid=new Datatable();
        grid.setAjaxParam("search_EQ_catalogId",'${d.id}');
        grid.init({
            src:$("#data_table"),dataTable:{
                "aLengthMenu":[[5,10,20,50,100,-1],[5,10,20,50,100,"All"]],
                "aaSorting":[[1,"asc"]],
                "iDisplayLength":5,
                "bServerSide":true,
                "aoColumnDefs":[{"bSortable":false,"aTargets":[0,1,2]}],
                "sAjaxSource":"${rc.contextPath}/product/catalog/attr",
                "aoColumns":[{
                    "sTitle":"目录组属性名称","mData":"catalogAttrName","mRender":function(data,type,row){
                        return '<a href="javascript:goView('+row.id+')">'+data+'</a>';
                    }
                },{"sTitle":"目录组属性排序","mData":"catalogAttrSort"},{
                    "sTitle":"操作","mData":"id","mRender":function(data,type,row){
                        return '<a class="btn btn-xs red" href="javascript:delData('+row.id+')"><i class="fa fa-trash-o"></i>删除</a></div>';
                    }
                }]
            }
        });
        function delData(id){
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
                                url:'${rc.contextPath}/product/catalog/delete-attr/'+id,type:'POST',dataType:"json",traditional:true,success:function(data){
                                    if(data.result=="success"){
                                        grid.getDataTable().fnDraw();
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
        $('.table-group-action-submit').click(function(){
            selectAjax($("#selectInput").val());
        });
        function selectAjax(value){
            grid.setAjaxParam("search_LIKE_catalogAttrName",value);
            grid.getDataTable().fnDraw();
        }
        function goView(id){
            document.location="${rc.contextPath}/product/catalog/view-attr/"+id;
        }
    </script>
</content>
</html>
