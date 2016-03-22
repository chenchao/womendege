<html>
<head>
    <title>功能管理</title>
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
                <a href="#">功能管理</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>
<div class="row">
<div class="col-md-12">
<div class="portlet box green-haze">
<div class="portlet-title">
    <div class="caption"><i class="fa fa-cogs"></i>功能列表</div>
    <div class="actions">
        <div class="btn-group">
            <a href="${rc.contextPath}/application/function/create-func" class="btn green">
                <i class="fa fa-plus"></i>
                <span class="hidden-480">新增功能</span>
            </a>
            <button onclick="deleteAll()" class="btn red">
                <i class="fa fa-trash-o"></i>
                <span class="hidden-480">删除功能</span>
            </button>
            <button onclick="importModule()" class="btn blue">
                <i class="fa fa-dropbox"></i>
                <span class="hidden-480">分配模块</span>
            </button>
            <button onclick="toAppFunc()" class="btn green">
                <i class="fa fa-flickr"></i>
                <span class="hidden-480">分配应用</span>
            </button>
            <#--<a class="btn default btn-sm btn-default" href="javascript:void(0)" data-toggle="dropdown">
                <i class="fa fa-cogs"></i>
                <span class="hidden-480">功能同步清单</span>
            </a>
            <ul class="dropdown-menu pull-right">
                <li>
                    <a href="javascript:synToCloud(2);">
                        全部同步至云端
                    </a>
                </li>
                <li>
                    <a href="javascript:synToCloud(3);">
                        选中同步至云端
                    </a>
                </li>
                <li>
                    <a href="javascript:synFromCloud(1);">
                        云端同步至本地
                    </a>
                </li>
            </ul>-->
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
            <select name="appId" id="appId" style="width: 150px;" class="table-group-action-input form-control select2me">
                <option value="-1" selected="selected">请选择</option>
                <option value="-2">未分配</option>
                <#list listApp as r>
                        <option value="${r.id}">${r.title}</option>
                    </#list>
                </select>
        </div>
        <table class="table table-striped table-bordered table-hover" id="func_data_table">
            <thead>
            <tr role="row" class="heading">
                <th width="5%">
                    <input type="checkbox" class="group-checkable">
                </th>
                <th width="5%">
                    功能图标
                </th>
                <th width="15%">
                    功能名称
                </th>
                <th width="5%">
                    版本
                </th>
                <th width="5%">
                    标识
                </th>
                <th width="5%">
                    状态
                </th>
                <th width="15%">
                    更新日期
                </th>
                <th width="25%">
                    操作
                </th>
            </tr>
            <tr role="row" class="filter">
                <td>
                </td>
                <td>
                </td>
                <td><input type="text" class="form-control form-filter  input-small" name="search_LIKE_name"></td>
                <td><input type="text" class="form-control form-filter  input-small" name="search_LIKE_version"></td>
                <td><input type="text" class="form-control form-filter  input-small" name="search_LIKE_markName"></td>
                <td><select name="search_LIKE_active" class="form-control  form-filter  input-small">
                    <option value="">请选择</option>
                    <option value="ENABLE">可用</option>
                    <option value="SETUPFILE">安装包</option>
                    <option value="COMMON">公用</option>
                    <option value="PUBLICPACKAGE">公共包</option>
                    <option value="DISABLE">不可用</option>
                </select></td>
                <td>
                    <div id="beginTime" class="input-group date date-picker margin-bottom-5" data-date-format="yyyy-mm-dd">
                        <input id="begin" type="text" class="form-control form-filter  input-sm" readonly name="beginTime" placeholder="From">
                        <span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span>
                    </div>
                    <div id="endTime" class="input-group date date-picker" data-date-format="yyyy-mm-dd">
                        <input id="end" type="text" class="form-control form-filter  input-sm" readonly name="endTime" placeholder="To">
                        <span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span>
                    </div>
                </td>
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

<div id="roleModal" class="modal fade" tabindex="-3" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content"  style="width: 800px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">将功能导入模块</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <label class="control-label ">请选择应用：
                            <select name="appId" id="roleAppSel" style="min-width: 200px;" class="select2me form-control input-small">
                                <option value="-1" selected="selected">请选择应用</option>
                                <#list listApp as r>
                                    <option value="${r.id}">${r.title}</option>
                                </#list>
                            </select>
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label class="control-label ">请选择角色：
                            <select class="select2me form-control input-small" style="min-width: 200px;" id="moduleRoleSel">
                                <option>选择应用下的角色</option>
                            </select></label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-striped table-hover table-bordered" id="module_data_info">
                            <thead>
                            <tr role="row" class="heading">
                                <th width="5%">
                                    <input id="cbkAllModule" type="checkbox" class="group-checkable">
                                </th>
                                <th width="15%">
                                    模块名称
                                </th>
                                <th width="5%">
                                    标识
                                </th>
                                <th width="5%">
                                    状态
                                </th>
                                <th width="15%">
                                    模块描述
                                </th>
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
<div id="moduleModal"  class="modal fade" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title" id="editModTitle">查看功能所属模块</h4>
            </div>
            <div class="modal-body">
                <div class="scroller" style="height:300px" data-always-visible="1" data-rail-visible1="1">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="control-label ">请选择角色：
                                <select class="" id="roleInFuncSel">
                                    <option>请选择角色</option>
                                </select></label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-striped table-hover table-bordered" id="role_func_data">
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <input type="hidden" id="functionId"/>
            </div>
        </div>
    </div>
</div>
<div id="appModal" class="modal fade" tabindex="-2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">修改功能所属模块</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <label class="control-label ">请选择应用：
                            <select id="_dlgAddAppId" class="select2me form-control input-small" style="min-width: 200px;">
                                <option value="-1" selected="selected">请选择应用</option>
                                <#list listApp as r>
                                    <option value="${r.id}">${r.title}</option>
                                </#list>
                            </select>
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label class="control-label ">请选择角色：
                            <select id="roleOfApp" class="select2me form-control input-small" style="min-width: 200px;">
                                <option>请选择应用下的角色</option>
                            </select>
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label class="control-label ">请选择模块：
                            <select id="moduleOfRole" class="select2me form-control input-small" style="min-width: 200px;">
                                <option>请选择角色下的模块</option>
                            </select>
                        </label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn green" onclick="updateFuncModu()">保存</button>
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
                <input type="hidden" id="oldRId"/>
                <input type="hidden" id="oldMId"/>
                <input type="hidden" id="currentFId"/>
            </div>
        </div>
    </div>
</div>

<div id="funcInRoleModal" class="modal fade" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 id="modalTitle" class="modal-title">查看模块所属角色</h4>
            </div>
            <div class="modal-body">
                <div class="scroller" style="height:300px" data-always-visible="1" data-rail-visible1="1">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-striped table-hover table-bordered" id="funcInRoleTable">
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="appFuncModal" class="modal fade" tabindex="-3" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content"  style="width: 800px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">将功能分配给应用</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-striped table-bordered table-hover" id="app_data_table">
                            <thead>
                            <tr role="row" class="heading">
                                <th width="5%">
                                    <input id="ckbAll" type="checkbox" class="group-checkable"/>
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
                <button type="button" class="btn green" onclick="doCheckAppInf()">保存</button>
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<div id="funcVersionDetail" class="modal fade" tabindex="-2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">查看功能版本详细信息</h4>
            </div>
            <div class="modal-body">
                <div class="scroller" style="height: 300px;" data-always-visible="1" data-rail-visible1="1">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">当前功能：
                                </label>

                                <div class="col-md-9">
                                    <label id="currentFuncName"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">zip状态：
                                </label>

                                <div class="col-md-9">
                                    <label id="workStatus"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">ZIP包：
                                </label>

                                <div class="col-md-9">
                                    <label id="funcZipUrl" name="funcZipUrl" style="word-wrap: break-word; word-break: break-all;"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">ZIP包大小：
                                </label>

                                <div class="col-md-9">
                                    <label id="zipSize" name="zipSize" style="word-wrap: break-word; word-break: break-all;"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">网络地址：</label>

                                <div class="col-md-9">
                                    <label style="word-wrap: break-word; word-break: break-all;" name="interfaceUrl" id="interfaceUrl"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-3">描述：</label>

                                <div class="col-md-9">
                                    <label style="word-wrap: break-word; word-break: break-all;" name="remark" id="remark"></label>
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
</div>
</body>
<content tag="script">
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js"></script>
<script src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
<script src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
<script type="text/javascript">
$('.date-picker').datepicker({
    rtl:Metronic.isRTL(),
    autoclose:true,
    language: 'zh-CN'
});
/**
 * 关闭提示信息
 * */
function alertClose(){
    $(".alert").alert('close');
}

$('#beginTime').on('change',function(e){
    $('#endTime').datepicker('setStartDate', $('#begin').val());
});
$('#endTime').on('change',function(e){
    $('#beginTime').datepicker('setEndDate', $('#end').val());
});

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
    src:$("#func_data_table"),
    onSuccess:function(grid){
    },
    onError:function(grid){
    },
    dataTable:{
        "bServerSide":true,
         "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 0,1 ,7] }]  ,//指定某列不可排序
        "sAjaxSource":"${rc.contextPath}/application/function/func-list",
        "aaSorting":[
            [ 1,"asc" ]
        ],
        "aoColumns":[
            { "mData":"id","mRender":function(data,type,full){
                return '<input type="checkbox" class="group-checkable" value="'+data+'" name="ids"><span class="row-details row-details-close" onclick="showZipList(\''+full.id+'\')" id="span_'+full.id+'"></span>';
            }},
            { "sTitle":"功能图标","mData":"icon","sDefaultContent":"","mRender":function(data,type,full){  // mRender --- 用来显示图片
                if(data){
                    return '<img src="${rc.contextPath}'+data+'" width="60px" height="60px">';
                }else{
                    return '<img src="${rc.contextPath}'+commonImgAddress+'" width="60px" height="60px" style="margin:auto 0;" >';
                }
            }},
            {  "sTitle":"功能名称","mData":"name"},
            {  "sTitle":"版本","mData":"version"},
            {  "sTitle":"标识","mData":"markName"},
            {  "sTitle":"状态","mData":"active","sDefaultContent":"","mRender":function(data,type,full){
                return getStatusDisplay(data);
            }},
            { "sTitle":"更新日期","mData":"createTimeStr"},
            {  "sTitle":"操作","mData":"id","sDefaultContent":"","mRender":function(data,type,full){
                var a='<a href="${rc.contextPath}/application/function/update-func/'+data+'" class= "btn btn-xs blue" title="编辑" ><i class="fa fa-edit"></i>编辑</a>';
                var b='<a  href="javascript:void(0);" class= "btn btn-xs red" title ="删除" onclick = "del(\''+data+'\')"><i class="fa fa-trash-o"></i>删除</a>';
                var c='<a class= "btn btn-xs green" href="javascript:void(0);" onclick="showModule(\''+data+'\')"><i class="fa fa-search"></i>查看模块</a>';
                var e='<a class= "btn btn-xs blue" href="javascript:void(0);" onclick="showRole(\''+data+'\')"><i class="fa fa-search"></i>查看角色</a>';
                var f='<a class= "btn btn-xs green" href="javascript:void(0);" onclick="showApp(\''+data+'\')"><i class="fa fa-search"></i>查看应用</a>';
                var d='<a href="${rc.contextPath}/application/function-version/create-func-version/'+data+'" class= "btn btn-xs blue" title="上传版本" >上传版本</a>';
                if(full.active=="SETUPFILE"){
                    return a+b+c+e+f+d;
                }else{
                    return a+b+c+e+d;
                }
            }}
        ]
    }
});
/**
 * 为 zip 列表信息 创建 table
 */
function fnFormatDetails(oTable,nTr){
    var id=$(nTr).find('.group-checkable').attr('value');
    return '<table id='+id+'></table>';
}
$('#func_data_table').on('click',' tbody td .row-details',function(){
    var oTable=$('#func_data_table').dataTable();
    var nTr=$(this).parents('tr')[0];
    if(oTable.fnIsOpen(nTr)){
        /* This row is already open - close it */
        $(this).addClass("row-details-close").removeClass("row-details-open");
        oTable.fnClose(nTr);
    }else{
        /* Open this row */
        $(this).addClass("row-details-open").removeClass("row-details-close");
        oTable.fnOpen(nTr,fnFormatDetails(oTable,nTr),'details');
    }
});
var moduleGrid=new Datatable();
moduleGrid.init({
    src:$("#module_data_info"),
    onSuccess:function(grid){
    },
    onError:function(grid){
    },
    dataTable:{
        "bServerSide":true,
        "sAjaxSource":"${rc.contextPath}/application/module/find-page-module-by-role-id",
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
            {  "sTitle":"模块描述","mData":"description"}
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
                return'<input type="checkbox" class="group-checkable" value="'+data+'" name="checkboxs"/>';
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

/**
 * @param 展示 zip集合信息
 */
function showZipList(id){
    if(getSpanStat(id)){
        loadZipList(id);
    }
}
/**
 * @param 获取 span 的状态 是打开还是闭合
 */
function getSpanStat(id){
    var cla=$('#span_'+id).attr('class'), close='row-details-close', bool=cla.indexOf(close)!= -1;
    return bool;
}
/**
 *  加载zip版本信息
 */
function loadZipList(id){
    $('#'+id).html('');
    Metronic.startPageLoading();
    $.ajax({
        url:'${rc.contextPath}/application/function-version/find-zip-list-by-fun-id',
        type:'POST',
        data:{"functionId":id},
        dataType:"json",
        traditional:true,
        success:function(data){
            Metronic.stopPageLoading();
            var str='<tr><td style="padding-left:10px; color:#e74c3c;">暂无版本</td></tr>';
            if(data.length!=0){
                str='';
                var bl=data.length>1;
                for(i=0; i<data.length; i++){
                    str+=createTable(data[i],bl);
                }
            }
            $('#'+id).html(str);
        }
    });
}
/**
 * 创建zip列表
 * @param obj zip对象
 */
function createTable(obj,bl){
    var funcZipUrl=obj.funcZipUrl, zipVersion=obj.zipVersion, workStatus=obj.workStatus, remark=obj.remark, id=obj.id, sOut='', name, status, opt;
    if('usable'==workStatus){
        name=id+'_unusable';
        status='<td class="statusChange" style="color:#428bca" name="'+id+'">';
        opt='<a style="margin-left:10px; color:#e74c3c" name="'+name+'" href="javascript:;" onclick="changeStatus(\''+id+'\',\'';
    }else{
        name=id+'_usable';
        status='<td class="statusChange" style="color:#e74c3c" name="'+id+'">';
        opt='<a style="margin-left:10px; color:#428bca;text-decoration: none;" name="'+name+'" href="javascript:;" onclick="changeStatus(\''+id+'\',\'';
    }
    sOut += '<tr id="'+id+'"><td style="padding-left:10px;">zip版本:</td><td>'+zipVersion+'</td>';
    sOut += '<td style="padding-left:10px;">zip路径:</td><td><a href="${rc.contextPath}'+funcZipUrl+'">'+funcZipUrl+'</a></td>';
    sOut += '<td style="padding-left:10px;">接口地址:</td><td><p title="'+obj.interfaceUrl+'" style="margin:2px;">'+checkLen(obj.interfaceUrl,50)+'</p></td>';
    sOut += '<td style="padding-left:10px;">备注:</td><td><p title="'+remark+'" style="margin:2px;">'+checkLen(remark,20)+'</p></td>';
    sOut += '<td style="padding-left:10px;">状态:</td>'+status+getStatusDisplay(workStatus)+'</td>';
    sOut += '<td style="padding-left:10px;">操作:</td><td><a class="delete" style="margin-left:10px;" href="javascript:;" onclick="deleteVer(\''+id+'\',this)">删除</a>  ';
    if(bl){
        sOut+='<a style="margin-left:10px;" href="javascript:;" onclick="deleteOtherVer(\''+id+'\',this)" class="delete">删除其它';
    }
    sOut += opt;
    if('usable'==workStatus){
        sOut+='unusable\',this)">置为不可用';
        sOut+='<a style="margin-left:10px; color:#428bca;text-decoration: none;" class="_usable" name="'+id+'_usable" href="javascript:;" onclick="changeStatus(\''+id+'\',\'';
        sOut+='usable\',this)">置为可用';
    }else{
        sOut+='usable\',this)">置为可用';
        sOut+='<a style="margin-left:10px;  color:#e74c3c" class="_usable" name="'+id+'_unusable" href="javascript:;" onclick="changeStatus(\''+id+'\',\'';
        sOut+='unusable\',this)">置为不可用';
    }
    sOut+='<a style="margin-left:10px;" href="javascript:;" onclick="showDetail(\''+id+'\')">查看详情</a> ';
    sOut+='</td></tr>';
    return sOut;
}
$('#appId').on('change',function(){
    grid.setAjaxParam("appId",$("#appId").val());
    grid.getDataTable().fnDraw();
});
/***********检查字段长度*****************/
function checkLen(str,len){
    var max_index=9;
    if(len){
        max_index=len;
    }
    // 包含「Opera」文字列
    if(navigator.userAgent.indexOf("Opera")!= -1){
    }
    // 包含「MSIE」文字列
    else if(navigator.userAgent.indexOf("MSIE")!= -1){
        //IE
        max_index=8;
    }
    // 包含「Firefox」文字列
    else if(navigator.userAgent.indexOf("Firefox")!= -1){
    }
    // 包含「Netscape」文字列
    else if(navigator.userAgent.indexOf("Netscape")!= -1){
    }
    // 包含「Safari」文字列
    else if(navigator.userAgent.indexOf("Safari")!= -1){
    }
    var value="";
    var len=0;
    if(str){
        var tmp=str.split("");
        for(var i=0; i<tmp.length; i++){
            if(tmp[i].charCodeAt(0)<299){
                len++;
            }else{
                len+=2;
            }
            if(len<=max_index-3){
                value+=tmp[i];
            }
        }
    }
    if(len<=max_index){
        return str;
    }else{
        return value+"…";
    }
}

//查看详细的版本信息
function showDetail(id){
    Metronic.startPageLoading();
    $.ajax({
        url:'${rc.contextPath}/application/function-version/find-func-version-by-id',
        type:'POST',
        data:{"id":id},
        dataType:"json",
        traditional:true,
        success:function(data){
            Metronic.stopPageLoading();
            if(data!=null){
                $("#currentFuncName").html(data.unZipUrl);
                $("#workStatus").html(getStatusDisplay(data.workStatus));
                $("#funcZipUrl").html(data.funcZipUrl);
                var size=null;
                if(data.zipSize>1024*1024){
                    size=(data.zipSize/1024/1024).toFixed(2)+"MB";
                }else{
                    size=(data.zipSize/1024).toFixed(0)+"KB";
                }
                $("#zipSize").html(size);
                $("#interfaceUrl").html(data.interfaceUrl);
                $("#remark").html(data.remark);
            }
            $('#funcVersionDetail').modal('show');
        }
    });
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
                    url:'${rc.contextPath}/application/function/delete-func',
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
        bootbox.alert('请选择至少一条要删除的信息。');
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
                    url:'${rc.contextPath}/application/function/delete-all-func',
                    type:'POST',
                    data:{"ids":ids},
                    dataType:"json",
                    traditional:true,
                    success:function(data){
                        Metronic.stopPageLoading();
                        grid.getDataTable().fnDraw();
                    }
                });
             }
           }
         }
     });
}
//分配模块
function importModule(){
    var ids=[];
    $.each(grid.getSelectedRows(),function(key,val){
        ids.push(val['value']);
    });
    if(ids.length==0){
        bootbox.alert('请选择至少一条功能信息。');
        return;
    }
    $('#roleModal').modal('show');
}
$('#roleAppSel').on('change',function(){
    var aid=$(this).val();
    if(aid){
        var str='<option value="">暂无角色</option> ';
        $('#loading').show();
        //获取应用下的角色
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
                $('#moduleRoleSel').html(str);
            }
        });
    }
});
$('#moduleRoleSel').on('change',function(){
    var roleId=$(this).val();
    if(roleId&&roleId!= -1){
        //获取角色下的模块
        moduleGrid.setAjaxParam("roleId",roleId);
        //去掉选中项
        $("input[name='checkboxs']").parent('span').attr("checked",false).removeClass('checked').parent('div').removeClass("checked").removeClass("disabled");
        //去掉选中的全选
        $("input[id='ckbAllModule']").attr("checked",false).parent('span').removeClass('checked');
        moduleGrid.getDataTable().fnDraw();
    }
});
//保存功能到模块中去，形成角色模块功能映射
function saveRoleList(){
    var fids=[];
    $.each(grid.getSelectedRows(),function(key,val){
        fids.push(val['value']);
    });
    var roleId=$('#moduleRoleSel').val();
    if(roleId==null||roleId== -1){
        bootbox.alert('请选择角色信息。');
        return;
    }
    var mids=[];
    $.each(moduleGrid.getSelectedRows(),function(key,val){
        mids.push(val['value']);
    });
    if(mids.length==0){
        bootbox.alert('请选择至少一条模块信息。');
        return;
    }
    Metronic.startPageLoading();
    $.ajax({
        url:'${rc.contextPath}/application/function/save-func-to-rmf',
        type:'POST',
        data:{"roleId":roleId,"mids":mids,"fids":fids},
        dataType:"json",
        traditional:true,
        success:function(data){
            Metronic.stopPageLoading();
            if(data){
                bootbox.alert(data.info);
                if(data.stat){
                    $('#roleModal').modal('hide');
                }
            }
        }
    });
}
//查看模块信息
function showModule(id){
    if(id){
        $("#functionId").val(id);
        $('#data').html('<p>正在加载...</p>');
        $('#moduleModal').modal('show');
        Metronic.startPageLoading();
        $('#role_func_data').html("");
        $.ajax({
            url:'${rc.contextPath}/application/role/find-role-by-func',
            type:'POST',
            data:{"functionId":id},
            dataType:"json",
            traditional:true,
            success:function(data){
                Metronic.stopPageLoading();
                if(data){
                    str='<option value="-1">请选择角色</option>';
                    for(i=0; i<data.length; i++){
                        var roleInfo=data[i];
                        str+='<option value="'+roleInfo.id+'">'+roleInfo.name+'</option> ';
                    }
                }
                $('#roleInFuncSel').html(str);
            }
        });
    }
}
$('#roleInFuncSel').on('change',function(){
    var roleId=$(this).val();
    var functionId=$("#functionId").val();
    if(roleId&&roleId!= -1){
        //获取角色下的模块
        Metronic.startPageLoading();
        $.ajax({
            url:'${rc.contextPath}/application/module/find-module-by-role-id-and-function-id',
            type:'POST',
            data:{"roleId":roleId,"functionId":functionId},
            dataType:"json",
            traditional:true,
            success:function(data){
                Metronic.stopPageLoading();
                if(data.length!=0){
                    str='<thead><tr><th>模块名称</th><th>标识</th><th>备注</th><th>修改</th><th>删除</th></tr></thead><tbody>';
                    for(i=0; i<data.length; i++){
                        var r=data[i];
                        var code=r.code==null?'':r.code;
                        var description=r.description==null?'':r.description;
                        str+='<tr><td> '+r.name+'</td><td>'+code+'</td><td>'+description+'</td><td><a class="edit" href="javascript:;" onclick="updateFuncInModule(\''+roleId+'\',\''+r.id+'\',\''+functionId+'\')">修改</a></td><td><a class="delete" href="javascript:;" onclick="deleteFuncInModule(\''+roleId+'\',\''+r.id+'\',\''+functionId+'\',this)">删除</a></td></tr>';
                    }
                    str+='</tbody>';
                }
                $('#role_func_data').html(str);
            }
        });
    }
});
//更新功能所属模块信息
function updateFuncInModule(rid,mid,fid){
    if(rid&&mid&&fid){
        $("#oldRId").val(rid);
        $("#oldMId").val(mid);
        $("#currentFId").val(fid);
        $('#appModal').modal('show');
    }
}
$("#_dlgAddAppId").on("change",function(){
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
                $('#roleOfApp').html(str);
            }
        });
    }
})
$("#roleOfApp").on("change",function(){
    var id=$(this).val();
    if(id){
        $('#rid').val(id);
        //获取角色下的模块
        Metronic.startPageLoading();
        var str='<option>暂无模块</option>';
        $.ajax({
            url:'${rc.contextPath}/application/function/find-module-by-role-id',
            type:'POST',
            data:{"roleId":id},
            dataType:"json",
            traditional:true,
            success:function(data){
                Metronic.stopPageLoading();
                if(data){
                    str='<option value="-1">请选择角色下的模块</option>';
                    for(i=0; i<data.length; i++){
                        var fmodule=data[i];
                        str+='<option value="'+fmodule.id+'">'+fmodule.name+'</option> ';
                    }
                }
                $('#moduleOfRole').html(str);
            }
        });
    }
})
//保存模块的修改
function updateFuncModu(){
    var rid=$("#roleOfApp").val();
    var mid=$('#moduleOfRole').val();
    var oldRId=$("#oldRId").val();
    var oldMId=$("#oldMId").val();
    var currentFId=$("#currentFId").val();
    if(rid==null||rid== -1||rid== -2){
        bootbox.alert("请选择应用下的角色。");
        return;
    }
    if(mid==null||mid== -1||mid== -2){
        bootbox.alert("请选择角色下的模块。");
        return;
    }
    if(rid==oldRId&&mid==oldMId){
        bootbox.alert("该功能所属的模块并未发生变化，请重新选择。");
        return;
    }
    Metronic.startPageLoading();
    $.ajax({
        url:'${rc.contextPath}/application/function/update-func-in-rmf',
        type:'POST',
        data:{"roleId":rid,"moduleId":mid,"functionId":currentFId,"oldRoleId":oldRId,"oldModuleId":oldMId},
        dataType:"json",
        traditional:true,
        success:function(data){
            Metronic.stopPageLoading();
            if(data){
                bootbox.alert(data.info);
                if(data.stat){
                    $('#appModal').modal('hide');
                    $('#moduleModal').modal('hide');
                }
            }
        }
    });
}
function deleteFuncInModule(rid,mid,fid,th){
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
                    url:'${rc.contextPath}/application/role/delete-func',
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
//查看功能所属的角色
function showRole(id){
    if(id){
        $('#modalTitle').html("查看功能所属角色");
        $('#funcInRoleTable').html('<p>正在加载...</p>');
        $('#funcInRoleModal').modal('show');
        Metronic.startPageLoading();
        $.ajax({
            url:'${rc.contextPath}/application/role/find-role-by-func',
            type:'POST',
            data:{"functionId":id},
            dataType:"json",
            traditional:true,
            success:function(data){
                Metronic.stopPageLoading();
                var str='<p>暂无所属角色</p>';
                if(data.length!=0){
                    str='<thead><tr><th>角色名称</th><th>角色代号</th><th>备注</th><th>删除</th></tr></thead><tbody>';
                    for(i=0; i<data.length; i++){
                        var r=data[i];
                        var code=r.code==null?'':r.code;
                        var description=r.description==null?'':r.description;
                        str+='<tr><td> '+r.name+'</td><td>'+code+'</td><td>'+description+'</td><td><a class="delete" href="javascript:;" onclick="deleteFuncFromRole(\''+id+'\',\''+r.id+'\',this)">删除</a></td></tr>';
                    }
                    str+='</tbody>';
                }
                $('#funcInRoleTable').html(str);
            }
        });
    }
}
//将功能从角色中删除
function deleteFuncFromRole(fid,rid,th){
    if(fid&&rid){
        bootbox.dialog({
         message: "删除角色，功能将解除与当前角色下所有模块的关系，您是否确认删除?",
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
                    url:'${rc.contextPath}/application/function/delete-rmf-info-by-rid-and-fid',
                    type:'POST',
                    data:{"roleId":rid,"functionId":fid},
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
//删除版本信息
function deleteVer(id,th){
    if(id){
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
                    url:'${rc.contextPath}/application/function-version/delete-func-version',
                    type:'POST',
                    data:{"id":id},
                    dataType:"json",
                    traditional:true,
                    success:function(data){
                        Metronic.stopPageLoading();
                        if(th){
                            $(th).parent().parent().remove();
                        }
                    }
                });
             }
           }
         }
     });
    }
}
//调整状态
function changeStatus(id,work,th){
    if(id){
        Metronic.startPageLoading();
        $.ajax({
            url:'${rc.contextPath}/application/function-version/update-func-version-status',
            type:"POST",
            data:{"workStatus":work,"vid":id},
            dataType:"json",
            traditional:true,
            success:function(data){
                Metronic.stopPageLoading();
                bootbox.alert(data.info);
                if(data.stat){
                    $(th).parents('tr').find('td[name="'+id+'"]').text(data.name);
                    if('usable'==work){
                        $(th).parents('tr td').find('a[name="'+id+'_usable"]').addClass('_usable');
                        $(th).parents('tr td').find('a[name="'+id+'_unusable"]').removeClass('_usable');
                        $(th).parents('tr').find('td[name="'+id+'"]').css('color','#428bca');
                    }else{
                        //不可用
                        $(th).parents('tr td').find('a[name="'+id+'_unusable"]').addClass('_usable');
                        $(th).parents('tr td').find('a[name="'+id+'_usable"]').removeClass('_usable');
                        $(th).parents('tr').find('td[name="'+id+'"]').css('color','#e74c3c');
                    }
                }
            }
        });
    }
}

//分配应用
function toAppFunc(){
    var fids=[];
    $.each(grid.getSelectedRows(),function(key,val){
        fids.push(val['value']);
    });
    if(!fids||fids.length==0){
        bootbox.alert('请选择需要加入的功能,功能类型必须为应安装包.');
        return ;
    }
    //通过功能ID查询功能包信息
    Metronic.startPageLoading();
    $.ajax({
        url:'${rc.contextPath}/application/function/find-setup-package-by-ids',
        type:'POST',
        data:{"ids":fids},
        dataType:"json",
        traditional:true,
        success:function(data){
            Metronic.stopPageLoading();
            if(data.length==0){
                bootbox.alert('请选择需要加入的功能,功能类型必须为应安装包.');
            }else{
                //去掉选中项
                $("input[name='checkboxs']").parent('span').attr("checked",false).removeClass('checked').parent('div').removeClass("checked").removeClass("disabled");
                //去掉选中的全选
                $("input[id='ckbAll']").attr("checked",false).parent('span').removeClass('checked');
                $('#appFuncModal').modal('show');
            }
        }
    });
}

//分配应用
function doCheckAppInf(){
    var funcIds=[];
    $.each(grid.getSelectedRows(),function(key,val){
        funcIds.push(val['value']);
    });
    var appIds=[];
    $.each(appGrid.getSelectedRows(),function(key,val){
        appIds.push(val['value']);
    });
    if(appIds.length==0){
		bootbox.alert('请选择需要分配的应用');
		return;
	}
    Metronic.startPageLoading();
    $.ajax({
        url:'${rc.contextPath}/application/function/save-setup-package-to-app',
        type:'POST',
        data:{"funcIds":funcIds,"appIds":appIds},
        dataType:"json",
        traditional:true,
        success:function(data){
            Metronic.stopPageLoading();
            bootbox.alert(data.info);
            if(data.stat){
                $('#appFuncModal').modal('hide');
            }
        }
    });
}

function showApp(id){
    if(id){
        $('#modalTitle').html("查看功能所属应用");
        $('#funcInRoleTable').html('<p>正在加载...</p>');
        $('#funcInRoleModal').modal('show');
        Metronic.startPageLoading();
        $.ajax({
            url:'${rc.contextPath}/application/function/find-app-by-func',
            type:'POST',
            data:{"functionId":id},
            dataType:"json",
            traditional:true,
            success:function(data){
                Metronic.stopPageLoading();
                var str='<p>暂无所属应用</p>';
                if(data.length!=0){
                    str='<thead><tr><th>应用名称</th><th>所属企业</th><th>下载地址</th><th>应用状态</th><th>删除</th></tr></thead><tbody>';
                    for(i=0; i<data.length; i++){
                        var r=data[i];
                        var forFrim=r.forFirm==null?'':r.forFirm;
                        var downLoadUrl=r.downLoadUrl==null?'':r.downLoadUrl;
                        str+='<tr><td> '+r.title+'</td><td>'+forFrim+'</td><td>'+downLoadUrl+'</td><td>'+getStatusDisplay(r.workStatus)+'</td><td><a class="delete" href="javascript:;" onclick="deleteFuncFromApp(\''+id+'\',\''+r.id+'\',this)">删除</a></td></tr>';
                    }
                    str+='</tbody>';
                }
                $('#funcInRoleTable').html(str);
            }
        });
    }
}

function deleteFuncFromApp(functionId,appId,th){
    if(functionId&&appId){
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
                    url:'${rc.contextPath}/application/function/delete-setup-package-from-app',
                    type:'POST',
                    data:{"functionId":functionId,"appId":appId},
                    dataType:"json",
                    traditional:true,
                    success:function(data){
                        Metronic.stopPageLoading();
                        if(th){
                            $(th).parent().parent().remove();
                        }
                    }
                });
             }
           }
         }
     });
    }
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
    return '不可用';
}

//同步至云端
function synToCloud(type){
    var ids=[];
    if(3==type||'3'==type){
        var  ch=$("#func_data_table span.checked >input[name='ids']");
        if(ch){
            ch.each(function(i,n){
                ids.push(n.value);
            });
        }
        if(ids==''||ids==null||ids.length==0){
            bootbox.alert('请选择需要同步至云端的功能');
            return false;
        }
    }else{
        ids.push(0);
    }
    bootbox.dialog({
        message: '确认同步数据到云端?',
        title: '同步数据',
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
                    $.ajax({
                        url: '${rc.contextPath}/cloud/application/syn-to-cloud',
                        type:'POST',
                        data:{"ids":ids,"tip":type},
                        dataType:"json",
                        traditional:true,
                        success:function(msg){
                            if(msg&&msg.resultCode=='200'){
                                bootbox.alert('同步成功');
                            }else{
                                bootbox.alert(msg.msg);
                            }
                        }
                    });
                }
            }
        }
    });
}

//云端同步至本地
function synFromCloud(tip){
    bootbox.dialog({
        message: '确认同步云端数据到本地?',
        title: '同步数据',
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
                    $.ajax({
                        url: '${rc.contextPath}/cloud/application/syn-from-cloud',
                        type:'POST',
                        dataType:"json",
                        data:{"tip":tip},
                        traditional:true,
                        success:function(msg){
                            if(msg&&msg.resultCode=='200'){
                                bootbox.alert('同步成功');
                            }else{
                                bootbox.alert(msg.msg);
                            }
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
