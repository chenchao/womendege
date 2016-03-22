<html>
<head>
    <title>意见反馈列表</title>
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
                <a href="#">意见反馈</a>
                <i class="fa fa-angle-right"></i>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>意见反馈列表</div>
                <div class="actions">
                    <div class="btn-group">
                        <a href="javascript:void(0);" onclick="showProblem()" class="btn green">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480">问题添加</span>
                        </a>
                        <a href="javascript:void(0);" onclick="deleteAll()" class="btn red">
                            <i class="fa fa-trash-o"></i>
                            <span class="hidden-480">批量删除</span>
                        </a>
                        <a class="btn green" href="javascript:void(0)" data-toggle="dropdown">
                            <i class="fa fa-arrow-up"></i>
                            <span class="hidden-480">导出EXCEL</span>
                        </a>
                        <ul class="dropdown-menu pull-right">
                            <li>
                                <a href="javascript:exportData(0);">
                                    全部导出
                                </a>
                            </li>
                            <li>
                                <a href="javascript:exportData(1);">
                                    选择导出
                                </a>
                            </li>
                            <li>
                                <a href="javascript:exportData(2);">
                                    查询导出
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="portlet-body">
                <div class="table-container">
                    <div class="table-actions-wrapper">

                    </div>
                    <table class="table table-striped table-bordered table-hover" id="attendees_data_table">
                        <thead>
                        <tr role="row" class="heading">
                            <th width="1%"><input type="checkbox" class="group-checkable"></th>
                            <th width="10%"></th>
                            <th width="10%"></th>
                            <th width="10%"></th>
                            <th width="10%"></th>
                            <th width="10%"></th>
                            <th width="10%"></th>
                            <th width="3%">操作</th>
                        </tr>
                        <tr role="row" class="filter">
                            <td></td>
                            <td><input type="text" class="form-control form-filter input-sm" id="search_LIKE_linkPerop" name="search_LIKE_linkPerop"></td>
                            <td><input type="text" class="form-control form-filter input-sm" id="search_LIKE_fromSys" name="search_LIKE_fromSys"></td>
                            <td><input type="text" class="form-control form-filter input-sm" id="search_LIKE_phone" name="search_LIKE_phone"></td>
                            <td><input type="text" class="form-control form-filter input-sm" id="search_LIKE_packageName" name="search_LIKE_packageName"></td>
                            <td></td>
                            <td></td>
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

            <div id="problem_add_div" class="modal fade" tabindex="-1" aria-hidden="true">
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
                                            <div class="caption"><i class="fa fa-cogs"></i>问题列表</div>
                                            <div class="actions">
                                                <div class="btn-group">
                                                    <a href="javascript:void(0);" onclick="delProblem(null)" class="btn red">
                                                        <i class="fa fa-trash-o"></i>
                                                        <span class="hidden-480">删除</span>
                                                    </a>
                                                    <a href="javascript:void(0);" onclick="addProblem()" class="btn green">
                                                        <i class="fa fa-plus"></i>
                                                        <span class="hidden-480">添加</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <table class="table table-striped table-hover table-bordered" id="problem_add_table">
                                                <thead>
                                                <tr role="row" class="heading">
                                                    <th width="1%"><input type="checkbox" class="group-checkable"></th>
                                                    <th width="10%">类型</th>
                                                    <th width="10%">内容</th>
                                                    <th width="3%">操作</th>
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
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/data-tables/DT_bootstrap.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${rc.contextPath}/assets/global/scripts/datatable.js"></script>
<script src="${rc.contextPath}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonUtil.js"></script>
<script type="text/javascript" src="${rc.contextPath}/assets/global/common/commonValidation.js"></script>
<script type="text/javascript">
$('.date-picker').datepicker({
    rtl:Metronic.isRTL(),
    autoclose:true
});
var grid=new Datatable();
var $attendees_data_table=$("#attendees_data_table");
grid.init({
    src:$attendees_data_table,
    onSuccess:function(grid){
        console.log(grid);
    },
    onError:function(grid){
    },
    dataTable:{
        "bServerSide":true,
        "sAjaxSource":"${rc.contextPath}/platform/feedback/list",
        "aaSorting":[
            [ 1,"asc" ]
        ],
        "aoColumnDefs":[
            { "bSortable":false,"aTargets":[ 0,7 ] }
        ],//设置不排序得列
        "aoColumns":[
            { "mData":"id","mRender":function(data,type,full){
                return '<input type="checkbox" class="group-checkable" value="'+data+'" name="ids"/>';
            }},
            {  "sTitle":"联系人","mData":"linkPerop"},
            {  "sTitle":"系统来源","mData":"fromSys"},
            {  "sTitle":"联系电话","mData":"phone"},
            {  "sTitle":"应用包名","mData":"packageName"},
            {  "sTitle":"反馈内容","mData":"content"},
            {  "sTitle":"更新时间","mData":"updateTime","sDefaultContent":"","mRender":function(data){
                var time='';
                if(data){
                    time=new Date(data).format('yyyy-MM-dd hh:mm');
                }
                return time;
            }},
            {  "sTitle":"操作","mData":"id","sDefaultContent":"","mRender":function(data){
                return'<a href="javascript:void(0)" onclick=del("'+data+'") class="btn btn-xs red"><i class="fa fa-trash-o"></i>删除</a>';
            }}
        ]
    }
});

var problemaddgrid=new Datatable();
var $attendees_probdata_table=$("#problem_add_table");
problemaddgrid.init({
    "bServerSide":true,
    src:$attendees_probdata_table,
    onSuccess:function(grid){
    },
    onError:function(grid){
    },
    dataTable:{
        "bServerSide":false,
        "sAjaxSource":"${rc.contextPath}/platform/feedprob/list" ,
        "aoColumns": [
            { "mData":"id","mRender":function(data,type,full){
                return '<input type="checkbox" class="group-checkable" value="'+data+'" id="ids" name="ids"/>';
            }},
            { "sWidth": "20%","sTitle": "类型",  "mData": "feedProblenType","mRender":function(data,type,full){
                var str  = '' ;
                if('problem'==data){
                    str = '问题' ;
                } else if('answer'==data){
                    str = '答案' ;
                }
                return str ;
            }},
            { "sWidth": "20%","sTitle": "内容",  "mData": "probContext"},
            { "sWidth": "10%","sTitle": "操作",  "mData": "id","mRender": function(data, type, full) {
                var tid = full.id , context = full.probContext ;
                if(data){
                    data=data.toString();
                    var len=data.indexOf('$_$');
                    if(len> -1){
                        tid=data.substr(0,len);
                        context=data.substr(len+3);
                    }
                }
                var a ='<a href="javascript:void(0);" onclick="editProblem(\''+tid+'\',\''+context+'\',this)" class="btn default btn-xs purple" title ="编辑"><i class="fa fa-edit"></i>编辑</a>&nbsp;';
                return "<span class='leftSize_s'>"+a+'</span>';}}
        ]
    }
});


/**
 * 编辑
 */
function editProblem(id,value,obj){
    var nRow = $(obj).parents('tr')[0],jqTds = $('>td', nRow),
            c = '<a  href="javascript:void(0);" onclick="saveProblem(\''+id+'\',false ,this)">保存</a>',d = "<span class='leftSize_s'>"+c+'</span>';
    jqTds[2].innerHTML =  '<input type="text" style="width:100%;" id= "s_key_'+id+'" class="form-control" value="' + value + '">';
    jqTds[3].innerHTML = d;
}


function addProblem(){
    var oTable=$('#problem_add_table').dataTable() ;
    var aiNew = oTable.fnAddData(['','','','']);
    var nRow = oTable.fnGetNodes(aiNew[0]);
    editRow(oTable, nRow);
}

function editRow(oTable, nRow) {
    var aData = oTable.fnGetData(nRow);
    aData[0]='0';
    aData[1]='0';
    var jqTds = $('>td', nRow);

    var  c='<a   href="javascript:void(0);" onclick="saveProblem(\''+0+'\',true ,this)">保存</a>'
            , d='<a   href="javascript:void(0);" onclick="cancelSave(this)">取消</a>'
            , e="<span class='leftSize_s'>"+c+"</span> <span class='leftSize_c'>"+d+"</span>" ;
    jqTds[1].innerHTML = '<select class="form-filter input-inline input-sm"  style="width:100%;"   id="key_' + aData[0] + '"><option value="${answerType}">答案</option><option value="${problemType}">问题</option></select>' ;
    jqTds[2].innerHTML = '<input type="text" style="width:100%;" class="form-control" id="s_key_' + aData[1] + '">';
    jqTds[3].innerHTML = e;
}


/**
 * 取消 新增 文本框
 */
function cancelSave(obj){
    var oTable =  $('#problem_add_table').dataTable();
    var nRow = $(obj).parents('tr')[0];
    oTable.fnDeleteRow(nRow);
}
/**
 * 保存
 */
function saveProblem(key,flag ,obj){
    var oTable =  $('#problem_add_table').dataTable();
    var id = $("#ids").val() , value ,type='' ;
    if(flag){
        //新增
        id = '' ;
        type = $('#key_'+key).val();
        value= $('#s_key_'+key).val() ;
    } else {
        //编辑
        id = key ;
        value = $('#s_key_'+key).val() ;
    }

    if(value != null && value != ''){
        var nRow = $(obj).parents('tr')[0] ;
        $.ajax({
            url:'${rc.contextPath}/platform/save-edit',
            type:'POST',
            data:{"id":id , "probContext":value ,"feedProblenType":type},
            dataType:"json",
            traditional:true,
            success:function(msg){
                $('#loading').hide();
                if(msg.stat){
                    if(flag){
                        //新增
                        oTable.fnUpdate(msg.id, nRow, 0, false);
                        oTable.fnUpdate(type, nRow, 1, false);
                    }
                    oTable.fnUpdate(value, nRow, 2, false);
                    var a = msg.id+'$_$'+value;
                    oTable.fnUpdate(a, nRow, 3, false);
                    oTable.fnDraw();
                    problemaddgrid.getDataTable().fnDraw();
                    Metronic.alert({type:'success',icon:'warning',message:'保存或编辑成功.',container:problemaddgrid.getTableWrapper(),place:'prepend'});
                } else {
                    Metronic.alert({type:'danger',icon:'warning',message:'问题已存在,请勿重复添加.',container:problemaddgrid.getTableWrapper(),place:'prepend'});
                }
                setTimeout("$('.alert').alert('close');",3000);
            }
        });
    }else{
        alertHint('值不能为空');
    }
}


function delProblem(id){
    var ids=[];
    if(id){
        ids.push(data);
    }else{
        $.each(problemaddgrid.getSelectedRows(),function(key,val){
            ids.push(val['value']);
        });
        if(ids.length==0){
            Metronic.alert({type:'danger',icon:'warning',message:'请选择至少一条要删除的信息。',container:problemaddgrid.getTableWrapper(),place:'prepend'});
            setTimeout("$('.alert').alert('close');",3000);
            return;
        }
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
                        url:'${rc.contextPath}/platform/del-prob',
                        type:'POST',
                        timeout:2000,
                        data:{"ids":ids},
                        dataType:"json",
                        traditional:true,
                        success:function(msg){
                            Metronic.stopPageLoading();
                            if(msg.stat){
                                Metronic.alert({type:'success',message:'删除成功.',container:problemaddgrid.getTableWrapper(),place:'prepend'});
                            } else {
                                Metronic.alert({type:'danger',icon:'warning',message:'删除失败.',container:problemaddgrid.getTableWrapper(),place:'prepend'});
                            }
                            //problemaddgrid.getDataTable().fnClearTable(0);
                           ///// problemaddgrid.getDataTable().fnDraw();
                            //dengfeng  存在问题的地方

                            problemaddgrid.getDataTable().fnClearTable(0);
                            problemaddgrid.getDataTable().fnDraw();
                            alertHint();
                        }
                    });
                }
            }
        }
    });
    setTimeout("$('.alert').alert('close');",3000);
}

function showProblem(){
    problemaddgrid.getDataTable().fnDraw();
    $('#problem_add_div').modal('show');
}

function del(id){
    $('#loading').show();
    bootbox.dialog({
        message:"确认删除该条意见反馈信息?",
        title:"删除意见反馈信息",
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
                    $('#loading').show();
                    $.ajax({
                        url:'${rc.contextPath}/platform/feedback/delete',
                        type:'POST',
                        data:{"id":id},
                        dataType:"json",
                        traditional:true,
                        success:function(data){
                            if(data==true){
                                $('#loading').hide();
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
    $('#loading').show();
    bootbox.dialog({
        message:"确认批量删除意见反馈信息?",
        title:"删除意见反馈信息",
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
                    $('#loading').show();
                    $.ajax({
                        url:'${rc.contextPath}/platform/feedback/delete-all',
                        type:'POST',
                        data:{"ids":ids},
                        dataType:"json",
                        traditional:true,
                        success:function(data){
                            if(data==true){
                                $('#loading').hide();
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
/**
 *
 * @param tip 0: 全部导出 ,  1: 选择导出 ,  2: 查询导出
 * @returns {boolean}
 */
function exportData(tip){
    var ids=[],linkperop = $('#search_LIKE_linkPerop').val(),fromsys = $('#search_LIKE_fromSys').val(),phone = $('#search_LIKE_phone').val(),packagename=$('#search_LIKE_packageName').val();
    if(1 == tip || '1' == tip){ //选择导出
        $.each(grid.getSelectedRows(),function(key,val){
            ids.push(val['value']);
        });
        if(ids==''||ids==null||ids.length==0){
            bootbox.alert('请选择需要导出的数据');
            return false;
        }
    }else{
        ids.push(0);
    }
    "${rc.contextPath}/platform/feedprob/list" ,
    location.href='${rc.contextPath}/platform/export-excel?ids='+ids+'&tip='+tip+'&linkperop='+linkperop+'&fromsys='+fromsys+'&phone='+phone+'&packagename='+packagename;
}
</script>
</content>
</html>
