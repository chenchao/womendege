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
                <a href="${rc.contextPath}/product/detail">商品</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">商品列表</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>商品列表</div>
                <div class="actions">
                    <div class="btn-group">
                        <a href="${rc.contextPath}/product/detail/create" class="btn green">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480">新增商品</span>
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
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_code"></td>
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
        grid.init({
            src:$("#data_table"),dataTable:{
                "aLengthMenu":[[10,20,50,100,150,-1],[10,20,50,100,150,"All"]],
                "aaSorting":[[0,"asc"]],
                "iDisplayLength":10,
                "bServerSide":true,
                "aoColumnDefs":[{"bSortable":false,"aTargets":[5]}],
                "sAjaxSource":"${rc.contextPath}/product/detail",
                "aoColumns":[
                    {"sTitle":"商品编码","mData":"productCode","mRender":function(data,type,row){
                        return '<a href="javascript:goView('+row.id+')">'+data+'</a>';
                    }},
                    {"sTitle":"商品名称","mData":"productName"},
                    {"sTitle":"商品简称","mData":"productShortName"},
                    {"sTitle":"所属品牌","mData":"brandName"},
                    {"sTitle":"所属分类","mData":"fullClassName"},
                    {"sTitle":"操作","mData":"id","mRender":function(data,type,row){
                        return '<a class="btn btn-xs red" href="javascript:delData('+row.id+')"><i class="fa fa-trash-o"></i>删除</a>';
                    }
                }]
            }
        });
        function goView(id){
            document.location="${rc.contextPath}/product/detail/sub-view/"+id;
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
                                url:'${rc.contextPath}/product/detail/delete/'+id,type:'POST',dataType:"json",traditional:true,success:function(data){
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
    </script>
</content>
</html>
