<html>
<head>
    <title>平台配置</title>
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
    <!-- END PAGE LEVEL STYLES -->
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="${rc.contextPath}/">平台配置</a>
                <i class="fa fa-angle-right"></i>
            </li>

        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>平台配置列表</div>
                <div class="actions">

                    <div class="btn-group">

                        <button onclick="toAdd()" class="btn btn-sm btn-default">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480">新增</span>
                        </button>
                        <a href="${rc.contextPath}/platform/setup/showNote" class="btn btn-sm btn-default">
                            <i class="fa icon-import_application"></i>
                            <span class="hidden-480">查看系统属性说明</span>
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
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonValidation.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function(){
            $('#editDataDiv').hide();
            var oTable=$('#allocationDataTable').dataTable({
                "bProcessing":true,//查询显示
                "bStateSave":false,
                "bServerSide":false,//从服务器加载
                "bAutoWidth":true,//列自适应浏览器宽度
                "bDestroy":true,
                "bRetrieve":true,
                "bSort":true,//排序
                "bPaginate":true,//是否开启滚动条
                "oLanguage":{
                    "sLengthMenu":"每页显示 _MENU_ 条记录",
                    "sZeroRecords":"抱歉, 没有找到记录",
                    "sInfo":"从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                    "sInfoEmpty":"",
                    "sInfoFiltered":"(从 _MAX_ 条数据中检索)","sSearch":"搜索"
                },
                "aLengthMenu":[
                    [10,25,50,100],
                    [10,25,50,100]
                ],
                "aoColumnDefs":[
                    { "bSortable":false,"aTargets":[ 2 ] }
                ],//指定某列不可排序
                "sAjaxSource":"${rc.contextPath}/platform/setup/list",
                "aoColumns":[
                    { "sWidth":"20%","sTitle":"键","mData":"key"},
                    { "sWidth":"69%","sTitle":"值","mData":"value"},
                    { "sWidth":"10%","sTitle":"操作","mData":"value","mRender":function(data,type,full){
                        var c='<a   href="javascript:void(0);" onclick="toEdit(\''+full.key+'\',\''+full.value+'\',this)">编辑</a>';
                        return "<span class='leftSize_s'>"+c+'</span>';
                    }}
                ]
            });
            oTable.fnDraw();
        });
        /**
         * 编辑
         */
        function toEdit(key,value,obj){
            var nRow=$(obj).parents('tr')[0], jqTds=$('>td',nRow), c='<a  href="javascript:void(0);" onclick="toSave(\''+key+'\',this)">保存</a>', d="<span class='leftSize_s'>"+c+'</span>';
            jqTds[1].innerHTML='<input type="text" style="width:100%;" id= "key_'+key+'" class="form-control" value="'+value+'">';
            jqTds[2].innerHTML=d;
        }
        /**
         * 新增显示页面
         * @param oTable
         * @param nRow
         */
        function editRow(oTable,nRow){
            var aData=oTable.fnGetData(nRow);
            var jqTds=$('>td',nRow);
            jqTds[0].innerHTML='<input type="text" class="form-control" id="key_'+aData[0]+'">';
            jqTds[1].innerHTML='<input type="text" style="width:100%;" class="form-control" id="s_key_'+aData[1]+'">';
            jqTds[2].innerHTML=aData[2];
        }
        /**
         * 新增系统属性
         */
        function toAdd(){
            var oTable=$('#allocationDataTable').dataTable();
            var c='<a href="javascript:void(0);" onclick="toSave(\''+0+'\',this)">保存</a>';
            var d='<a href="javascript:void(0);" onclick="toCanle(this)">取消</a>';
            var e="<span class='leftSize_s'>"+c+"</span> <span class='leftSize_c'>"+d+"</span>";
            var aiNew=oTable.fnAddData(['0','0',e]);
            var nRow=oTable.fnGetNodes(aiNew[0]);
            editRow(oTable,nRow);
        }
        /**
         * 取消 新增 文本框
         */
        function toCanle(obj){
            var oTable=$('#allocationDataTable').dataTable();
            var nRow=$(obj).parents('tr')[0];
            oTable.fnDeleteRow(nRow);
        }
        /**
         * 保存
         */
        function toSave(key,obj){
            var oTable=$('#allocationDataTable').dataTable();
            var nRow=$(obj).parents('tr')[0] , value=$('#key_'+key).val(), tip='0';
            if(key=='0'){
                value=$('#s_key_'+key).val(), key=$('#key_'+key).val();
                tip='1';
            }
            if(key!=null&&key!=''&&value!=null&&value!=''){
                if(tip=='1'){
                    oTable.fnUpdate(key,nRow,0,false);
                    oTable.fnUpdate(value,nRow,1,false);
                    oTable.fnUpdate(value,nRow,2,false);
                }else{
                    oTable.fnUpdate(value,nRow,1,false);
                    oTable.fnUpdate(value,nRow,2,false);
                }
                oTable.fnDraw();
                $.post("${rc.contextPath}/platform/setup/update-properties?random="+Math.random(),{"key":key,"value":value,"tip":tip},function(data){
                    data=eval(data);
                    if(data.status=="true"){
                        alertHint(data.message,'');
                    }
                });
            }else{
                alertHint('键，值不能为空');
            }
        }

    </script>
</content>
</html>
