<html>
<head>
    <title>用户管理</title>
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
                <a href="${rc.contextPath}/">权限管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">用户管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>用户列表</div>
                <div class="actions">
                    <div class="btn-group">
                        <a href="${rc.contextPath}/authority/user/create" class="btn green">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480"  >新增用户</span>
                        </a>
                        <button  class="btn red">
                            <i class="fa fa-trash-o"></i>
                            <span class="hidden-480" onclick="deleteUserList();">删除用户</span>
                        </button>
                        <button  class="btn blue">
                            <i class="fa fa-user"></i>
                            <span class="hidden-480" onclick="showRoleList();">分配角色</span>
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
                <div id="roleModal" class="modal fade" tabindex="-3" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                <h4 class="modal-title">将用户导入角色</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4>请选择应用：
                                            <select class="" id="roleAppSel">
                                                <option value="-1" selected="selected">请选择应用</option>
                                                <#list listData as r>
                                                    <option value="${r.id}">${r.title}</option>
                                                </#list>
                                            </select></h4>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <table class="table table-striped table-hover table-bordered" id="roleCheckBox">
                                                </table>
                                            </div>
                                        </div>
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

                <div class="table-container">
                    <div class="table-actions-wrapper">
                        <select name="appId" id="appId" class="table-group-action-input form-control input-inline input-small input-sm">
                            <option value="-1" selected="selected">请选择应用</option>
                            <#list listData as r>
                                <option value="${r.id}">${r.title}</option>
                            </#list>
                        </select>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="user_data_table">
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
<script src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
<script src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
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
    src:$("#user_data_table"),
    onSuccess:function(grid){
    },
    onError:function(grid){
    },
    dataTable:{
        "aLengthMenu":[
            [20,50,100,150,-1],
            [20,50,100,150,"All"]
        ],
        "iDisplayLength":20,
        "bServerSide":true,
        "sAjaxSource":"${rc.contextPath}/authority/user/list",
        "aaSorting":[
            [ 1,"asc" ]
        ],
        "aoColumns":[
            { "sWidth":"1%","sTitle":'<input type="checkbox" class= "checkAllBox" onclick="checkAllBox(this)"  title="全选" class="group-checkable" />',"sDefaultContent":"","mRender":function(data,type,full){
                return '<div class="checker"  ><span class=""><input type="checkbox" class="checkboxes" checked="" name="checkBox" value="'+full.id+'"></span></div>';
            }},
            {  "sTitle":"账号","mData":"loginName"},
            {  "sTitle":"用户名称","mData":"name"},
            {  "sTitle":"来自系统","mData":"fromSystem"},
            {  "sTitle":"账号状态","mData":"status","mRender":function(data,type,full){
                var statusName='未启用';
                if(data&&data.length){
                    if(1==data||'1'==data){
                        statusName='启用';
                    }
                }
                return statusName;
            }},
            {  "sTitle":"更新日期","mData":"registerDate","sDefaultContent":"","mRender":function(data,type,full){
                var time='';
                if(data&&data.length){
                    time=data;
                }else{
                    time=full.updateDate;
                }
                return time;
            }},
            {  "sTitle":"操作","sDefaultContent":"","mRender":function(data,type,full){
                var a='<a href="${rc.contextPath}/authority/user/update/'+full.id+'" class="btn blue"  title="编辑" >编辑</a>';
                var b='<a  href="javascript:void(0);" onclick="deleteUserInfo('+full.id+')" class= "btn red" title ="删除">删除</a>';
                return a+b;
            }}
        ]
    }
});
jQuery('#user_data_table').on('change','tbody tr .checkboxes',function(){
    $(this).parents('span').toggleClass("checked");
});
$('.table-group-action-submit').click(function(){
    selectAjax($("#appId").val());
});
function selectAjax(appId){
    grid.setAjaxParam("appId",appId);
    grid.getDataTable().fnDraw();
}
/**
 * 删除单个用户信息
 **/
function deleteUserInfo(id){
    commonDelete({"id":id},'删除用户','确认删除用户,以及相关联的的员工信息?','${rc.contextPath}/authority/user/delete');
}
/**
 *  删除用户信息
 */
function deleteUserList(){
    var ids=[], finIds=[], ch=$("#user_data_table span.checked >input[name='checkBox']");
    if(ch){
        ch.each(function(i,n){
            ids.push(n.value);
        });
    }
    if(ids==''||ids==null||ids.length==0){
        bootbox.alert('请选择需要删除的用户');
        return false;
    }
    commonDelete({"ids":ids},'批量删除用户','确认批量删除用户,以及相关联的的员工信息?','${rc.contextPath}/authority/user/deleteAll');
}
/**
 *  公共删除用户信息
 * */
function commonDelete(data,message,title,url){
    bootbox.dialog({
        message:message,
        title:title,
        buttons:{
            main:{
                label:"取消",
                className:"gray",
                callback:function(){
                    $(this).hide();
                }
            },
            success:{
                label:"确定",
                className:"green",
                callback:function(){
                    $.ajax({
                        url:url,
                        type:'POST',
                        data:data,
                        dataType:"json",
                        traditional:true,
                        success:function(msg){
                            if(msg&&msg.stat){
                                bootbox.alert('删除成功');
                                grid.getDataTable().fnDraw();
                            }else{
                                bootbox.alert('删除失败');
                            }
                        }
                    });
                }
            }
        }
    });
}
/**
 * 打开 用户分配角色 页面
 */
function showRoleList(){
    var parm;
    var ch=$("#user_data_table span.checked >input[name='checkBox']");
    if(ch){
        ch.each(function(i,n){
            if(i==0){
                parm='\''+n.value+'\'';
            }else{
                parm+=',\''+n.value+'\'';
            }
        });
    }
    if(!parm){
        bootbox.alert('请选择需要分配的用户');
        return false;
    }
    $('#roleModal').modal('show');
}
/**
 * 保存 用户 角色
 */

function saveRoleList(){
    var parm, rids;
    var ch=$("#user_data_table input[name='checkBox']:checked");
    if(ch){
        ch.each(function(i,n){
            if(i==0){
                parm='\''+n.value+'\'';
            }else{
                parm+=',\''+n.value+'\'';
            }
        });
    }
    if(!parm){
        bootbox.alert('请选择需要加入的用户');
        return false;
    }
    var ri=$('#roleCheckBox span.checked >input');
    if(ri){
        ri.each(function(i,n){
            if(i==0){
                rids=n.value;
            }else{
                rids+=','+n.value;
            }
        });
    }
    if(!rids){
        bootbox.alert('请选择需要导入的角色');
        return false;
    }
    var url=webUrl+"/apply/user_saveToRole.action";
    //提交
    $.post(url,{"ids":parm,"rid":rids},function(msg){
        msg=eval("("+msg+")");
        if(msg.stat){
            alertHint(msg.info);
            $('#roleModal').modal('hide');
        }else{
            bootbox.alert(msg.info);
        }
    });
}
</script>
</content>
</html>
