<html>
<head>
    <title>角色管理</title>
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
                <a href="#">角色管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>
<div class="row">
<div class="col-md-12">
<div class="portlet box green-haze">
    <div class="portlet-title">
        <div class="caption"><i class="fa fa-cogs"></i>角色列表</div>
        <div class="actions">
            <div class="btn-group">
                <a href="${rc.contextPath}/application/role/create" class="btn green">
                    <i class="fa fa-plus"></i>
                    <span class="hidden-480">新增角色</span>
                </a>
                <button onclick="deleteAll()" class="btn red">
                    <i class="fa fa-trash-o"></i>
                    <span class="hidden-480">删除角色</span>
                </button>
                <button onclick="importApp()" class="btn blue">
                    <i class="fa fa-ticket"></i>
                    <span class="hidden-480">导入应用</span>
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
                <select name="appId" id="appId"
                        style="width: 150px;" class="table-group-action-input form-control select2me">
                    <option value="-1" selected="selected">请选择</option>
                    <option value="-2">未分配</option>
                    <#list listData as r>
                        <option value="${r.id}">${r.title}</option>
                    </#list>
                </select>
            </div>
            <table class="table table-striped table-bordered table-hover" id="role_data_table">
                <thead>
                <tr role="row" class="heading">
                    <th width="1%">
                        <input type="checkbox" class="group-checkable">
                    </th>
                    <th width="10%">
                        角色名称
                    </th>
                    <th width="10%">
                        角色代号
                    </th>
                    <th width="15%">
                        备注
                    </th>
                    <th width="5%">
                        状态
                    </th>
                    <th width="15%">
                        操作
                    </th>
                </tr>
                <tr role="row" class="filter">
                    <td>
                    </td>
                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_name">
                    </td>
                    <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_code">
                    </td>
                    <td></td>
                    <td><select name="search_LIKE_active" class="form-control  form-filter input-sm">
                        <option value="">请选择</option>
                        <option value="ENABLE">启用</option>
                        <option value="DISABLE">禁用</option>
                    </select></td>
                    <td>
                        <button class="btn btn-sm yellow filter-submit margin-bottom"><i
                                class="fa fa-search"></i>搜索
                        </button>
                        <button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i>重置</button>
                    </td>
                </tr>
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
                    <h4 id="title" class="modal-title">查看角色所属应用</h4>
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
                    <h4 class="modal-title">修改角色所属应用</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <#--<div class="col-md-12">
                            <h4>请选择应用：
                                <select  class="form-control  input-small select2me" id="_dlgAddAppId">
                                    <option value="-1" selected="selected">请选择应用</option>
                                    <#list listApp as r>
                                        <option value="${r.id}">${r.title}</option>
                                    </#list>
                                </select></h4>
                        </div>-->
                        <div class="col-md-3">
                            <label class="control-label">请选择应用：</label>
                        </div>
                        <div class="col-md-9">
                            <select  class="form-control  input-small select2me" id="_dlgAddAppId">
                                <option value="-1" selected="selected">请选择应用</option>
                                <#list listApp as r>
                                    <option value="${r.id}">${r.title}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn green" onclick="updateRoleApp()">保存</button>
                    <input type="hidden" id="respId"/>
                    <input type="hidden" id="oldId"/>
                </div>
            </div>
        </div>
    </div>

    <div id="funcRoleModal" class="modal fade" tabindex="-3" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">查看角色下的功能</h4>
                </div>
                <div class="modal-body">
                    <div class="scroller" style="height:350px" data-always-visible="1" data-rail-visible1="1">
                        <div class="row">
                            <div class="col-md-12" id="moduleFunctionList">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="rid"/>
                </div>
            </div>
        </div>
    </div>

    <div id="roleModal" class="modal fade" tabindex="-3" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content"  style="width: 800px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">将角色导入应用</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-striped table-bordered table-hover" id="app_data_table">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="5%">
                                        <input type="checkbox" class="group-checkable">
                                    </th>
                                    <th>应用名称</th>
                                    <th>所属企业</th>
                                    <th>下载地址</th>
                                    <th>应用包名</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
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
<script type="text/javascript"
        src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
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
    src:$("#role_data_table"),
    onSuccess:function(grid){
    },
    onError:function(grid){
    },
    dataTable:{
        "bServerSide": true,
        "sAjaxSource": "${rc.contextPath}/application/role/list",
        "aoColumnDefs": [ { "bSortable": false, "aTargets": [0,4, 5] }]  ,//指定某列不可排序
        "aaSorting":[
            [ 1,"asc" ]
        ],
        "aoColumns":[
            { "mData":"id","mRender":function(data,type){
                return'<input type="checkbox" class="group-checkable" value="'+data+'" name="ids">';
            }},
            {  "sTitle":"角色名称","mData":"name"},
            {  "sTitle":"角色代号","mData":"code"},
            {  "sTitle":"角色描述","mData":"description"},
            {  "sTitle":"状态","mData":"active","sDefaultContent":"","mRender":function(data,type,full){
                return getRoleStatus(data);
            }},
            {  "sTitle":"操作","mData":"id","sDefaultContent":"","mRender":function(data,type,full){
                var a='<a href="${rc.contextPath}/application/role/update/'+data+'" class= "btn btn-xs blue"  title="编辑" ><i class="fa fa-edit"></i>编辑</a>';
                var b='<a  href="javascript:void(0);" class= "btn btn-xs red" title ="删除" onclick = "del(\''+data+'\')"><i class="fa fa-trash-o"></i>删除</a>';
                var c='<a  href="javascript:void(0);" class= "btn btn-xs green" onclick="showApp(\''+data+'\')"><i class="fa fa-search"></i>查看应用</a>';
                var e='<a href="javascript:void(0);" class= "btn btn-xs blue" onclick="showFunc(\''+data+'\')"><i class="fa fa-search"></i>查看功能</a>';
                var d='<a href="${rc.contextPath}/application/role/to-drag-function/'+data+'"  title="布局管理" ><i class="fa fa-tablet"></i>布局管理</a>';
                return a+b+c+e+d;
            }}
        ]
    }
});
var appGrid=new Datatable();
appGrid.init({
    src:$("#app_data_table"),
    onSuccess:function(grid){
    },
    onError:function(grid){
    },
    dataTable:{
        "bServerSide":true,
        "sAjaxSource":"${rc.contextPath}/application/list/list",
        "aaSorting":[
            [ 1,"asc" ]
        ],
        "aoColumns":[
            { "mData":"id","mRender":function(data,type){
                return'<input type="checkbox" class="group-checkable" value="'+data+'" name="ids">';
            }},
            {  "sTitle":"应用名称","mData":"title"},
            {  "sTitle":"所属企业","mData":"forFirm"},
            {  "sTitle":"下载地址","mData":"downLoadUrl"},
            {  "sTitle":"应用状态","mData":"workStatus","sDefaultContent":"","mRender":function(data,type,full){
                return getStatusDisplay(data);
            }}
        ]
    }
});
$('#appId').on('change',function(){
    grid.setAjaxParam("appId",$("#appId").val());
    grid.getDataTable().fnDraw();
});
function getRoleStatus(status) {
    if ("ENABLE" == status) {
        return"启用";
    }
    return"禁用";
}
function getStatusDisplay(status){
    if("ENABLE"==status){
        return "可用";
    }else if("DISABLE"==status){
        return "不可用";
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

function del(id) {
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
                    url: '${rc.contextPath}/application/role/delete',
                    type: 'POST',
                    data: {"id": id},
                    dataType: "json",
                    traditional: true,
                    success: function () {
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
        //Metronic.alert({type: 'danger', icon: 'warning', message: '请至少选择一条要删除的记录。', container: grid.getTableWrapper(), place: 'prepend'});
        bootbox.alert('请至少选择一条要删除的记录。');
        return;
    }
    bootbox.dialog({
         message: "您是否确认批量删除?",
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
                    url: '${rc.contextPath}/application/role/delete-all',
                    type: 'POST',
                    data: {"ids": ids},
                    dataType: "json",
                    traditional: true,
                    success: function () {
                        Metronic.stopPageLoading();
                        grid.getDataTable().fnDraw();
                    }
                });
             }
           }
         }
     });
}

function importApp(){
    var ids=[];
    $.each(grid.getSelectedRows(),function(key,val){
        ids.push(val['value']);
    });
    if(ids.length==0){
        //Metronic.alert({type: 'danger', icon: 'warning', message: '请选择需要导入的应用。', container: grid.getTableWrapper(), place: 'prepend'});
        bootbox.alert('请选择需要导入的角色。');
        return;
    }
    $('#roleModal').modal('show');
}
//将应用导入角色
function saveRoleList(){
    var rids=[];
    $.each(grid.getSelectedRows(),function(key,val){
        rids.push(val['value']);
    });
    //获取应用ID
    var appIds=[];
    $.each(appGrid.getSelectedRows(),function(key,val){
        appIds.push(val['value']);
    });
    if(appGrid.getSelectedRowsCount()==0){
        //Metronic.alert({type: 'danger', icon: 'warning', message: '请选择至少一条应用信息。', container: grid.getTableWrapper(), place: 'prepend'});
        bootbox.alert('请选择至少一条应用信息。');
        return;
    }
    Metronic.startPageLoading();
    $.ajax({
        url: '${rc.contextPath}/application/role/save-to-app',
        type: 'POST',
        data: {"rids": rids, "appIds": appIds},
        dataType: "json",
        traditional: true,
        success: function (data) {
            Metronic.stopPageLoading();
            if(data){
                bootbox.alert("保存成功");
                $('#roleModal').modal('hide');
            }else{
                bootbox.alert("保存失败");
            }
        }
    });
}
//查看应用
function showApp(id){
    if(id){
        Metronic.startPageLoading();
        $('#modalTable').html('<p>正在加载...</p>');
        $('#myModal').modal('show');
        $('#title').html('查看角色所属应用');
        $.ajax({
            url:'${rc.contextPath}/application/role/find-application-info-by-rid',
            type:'POST',
            data:{"id":id},
            dataType:"json",
            traditional:true,
            success:function(data){
                Metronic.stopPageLoading();
                var str='<p>暂无应用</p>';
                if(data.length!=0){
                    str='<thead><tr><th>应用名称</th><th>英文名称</th><th>所属企业</th><th>修改</th><th>删除</th></tr></thead><tbody>';
                    for(i=0; i<data.length; i++){
                        var r=data[i];
                        var firm = r.forFirm;
                        if(firm == null){
                            firm = '';
                        }
                        var entitle = r.enTitle;
                        if(entitle==null||entitle==undefined){
                            entitle='';
                        }
                        str+='<tr><td> '+r.title+'</td><td>'+entitle+'</td><td>'+firm+'</td><td><a class="edit" href="javascript:;" onclick="updateApp(\''+id+'\',\''+r.id+'\')">修改</a></td><td><a class="delete" href="javascript:;" onclick="deleteApp(\''+id+'\',\''+r.id+'\',this)" style="color:red">删除</a></td></tr>';
                    }
                    str+='</tbody>';
                }
                $('#modalTable').html(str);
            }
        });
    }
}
//查看功能
function showFunc(id){
    if(id){
        $('#rid').val(id);
        //获取角色下的模块
        Metronic.startPageLoading();
        $.ajax({
            url:'${rc.contextPath}/application/function/find-func-by-role-id',
            type:'POST',
            data:{"roleId":id},
            dataType:"json",
            traditional:true,
            success:function(data){
                if(data){
                    $.ajax({
                        url:'${rc.contextPath}/application/function/find-func-by-role-id-group-by-module',
                        type:'POST',
                        data:{"roleId":id},
                        dataType:"json",
                        traditional:true,
                        success:function(data){
                            Metronic.stopPageLoading();
                            if(data!=[]&&data.length!=0){
                                var str='';
                                for(i=0; i<data.length; i++){
                                    var funcList=data[i];
                                    str+='<div><p style="color:#428bca">'+funcList.moduleName+'</p>';
                                    str+='<table class="table table-striped table-hover table-bordered" >';
                                    str+='<thead><tr><th width="150px">功能名称</th><th  width="150px">标识</th><th  width="120px">状态</th><th>删除</th></tr></thead><tbody>';
                                    for(j=0;j<funcList.list.length;j++){
                                        var r=funcList.list[j];
                                        var markName=(r.markName==null?'':r.markName);
                                        str+='<tr><td> '+r.name+'</td><td>'+markName+'</td><td>'+getStatusDisplay(r.active)+'</td><td><a class="delete" href="javascript:;" onclick="deleteFunc(\''+id+'\',\''+funcList.moduleId+'\',\''+r.id+'\',this)" style="color:red">删除</a></td></tr>';
                                    }
                                    str+='</tbody>';
                                    str+='</table></div>';
                                }
                                $('#moduleFunctionList').html(str);
                                $('#funcRoleModal').modal('show');

                            }else{
                                bootbox.alert("暂无功能。");
                            }
                        }
                    });
                }else{
                    Metronic.stopPageLoading();
                    bootbox.alert("暂无功能。");
                }
            }
        });

    }
}

//修改应用
function updateApp(rid,appId){
    if(rid&&appId){
        $('#appModal').modal('show');
        $('#respId').val(rid);
        $('#oldId').val(appId);
    }
}
//更新角色的应用
function updateRoleApp(){
    var aid=$('#_dlgAddAppId').val();
    var respId=$('#respId').val();
    var oldId=$('#oldId').val();
    if(!aid||aid=='-1'){
        bootbox.alert('请选择所属应用');
        return false;
    }
    if(aid&&respId){
        //提交修改
        Metronic.startPageLoading();
        $.ajax({
            url:'${rc.contextPath}/application/role/update-app',
            type:'POST',
            data:{"aid":aid,"rid":respId,"oldId":oldId},
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
/**
 * 删除应用
 */
function deleteApp(rid, aid, th) {
    if (aid && rid) {
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
                        url: '${rc.contextPath}/application/role/delete-app',
                        type: 'POST',
                        data: {"aid": aid, "rid": rid},
                        dataType: "json",
                        traditional: true,
                        success: function (data) {
                            Metronic.stopPageLoading();
                            if (data) {
                                bootbox.alert(data.info);
                                if (data.stat) {
                                    if (th) {
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
//删除角色下的功能
function deleteFunc(rid, mid, fid, th) {
    if (rid && mid && fid) {
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
                    url: '${rc.contextPath}/application/role/delete-func',
                    type: 'POST',
                    data: {"rid": rid, "mid": mid, "fid": fid},
                    dataType: "json",
                    traditional: true,
                    success: function (data) {
                        Metronic.stopPageLoading();
                        if (data) {
                            bootbox.alert(data.info);
                            if (data.stat) {
                                if (th) {
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
