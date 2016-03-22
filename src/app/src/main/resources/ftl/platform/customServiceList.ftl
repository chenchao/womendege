<html>
<head>
    <title>客服管理</title>
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
                <a href="${rc.contextPath}/">平台管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">客服管理</a>
                <i class="fa fa-angle-right"></i>
            </li>

        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>客服列表</div>
                <div class="actions">

                    <div class="btn-group">
                        <button onclick="openUserWin()" class="btn green">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480">新增客服</span>
                        </button>
                        <button onclick="deleteAll()" class="btn red">
                            <i class="fa fa-trash-o"></i>
                            <span class="hidden-480">批量删除</span>
                        </button>
                        <button onclick="openSystemWin()" class="btn blue">
                            <i class="fa fa-cogs"></i>
                            <span class="hidden-480">设置系统属性</span>
                        </button>


                    </div>
                </div>
            </div>
            <div class="portlet-body">

                <div class="table-container">
                    <div class="table-actions-wrapper">

                    </div>
                    <table class="table table-striped table-bordered table-hover" id="customServiceDataTable">
                        <thead>
                        <tr role="row" class="heading">
                            <th width="1%"><input type="checkbox" class="group-checkable"></th>
                            <th width="10%"></th>
                            <th width="10%"></th>
                            <th width="10%"></th>
                            <th width="10%"></th>
                            <th width="3%">操作</th>
                        </tr>
                        <tr role="row" class="filter">
                            <td></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_fullName"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userId"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userType"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_fromSys"></td>
                            <td>
                                <div class="margin-bottom-5">
                                    <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> 搜索</button>
                                </div>
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
<!--新增客服 -->
<div id="editDataDiv" class="modal fade" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content"  style="width: 800px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="cancelUser()"></button>
                <h4 class="modal-title" id="editModTitle">新增客服</h4>
            </div>
            <div class="modal-body">
                    <table class="table table-striped table-hover table-bordered" id="modalTable">
                        <thead>
                        <tr role="row" class="heading">
                            <th width="1%"><input type="checkbox" class="group-checkable"></th>
                            <th width="10%"></th>
                            <th width="10%"></th>
                            <th width="10%"></th>
                            <th width="10%"></th>
                            <th width="10%"></th>
                        </tr>
                        <tr role="row" class="filter">
                            <td></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_fullName"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_account"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userId"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="search_LIKE_userType"></td>
                            <td>
                                <div class="margin-bottom-5">
                                    <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> 搜索</button>
                                </div>
                                <button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i> 重置</button>
                            </td>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn green" onclick="saveCustom()">保存</button>
                <button type="button" class="btn default" data-dismiss="modal" onclick="cancelUser()">取消</button>
            </div>
        </div>
    </div>
</div>
<!--系统属性设置 -->
<div id="systemModal" class="modal fade" tabindex="-3" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">系统属性设置</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-2">电话号码 </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="name" id="telnum">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-2">邮箱地址</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="email" id="email">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn green" onclick="saveSystem()">保存</button>
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
                <input type="hidden" id="ideaId"/>
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
<script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonValidation.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/common/common.js"></script>
<script type="text/javascript">
$('.date-picker').datepicker({
    rtl:Metronic.isRTL(),
    autoclose:true
});
var grid=new Datatable();
grid.init({
    src:$("#customServiceDataTable"),
    onSuccess:function(grid){
        console.log(grid);
    },
    onError:function(grid){
    },
    dataTable:{
        "bServerSide":true,
        "sAjaxSource":"${rc.contextPath}/platform/custom/list",
        "aaSorting":[
            [ 1,"asc" ]
        ],
        "aoColumnDefs":[
            { "bSortable":false,"aTargets":[ 0,5 ] }
        ],//设置不排序得列
        "aoColumns":[
            { "sWidth":"1%","sTitle":"<input type='checkbox' class='group-checkable'>","mData":"id","mRender":function(data,type){
                return '<input type="checkbox" class="group-checkable" value="'+data+'" name="ids"/>';
            }},
            {  "sTitle":"用户名","mData":"fullName"},
            {  "sTitle":"用户ID","mData":"userId"},
            {  "sTitle":"用户类型","mData":"userType"},
            {  "sTitle":"来自系统","mData":"fromSys"},
            {  "sTitle":"操作","mData":"id","sDefaultContent":"","mRender":function(data){
                return'<a href="javascript:void(0)" onclick=del("'+data+'") class="btn btn-xs red"><i class="fa fa-trash-o"></i>删除</a>';
            }}
        ]
    }
});

var gridmodalTable=new Datatable();
gridmodalTable.init({
    src:$("#modalTable"),
    onSuccess:function(gridmodalTable){
    },
    onError:function(gridmodalTable){
    },
    dataTable:{
        "bServerSide":true,
        "sAjaxSource":"${rc.contextPath}/platform/custom/users",
        "aaSorting":[
            [ 1,"asc" ]
        ],
        "aoColumnDefs":[
            { "bSortable":false,"aTargets":[ 0,1,2,3,4,5] }
        ],//设置不排序得列
        "aoColumns":[
            { "sWidth":"1%","sTitle":"<input type='checkbox' class='group-checkable'>","mData":"id","mRender":function(data,type){
                return '<input type="checkbox" class="group-checkable" value="'+data+'" name="checkBox2"/>';
            }},
            { "sWidth":"15%","sTitle":"用户名","mData":"userName"},
            { "sWidth":"10%","sTitle":"用户账号","mData":"loginName"},
            { "sWidth":"10%","sTitle":"用户Id","mData":"userId"},
            { "sWidth":"15%","sTitle":"用户类型","mData":"userType"},
            { "sWidth":"15%","sTitle":"来自系统","mData":"userSystem"}
        ]
    }
});

function del(id){
    bootbox.dialog({
        message:"确认删除该客服信息?",
        title:"删除客服",
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
                    Metronic.startPageLoading();
                    $.ajax({
                        url:'${rc.contextPath}/platform/custom/delete',
                        type:'POST',
                        data:{"id":id},
                        dataType:"json",
                        traditional:true,
                        success:function(data){
                            if(data==true){
                                Metronic.stopPageLoading();
                                grid.getDataTable().fnDraw();
                                alertHint();
                            }
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
        bootbox.alert('请选择至少一条要删除的信息。');
        return;
    }
    bootbox.dialog({
        message:"确认删除该客服信息?",
        title:"删除客服",
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
                    Metronic.startPageLoading();
                    $.ajax({
                        url:'${rc.contextPath}/platform/custom/delete-all',
                        type:'POST',
                        data:{"ids":ids},
                        dataType:"json",
                        traditional:true,
                        success:function(data){
                            if(data==true){
                                Metronic.stopPageLoading();
                                grid.getDataTable().fnClearTable(0);
                                grid.getDataTable().fnDraw();
                                alertHint();
                            }
                        }
                    });
                }
            }
        }
    });
}
//新增客服信息
function openUserWin(){
    Metronic.startPageLoading();
    $('#editDataDiv').modal('show');
    Metronic.stopPageLoading();
}
//取消新增客服信息
function cancelUser(){
    $('#editDataDiv').modal('hide');
}

//全选用户
function checkAllBox2(th){
    if(th){
        if(th.checked){
            $("input[name='checkBox2']").attr("checked",true).parent('span').addClass('checked');
        }else{
            $("input[name='checkBox2']").attr("checked",false).parent('span').removeClass('checked');
        }
    }
}
//单选用户
function checkBox2(th){
    if(th){
        var ch=$(th).find("input[name='checkBox2']");
        if(ch[0].checked){
            ch.attr("checked",true).parent('span').addClass('checked');
        }else{
            ch.attr("checked",false).parent('span').removeClass('checked');
        }
    }
}
//保存客服信息
function saveCustom(){
    var parm="";
    var ch=$("span.checked >input[name='checkBox2']");
    if(ch){
        ch.each(function(i,n){
            if(i==0){
                parm=n.value;
            }else{
                parm+=','+n.value;
            }
        });
    }
    if(!parm){
        bootbox.alert('请选择需要加入的客服');
        return false;
    }
    Metronic.startPageLoading();
    $.post("${rc.contextPath}/platform/custom/save-custom-service",{'rand':Math.random(),'ids':parm},function(result){
        Metronic.stopPageLoading();
        if(true==result){
            alertHint();
            $('#editDataDiv').modal('hide');
            grid.getDataTable().fnDraw();
        }
    });
}
//跳转系统属性
function openSystemWin(){
    $('#systemModal').modal('show');
    $.getJSON("${rc.contextPath}/platform/custom/system?rand="+Math.random(),function(data){
        $("#ideaId").val(data.id);
        $("#telnum").val(data.telNum);
        $("#email").val(data.email);
    });
}
//保存系统属性
function saveSystem(){
    var telnum=$('#telnum').val();
    var email=$('#email').val();
    var ideaId=$('#ideaId').val();
    Metronic.startPageLoading();
    $.post('${rc.contextPath}/platform/custom/save-system?rand='+Math.random(),{"ideaId":ideaId,"email":email,"telnum":telnum},function(result){
        Metronic.stopPageLoading();
                if(true==result){
                    bootbox.alert('保存成功!');
                    $('#systemModal').modal('hide');
                }
            });
}
</script>
</content>
</html>
