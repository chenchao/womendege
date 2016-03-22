<html>
<head>
    <title>团队管理</title>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
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
                <a href="#">团队管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>团队列表</div>
                <div class="actions">
                    <div class="btn-group">
                        <a href="${rc.contextPath}/system/team/add-team" class="btn green">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480">新增团队</span>
                        </a>
                        <a href="javascript:void(0);" onclick="deleteAll(null)" class="btn red">
                            <i class="fa fa-trash-o"></i>
                            <span class="hidden-480">删除</span>
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
                    <table class="table table-striped table-bordered table-hover" id="team_list_table">
                        <thead>
                        <tr role="row" class="heading">
                            <th width="5%"><input type="checkbox" class="group-checkable"></th>
                            <!-- <th width="10%">唯一编码</th> -->
                            <th width="10%">
                                名称
                            </th>
                            <th width="10%">
                                负责人用户名
                            </th>
                            <th width="10%">
                                负责人姓名
                            </th>
                            <th width="10%">
                                状态
                            </th>
                            <th width="15%">
                                描述
                            </th>
                            <th width="15%">
                                操作
                            </th>
                        </tr>
                        <tr role="row" class="filter">
                            <td></td>
                            <!-- <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_code"></td> -->
                            <td>
                                <input type="text" class="form-control form-filter input-sm" name="search_LIKE_name">
                            </td>
                            <td>
                                <!--负责人用户名 -->
                                <input type="text" class="form-control form-filter input-sm" name="search_LIKE_master.loginName">
                            </td>
                            <td>
                                <!--负责人中文名 -->
                                <input type="text" class="form-control form-filter input-sm" name="search_LIKE_master.userName">
                            </td>
                            <td>
                                <select name="search_EQ_active" class=" form-filter input-inline input-sm">
                                    <option value="">请选择</option>
                                    <#list status  as q>
                                        <option value='${q.name()}'>${q.typeName}</option>
                                    </#list>
                                </select>
                            </td>
                            <td>
                                <input type="text" class="form-control form-filter input-sm" name="search_LIKE_description">
                            </td>
                            <td>
                                <button class="btn btn-sm yellow filter-submit margin-bottom"><i
                                        class="fa fa-search"></i> 搜索
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

            <div id="team_employee_div" class="modal fade" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog" style="width:900px;">
                    <div class="modal-content">
                        <div class="modal-header" style="border-bottom:none;">
                            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row" id="tableDatas">
                                <div class="col-md-12">
                                    <div class="portlet">
                                        <div class="portlet-title">
                                            <div class="caption"><i class="fa fa-cogs"></i>团队成员列表</div>
                                            <div class="actions">
                                                <div class="btn-group">
                                                    <a href="javascript:void(0);" onclick="deleteEmployee(null)" class="btn red">
                                                        <i class="fa fa-trash-o"></i>
                                                        <span class="hidden-480">删除</span>
                                                    </a>
                                                    <a href="javascript:void(0);" onclick="showWinEmployee()" class="btn green">
                                                        <i class="fa fa-plus"></i>
                                                        <span class="hidden-480">新增成员</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <table class="table table-striped table-bordered table-hover" id="emp_list_table">
                                                <thead>
                                                <tr role="row" class="heading">
                                                    <th width="5%"><input type="checkbox" class="group-checkable"></th>
                                                    <th width="5%">照片</th>
                                                    <th width="10%">用户Id</th>
                                                    <th width="10%">登陆名</th>
                                                    <th width="10%">姓名</th>
                                                    <th width="15%">邮箱</th>
                                                    <th width="15%">在职</th>
                                                    <th width="10%">来自系统</th>
                                                    <th width="20%">操作</th>
                                                </tr>
                                                <tr role="row" class="filter">
                                                    <input type="hidden" class="form-control form-filter input-sm" name="search_LIKE_teamId" id="teamId">
                                                    <td><input type="hidden" class="form-control form-filter input-sm" name="searchTemId" id="searchTemId"></td>
                                                    <td></td>
                                                    <!-- 用户Id -->
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userId"></td>
                                                    <!-- 登陆名 -->
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_loginName"></td>
                                                    <!-- 姓名 -->
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userName"></td>
                                                    <!-- 邮箱 -->
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_email"></td>
                                                    <!-- 在职 -->
                                                    <td>
                                                        <select name="search_EQ_job" class="form-control  form-filter input-sm">
                                                            <option selected="selected" value>请选择</option>
                                                            <#list station  as q>
                                                                <option value='${q.name()}'>${q.typeName}</option>
                                                            </#list>
                                                        </select>
                                                    </td>
                                                    <!-- 来自系统 -->
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userSystem"></td>
                                                    <td>
                                                        <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> 搜索</button>
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
                                            <div class="caption"><i class="fa fa-cogs"></i>员工列表</div>
                                            <div class="actions">
                                                <div class="btn-group">
                                                    <a href="javascript:void(0);" onclick="addEmployee(null)" class="btn green">
                                                        <i class="fa fa-plus"></i>
                                                        <span class="hidden-480">添加</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <table class="table table-striped table-bordered table-hover" id="emp_members_list_table">
                                                <thead>
                                                <tr role="row" class="heading">
                                                    <th width="5%"><input type="checkbox" class="group-checkable"></th>
                                                    <th width="5%">照片</th>
                                                    <th width="10%">用户Id</th>
                                                    <th width="10%">登陆名</th>
                                                    <th width="10%">姓名</th>
                                                    <th width="15%">邮箱</th>
                                                    <th width="10%">在职</th>
                                                    <th width="10%">来自系统</th>
                                                    <th width="20%">操作</th>
                                                </tr>
                                                <tr role="row" class="filter">
                                                    <td></td>
                                                    <td></td>
                                                    <!-- 用户Id -->
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userId"></td>
                                                    <!-- 登陆名 -->
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_loginName"></td>
                                                    <!-- 姓名 -->
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userName"></td>
                                                    <!-- 邮箱 -->
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_email"></td>
                                                    <!-- 在职 -->
                                                    <td>
                                                        <select name="search_EQ_job" class="form-control  form-filter input-sm">
                                                            <option selected="selected" value>请选择</option>
                                                            <#list station  as q>
                                                                <option value='${q.name()}'>${q.typeName}</option>
                                                            </#list>
                                                        </select>
                                                    </td>
                                                    <!-- 来自系统 -->
                                                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userSystem"></td>
                                                    <td>
                                                        <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> 搜索</button>
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
<script src="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/summernote.min.js" type="text/javascript"></script>
<script src="${rc.contextPath}/assets/global/plugins/bootstrap-summernote/lang/summernote-zh-CN.js" type="text/javascript"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/jstree/dist/jstree.js"></script>
<script type="text/javascript"
        src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js"></script>
<script src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
<script type="text/javascript">

var grid=new Datatable();
var $attendees_data_table=$("#team_list_table");
grid.init({
    src:$attendees_data_table,
    onSuccess:function(grid){
    },
    onError:function(grid){
    },
    dataTable:{
        "aoColumnDefs":[
           // { "bSortable":false,"aTargets":[ 0,1,6,7 ] }
           { "bSortable":false,"aTargets":[ 0,5,6 ] }
        ],//指定某列不可排序
        "bServerSide":true,
        "sAjaxSource":"${rc.contextPath}/system/team/search-list",
        "aoColumns":[
            { "mData":"id","mRender":function(data,type){
                return'<input type="checkbox" class="group-checkable" value="'+data+'">';
            }},
            //{ "sTitle":"唯一编码","mData":"code"},
            { "sTitle":"名称","mData":"name"},
            { "sTitle":"负责人用户名","mData":"master.loginName"},
            { "sTitle":"负责人姓名","mData":"master.userName"},
            { "sTitle":"状态","mData":"active","sDefaultContent":"","mRender":function(data,type,full){
                return "ENABLE"==data?"启用":"禁用";
            }},
            { "sTitle":"描述","mData":"description" ,"mRender":function(data,type,full){
                return "<div style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;wzy:expression(void(this.title=this.innerText));width:150px;' title='"+data+"'>"+data+"</div>";
            }},
            { "sTitle":"操作","mData":"id","sDefaultContent":"","mRender":function(data,type,full){
                var a='<a href="${rc.contextPath}/system/team/update-team/'+data+'"  class="btn btn-xs purple" title ="编辑"><i class="fa fa-edit"></i>编辑</a>';
                var b='<a href="javascript:void(0);" onclick="showEmployee(\''+data+'\')" class="btn btn-xs green" title ="查看成员"><i class="fa fa-search"></i>查看成员</a>';
                var c='<a href="javascript:void(0);" onclick="deleteAll(\''+data+'\')" class="btn btn-xs red" title ="删除"><i class="fa fa-trash-o"></i>删除</a>';
                return a+b+c;
            }}
        ]
    }
});

var empGrid=new Datatable();
empGrid.init({
    src:$('#emp_list_table'),
    onSuccess:function(empGrid){
    },
    onError:function(empGrid){
    },
    dataTable:{
        "bServerSide":true,
        "sAjaxSource":"${rc.contextPath}/system/team/query-emp-list",
        "aoColumnDefs":[
            {'bSortable':false,'aTargets':[0]},
            {'bSortable':false,'aTargets':[1]},
            {'bSortable':false,'aTargets':[8]}
        ],
        "aoColumns":[
            { "mData":"id","mRender":function(data,type){
                return'<input type="checkbox" class="group-checkable" value="'+data+'">';
            }},
            { "sTitle":"照片","mData":"imageAddress","sDefaultContent":"","mRender":function(data,type,full){
                if(!data){
                    data="/assets/global/img/default.jpg";
                }
                return '<img src="${rc.contextPath}'+data+'" width="60px" height="60px" style="margin:auto 0;" >';
            }},
            { "sTitle":"三方系统ID","mData":"userId"},
            { "sTitle":"登陆名","mData":"loginName"},
            { "sTitle":"姓名","mData":"userName"},
            { "sTitle":"邮箱","mData":"email","mRender":function(data){
                if(null==data){
                    data = '' ;
                } else {
                    data = "<a href='mailto:"+data+"'>"+data+"</a>";
                }
                return data ;
            }},
            { "sTitle":"状态","mData":"job","sDefaultContent":"","mRender":function(data){
                return "ENABLE"==data?"在职":"离职";
            }},
            { "sTitle":"来自系统","mData":"userSystem"},
            { "sTitle":"操作","mData":"id","mRender":function(data,type,row){
                return '<a href="javascript:void(0);" onclick="deleteEmployee(\''+data+'\')" class= "btn btn-xs red" title ="删除"><i class="fa fa-trash-o"></i>删除</a>';
            }}
        ]
    }
});


var empMembersGrid=new Datatable();
empMembersGrid.init({
    src:$('#emp_members_list_table'),
    onSuccess:function(empMembersGrid){
    },
    onError:function(empMembersGrid){
    },
    dataTable:{
        "bServerSide":true,
        "sAjaxSource":"${rc.contextPath}/system/team/emp-member-list",
        "aoColumnDefs":[
            {'bSortable':false,'aTargets':[0]},
            {'bSortable':false,'aTargets':[1]},
            {'bSortable':false,'aTargets':[8]}
        ],
        "aoColumns":[
            { "mData":"id","mRender":function(data,type){
                return'<input type="checkbox" class="group-checkable" value="'+data+'">';
            }},
            { "sTitle":"照片","mData":"imageAddress","sDefaultContent":"","mRender":function(data,type,full){
                if(!data){
                    data="/assets/global/img/default.jpg";
                }
                return '<img src="${rc.contextPath}'+data+'" width="60px" height="60px" style="margin:auto 0;" >';
            }},
            { "sTitle":"三方系统ID","mData":"userId"},
            { "sTitle":"登陆名","mData":"loginName"},
            { "sTitle":"姓名","mData":"userName"},
            { "sTitle":"邮箱","mData":"email","mRender":function(data){
                if(null==data){
                    data = '' ;
                } else {
                    data = "<a href='mailto:"+data+"'>"+data+"</a>";
                }
                return data ;
            }},
            { "sTitle":"状态","mData":"job","sDefaultContent":"","mRender":function(data){
                return "ENABLE"==data?"在职":"离职";
            }},
            { "sTitle":"来自系统","mData":"userSystem"},
            { "sTitle":"操作","mData":"id","mRender":function(data,type,row){
                return '<a href="javascript:void(0);" onclick="addEmployee(\''+data+'\')" class="btn btn-xs green" title ="添加"><i class="fa fa-plus"></i>添加</a>';
            }}
        ]
    }
});

function showEmployee(data){
    empGrid.setAjaxParam("teamId",data);
    $("#teamId").val(data);
    $("#searchTemId").val(data);
    empGrid.getDataTable().fnDraw();
    $('#team_employee_div').modal('show');
}

function showWinEmployee(){
    empMembersGrid.getDataTable().fnDraw();
    $('#emp_members_list_div').modal('show');
}


function addEmployee(data){
    var ids=[];
    if(data){
        ids.push(data);
        ajaxUpdateEmployee(ids ,$("#searchTemId").val() ,'update',empMembersGrid) ;
    }else{
        $.each(empMembersGrid.getSelectedRows(),function(key,val){
            ids.push(val['value']);
        });
        if(ids.length==0){
            Metronic.alert({type:'danger',icon:'warning',message:'请至少选择一名要添加的员工',container:empMembersGrid.getTableWrapper(),place:'prepend'});
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
                        ajaxUpdateEmployee(ids ,$("#searchTemId").val() ,'update',empMembersGrid) ;
                    }
                }
            }
        });
    }
}
function ajaxUpdateEmployee(ids ,tid ,action,tabDataGrid){
    Metronic.startPageLoading();
    $.ajax({
        url:'${rc.contextPath}/system/team/update-dele-emp',
        type: 'POST',
        data: {"uIds": ids,"tid":tid , "action": action},
        dataType: "json",
        traditional: true,
        success: function (data) {
            var tip = '' ,failTip = '' ;
            if('update'==action){
                tip = '添加成功,可继续添加成员.' ;
                failTip = '添加失败.' ;
            }else if('del'==action){
                tip = '删除成功.' ;
                failTip = data.info ;
            }

            Metronic.stopPageLoading();
            if(data.stat){
                Metronic.alert({type:'success',message:tip,container:tabDataGrid.getTableWrapper(),place:'prepend'});
            } else {
                Metronic.alert({type:'danger',icon:'warning',message:failTip,container:tabDataGrid.getTableWrapper(),place:'prepend'});
            }
            setTimeout("$('.alert').alert('close');",3000);
            empGrid.getDataTable().fnDraw();
        }
    });
}

/**
 * 删除员工
 * @param data
 */
function deleteEmployee(data){
    var ids=[];
    if(data){
        ids.push(data);
    }else{
        //批量删除
        $.each(empGrid.getSelectedRows(),function(key,val){
            ids.push(val['value']);
        });
        if(ids.length==0){
            Metronic.alert({type:'danger',icon:'warning',message:'请至少选择一条要删除的信息。',container:empGrid.getTableWrapper(),place:'prepend'});
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
                    ajaxUpdateEmployee(ids ,$("#searchTemId").val() ,'del',empGrid) ;
                }
            }
        }
    });
}
/**
 * 删除团队
 * @param data  团队的id
 */
function deleteAll(data){
    var ids=[];
    if(data){
        ids.push(data);
    }else{
        $.each(grid.getSelectedRows(),function(key,val){
            ids.push(val['value']);
        });
        if(ids.length==0){
            Metronic.alert({type:'danger',icon:'warning',message:'请至少选择一条要删除的信息。',container:grid.getTableWrapper(),place:'prepend'});
            setTimeout("$('.alert').alert('close');",4000);
            return;
        }
    }
    bootbox.dialog({
        message: "您是否确认删除选中的数据?",
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
                    Metronic.startPageLoading();
                    $.ajax({
                        url:'${rc.contextPath}/system/team/delete',
                        type:'POST',
                        data:{"ids":ids},
                        dataType:"json",
                        traditional:true,
                        success:function(data){
                            Metronic.stopPageLoading();
                            if(data.stat){
                                Metronic.alert({type:'success',message:'删除成功.',container:grid.getTableWrapper(),place:'prepend'});
                            } else {
                                Metronic.alert({type:'danger',icon:'warning',message:'删除失败.',container:grid.getTableWrapper(),place:'prepend'});
                            }
                            setTimeout("$('.alert').alert('close');",3000);
                            grid.getDataTable().fnDraw();
                        }
                    });
                }
            }
        }
    });
    setTimeout("$('.alert').alert('close');",3000);
}


</script>
</content>
</html>
