<html>
<head>
    <title>商品管理</title>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
</head>
<body>
<!--导航菜单栏-->
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="#">商品管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="${rc.contextPath}/product/class">商品分类</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">商品分类列表</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>商品分类列表</div>
                <div class="actions">
                    <div class="btn-group">
                        <a href="${rc.contextPath}/product/class/create/ROOT" class="btn green">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480">新增商品分类</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="portlet-body">
            <#if message??>
                <div id="message" class="alert alert-success">
                    <button data-dismiss="alert" class="close">×</button>
                ${message}
                </div>
            </#if>
                <div class="table-container">
                    <div class="table-actions-wrapper">
                        <input style="width: 170px!important" type="text" class="form-control table-group-action-input form-control input-inline input-small input-sm" placeholder="请输入分类编码或名称" id="selectInput">
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
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js"></script>
    <script type="text/javascript">
        function alertClose(){
            $(".alert").alert('close');
        }
        $(document).ready(function(){
            setInterval(alertClose,3*1000);
        });
        var grid=new Datatable();
        grid.setAjaxParam("search_EQ_parentClass","ROOT");
        grid.init({
            src:$("#data_table"),dataTable:{
                "aLengthMenu":[[10,20,50,100,150,-1],[10,20,50,100,150,"All"]],
                "aaSorting":[[2,"asc"]],
                "iDisplayLength":10,
                "bServerSide":true,
                "aoColumnDefs":[{"bSortable":false,"aTargets":[4,5]}],
                "sAjaxSource":"${rc.contextPath}/product/class",
                "aoColumns":[{
                    "sTitle":"分类编码","mData":"classCode","mRender":function(data,type,row){
                        return '<a href="javascript:goView('+row.id+')">'+data+'</a>';
                    }
                },{"sTitle":"分类名称","mData":"className"},{"sTitle":"分类排序","mData":"classSort"},{"sTitle":"关键字","mData":"classKeyword"},{"sTitle":"描述","mData":"classDesc"},{
                    "sTitle":"操作","mData":"id","mRender":function(data,type,row){
                        var a='<a class="btn btn-xs red" href="javascript:delData('+row.id+')"><i class="fa fa-trash-o"></i>删除</a>';
                        var b='<a class="btn btn-xs blue" href="javascript:subView('+row.classCode+')"><i class="fa fa-edit"></i>编辑子类</a></div>';
                        return a+b;
                    }
                }]
            }
        });
        function subView(code){
            document.location="${rc.contextPath}/product/class/sub-view/"+code;
        }
        function goView(id){
            document.location="${rc.contextPath}/product/class/view/"+id+"/ROOT";
        }
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
                                url:'${rc.contextPath}/product/class/delete/'+id,type:'POST',dataType:"json",traditional:true,success:function(data){
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
            grid.setAjaxParam("search_EQ_parentClass","ROOT");
            grid.setAjaxParam("search_OR_classCode|className",value);
            grid.getDataTable().fnDraw();
        }
    </script>
</content>
</html>
