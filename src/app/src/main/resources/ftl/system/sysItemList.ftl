<html>
<head>
    <title>字典管理</title>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/select2/select2.css" type="text/css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css" type="text/css"/>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="${rc.contextPath}/">系统设置</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">数据字典</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>
<div class="row _list">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-user"></i>字典列表
                </div>
                <div class="actions">
                    <a href="${rc.contextPath}/system/sysitem/create" class="btn green add">
                        <i class="fa fa-plus"></i>
                        <span class="hidden-480">新建字典</span>
                    </a>
                </div>
            </div>
            <div class="portlet-body">
            <#if message??>
                <div class="alert alert-success">
                    <button data-dismiss="alert" class="close">×</button>
                ${message}
                </div>
            </#if>
                <div class="table-container">
                    <table class="table table-striped table-bordered table-hover" id="item-list-table">
                        <thead>
                        <tr role="row" class="heading">
                            <th width="10%">项目代码</th>
                            <th width="10%">对象代码</th>
                            <th width="10%">说明A</th>
                            <th width="10%">说明B</th>
                            <th width="10%">说明C</th>
                            <th width="15%">说明D</th>
                            <th width="15%">说明E</th>
                            <th width="10%">状态</th>
                            <th width="10%">操作</th>
                        </tr>
                        <tr role="row" class="filter">
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_itemId"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_objId"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_annexa"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_annexb"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_annexc"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_annexd"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_annexe"></td>
                            <td>
                                <select name="search_EQ_active" class="form-control  form-filter input-sm">
                                    <option selected="selected" value="">请选择</option>
                                    <option value="ENABLE">启用</option>
                                    <option value="DISABLE">禁用</option>
                                </select>
                            </td>
                            <td>
                                <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i>查询</button>
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
    <script src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js" type="text/javascript"></script>
    <script src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
    <script type="text/javascript">
        var grid=new Datatable();
        grid.init({
            src:$('#item-list-table'),
            dataTable:{
                "bServerSide":true,
                "sAjaxSource":"${rc.contextPath}/system/sysitem/list",
                "aoColumns":[
                    { "sTitle":"项目代码","mData":"itemId"},
                    { "sTitle":"对象代码","mData":"objId","mRender":function(data,type,row){
                        return'<a href="${rc.contextPath}/system/sysitem/update/'+row.id+'">'+data+'</a>';
                    }},
                    { "sTitle":"说明A","mData":"annexa"},
                    { "sTitle":"说明B","mData":"annexb"},
                    { "sTitle":"说明C","mData":"annexc"},
                    { "sTitle":"说明D","mData":"annexd"},
                    { "sTitle":"说明E","mData":"annexe"},
                    {"sWidth":"10%","sTitle":"状态","mData":"active","sDefaultContent":"","mRender":function(data){
                        return "ENABLE"==data?"启用":"禁用";
                    }},
                    { "sTitle":"操作","mData":"id","mRender":function(data,type,row){
                        return'<div><a class="delete btn default btn-xs black" href="javascript:doDelete('+row.id+');" ><i class="fa fa-trash-o"></i>删除</a></div>';
                    }}
                ]
            }
        });
        function doDelete(id){
            if(confirm("确认要删除此资源及其下级所有资源吗？"))
                $.ajax({
                    url:'${rc.contextPath}/system/sysitem/delete/'+id,
                    type:'DELETE',
                    success:function(){
                        grid.getDataTable().fnDraw();
                    }
                });
        }
    </script>
</content>
</html>