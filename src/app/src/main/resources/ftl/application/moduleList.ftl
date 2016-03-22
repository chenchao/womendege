<html>
<head>
    <title>模块管理</title>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.css"/>
    <link rel="stylesheet" href="${rc.contextPath}/assets/global/css/plugins.css"/>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="${rc.contextPath}/">应用管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">模块管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>
<div class="row">
<div class="col-md-12">
<div class="portlet box green-haze">
<div class="portlet-title">
    <div class="caption"><i class="fa fa-cogs"></i>模块列表</div>
    <div class="actions">
        <div class="btn-group">
            <a href="${rc.contextPath}/application/module/create" class="btn green">
                <i class="fa fa-plus"></i>
                <span class="hidden-480">新增模块</span>
            </a>
            <button onclick="deleteAll()" class="btn red">
                <i class="fa fa-trash-o"></i>
                <span class="hidden-480">删除模块</span>
            </button>
            <button onclick="importRole()" class="btn blue">
                <i class="icon-user"></i>
                <span class="hidden-480">分配角色</span>
            </button>
        </div>
    </div>
</div>
<div class="portlet-body">
    <#if message>
        <div class="alert alert-success">
            <button data-dismiss="alert" class="close">×</button>
        ${(message)!}
        </div>
    </#if>
    <div class="table-container">
        <div class="table-actions-wrapper"><span></span>
            <select name="appId" id="appId" style="width: 150px;" class="select2me table-group-action-input form-control">
                <option value="-1" selected="selected">请选择</option>
                <option value="-2">未分配</option>
                <#list listApp as r>
                    <option value="${r.id}">${r.title}</option>
                </#list>
            </select>
        </div>
        <table class="table table-striped table-bordered table-hover" id="module_data_table">
            <thead>
            <tr role="row" class="heading">
                <th width="1%">
                    <input type="checkbox" class="group-checkable">
                </th>
                <th width="15%">
                    模块名称
                </th>
                <th width="15%">
                    模块标识
                </th>
                <th width="15%">
                    状态
                </th>
                <th width="5%">
                    备注
                </th>
                <th width="15%">
                    操作
                </th>
            </tr>
            <#--<tr role="row" class="filter">
                <td>
                </td>
                <td><input type="text" class="form-control form-filter input-small" name="search_LIKE_name"></td>
                <td><input type="text" class="form-control form-filter input-small" name="search_LIKE_code"></td>
                <td><select name="search_LIKE_active" class="form-control  form-filter input-small">
                    <option value="ENABLE">启用</option>
                    <option value="DISABLE">禁用</option>
                </select></td>
                <td></td>
                <td>
                    <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i>搜索</button>
                    <button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i>重置</button>
                </td>
            </tr>-->
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>

<div id="myModal" class="modal fade" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title" id="editModTitle">查看模块所属角色</h4>
            </div>
            <div class="modal-body">
                <div class="scroller" style="height:250px" data-always-visible="1" data-rail-visible1="1">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-striped table-hover table-bordered" id="modalTable">
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="appModal" class="modal fade" tabindex="-2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">修改模块所属角色</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <label class="control-label ">请选择应用：
                            <select id="_dlgAddAppId" style="min-width: 200px;" class="select2me form-control input-small ">
                                <option value="-1" selected="selected">请选择应用</option>
                                <#list listApp as r>
                                    <option value="${r.id}">${r.title}</option>
                                </#list>
                            </select></label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label class="control-label ">请选择角色：
                            <select id="roleSel" style="min-width: 200px;" class="select2me form-control input-small ">
                                <option>请选择应用下的角色</option>
                            </select></label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn green" onclick="updateModRole()">保存</button>
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
                <input type="hidden" id="respId"/>
                <input type="hidden" id="oldId"/>
            </div>
        </div>
    </div>
</div>
<div id="roleModal" class="modal fade" tabindex="-3" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content"  style="width: 800px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">将模块导入角色</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <label class="control-label " style="float: right;">请选择应用：
                            <select id="roleAppSel" style="min-width: 200px;" class="select2me form-control input-small ">
                                <option value="-1" selected="selected">请选择应用</option>
                                <option value="-2">未分配</option>
                                <#list listApp as r>
                                    <option value="${r.id}">${r.title}</option>
                                </#list>
                            </select>
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-striped table-bordered table-hover" id="role_data_table">
                            <thead>
                            <tr role="row" class="heading">
                                <th width="5%">
                                    <input type="checkbox" class="group-checkable">
                                </th>
                                <th>角色名称</th>
                                <th>角色代号</th>
                                <th>状态</th>
                                <th>备注</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn green" onclick="saveRoleList()">保存</button>
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<div id="funcModal" class="modal fade" tabindex="-4" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">查看模块下的功能</h4>
            </div>
            <div class="modal-body" >
                <div class="row">
                    <div class="col-md-12">
                        <label class="control-label ">请选择角色：
                            <select class="" id="_dlgRoleSelect">
                                <option>请选择模块所属角色</option>
                            </select></label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-striped table-bordered table-hover" id="func_data_table">
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <input type="hidden" id="moduleId"/>
            </div>
        </div>
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
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js"></script>
<script src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
<script type="text/javascript">
/**
 * 关闭提示信息
 * */
function alertClose(){
    $(".alert").alert('close');
}
jQuery(function($){
    var message="${message}", stat="${stat}";
    if(null==message||''==message){
        setInterval(alertClose,3*1000);
    }else{
        if('true'==stat){
            $('#message').removeClass('alert-danger');
            $('#message').addClass('alert-success');
            setInterval(alertClose,3*1000);
        }else{
            $('#message').removeClass('alert-success');
            $('#message').addClass('alert-danger');
        }
    }
});
var grid=new Datatable();
grid.init({
    src:$("#module_data_table"),
    onSuccess:function(grid){
    },
    onError:function(grid){
    },
    dataTable:{
        "bServerSide":true,
         "aoColumnDefs": [ { "bSortable": false, "aTargets": [0, 5] }]  ,//指定某列不可排序
        "sAjaxSource":"${rc.contextPath}/application/module/list",
        "aaSorting":[
            [ 1,"asc" ]
        ],
        "aoColumns":[
            { "mData":"id","mRender":function(data,type){
                return'<input type="checkbox" class="group-checkable" value="'+data+'" name="ids">';
            }},
            {  "sTitle":"模块名称","mData":"name"},
            {  "sTitle":"标识","mData":"code"},
            {  "sTitle":"状态","mData":"active","sDefaultContent":"","mRender":function(data,type,full){
                return getStatusDisplay(data);
            }},
            {  "sTitle":"模块描述","mData":"description"},
            {  "sTitle":"操作","mData":"id","sDefaultContent":"","mRender":function(data,type,full){
                var a='<a href="${rc.contextPath}/application/module/update/'+data+'" class= "btn btn-xs blue" title="编辑" ><i class="fa fa-edit"></i>编辑</a>';
                var b='<a  href="javascript:void(0);" class= "btn btn-xs red" title ="删除" onclick = "del(\''+data+'\')"><i class="fa fa-trash-o"></i>删除</a>';
                var c='<a href="javascript:void(0);" class= "btn btn-xs green" onclick="showRole(\''+data+'\')"><i class="fa fa-search"></i>查看角色</a>';
                var e='<a href="javascript:void(0);" class= "btn btn-xs blue" onclick="showFunc(\''+data+'\')"><i class="fa fa-search"></i>查看功能</a>';
                return a+b+c+e;
            }}
        ]
    }
});
var roleGrid=new Datatable();
roleGrid.init({
    src:$("#role_data_table"),
    onSuccess:function(grid){
    },
    onError:function(grid){
    },
    dataTable:{
        "bServerSide":true,
        "sAjaxSource":"${rc.contextPath}/application/module/find-role-by-aid",
        "aaSorting":[
            [ 1,"asc" ]
        ],
        "aoColumns":[
            { "mData":"id","mRender":function(data,type){
                return'<input type="checkbox" class="group-checkable" value="'+data+'" name="ids">';
            }},
            {  "sTitle":"角色名称","mData":"name"},
            {  "sTitle":"角色代号","mData":"code"},
            {  "sTitle":"状态","mData":"active","sDefaultContent":"","mRender":function(data,type,full){
                return getStatusDisplay(data);
            }},
            {  "sTitle":"角色描述","mData":"description"}
        ]
    }
});
$("#appId").on("change",function(){
    selectAjax($("#appId").val());
});
function selectAjax(appId){
    grid.setAjaxParam("appId",appId);
    grid.getDataTable().fnDraw();
}
function getStatusDisplay(status){
    if("ENABLE"==status){
        return "启用";
    }else if("DISABLE"==status){
        return "禁用";
    }else if("usable"==status){
        return "可用";
    }else if("unusable"==status){
        return "不可用";
    }else if("purchased"==status){
        return "已购买";
    }else if("prototype"==status){
        return "原型";
    }else if("introduce"==status){
        return "介绍";
    }else if("common"==status||"COMMON"==status){
        return "公用";
    }else if("publicPackage"==status||"PUBLICPACKAGE"==status){
        return "公共包";
    }else if("test"==status){
        return "测试";
    }else if("company"==status){
        return "企业";
    }else if("proterotype"==status){
        return "原生态";
    }else if("SETUPFILE"==status){
        return "安装包";
    }
}
function del(id){
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
            	Metronic.startPageLoading();
                $.ajax({
                    url:'${rc.contextPath}/application/module/delete',
                    type:'POST',
                    data:{"id":id},
                    dataType:"json",
                    traditional:true,
                    success:function(){
                        Metronic.stopPageLoading();
                        grid.getDataTable().fnDraw();
                    }
              });
             }
           }
         }
     });
}
function deleteAll(){
    var ids=[];
    $.each(grid.getSelectedRows(),function(key,val){
        ids.push(val['value']);
    });
    if(ids.length==0){
        Metronic.alert({type:'danger',icon:'warning',message:'请选择至少一条要删除的信息。',container:grid.getTableWrapper(),place:'prepend'});
        return;
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
            	Metronic.startPageLoading();
                $.ajax({
                    url:'${rc.contextPath}/application/module/delete-all',
                    type:'POST',
                    data:{"ids":ids},
                    dataType:"json",
                    traditional:true,
                    success:function(){
                        Metronic.stopPageLoading();
                        grid.getDataTable().fnDraw();
                    }
                });
             }
           }
         }
     });
}
function importRole(){
    var ids=[];
    $.each(grid.getSelectedRows(),function(key,val){
        ids.push(val['value']);
    });
    if(ids.length==0){
        bootbox.alert("请选择需要导入的模块。");
        //Metronic.alert({type:'danger',icon:'warning',message:'请选择需要导入的应用。',container:grid.getTableWrapper(),place:'prepend'});
        return;
    }
    //需要清空上次选中
    if($("#appId").val()!= -1){
        roleGrid.setAjaxParam("appId",-1);
        roleGrid.getDataTable().fnDraw();
    }
    if($('#role_data_table_wrapper').children().length==3){
        $('#role_data_table_wrapper').children()[0].remove();
    }
    $('#roleModal').modal('show');
}
$('#roleAppSel').on('change',function(){
    roleGrid.setAjaxParam("appId",$("#roleAppSel").val());
    roleGrid.getDataTable().fnDraw();
});
//将模块导入角色
function saveRoleList(){
    var mids=[];
    $.each(grid.getSelectedRows(),function(key,val){
        mids.push(val['value']);
    });
    //获取角色ID
    var rIds=[];
    $.each(roleGrid.getSelectedRows(),function(key,val){
        rIds.push(val['value']);
    });
    if(roleGrid.getSelectedRowsCount()==0){
        //Metronic.alert({type:'danger',icon:'warning',message:'请选择至少一条角色信息。',container:grid.getTableWrapper(),place:'prepend'});
        bootbox.alert("请选择至少一条角色信息。");
        return;
    }
    Metronic.startPageLoading();
    $.ajax({
        url:'${rc.contextPath}/application/module/save-to-role',
        type:'POST',
        data:{"mids":mids,"rids":rIds},
        dataType:"json",
        traditional:true,
        success:function(data){
            Metronic.stopPageLoading();
            bootbox.alert(data.info);
            if(data.stat){
                $('#roleModal').modal('hide');
            }
        }
    });
}
//查看角色
function showRole(id){
    if(id){
        $('#editModTitle').text('查看模块所属角色');
        $('#modalTable').html('<p>正在加载...</p>');
        $('#myModal').modal('show');
        Metronic.startPageLoading();
        $.ajax({
            url:'${rc.contextPath}/application/module/find-role-by-module',
            type:'POST',
            data:{"mid":id},
            dataType:"json",
            traditional:true,
            success:function(data){
                Metronic.stopPageLoading();
                if(data.length!=0){
                    str='<thead><tr><th>角色名称</th><th>角色代号</th><th>备注</th><th>修改</th><th>删除</th></tr></thead><tbody>';
                    for(i=0; i<data.length; i++){
                        var r=data[i];
                        var code=r.code==null?'':r.code;
                        var description=r.description==null?'':r.description;
                        str+='<tr><td> '+r.name+'</td><td>'+code+'</td><td>'+description+'</td><td><a class="edit" href="javascript:;" onclick="updateRole(\''+id+'\',\''+r.id+'\')">修改</a></td><td><a class="delete" href="javascript:;" onclick="deleteRole(\''+id+'\',\''+r.id+'\',this)">删除</a></td></tr>';
                    }
                    str+='</tbody>';
                }else{
                    str='<p>暂无角色。</p>';
                }
                $('#modalTable').html(str);
            }
        });
    }
}
function updateRole(mid,rid){
    if(mid&&rid){
        $('#appModal').modal('show');
        $('#respId').val(mid);
        $('#oldId').val(rid);
    }
}
$('#_dlgAddAppId').on('change',function(){
    var aid=$(this).val();
    if(aid){
        Metronic.startPageLoading();
        var str='<option>暂无角色</option>';
        $.ajax({
            url:'${rc.contextPath}/application/module/find-role-by-app-id',
            type:'POST',
            data:{"appId":aid},
            dataType:"json",
            traditional:true,
            success:function(data){
                Metronic.stopPageLoading();
                if(data){
                    str='<option value="-1">请选择应用下的角色</option>';
                    for(i=0; i<data.length; i++){
                        var roleInfo=data[i];
                        str+='<option value="'+roleInfo.id+'">'+roleInfo.name+'</option> ';
                    }
                }
                $('#roleSel').html(str);
            }
        });
    }
});
function updateModRole(){
    var rid=$('#roleSel').val();
    var respId=$('#respId').val();
    var oldId=$('#oldId').val();
    if(rid&&respId){
        if(!rid||rid=='-1'){
            bootbox.alert('请选择所属模块');
            //Metronic.alert({type:'danger',icon:'warning',message:'请选择所属模块。',container:grid.getTableWrapper(),place:'prepend'});
            return false;
        }
        //提交修改
        Metronic.startPageLoading();
        $.ajax({
            url:'${rc.contextPath}/application/module/update-role',
            type:'POST',
            data:{"rid":rid,"mid":respId,"oldrId":oldId},
            dataType:"json",
            traditional:true,
            success:function(data){
                Metronic.stopPageLoading();
                if(data){
                    bootbox.alert(data.info);
                    if(data.stat){
                        $('#appModal').modal('hide');
                        $('#myModal').modal('hide');
                    }
                }
            }
        });
    }
}
//删除角色信息
function deleteRole(mid,rid,th){
    if(mid&&rid){
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
            	Metronic.startPageLoading();
                $.ajax({
                    url:'${rc.contextPath}/application/module/delete-role',
                    type:'POST',
                    data:{"rid":rid,"mid":mid},
                    dataType:"json",
                    traditional:true,
                    success:function(data){
                        Metronic.stopPageLoading();
                        if(data){
                            if(data.stat){
                                if(th){
                                    $(th).parents('tr').remove();
                                }
                            }else{
                                bootbox.alert(data.info);
                            }
                        }
                    }
                });
             }
           }
         }
     });
    }
}
//查看功能
function showFunc(id){
    if(id){
        $('#moduleId').val(id);
        $('#func_data_table').html('');
        $('#funcModal').modal('show');
        Metronic.startPageLoading();
        var str='<option>暂无角色</option>';
        $.ajax({
            url:'${rc.contextPath}/application/module/find-role-by-module',
            type:'POST',
            data:{"mid":id},
            dataType:"json",
            traditional:true,
            success:function(data){
                Metronic.stopPageLoading();
                if(data){
                    str='<option value="-1">请选择模块所属角色</option>';
                    for(i=0; i<data.length; i++){
                        var roleInfo=data[i];
                        str+='<option value="'+roleInfo.id+'">'+roleInfo.name+'</option> ';
                    }
                }
                $('#_dlgRoleSelect').html(str);
            }
        });
    }
}
$('#_dlgRoleSelect').on('change',function(){
    var mid=$('#moduleId').val();
    var rid=$(this).val();
    if(rid&&mid){
        Metronic.startPageLoading();
        $.ajax({
            url:'${rc.contextPath}/application/module/find-func-and-func-version-by-mid',
            type:'POST',
            data:{"rid":rid,"mid":mid},
            dataType:"json",
            traditional:true,
            success:function(data){
                Metronic.stopPageLoading();
                var str='<p>暂无功能</p>';
                if(data.length!=0){
                    console.log(data);
                    str='<thead><tr><th>功能名称</th><th>标识</th><th>状态</th><th>功能版本</th><th>zip版本</th><th>删除</th></tr></thead><tbody>';
                    for(i=0; i<data.length; i++){
                        var r=data[i].function;
                        var v=data[i].version;
                        var zipVersion=(v.zipVersion==undefined?'':v.zipVersion);
                        var markName=(r.markName==null||r.markName==undefined)?'':r.markName;
                        var version=(r.version==null||r.version==undefined)?'':r.version;
                        str+='<tr><td> '+r.name+'</td><td>'+markName+'</td><td>'+getStatusDisplay(r.active)+'</td><td>'+version+'</td><td>'+zipVersion+'</td><td><a class="delete" href="javascript:;" onclick="deleteFuncFromRM(\''+rid+'\',\''+mid+'\',\''+r.id+'\',this)">删除</a></td></tr>';
                    }
                    str+='</tbody>';
                }
                $('#func_data_table').html(str);
            }
        });
    }
});
//删除模块中的功能
function deleteFuncFromRM(rid,mid,fid,th){
    if(rid&&mid&&fid){
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
            	Metronic.startPageLoading();
                $.ajax({
                    url:'${rc.contextPath}/application/module/delete-func-from-rmf',
                    type:'POST',
                    data:{"rid":rid,"mid":mid,"fid":fid},
                    dataType:"json",
                    traditional:true,
                    success:function(data){
                        Metronic.stopPageLoading();
                        if(data){
                            bootbox.alert(data.info);
                            if(data.stat){
                                if(th){
                                    $(th).parents('tr').remove();
                                }
                            }
                        }
                    }
                });
             }
           }
         }
     });
    }
}


</script>
</content>
</html>
