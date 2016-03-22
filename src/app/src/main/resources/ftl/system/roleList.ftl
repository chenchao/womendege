<html>
<head>
    <title>角色管理</title>
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
                <a href="#">角色管理</a>
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
                    <i class="fa fa-user"></i>角色列表
                </div>
                <div class="actions">
                    <a href="${rc.contextPath}/system/role/create" class="btn green add">
                        <i class="fa fa-plus"></i>
                        <span class="hidden-480">新建角色</span>
                    </a>
                </div>
            </div>
            <div class="portlet-body">
            <#if message??>
                <div class="alert alert-success">
                    <button data-dismiss="alert" class="close">×</button>
                ${(message)!}
                </div>
            </#if>
                <div class="table-container">
                    <table class="table table-striped table-bordered table-hover" id="role-list-table">
                        <thead>
                        <tr role="row" class="heading">
                            <th width="15%">名称</th>
                            <th width="15%">编码</th>
                            <th width="15%">备注</th>
                            <th width="15%">状态</th>
                            <th width="15%">操作</th>
                        </tr>
                        <tr role="row" class="filter">
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_name">
                            </td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_code">
                            </td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_description"></td>
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
            <div id="user_list_div" class="modal fade" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog" style="width:800px;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 class="modal-title">用户列表</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row" id="tableDatas">
                                <div class="col-md-12">
                                    <div class="portlet">
                                        <div class="portlet-body">
                                            <table class="table table-striped table-bordered table-hover" id="user_list_table">
                                                <thead>
                                                <tr role="row" class="heading">
                                                    <th width="15%">登陆名</th>
                                                    <th width="15%">姓名</th>
                                                    <th width="15%">邮箱</th>
                                                    <th width="15%">操作</th>
                                                </tr>
                                                <tr role="row" class="filter">
                                                    <input type="hidden"  name="roleId" id="roleId">
                                                    <!-- 登陆名 -->
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_loginName"></td>
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_name"></td>
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_email"></td>
                                                    <td>
                                                        <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> 搜索
                                                        </button>
                                                        <button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i> 重置</button>
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
            src:$('#role-list-table'),
            onSuccess:function(grid){
            },
            onError:function(grid){
            },
            dataTable:{
                "bServerSide":true,
                "sAjaxSource":"${rc.contextPath}/system/role/list",
                "aoColumnDefs":[
                    { "bSortable":false,"aTargets":[ 2,3,4] }
                ],//设置不排序得列
                "aoColumns":[
                    { "sTitle":"名称","mData":"name","mRender":function(data,type,row){
                        return'<a href="${rc.contextPath}/system/role/update/'+row.id+'">'+data+'</a>';
                    }},
                    { "sTitle":"代号","mData":"code"},
                    { "sTitle":"描述","mData":"description"},
                    {"sWidth":"10%","sTitle":"状态","mData":"active","sDefaultContent":"","mRender":function(data){
                        return "ENABLE"==data?"启用":"禁用";
                    }},
                    { "sTitle":"操作","mData":"id","sDefaultContent":"","mRender":function(data,type,row){
                        var a='<a class="btn btn-xs red" href="javascript:void(0);" onclick="doDelete(\''+row.id+'\')" title ="删除"><i class="fa fa-trash-o"></i>删除</a>';
                        var b='<a class="btn btn-xs green" href="javascript:void(0);" onclick="seeUser(\''+row.id+'\')" title ="查看员工"><i class="fa fa-search"></i>查看员工</a>';
                        return a + b ;
                    }}
                ]
            }
        });
        var userGrid=new Datatable();
        var $userList_data_table=$("#user_list_table");
        userGrid.init({
            src:$userList_data_table,
            onSuccess:function(userGrid){
                console.log(userGrid);
            },
            onError:function(userGrid){
            },
            dataTable:{
                "bServerSide":true,
                "sAjaxSource":"${rc.contextPath}/system/role/query-user-list",
                "aoColumnDefs":[
                    { "bSortable":false,"aTargets":[ 0,1,2,3] }
                ],//设置不排序得列
                "aoColumns":[
                    { "sTitle":"登陆名","mData":"loginName"},
                    { "sTitle":"姓名","mData":"name"},
                    { "sTitle":"邮箱","mData":"email","mRender":function(data){
                        return "<a href='mailto:"+data+"'>"+data+"</a>";
                    }},
                    { "sTitle":"操作","mData":"id","sDefaultContent":"","mRender":function(data,type,row){

                    }}
                ]
            }
        });
        function doDelete(id){
            if(confirm("确认要删除此资源及其下级所有资源吗？"))
                $.ajax({
                    url:'${rc.contextPath}/system/role/delete/'+id,
                    success:function(){
                        grid.getDataTable().fnDraw();
                    }
                });
        }
        function seeUser(id){
            userGrid.setAjaxParam("roleId",id);
            $("#roleId").val(id);
            userGrid.getDataTable().fnDraw();
            $('#user_list_div').modal('show');
        }
    </script>
</content>
</html>