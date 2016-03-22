<html>
<head>
    <title>平台配置</title>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="${rc.contextPath}/">查看系统属性说明</a>
                <i class="fa fa-angle-right"></i>
            </li>

        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>查看系统属性说明</div>
                <div class="actions">

                    <div class="btn-group">


                        <a href="${rc.contextPath}/platform/allocation" onclick="" class="btn btn-sm btn-default">
                            <i class="fa icon-import_application"></i>
                            <span class="hidden-480">返回</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="portlet-body">

                <div class="table-container">
                    <div class="table-actions-wrapper">

                    </div>
                    <table class="table table-striped table-bordered table-hover" id="allocationDataTable">
                    </table>
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
    <script src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        /**
         * 加载并渲染  系统属性说明 table
         */
        jQuery(document).ready(function(){
            var oTable=$('#allocationDataTable').dataTable({
                "bProcessing":true,//查询显示
                "bStateSave":false,
                "bServerSide":false,//从服务器加载
                "bAutoWidth":true,//列自适应浏览器宽度
                "bDestroy":true,
                "bRetrieve":true,
                "bSort":true,//排序
                "bPaginate":false,//是否分页
                "oLanguage":{
                    "sLengthMenu":"每页显示 _MENU_ 条记录",
                    "sZeroRecords":"抱歉, 没有找到记录",
                    "sInfo":"从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                    "sInfoEmpty":"",
                    "sInfoFiltered":"(从 _MAX_ 条数据中检索)","sSearch":"搜索"
                },
                "aoColumnDefs":[
                    { "bSortable":false,"aTargets":[ 0 ] }
                ],//指定某列不可排序
                "sAjaxSource":"${rc.contextPath}/platform/setup/show-index",
                "aoColumns":[
                    { "sWidth":"19%","bSortable":false,"sTitle":"关于clientInfo.properties属性文件说明","mData":"value","sDefaultContent":"","mRender":function(data,type,full){
                        return "<span class='leftSize'>"+data+"</span>";
                    }}
                ]
            });
            oTable.fnDraw();
        });


    </script>
</content>
</html>
